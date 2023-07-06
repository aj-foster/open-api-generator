defmodule OpenAPI.Processor.Ignore do
  @moduledoc """
  Default plugin for ignoring schemas and operations
  """
  alias OpenAPI.Spec.Path.Operation
  alias OpenAPI.Spec.Schema

  @typedoc "Definition of a module to ignore"
  @type definition :: String.t() | Regex.t()

  @spec ignored?(OpenAPI.Processor.State.t(), Operation.t()) :: boolean
  @spec ignored?(OpenAPI.Processor.State.t(), Schema.t()) :: boolean
  def ignored?(state, %Operation{} = operation) do
    %Operation{"$oag_path": operation_path, operation_id: operation_id} = operation

    patterns_to_ignore = config(state)

    combinations_to_check =
      for x <- [operation_path, operation_id], y <- patterns_to_ignore do
        {x, y}
      end

    Enum.any?(combinations_to_check, fn
      {nil, _pattern} -> false
      {value, %Regex{} = regex} -> Regex.match?(regex, value)
      {value, value} -> true
      {_value, _string_pattern} -> false
    end)
  end

  def ignored?(state, %Schema{} = schema) do
    %Schema{"$oag_base_file_path": base_path, "$oag_last_ref_path": ref_path, title: title} =
      schema

    patterns_to_ignore = config(state)

    base_path = Enum.join(base_path, "/")
    ref_path = Enum.join(ref_path, "/")

    combinations_to_check =
      for x <- [base_path, ref_path, title], y <- patterns_to_ignore do
        {x, y}
      end

    Enum.any?(combinations_to_check, fn
      {nil, _pattern} -> false
      {value, %Regex{} = regex} -> Regex.match?(regex, value)
      {value, value} -> true
      {_value, _string_pattern} -> false
    end)
  end

  @spec config(OpenAPI.Processor.State.t()) :: [definition]
  defp config(state) do
    %OpenAPI.Processor.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:ignore, [])
  end
end
