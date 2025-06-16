defmodule OpenAPI.Processor.Ignore do
  @moduledoc """
  Ignore operations and schemas from the description

  This module contains the default implementations for:

    * `c:OpenAPI.Processor.ignore_operation?/2`
    * `c:OpenAPI.Processor.ignore_schema?/2`

  ## Configuration

  All configuration for the functions in this module is contained in a key `ignore` of the active
  configuration profile. For example:

      # config/config.exs

      config :oapi_generator, default: [
        ignore: [
          "IgnoredOperation",
          ~r"/components/schemas/ignored-",
          :deprecated_schemas
        ]
      ]

  Each element of the `ignored` list is a pattern. Patterns are compared against the operation IDs
  and paths of an operation, and the paths and titles of a schema. If a string is given, it is
  compared for equality. Regular expressions are tested using `Regex.match?/2`.

  If any pattern matches the tested operation or schema, it will be excluded.

  The special values `:deprecated`, `:deprecated_operations`, and `:deprecated_schemas` can be
  used to ignore all operations and/or schemas that are marked as deprecated.
  """
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @typedoc "Definition of a module to ignore"
  @type definition :: String.t() | Regex.t()

  @doc """
  Ignore operations based on configured patterns of IDs and paths

  Default implementation of `c:OpenAPI.Processor.ignore_operation?/2`.

  In this implementation, patterns from the `ignore` configuration key are compared against each
  operation ID and path. If a string pattern matches exactly, or regular expression pattern
  matches according to `Regex.match?/2`, the operation will be ignored.
  """
  @doc default_implementation: true
  @spec ignore_operation?(OpenAPI.Processor.State.t(), OperationSpec.t()) :: boolean
  def ignore_operation?(state, %OperationSpec{} = operation) do
    %OperationSpec{"$oag_path": operation_path, operation_id: operation_id} = operation

    patterns_to_ignore = config(state)

    ignore_deprecated? =
      :deprecated in patterns_to_ignore or
        :deprecated_operations in patterns_to_ignore

    combinations_to_check =
      for x <- [operation_path, operation_id], y <- patterns_to_ignore do
        {x, y}
      end

    if ignore_deprecated? and operation.deprecated do
      true
    else
      Enum.any?(combinations_to_check, fn
        {nil, _pattern} -> false
        {value, %Regex{} = regex} -> Regex.match?(regex, value)
        {value, value} -> true
        {_value, _string_pattern} -> false
      end)
    end
  end

  @doc """
  Ignore schemas based on configured patterns of paths and titles

  Default implementation of `c:OpenAPI.Processor.ignore_schema?/2`.

  In this implementation, patterns from the `ignore` configuration key are compared against each
  schema title and path. If a string pattern matches exactly, or regular expression pattern
  matches according to `Regex.match?/2`, the schema will be ignored. This often means the type
  will be replaced by a plain `map`.
  """
  @doc default_implementation: true
  @spec ignore_schema?(OpenAPI.Processor.State.t(), SchemaSpec.t()) :: boolean
  def ignore_schema?(state, %SchemaSpec{} = schema) do
    %SchemaSpec{"$oag_base_file_path": base_path, "$oag_last_ref_path": ref_path, title: title} =
      schema

    patterns_to_ignore = config(state)

    ignore_deprecated? =
      :deprecated in patterns_to_ignore or
        :deprecated_schemas in patterns_to_ignore

    base_path = Enum.join(base_path, "/")
    ref_path = Enum.join(ref_path, "/")

    combinations_to_check =
      for x <- [base_path, ref_path, title], y <- patterns_to_ignore do
        {x, y}
      end

    if ignore_deprecated? and schema.deprecated do
      true
    else
      Enum.any?(combinations_to_check, fn
        {nil, _pattern} -> false
        {value, %Regex{} = regex} -> Regex.match?(regex, value)
        {value, value} -> true
        {_value, _string_pattern} -> false
      end)
    end
  end

  #
  # Private Helpers
  #

  @spec config(OpenAPI.Processor.State.t()) :: [definition]
  defp config(state) do
    %OpenAPI.Processor.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:ignore, [])
  end
end
