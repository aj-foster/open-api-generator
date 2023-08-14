defmodule OpenAPI.Processor.Naming do
  @moduledoc """
  Default plugin for naming operations and schemas
  """
  alias OpenAPI.Processor.State
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec
  alias OpenAPI.Spec.Schema, as: SchemaSpec

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

  @spec schema_module_and_type(State.t(), SchemaSpec.t()) :: {module | nil, atom}
  def schema_module_and_type(_state, schema_spec) do
    {starting_module, starting_type} = raw_schema_module_and_type(schema_spec)

    if is_nil(starting_module) do
      {starting_module, String.to_atom(starting_type)}
    else
      {Module.concat([starting_module]), String.to_atom(starting_type)}
    end
  end

  #
  # Public Helpers
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

  @doc """
  Choose a starting schema module and type name based on title and context

  Returns a tuple containing the `{module, type}`, such as `{"MySchema", "t"}`.

  This function does not consider schema renaming or merging. It uses the title, context, and
  location of the schema within the specification to determine an initial set of names. Schemas
  located in `components/schemas` are named based on their key in the `schemas` map, so a schema
  located at `components/schemas/my_schema` will become `MySchema.t()`. If a schema has a
  context attached (such as a request body or response body for an operation) then it will be
  named based on the operation. Finally, if a schema has a defined title, this will be used as
  the name. If none of this information is available, `{nil, "map"}` is returned.

  Callers of this function will almost certainly want to perform further processing.
  """
  @spec raw_schema_module_and_type(SchemaSpec.t()) ::
          {module :: String.t() | nil, type :: String.t()}
  def raw_schema_module_and_type(%SchemaSpec{
        "$oag_last_ref_path": ["components", "schemas", schema_name]
      }) do
    module =
      schema_name
      |> normalize_identifier()
      |> Macro.camelize()

    {module, "t"}
  end

  def raw_schema_module_and_type(%SchemaSpec{
        "$oag_schema_context": {:request, operation_module, operation_function, content_type}
      }) do
    type = Enum.join([operation_function, readable_content_type(content_type), "req"], "_")

    {operation_module, type}
  end

  def raw_schema_module_and_type(%SchemaSpec{
        "$oag_schema_context":
          {:response, operation_module, operation_function, status_code, content_type}
      }) do
    type =
      Enum.join(
        [
          operation_function,
          to_string(status_code),
          readable_content_type(content_type),
          "resp"
        ],
        "_"
      )

    {operation_module, type}
  end

  def raw_schema_module_and_type(%SchemaSpec{title: schema_title}) when is_binary(schema_title) do
    module =
      schema_title
      |> normalize_identifier()
      |> Macro.camelize()

    {module, "t"}
  end

  def raw_schema_module_and_type(_schema_spec) do
    {nil, "map"}
  end

  @doc """
  Turn a content type (ex. `"application/json"`) into a readable type (ex. `"json"`)

  This is used by the default implementation of the schema module/type name function while
  constructing the type of a request or response body that is otherwise unnamed. If an unknown
  content type is passed, this function returns an empty string to avoid including the content
  type in the name (although this could cause collisions).
  """
  @spec readable_content_type(String.t()) :: String.t()
  def readable_content_type(content_type)
  def readable_content_type("application/json"), do: "json"
  def readable_content_type("application/json+" <> _), do: "json"
  def readable_content_type(""), do: ""

  #
  # Private Helpers
  #

  @spec config(State.t()) :: keyword
  defp config(state) do
    %OpenAPI.Processor.State{profile: profile} = state

    Application.get_env(:oapi_generator, profile, [])
    |> Keyword.get(:naming, [])
  end
end
