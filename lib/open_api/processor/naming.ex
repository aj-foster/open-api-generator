defmodule OpenAPI.Processor.Naming do
  @moduledoc """
  Default plugin for naming operations and schemas
  """
  alias OpenAPI.Processor.State
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec

  @doc """
  Choose the name of an operation client function based on its operation ID

  In this implementation, the operation ID is split up by slash characters with only the last
  portion taken (ex. "repos/get" becomes "get"), assuming that the module name will use the
  remaining portions. Then the value is normalized to be atom-friendly.

  Note that this function creates new atoms, and should not be run in a production environment.
  """
  @spec operation_function(State.t(), OperationSpec.t()) :: atom
  def operation_function(_state, operation_spec) do
    %OperationSpec{operation_id: id} = operation_spec

    id
    |> String.split("/", trim: true)
    |> List.last()
    |> normalize_identifier()
    |> String.to_atom()
  end

  @doc """
  Choose the names of modules containing the given operation

  Each operation may exist in multiple modules depending on the quantity of tags and the format
  of the operation ID. This implementation looks for slash characters in the operation ID and
  uses the initial segments (everything except the last segment) as segments of a module. It is
  assumed that the last segment will form the function name.

  It also uses each tag as a module, similarly turning slash characters into module namespaces. If
  the operation does not have slashes in its ID and does not have any tags, then it will use the
  configured `:default_operation_module` or `Operations` by default.

  ## Configuration

      config :oapi_generator, default: [
        naming: [default_operation_module: Operations]
      ]

  """
  @spec operation_modules(State.t(), OperationSpec.t()) :: [module]
  def operation_modules(state, operation_spec) do
    %OperationSpec{operation_id: id, tags: tags} = operation_spec
    [_function | modules] = String.split(id, "/", trim: true) |> Enum.reverse()

    id_name =
      if length(modules) > 0 do
        modules
        |> Enum.reverse()
        |> Enum.map(&normalize_identifier/1)
        |> Enum.map(&Macro.camelize/1)
        |> Module.concat()
      end

    tag_names =
      Enum.map(tags, fn tag ->
        tag
        |> String.split("/", trim: true)
        |> Enum.map(&normalize_identifier/1)
        |> Enum.map(&Macro.camelize/1)
        |> Module.concat()
      end)

    all_names =
      [id_name | tag_names]
      |> Enum.reject(&is_nil/1)
      |> Enum.uniq()

    if length(all_names) > 0 do
      all_names
    else
      default = config(state)[:default_operation_module] || Operations
      [default]
    end
  end

  #
  # Helpers
  #

  @doc """
  Normalize an identifier into snake_case

  ## Example

      iex> normalize_identifier("get-/customer/purchases/{date}_byId")
      "get_customer_purchases_date_by_id"

  """
  @spec normalize_identifier(String.t()) :: String.t()
  def normalize_identifier(input) do
    input
    |> String.split(~r/([^A-Za-z0-9]+)?([A-Z]+)?([a-z0-9]+)?/, include_captures: true, trim: true)
    |> Enum.map_join("_", fn segment ->
      segment
      |> String.replace(~r/^[^A-Za-z]+/, "")
      |> String.replace(~r/[^A-Za-z0-9]+$/, "")
      |> String.downcase()
    end)
  end

  @spec config(State.t()) :: keyword
  defp config(state) do
    %OpenAPI.Processor.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:naming, [])
  end
end
