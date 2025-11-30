# Configuration

This project exists for its configuration capabilities.
Most API client libraries are **either** feature complete (due to code generation) **or** ergonomic (due to hand-crafting code), but not both.
With the right configuration — and a little bit of luck with the OpenAPI description — your client library can be both.

The following sections outline the configuration available for the _default implementations_ of the various callbacks used by this library.
See the [Plugins](plugins.md) documentation for information about overriding the default behaviours with custom implementations.

## Profiles

This library uses configuration _profiles_ to allow for multiple sets of configuration at once.
In practice, this means that all configuration lives under a top-level key that will be referenced when running the generator.
For example:

```elixir
# config/config.exs

import Config

config :oapi_generator,
  my_profile: [
    output: [
      base_module: MyClientLibrary
    ]
  ]
```

To use this configuration, run `mix api.gen my_profile path/to/description.json` or call `OpenAPI.run("my_profile", ["path/to/description/json"])`.

> Not sure what to name the profile? Start with `default`.

---

## Operations

Operations are the actions you can take in an API: the HTTP requests that are possible.
This code generator takes an operation-first mindset when generating code.
For example, schemas that are defined in a description but not referenced in any API operation will not be output.

Following is an example operation module that has been annotated with the configuration options involved in various parts of the rendered output.

### Example Module

```elixir
# Existence: `ignore`
# Location: `output.location`, `output.operation_subdirectory`
# Module name: `output.base_module`, `naming.default_operation_module`
defmodule Example.Operations do
  @moduledoc """
  Provides API endpoints related to repos
  """
  # `output.operation_use`, `output_schema_use` (if schemas are present)
  use Example.Helper

  # `output.default_client`
  @default_client Example.Client

  # Schemas would appear here, if present.

  @doc """
  Summary of the operation
  """
  # `output.base_module`, `output.types.error`
  @spec my_operation(String.t(), map, keyword) :: :ok | {:error, Example.Error.t()}
  def my_operation(path_param, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:query_param])

    client.request(%{
      args: [path_param: path_param, body: body],
      call: {Example.Operations, :my_operation},
      url: "/path/to/#{path_param}",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", :map}],
      response: [{200, :map}, {404, {Example.NotFoundError, :t}}],
      opts: opts
    })
  end
end
```

Below are some of the highlights from the available configuration.
See the **Option Reference** section for an exhaustive list of the available options.

### Processor: Naming

At the moment, configuration related to the naming and placement of operation functions is limited.
If you have ideas related to this, please share them in GitHub Discussions.

If an operation does not have any tags, and its operation ID does not contain any `/` characters, it will be placed in a default module named `[BaseModule].Operations`.
This module name can be controlled using the `naming.default_operation_module` configuration:

```elixir
config :oapi_generator, default: [
  naming: [
    base_module: MyClientLibrary,
    default_operation_module: MyOperations
  ]
]
```

Learn more in the documentation for `OpenAPI.Processor.Naming.operation_modules/2`.

### Processor: Ignore

The `ignore` option allows operations to be ignored based on their Operation IDs or paths in the API description.
Patterns can be exact strings or regular expressions.

Learn more in the documentation for `OpenAPI.Processor.Ignore`.

### Renderer: Default Client

`output.default_client` defines the module that will be called in each operation function.
By allowing the client module to be defined at the time of code generation (with this option) and at runtime (with the `client` option passed to any operation call), this code generator maximizes flexibility.
For example, tests can supply a special test client module when they call client operations.

This need not be the end of the flexibility, however.
The GitHub client library defines a "stack" system within its client module, allowing users to easily swap libraries for handling HTTP requests and decoding JSON.

### Renderer: Meta-programming

`output.operation_use` defines a module that should be included as a `use [output.operation_use]` statement at the top of every module that contains operations.
This can be useful for meta-programming, such as using compilation hooks to performed advanced modifications of the generated code.

### Renderer: Types

`output.types`, and specifically its `error` key, allows library authors to override the return type of operation functions.
It's fairly common for client libraries to create their own error that acts as a superset for all of the errors defined in the OpenAPI description.
This provides a consistent interface for client library consumers.

---

## Schemas

Much of the configuration of this code generator relates to the naming and output of schemas.
Remember that the library takes an operation-first mindset, and will not output schemas that are not actively used by an operation.

Following is an example operation module that has been annotated with the configuration options involved in various parts of the rendered output.

### Example Schema

```elixir
# Existence: `ignore`
# Location: `output.location`, `output.schema_subdirectory`
# Module name: `output.base_module`
defmodule Example.MySchema do
  @moduledoc """
  Provides struct and types for a MySchema
  """
  # `output_schema_use`
  use Example.Helper

  @type t :: %__MODULE__{
    example: String.t()
  }

  defstruct [
    # output.extra_fields
    :__extra__,
    :example
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      example: :string
    ]
  end
end
```

Below are some of the highlights from the available configuration.
See the **Option Reference** section for an exhaustive list of the available options.

### Processor: Naming

Schemas can be renamed, grouped, and merged.
Applying variations of these options to the API description can turn generated code from confusing to ergonomic rather quickly.

Learn more in the documentation for `OpenAPI.Processor.Naming.schema_module_and_type/2`.

### Processor: Ignore

The `ignore` option allows operations to be ignored based on their Operation IDs or paths in the API description.
Patterns can be exact strings or regular expressions.

Learn more in the documentation for `OpenAPI.Processor.Ignore`.

### Renderer: Extra Fields

`output.extra_fields` allows authors to insert additional fields into every outputted schema.
For example, the GitHub library adds an `__info__` map to each schema.
Like the `__meta__` field provided by `Ecto.Schema` or the `private` field on `Plug.Conn`, this field can hold additional library-specific information without interfering with the API's own data.

### Renderer: Meta-programming

`output.schema_use` allows authors to insert a `use [output.schema_use]` statement at the top of every module containing a schema.
A corresponding module must be supplied by the library with a `__using__/1` macro.
Inside this macro, library authors can inject additional code that may be helpful.
For example:

```elixir
defmodule MyLibrary.Schema do
  defmacro __using__(_opts) do
    quote do
      @derive {Jason.Encoder, except: [:__info__]}
    end
  end
end
```

Inside the macro, you can reference the name of the current module using `__MODULE__`, along with any other variables that are part of the macro environment.

---

## Option Reference

Below are all of the configuration options offered by the default implementations of the processor and renderer.
They are expressed in terms of nested keyword lists.
For example, `output.base_module` represents the following:

```elixir
config :oapi_generator, default: [
  output [
    base_module: ...
  ]
]
```

Remember that all configuration values must be contained within a profile.

- `ignore`: List of patterns (string or regular expression) representing operations or schemas to ignore during code generation.
  Include the special atom `:deprecated` to ignore all deprecated schemas and operations, `:deprecated_schemas` to ignore deprecated schemas, and `:deprecated_operations` to ignore deprecated operations.
  Defaults to an empty list of patterns.
  See `OpenAPI.Processor.Ignore` for more information.

- `naming.default_operation_module`: Module into which operation functions will be rendered if a module cannot be determined based on their operation ID or tags.
  The configuration should not include the base module configured in `output.base_module`.
  Defaults to `Operations`.
  See `OpenAPI.Processor.Naming.operation_modules/2` for more information.

- `naming.group`: List of module namespaces to use while naming operations and schemas.
  Defaults to an empty list of modules.
  See `OpenAPI.Processor.Naming.group_schema/2` for more information.

- `naming.merge`: List of tuples containing patterns and replacements to use when merging schema modules.
  Defaults to an empty list of merges.
  See `OpenAPI.Processor.Naming.merge_schema/2` for more information.

- `naming.operation_use_tags`: Whether to use tags when determining module names for operations.
  Defaults to `true`.
  See `OpenAPI.Processor.Naming.operation_modules/2` for more information.

- `naming.rename`: List of tuples containing patterns and replacements to use when renaming modules.
  Defaults to an empty list of replacements.
  See `OpenAPI.Processor.Naming.rename_schema/2` for more information.

- `output.base_module`: Base module of the generated code.
  This is often the name of the library you intend to create, and it acts as a prefix for all rendered modules.
  Defaults to `nil`, or no module prefix.
  See `OpenAPI.Renderer.Module.render/2` for more information.

- `output.default_client`: Default client to use in operation modules.
  Every operation function calls a dynamic module to perform requests, and this configuration determines the default value.
  Defaults to `[output.base_module].Client`.
  See `OpenAPI.Renderer.Module.render_default_client/2` for more information.

- `output.extra_fields`: Additional fields to add to all schema struct definitions and their typespecs, expressed as a keyword list of types.
  This can be useful for private data the library wishes to add to all outputted data.
  Defaults to an empty list of fields.
  See `OpenAPI.Renderer.Schema` for more information.

- `output.field_casing`: Either `:camel`, `:snake`, or `nil` (default) to output schema field names as `camelCase`, `snake_case`, or leave the fields name as-is from the API description.
  Changing the field casing is likely to be a breaking change for clients, unless the API description consistently uses the same casing.
  Setting this field may be necessary if field names require normalization (ex. if a field begins with a number).

- `output.location`: Base filesystem location for all rendered files.
  This is often a directory like `lib` to follow Elixir conventions.
  Defaults to the current working directory.
  See `OpenAPI.Renderer.Module.filename/2` for more information.

- `output.operation_call.request`: Format of the `request` key in the body of an operation function.
  By default, the possible request body schemas are formatted as a `:list` of tuples with the content type and the schema.
  A value of `:map` will cause a map to be output instead.
  See `OpenAPI.Renderer.Operation.render_function/2` for more information.

- `output.operation_subdirectory`: Subdirectory to use for all rendered files containing operations.
  This is an optional way to colocate generated operation modules in a single directory away from other parts of the client library.
  Defaults to the same location as `output.location`.
  See `OpenAPI.Renderer.Module.filename/2` for more information.

- `output.operation_use`: Module to include as a `use` statement at the top of every module containing operations.
  Defaults to no used module.
  See `OpenAPI.Renderer.Module.render_using/2` for more information.

- `output.schema_subdirectory`: Subdirectory to use for all rendered files containing only schemas.
  This is an optional way to colocate generated schema modules in a single directory away from other parts of the client library.
  Defaults to the same location as `output.location`.
  See `OpenAPI.Renderer.Module.filename/2` for more information.

- `output.schema_use`: Module to include as a `use` statement at the top of every module containing only schemas.
  Defaults to no used module.
  See `OpenAPI.Renderer.Module.render_using/2` for more information.

- `output.types.error`: Type to override the error return type of all operation functions.
  This is useful when the client intends to normalize errors from the API.
  By default, the error type is a union of all possible error responses for the operation.
  See `OpenAPI.Renderer.Operation.render_spec/2` for more information.

- `output.types.specs`: Format of type specifications to use for operation functions.
  The default is `:spec`, which outputs a single `@spec` including all arguments and `opts`.
  Use `:spec_comprehensive` to output two `@spec`, one with and one without the optional `opts` parameter.
  Use `:callback` to instead output a `@callback` (useful for some mocking libraries).
  Similarly, `:callback_comprehensive` outputs two `@callback`s, one with and one without the optional `opts` parameter.
  Use the special value `false` to disable spec output altogether.
  See `OpenAPI.Renderer.Operation.render_spec/2` for more information.

- `reader.additional_files`: List of paths to supplemental root files of an API description.
  Defaults to an empty list.
  See `OpenAPI.Reader` for more information.

- `reader.file`: Path to the root file of an API description.
  This option is often supplied to the `mix api.gen` mix task instead.
  See `OpenAPI.Reader` for more information.
