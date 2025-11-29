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
  alias OpenAPI.Processor.Schema
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
  def operation_function(_state, %OperationSpec{operation_id: id}) when not is_nil(id) do
    id
    |> String.split("/", trim: true)
    |> List.last()
    |> normalize_identifier()
    |> String.to_atom()
  end

  def operation_function(_state, operation_spec) do
    %OperationSpec{"$oag_path": path, "$oag_path_method": method} = operation_spec

    "#{path}_#{method}"
    |> normalize_identifier()
    |> String.to_atom()
  end

  @doc """
  Choose the names of modules containing the given operation

  Default implementation of `c:OpenAPI.Processor.operation_module_names/2`.

  This generator generates a set of modules with functions in them according to some
  normalization rules:

  * Operation tags and IDs are normalized for spaces, slashes, etc.
  * Operation tags are used to generate modules that group operation functions (unless
    `naming.operation_use_tags` is `false`)
  * Operation IDs with slashes will be split, with the initial segments (everything except the
    last segment) used as segments of a module

  Examples:

    * Operation `foo` with tag `bar` => `Bar.foo`
    * Operation `foo/bar` with tag `baz` => `Foo.bar` and `Baz.bar`
    * Operation `foo/bar` without tags => `Foo.bar`

  Each operation may exist in multiple modules depending on the quantity of tags and the format
  of the operation ID. If the operation does not have slashes in its ID and does not have any
  tags, then the configured `:default_operation_module` or `[output.base_module].Operations`
  becomes the module by default.

  ## Configuration

  Use `naming.default_operation_module` to configure the catch-all module name. Note that the
  configured name should not include the base module, if it is set in `output.base_module`. The
  following configuration would result in a module named `MyClientLibrary.Operations`:

      config :oapi_generator, default: [
        naming: [
          default_operation_module: Operations,
          operation_use_tags: true
        ],
        output: [
          base_module: MyClientLibrary
        ]
      ]

  Set `naming.operation_use_tags` to `false` to disable the use of tags when creating modules.
  """
  @doc default_implementation: true
  @spec operation_modules(State.t(), OperationSpec.t()) :: [module]
  def operation_modules(state, operation_spec) do
    config = config(state)
    %OperationSpec{operation_id: id, tags: tags} = operation_spec

    modules =
      if id do
        String.split(id, "/", trim: true)
        |> Enum.slice(0..-2//1)
      else
        []
      end

    id_name =
      if length(modules) > 0 do
        modules
        |> Enum.map(fn module ->
          normalize_identifier(module, :camel)
          |> do_rename_schema(state)
        end)
        |> Module.concat()
      end

    tag_names =
      if config[:operation_use_tags] != false do
        Enum.map(tags, fn tag ->
          tag
          |> String.split("/", trim: true)
          |> Enum.map(fn module ->
            normalize_identifier(module, :camel)
            |> do_rename_schema(state)
          end)
          |> Module.concat()
        end)
      else
        []
      end

    all_names =
      [id_name | tag_names]
      |> Enum.reject(&is_nil/1)
      |> Enum.uniq()

    if length(all_names) > 0 do
      all_names
    else
      default = config[:default_operation_module] || Operations
      [default]
    end
  end

  @doc """
  Choose the name of the schema's module and type

  Default implementation of `c:OpenAPI.Processor.schema_module_and_type/2`.

  Most of the configuration of this project relates to the manipulation of schema names. It is
  important to understand the order of operations. As an example, imagine an OpenAPI description
  has the following schemas:

    * `#/components/schemas/simple-user`
    * `#/components/schemas/user`
    * `#/components/schemas/user-preferences`

  And the following configuration:

      config :oapi_generator, default: [
        naming: [
          group: [User],
          merge: [{"SimpleUser", "User"}]
          rename: [{~r/Preferences/, "Settings"}]
        ],
        output: [
          base_module: Example
        ]
      ]

  In this case, naming would proceed as follows:

  1. Schemas in the OpenAPI descriptions are turned into Elixir modules based on their location,
    context, or title by `raw_schema_module_and_type/1`:
    ```
  #/components/schemas/simple-user       =>  SimpleUser.t()
  #/components/schemas/user              =>  User.t()
  #/components/schemas/user-preferences  =>  UserPreferences.t()
    ```

  2. Merge settings are applied based on the original names of the schemas by `merge_schema/2`:
    ```
  SimpleUser.t()  =>  User.simple()
    ```

  3. Rename settings are applied based on the merged module names by `rename_schema/2`:
    ```
  UserPreferences.t()  =>  UserSettings.t()
    ```

  4. Group settings are applied based on the renamed module names by `group_schema/2`:
    ```
  UserSettings.t()  =>  User.Settings.t()
    ```

  5. The base module is applied to get the final names:
    ```
  User.simple()      =>  Example.User.simple()
  User.t()           =>  Example.User.t()
  User.Settings.t()  =>  Example.User.Settings.t()
    ```

  ### Collapsing

  Note that `User.simple()` and `User.t()` will end up in the same file as a result of the merge,
  sharing the same struct for their responses (with distinct typespecs).
  """
  @doc default_implementation: true
  @spec schema_module_and_type(State.t(), Schema.t()) :: {module | nil, atom}
  def schema_module_and_type(state, schema) do
    schema_spec = Map.fetch!(state.schema_specs_by_ref, schema.ref)

    {module, type} =
      raw_schema_module_and_type(state, schema, schema_spec)
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

  @doc """
  Merge schemas based on configured pairs of patterns and replacements

  This function accepts a tuple with the module and type of a schema as strings, along with the
  processor state, and returns a modified tuple according to the configured merges.

  ## Discussion

  OpenAPI descriptions may have multiple schemas that are closely related or even duplicated.
  Merging gives the power to consolidate these schemas into a single struct that is easy to use.

  For example, the GitHub API description used to have schemas `repository`, `full-repository`,
  and `nullable-repository`. While the "full" repository added additional properties, the
  "nullable" variant was just that: all of the same properties, but the schema was nullable. This
  kind of oddity in the OpenAPI specification is exactly what makes most generated code difficult
  to use.

  The following merge settings would help clean this up:

      merge: [
        {"FullRepository", "Repository"},
        {~r/^Nullable/, ""}
      ]

  In the first line, we tell the generator to merge `FullRepository` into `Repository` (the
  original module names based on the names of the schemas). Because the destination module appears
  at the end of the original module, the word "Repository" will be dropped from the type:

  ```
  FullRepository => Repository :: Repository.full()
  ```

  This renaming of the type is automatic for prefixes and suffixes. If no overlap is found, then
  the full (underscored) schema name will be used for the type:

  ```
  SimpleUser        => User        :: User.simple()
  PullRequestSimple => PullRequest :: PullRequest.simple()
  MySchema          => Unrelated   :: Unrelated.my_schema()
  ```

  If the destination module is later renamed or grouped, the merged schemas will processed in the
  same way.

  ## Configuration

  Merges are configured as a list of tuples in the `naming.merge` key of a configuration profile:

      config :oapi_generator, default: [
        naming: [
          merge: [
            {"PrivateUser", "User"},
            {~r/Simple$/, ""}
          ]
        ]
      ]

  If the first element of the tuple is a string, it will be compared for an exact match to the
  schema's module name. If the first element of the tuple is a regular express, it will be
  compared to the schema's module name using `Regex.match?/2`. If it matches, the module name will
  be replaced with the second element of the tuple.

  After the module name replacement, the type name may be modified. If new the module name is the
  first or last part of the original module name, the leftover portion will be used as the type.
  For example, with the configuration above, the following transformations take place:

      PrivateUser.t() => User.private()
      UserSimple.t()  => User.simple()

  In the case that the new module name is not a prefix or suffix of the original, the entire
  underscored original module name is used as the new type.
  """
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

      config :oapi_generator, default: [
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
    {do_rename_schema(module, state), type}
  end

  defp do_rename_schema(module, state) do
    replacements = config(state)[:rename] || []

    Enum.reduce(replacements, module, fn {pattern, replacement}, module ->
      String.replace(module, pattern, replacement)
    end)
  end

  @doc """
  Group schema modules into configured namespaces

  This function accepts a tuple with the module and type of a schema as strings, along with the
  processor state, and returns a modified tuple according to the configured groups.

  ## Discussion

  Schemas in an OpenAPI description can have extensively long names. For example, GitHub has a
  schema called `actions-cache-usage-by-repository`. Along with all other actions-related schemas,
  we can cut down the top-level module namespace by grouping on `Actions` or even further:

      group: [
        Actions,
        Actions.CacheUsage
      ]

  Even simple renaming and groups can take a raw OpenAPI description and turn it into a library
  that feels friendly to users.

  ## Configuration

  Module namespaces can be configured as a list of modules in the `naming.group` key of a
  configuration profile:

      config :oapi_generator, default: [
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
          module == group ->
            module

          String.starts_with?(module, "#{group}.") ->
            module

          String.match?(module, ~r/^(#{group})[A-Z]/) ->
            String.replace(module, ~r/^(#{group})/, "#{group}.")

          :else ->
            module
        end

      {module, type}
    end)
  end

  @doc """
  Normalize an identifier into CamelCase or snake_case

  ## Example

      iex> normalize_identifier("get-/customer/purchases/{date}_byId")
      "get_customer_purchases_date_by_id"

      iex> normalize_identifier("openAPISpec", :camel)
      "OpenAPISpec"

      iex> normalize_identifier("get-/customer/purchases/{date}_byId", :lower_camel)
      "getCustomerPurchasesDateById"

  """
  @spec normalize_identifier(String.t(), :camel | :lower_camel | :snake) :: String.t()
  def normalize_identifier(input, casing \\ :snake)

  def normalize_identifier(input, :camel) do
    input
    |> segment_identifier()
    |> Enum.map(fn segment ->
      if String.match?(segment, ~r/^[A-Z]+$/) do
        segment
      else
        String.capitalize(segment)
      end
    end)
    |> Enum.join()
  end

  def normalize_identifier(input, :lower_camel) do
    [first_segment | segments] = segment_identifier(input)

    segments =
      Enum.map(segments, fn segment ->
        if String.match?(segment, ~r/^[A-Z]+$/) do
          segment
        else
          String.capitalize(segment)
        end
      end)

    Enum.join([first_segment | segments])
  end

  def normalize_identifier(input, :snake) do
    input
    |> segment_identifier()
    |> Enum.map_join("_", &String.downcase/1)
  end

  @doc false
  def segment_identifier(input) do
    raise_for_invalid_identifier(input)

    [first_segment | segments] =
      String.split(input, ~r/[^A-Za-z0-9]+|([A-Z]?[a-z]+[0-9]?+)/,
        include_captures: true,
        trim: true
      )

    first_segment = String.replace(first_segment, ~r/^[^A-Za-z]+/, "")

    [first_segment | segments]
    |> Enum.map(fn segment ->
      String.replace(segment, ~r/[^A-Za-z0-9]+$/, "")
    end)
    |> Enum.reject(&(&1 == ""))
  end

  defp raise_for_invalid_identifier(input) do
    if String.match?(input, ~r/^[^A-Za-z]+$/) do
      raise ArgumentError, """
      Identifier #{input} cannot be normalized

      This may mean that the description contains a schema or operation ID with only
      non-alphabetical characters or numbers. Please check the OpenAPI description and
      consider renaming the offending schema or operation using the `naming.rename`
      configuration.
      """
    end
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
  @spec raw_schema_module_and_type(State.t(), Schema.t(), SchemaSpec.t()) ::
          {module :: String.t() | nil, type :: String.t()}
  def raw_schema_module_and_type(state, schema, schema_spec)

  def raw_schema_module_and_type(_state, _schema, %SchemaSpec{
        "$oag_last_ref_path": ["components", "schemas", schema_name]
      }) do
    module = normalize_identifier(schema_name, :camel)
    {module, "t"}
  end

  def raw_schema_module_and_type(_state, _schema, %SchemaSpec{
        "$oag_last_ref_path": ["components", "schemas", schema_name, "items"]
      }) do
    module = normalize_identifier(schema_name, :camel)
    {module, "t"}
  end

  def raw_schema_module_and_type(_state, _schema, %SchemaSpec{
        "$oag_last_ref_path": [
          "components",
          "responses",
          schema_name,
          "content",
          content_type,
          "schema"
        ]
      }) do
    module = normalize_identifier(schema_name, :camel)
    type = Enum.join([readable_content_type(content_type), "resp"], "_")

    {module, type}
  end

  def raw_schema_module_and_type(
        _state,
        %Schema{context: [{:request, op_module, op_function, content_type}]},
        _schema_spec
      ) do
    type = Enum.join([op_function, readable_content_type(content_type), "req"], "_")

    {inspect(op_module), type}
  end

  def raw_schema_module_and_type(
        _state,
        %Schema{context: [{:response, op_module, op_function, status_code, content_type}]},
        _schema_spec
      ) do
    type =
      Enum.join(
        [
          op_function,
          to_string(status_code),
          readable_content_type(content_type),
          "resp"
        ],
        "_"
      )

    {inspect(op_module), type}
  end

  def raw_schema_module_and_type(_state, _schema, %SchemaSpec{title: schema_title})
      when is_binary(schema_title) do
    module = normalize_identifier(schema_title, :camel)
    {module, "t"}
  end

  def raw_schema_module_and_type(
        state,
        %Schema{context: [{:field, parent_ref, field_name}], output_format: :struct},
        _schema_spec
      ) do
    %State{implementation: implementation, schemas_by_ref: schemas_by_ref} = state

    {parent_module, parent_type} =
      case Map.fetch!(schemas_by_ref, parent_ref) do
        %Schema{module_name: nil, type_name: nil} = parent ->
          {parent_module, parent_type} = implementation.schema_module_and_type(state, parent)
          {inspect(parent_module), to_string(parent_type)}

        %Schema{module_name: parent_module, type_name: parent_type} ->
          {inspect(parent_module), to_string(parent_type)}
      end

    module = Enum.join([parent_module, normalize_identifier(field_name, :camel)])
    {module, parent_type}
  end

  def raw_schema_module_and_type(
        state,
        %Schema{context: [{:field, parent_ref, field_name}], output_format: :typed_map},
        _schema_spec
      ) do
    %State{implementation: implementation, schemas_by_ref: schemas_by_ref} = state

    {parent_module, parent_type} =
      case Map.fetch!(schemas_by_ref, parent_ref) do
        %Schema{module_name: nil, type_name: nil} = parent ->
          {parent_module, parent_type} = implementation.schema_module_and_type(state, parent)
          {inspect(parent_module), to_string(parent_type)}

        %Schema{module_name: parent_module, type_name: parent_type} ->
          {inspect(parent_module), to_string(parent_type)}
      end

    type = Enum.join([parent_type, normalize_identifier(field_name, :snake)], "_")
    {parent_module, type}
  end

  def raw_schema_module_and_type(_state, _schema, _schema_spec) do
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
  def readable_content_type("application/x-www-form-urlencoded"), do: "form"
  def readable_content_type(_), do: ""

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
