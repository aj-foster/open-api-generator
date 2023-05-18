defmodule OpenAPI.Config do
  @moduledoc """
  Configuration for the code generator

  ## Configuration

  This section is an overview of the available configuration options. For a more in-depth discussion
  of output module naming, see **Naming** below. See also type `t:t()` below for the exact type
  specification of each option.

  * `base_location` (string, **required**): Relative path (from the base of the Mix project where
    the code generator is run) to output files. When creating a standalone client library, this
    will often be `lib/`.

  * `base_module` (module, **required**): Base module for all output files. For example, a base
    module of `Example` will output schemas like `Example.MySchema` and operation files like
    `Example.MyOperations`. When outputting a standalone client library, this will often be the
    base module of the library.

  * `default_client` (module): Module to call when making a web request. This code generator has
    no opinion on how HTTP requests are made. Instead, you must provide a client module that
    implements a `request/1` function and performs the request and decodes the response. By default,
    a module `[base_module].Client` will be used.

  * `extra_fields` (keyword list): Additional fields to add to each schema. The key is the name
    of the field, and the value is the type (as defined by `t:OpenAPI.Generator.Typing.t/0`. For
    example, `[__info__: :map]` will add a field named `__info__` with type `map` to every schema.
    This can be useful for library authors that would like to store additional information in
    the structs returned by the client operations. Defaults to `[]`.

  * `group` (list of modules): Namespaces to use when grouping modules. For example, two schemas
    `SchemaOne` and `SchemaTwo` grouped by the `Schema` module would become `Schema.One` and
    `Schema.Two`. Defaults to no grouping.

  * `ignore` (list of modules, strings, or regular expressions): Schemas to ignore when outputting
    well-defined Elixir structs. Schemas that are ignored will be replaced with a `map` type when
    referenced elsewhere in the code. When provided as a module or string, the ignore pattern must
    **exactly** match the name of the schema **after any merges**. Defaults to no schemas ignored.

  * `merge` (list of two-tuples): Source and destination modules for schemas that should be merged
    into a single file. See **Merging** below for examples. Defaults to no schemas merged.

  * `operation_location` (string): Relative path, after the `base_location`, to output operation
    files. This may useful if you want to hide generated operation files in a subdirectory of a
    larger project. Defaults to outputting operation files to the `base_location`.

  * `rename` (list of rename pattern and action tuples): Renaming actions to take on schema names.
    The two elements of each tuple will be fed as the second and third arguments to
    `String.replace/4` along with the schema name. See **Renaming** below for examples. Defaults
    to no schemas renamed.

  * `schema_location` (string): Relative path, after the `base_location`, to output schema files.
    This may useful if you want to hide generated schema files in a subdirectory of a larger
    project. Defaults to outputting schema files to the `base_location`.

  * `types` (keyword list): Overrides to the types defined by the generator. Each value should be
    a tuple `{module, type}` such as `{MyModule, :t}`.

    * `error`: Override the error type for all operations. APIs often define their own error
      schemas, which may differ between operations. Use this option to define a single, consistent
      error type for all operations. For example, a value `{MyError, :t}` would cause operations
      to return `{:ok, ...} | {:error, MyError.t()}`.

  ## Naming

  Most of the configuration of this project relates to the manipulation of schema names. It is
  important to understand the order of operations. As an example, imagine an OpenAPI description
  has the following schemas:

    * `#/components/schemas/simple-user`
    * `#/components/schemas/user`
    * `#/components/schemas/user-preferences`

  And the following configuration:

      config :oapi_generator, default: [
        base_location: "lib/",
        base_module: Example,
        group: [User],
        ignore: [],
        merge: [{"SimpleUser", "User"}]
        rename: [{~r/Preferences/, "Settings"}]
      ]

  In this case, naming would proceed as follows:

  1. Schemas in the OpenAPI descriptions are turned into Elixir modules:
    ```
  #/components/schemas/simple-user       =>  SimpleUser.t()
  #/components/schemas/user              =>  User.t()
  #/components/schemas/user-preferences  =>  UserPreferences.t()
    ```

  2. Merge settings are applied based on the original names of the schemas:
    ```
  SimpleUser.t()  =>  User.simple()
    ```

  3. Ignore settings are applied based on the merged module names (no changes in this example).

  4. Rename settings are applied based on the merged module names:
    ```
  UserPreferences.t()  =>  UserSettings.t()
    ```

  5. Group settings are applied based on the renamed module names:
    ```
  UserSettings.t()  =>  User.Settings.t()
    ```

  6. The base module is applied to get the final names:
    ```
  User.simple()      =>  Example.User.simple()
  User.t()           =>  Example.User.t()
  User.Settings.t()  =>  Example.User.Settings.t()
    ```

  All of the schemas are then written to appropriate files based on the `base_location` and
  `schema_location` settings. Note that `User.simple()` and `User.t()` will end up in the same file
  as a result of the merge, sharing the same struct for their responses (with distinct typespecs).

  ### Merging

  OpenAPI descriptions may have multiple schemas that are closely related or even duplicated.
  Merging gives the power to consolidate these schemas into a single struct that is easy to use.

  For example, the GitHub API description has schemas `repository`, `full-repository`, and
  `nullable-repository`. While the "full" repository adds additional properties, the "nullable"
  variant is just that: all of the same properties, but the schema is nullable. This kind of oddity
  in the OpenAPI specification is exactly what makes most generated code difficult to use.

  The following merge settings would help clean this up:

      merge: [
        {"FullRepository", "Repository"},
        {~r/^Nullable/, ""}
      ]

  In the first line, we tell the generator to merge `FullRepository` into `Repository` (the original
  module names based on the names of the schemas). Because the destination module appears at the
  end of the original module, the word "Repository" will be dropped from the type:

  ```
  FullRepository => Repository :: Repository.full()
  ```

  This renaming of the type is automatic for prefixes and suffixes. If no overlap is found, then the
  full (underscored) schema name will be used for the type:

  ```
  SimpleUser        => User        :: User.simple()
  PullRequestSimple => PullRequest :: PullRequest.simple()
  MySchema          => Unrelated   :: Unrelated.my_schema()
  ```

  If the destination module is later renamed or grouped, the merged schemas will processed in the
  same way.

  ### Collapsing

  In the second line of the configuration above, we merge two nearly-identical schemas
  `NullableRepository` and `Repository`. Because these schemas have the same fields, there will not
  be a `Repository.nullable()` type generated; instead, references will use `Repository.t()`.
  Despite this deduplication, other parts of the code will continue to know that the original
  schema had `nullable: true` and respond accordingly.

  ### Ignoring

  Sometimes, schemas are best treated as plain maps. In these cases, they can be ignored using a
  regular expression, exact string, or exact module:

      ignore: [
        ~r/^Unnecessary/,
        "SomeSchema",
        AnotherSchema
      ]

  Any references to an ignored schema will be replaced with a `map()` type.

  ### Grouping

  Schemas in an OpenAPI description can have extensively long names. For example, GitHub has a
  schema called `actions-cache-usage-by-repository`. Along with all other actions-related schemas,
  we can cut down the top-level module namespace by grouping on `Actions` or even further:

      group: [
        Actions,
        Actions.CacheUsage
      ]

  Even simple renaming and groups can take a raw OpenAPI description and turn it into a library
  that feels friendly to users.
  """

  @typedoc "Keyword list of extra fields to add to each schema"
  @type extra_fields :: keyword(OpenAPI.Generator.Typing.t())

  @typedoc "List of module namespaces to create when grouping"
  @type group_options :: [module]

  @typedoc "Patterns or exact matches of schemas to ignore"
  @type ignore_pattern :: Regex.t() | String.t() | module

  @typedoc "List of patterns or exact matches of schemas to ignore"
  @type ignore_options :: [ignore_pattern]

  @typedoc "Before (pattern or exact match) and after (replacement action) for merging schemas by module"
  @type merge_options :: [{Regex.t() | String.t() | module, String.t()}]

  @typedoc "Search pattern for renaming schemas by module"
  @type rename_pattern :: String.pattern() | Regex.t()

  @typedoc "Replacement action for renaming schemas by module"
  @type rename_action :: String.t() | (String.t() -> String.t())

  @typedoc "List of replacement searches and actions for renaming schemas by module"
  @type rename_options :: [{rename_pattern, rename_action}]

  @typedoc "Configuration for the code generator"
  @type t :: %__MODULE__{
          base_location: String.t(),
          base_module: module,
          default_client: module,
          extra_fields: extra_fields,
          group: group_options,
          ignore: ignore_options,
          merge: merge_options,
          operation_location: String.t(),
          rename: rename_options,
          schema_location: String.t(),
          types: keyword
        }

  defstruct [
    :base_location,
    :base_module,
    :default_client,
    :extra_fields,
    :group,
    :ignore,
    :merge,
    :operation_location,
    :rename,
    :schema_location,
    :types
  ]

  @doc false
  @spec new(keyword) :: t
  def new(opts) do
    base_module = get_base_module(opts[:base_module])

    %__MODULE__{
      base_location: get_base_location(opts[:base_location]),
      base_module: base_module,
      default_client: get_default_client(opts[:default_client], base_module),
      extra_fields: get_extra_fields(opts[:extra_fields]),
      group: get_group(opts[:group]),
      ignore: get_ignore(opts[:ignore]),
      merge: get_merge(opts[:merge]),
      operation_location: get_operation_location(opts[:operation_location]),
      rename: get_rename(opts[:rename]),
      schema_location: get_schema_location(opts[:schema_location]),
      types: get_types(opts[:types])
    }
  end

  @spec get_base_location(any) :: String.t() | no_return
  defp get_base_location(nil), do: raise(ArgumentError, "Option :base_location is required")
  defp get_base_location(value) when is_binary(value), do: value

  defp get_base_location(value),
    do: raise(ArgumentError, "Option :base_location expects a string, got #{inspect(value)}")

  @spec get_base_module(any) :: module | no_return
  defp get_base_module(nil), do: raise(ArgumentError, "Option :base_module is required")
  defp get_base_module(value) when is_atom(value), do: value

  defp get_base_module(value),
    do: raise(ArgumentError, "Option :base_module expects a module, got #{inspect(value)}")

  @spec get_default_client(any, module) :: module | no_return
  defp get_default_client(nil, base_module), do: Module.concat([base_module, Client])
  defp get_default_client(value, _base_module) when is_atom(value), do: value

  @spec get_extra_fields(any) :: extra_fields
  defp get_extra_fields(nil), do: []
  defp get_extra_fields(value) when is_list(value), do: value

  defp get_extra_fields(value),
    do: raise(ArgumentError, "Option :extra_fields expects a keyword list, got #{inspect(value)}")

  @spec get_group(any) :: [module] | no_return
  defp get_group(nil), do: []

  defp get_group(value) when is_list(value) do
    if Enum.all?(value, &is_atom/1) do
      value
    else
      raise ArgumentError, "Option :group expects a list of modules"
    end
  end

  @spec get_ignore(any) :: [ignore_pattern] | no_return
  defp get_ignore(nil), do: []

  defp get_ignore(value) when is_list(value) do
    if Enum.all?(value, fn
         %Regex{} -> true
         string when is_binary(string) -> true
         atom when is_atom(atom) -> true
         _ -> false
       end) do
      value
    else
      raise ArgumentError,
            "Option :ignore expects a list of regular expressions, strings, or modules"
    end
  end

  @spec get_merge(any) :: merge_options | no_return
  defp get_merge(nil), do: []

  defp get_merge(value) when is_list(value) do
    if Enum.all?(value, fn
         {%Regex{}, after_merge} ->
           is_atom(after_merge) or is_binary(after_merge)

         {before_merge, after_merge} ->
           (is_atom(before_merge) or is_binary(before_merge)) and
             (is_atom(after_merge) or is_binary(after_merge))
       end) do
      value
    else
      raise ArgumentError,
            "Option :merge expects a list of tuples with patterns and replacements"
    end
  end

  @spec get_operation_location(any) :: String.t() | no_return
  defp get_operation_location(nil), do: ""
  defp get_operation_location(value) when is_binary(value), do: value

  defp get_operation_location(value),
    do: raise(ArgumentError, "Option :operation_location expects a string, got #{inspect(value)}")

  @spec get_rename(any) :: [{rename_pattern, rename_action}] | no_return
  defp get_rename(nil), do: []

  defp get_rename(value) when is_list(value) do
    if Enum.all?(value, fn
         {compiled_pattern, _action} when is_tuple(compiled_pattern) -> true
         {string, _action} when is_binary(string) -> true
         {list, _action} when is_list(list) -> true
         {%Regex{}, _action} -> true
         _ -> false
       end) do
      value
    else
      raise ArgumentError,
            "Option :rename expects a list of tuples with patterns and replacements"
    end
  end

  @spec get_schema_location(any) :: String.t() | no_return
  defp get_schema_location(nil), do: ""
  defp get_schema_location(value) when is_binary(value), do: value

  defp get_schema_location(value),
    do: raise(ArgumentError, "Option :schema_location expects a string, got #{inspect(value)}")

  @spec get_types(any) :: keyword | no_return
  defp get_types(nil), do: []
  defp get_types(value) when is_list(value), do: value

  defp get_types(value),
    do: raise(ArgumentError, "Option :types expects a keyword list, got #{inspect(value)}")
end
