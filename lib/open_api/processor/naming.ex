defmodule OpenAPI.Processor.Naming do
  @moduledoc """
  Default implementation for naming-related callbacks

  This module contains the default implementations for:

    * `c:OpenAPI.Processor.operation_function_name/2`
    * `c:OpenAPI.Processor.operation_module_names/2`
    * `c:OpenAPI.Processor.schema_module_and_type/2`

  It also includes several helper functions that are used by the default implementations. Library
  authors implementing their own naming-related callbacks may find these helpful.

  ## Configuration

  All configuration offered by the functions in this module lives under the `naming` key of the
  active configuration profile. For example (default values shown):

      # config/config.exs

      config :oapi_generator, default: [
        naming: [
          default_operation_module: Operations,
          group: [],
          merge: [],
          rename: []
        ]
      ]
  """
  alias OpenAPI.Processor.State
  alias OpenAPI.Spec.Path.Operation, as: OperationSpec
  alias OpenAPI.Spec.Schema, as: SchemaSpec

  @type raw_module_and_type :: {module :: String.t() | nil, type :: String.t()}
  @type module_and_type :: {module :: module, type :: atom}

  @doc """
  Choose the name of an operation client function based on its operation ID

  Default implementation of `c:OpenAPI.Processor.operation_function_name/2`.

  In this implementation, the operation ID is split up by slash characters with only the last
  portion taken (ex. "repos/get" becomes "get"), assuming that the module name will use the
  remaining portions. Then the value is normalized to be atom-friendly.

  Note that this function creates new atoms, and should not be run in a production environment.
  """
  @doc default_implementation: true
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
  configured `:default_operation_module` or `[BaseModule].Operations` by default.

  ## Configuration

  Use `naming.default_operation_module` to configure the catch-all module name. Note that the
  configured name should not include the base module, if it is set in `naming.base_module`. The
  following configuration would result in a module named `MyClientLibrary.Operations`:

      config :oapi_generator, default: [
        naming: [
          base_module: MyClientLibrary,
          default_operation_module: Operations
        ]
      ]

  """
  @doc default_implementation: true
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

  # TODO: Docs and tests
  @doc default_implementation: true
  @spec schema_module_and_type(State.t(), SchemaSpec.t()) :: {module | nil, atom}
  def schema_module_and_type(state, schema_spec) do
    {module, type} =
      raw_schema_module_and_type(schema_spec)
      |> merge_schema(state)
      |> rename_schema(state)
      |> group_schema(state)

    if is_nil(module) do
      {module, String.to_atom(type)}
    else
      {Module.concat([module]), String.to_atom(type)}
    end
  end

  #
  # Public Helpers
  #

  # TODO: Docs and tests
  @spec merge_schema(raw_module_and_type, State.t()) :: raw_module_and_type
  def merge_schema(raw_module_and_type, state)
  def merge_schema({nil, type}, _state), do: {nil, type}

  def merge_schema({module, type}, state) do
    merges = config(state)[:merge] || []

    Enum.reduce(merges, {module, type}, fn
      {before_merge, after_merge}, {module, type} ->
        cond do
          is_struct(before_merge, Regex) and Regex.match?(before_merge, module) ->
            new_module = String.replace(module, before_merge, after_merge)
            new_type = merged_type(module, new_module)
            {new_module, new_type}

          not is_struct(before_merge) and module == to_string(before_merge) ->
            new_type = merged_type(before_merge, after_merge)
            {after_merge, new_type}

          :else ->
            {module, type}
        end
    end)
  end

  @spec merged_type(String.t(), String.t()) :: String.t()
  defp merged_type(before_merge, after_merge) do
    cond do
      String.starts_with?(before_merge, after_merge) ->
        before_merge
        |> String.trim_leading(after_merge)
        |> Macro.underscore()

      String.ends_with?(before_merge, after_merge) ->
        before_merge
        |> String.trim_trailing(after_merge)
        |> Macro.underscore()

      :else ->
        Macro.underscore(before_merge)
    end
  end

  @doc """
  Rename schema modules based on configured patterns

  This function accepts a tuple with the module and type of a schema as strings, along with the
  processor state, and returns a modified tuple according to the configured replacements.

  ## Configuration

  Module replacements can be configured as a list of tuples in the `naming.rename` key of a
  configuration profile:

      config :oapi_generator,
        my_profile: [
          naming: [
            rename: [
              {"Api", "API"},
              {~r/^Bio/, "Author.Bio"},
              # ...
            ]
          ]
        ]

  The contents of each tuple will be fed into `String.replace/3`, for example:

      > String.replace("MyApiResponse", "Api", "API")

  ## Examples

  In the configuration above, there are two replacements configured: the string pattern `"Api"`
  will be replaced with `"API"`, and the regular expression pattern `^Bio` will be replaced with
  `"Author.Bio"`. These rules would create the following transformations (types omitted because
  they do not change):

      MyApiResponse => MyAPIResponse
      Apiary        => APIary
      BioUpdate     => Author.BioUpdate
      EditorBio     => EditorBio

  Note that replacements can have unintended side-effects. For example, while we correctly
  capitalized `MyApiResponse` using the `"Api"` pattern, we also replaced `APIary`. Regular
  expressions lend more powerful and precise replacement patterns. This includes the ability to
  use capture expressions (ex. `~r/(Api)([A-Z]|$)/`) and replacements that reference those
  captures (ex. `"API\\\\2"`). See `String.replace/3` for more information.
  """
  @spec rename_schema(raw_module_and_type, State.t()) :: raw_module_and_type
  def rename_schema(raw_module_and_type, state)
  def rename_schema({nil, type}, _state), do: {nil, type}

  def rename_schema({module, type}, state) do
    replacements = config(state)[:rename] || []

    Enum.reduce(replacements, {module, type}, fn {pattern, replacement}, {module, type} ->
      {String.replace(module, pattern, replacement), type}
    end)
  end

  @doc """
  Group schema modules into configured namespaces

  This function accepts a tuple with the module and type of a schema as strings, along with the
  processor state, and returns a modified tuple according to the configured groups.

  ## Configuration

  Module namespaces can be configured as a list of modules in the `naming.group` key of a
  configuration profile:

      config :oapi_generator,
        my_profile: [
          naming: [
            group: [
              Author,
              Author.Bio
              Comment,
              # ...
            ]
          ]
        ]

  ## Examples

  The configuration above includes three module namespaces for grouping: `Author`, `Author.Bio`,
  and `Comment`. These rules would create the following transformations (types omitted because
  they do not change):

      AuthorAvatar    => Author.Avatar
      AuthorBio       => Author.Bio
      AuthorBioUpdate => Author.Bio.Update
      PostComment     => PostComment

  Note that the desired grouping must appear at the start of the module name: `PostComment` is
  unaffected by the `Comment` group configuration. As a result, it is also important that `Author`
  appear in the configuration before `Author.Bio`, otherwise `Author.Bio` would fail to match the
  beginning of `AuthorBioUpdate` resulting in `Author.BioUpdate` (since the `Author` configuration
  would still match afterwards).
  """
  @spec group_schema(raw_module_and_type, State.t()) :: raw_module_and_type
  def group_schema(raw_module_and_type, state)
  def group_schema({nil, type}, _state), do: {nil, type}

  def group_schema({module, type}, state) do
    groups = config(state)[:group] || []

    Enum.reduce(groups, {module, type}, fn group, {module, type} ->
      group = inspect(group)

      module =
        cond do
          module == group -> module
          String.starts_with?(module, "#{group}.") -> module
          String.starts_with?(module, group) -> String.replace_leading(module, group, "#{group}.")
          :else -> module
        end

      {module, type}
    end)
  end

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

    {to_string(operation_module), type}
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

    {to_string(operation_module), type}
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
