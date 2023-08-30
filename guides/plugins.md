# Plugins

Sometimes, the configuration available using the default implementation of this library isn't enough.
For advanced use-cases, library authors have the option to override the default implementations and create their own workflows.
This guide provides more details and a brief example of such an integration.

First, however, it is important to understand how the library is divided up:

## Phases

There are three overall phases involved in code generation:

1. **Read** the API description, dereference it, and create a large in-memory data structure representing the specification.
  This phase begins with one or more filenames (JSON or YAML) to read and ends with an Elixir representation of each document.
2. **Process** the description, converting the data into structures that are more useful for code generation.
  This phase begins with the dereferenced API description and ends with a modified set of structs that represent the files to be written.
3. **Render** the code using an AST-based renderer.
  This phase begins with the final state of the API description and ends with formatted Elixir code written to the filesystem.

Through all three phases, the library uses an `OpenAPI.State` struct to keep track of changes.
Each phase also implements its own "state" struct, with intermediate data useful for that phase.

## Behaviours

Both the _process_ and _render_ phases define a behaviour with optional callbacks.
By default, the following modules are used for each phase:

```elixir
config :oapi_generator,
  my_profile: [
    processor: OpenAPI.Processor,
    renderer: OpenAPI.Renderer
  ]
```

Client library authors may configure their own module in place of the default implementation.
For example, a custom renderer may start like this:

```elixir
# config/config.exs

config :oapi_generator,
  my_profile: [
    renderer: MyLibrary.Renderer
  ]
```

```elixir
# lib/my_library/renderer.ex

defmodule MyLibrary.Renderer do
  use OpenAPI.Renderer
end
```

With `use OpenAPI.Renderer` (or similarly with `use OpenAPI.Processor`), default implementations of all behaviour callbacks are provided automatically.
This allows authors to override only those callbacks they are interested in.

```elixir
# lib/my_library/renderer.ex

defmodule MyLibrary.Renderer do
  use OpenAPI.Renderer

  # Override the default write/2 callback
  # with an alternative implementation.
  def write(state, file) do
    # ...
  end
end
```

The full list of callbacks can be found in the [**Callbacks**](#callbacks) section below and in the documentation for `OpenAPI.Processor` and `OpenAPI.Renderer`.

## Configuration

Since custom plugins are implemented in each client applications, authors can choose to configure them in whatever manner suits the client application best.
It is recommended that the method of configuration maximize the repeatability of the code generation for easier contributions.

Default implementations of each callback generally use the application environment for configuration.
Because of this, if library authors use the same configuration profiles setup as the default implementations, it is recommended that each custom plugin choose a unique configuration key within the profile that does not conflict with other callbacks.

## Callbacks

Below is a list of all available callbacks in order of their use, along with their default implementations:

**Processor**: `OpenAPI.Processor`

* For each operation
  * `c:OpenAPI.Processor.ignore_operation?/2`: `OpenAPI.Processor.Ignore.ignore_operation?/2`
  * `c:OpenAPI.Processor.operation_docstring/3`: `OpenAPI.Processor.Operation.docstring/3`
  * `c:OpenAPI.Processor.operation_request_method/2`: `OpenAPI.Processor.Operation.request_method/2`
  * `c:OpenAPI.Processor.operation_module_names/2`: `OpenAPI.Processor.Naming.operation_modules/2`
  * For each operation module name
    * `c:OpenAPI.Processor.operation_function_name/2`: `OpenAPI.Processor.Naming.operation_function/2`
    * `c:OpenAPI.Processor.operation_request_body/2`: `OpenAPI.Processor.Operation.request_body/2`
    * `c:OpenAPI.Processor.operation_response_body/2`: `OpenAPI.Processor.Operation.response_body/2`
* For each schema
  * `c:OpenAPI.Processor.ignore_schema?/2`: `OpenAPI.Processor.Ignore.ignore_schema?/2`
  * `c:OpenAPI.Processor.schema_module_and_type/2`: `OpenAPI.Processor.Naming.schema_module_and_type/2`

**Renderer**: `OpenAPI.Renderer`

* For each file (identified by module name)
  * `c:OpenAPI.Renderer.render/2`: `OpenAPI.Renderer.Module.render/2`
    * `c:OpenAPI.Renderer.render_moduledoc/2`: `OpenAPI.Renderer.Module.render_moduledoc/2`
    * `c:OpenAPI.Renderer.render_using/2`: `OpenAPI.Renderer.Module.render_using/2`
    * `c:OpenAPI.Renderer.render_default_client/2`: `OpenAPI.Renderer.Module.render_default_client/2`
    * `c:OpenAPI.Renderer.render_schema/2`: `OpenAPI.Renderer.Schema.render/2`
      * `c:OpenAPI.Renderer.render_schema_types/2`: `OpenAPI.Renderer.Schema.render_types/2`
      * `c:OpenAPI.Renderer.render_schema_struct/2`: `OpenAPI.Renderer.Schema.render_struct/2`
      * `c:OpenAPI.Renderer.render_schema_field_function/2`: `OpenAPI.Renderer.Schema.render_field_function/2`
    * `c:OpenAPI.Renderer.render_operations/2`: `OpenAPI.Renderer.Operation.render_all/2`
    * For each operation in the file
      * `c:OpenAPI.Renderer.render_operation/2`: `OpenAPI.Renderer.Operation.render/2`
      * `c:OpenAPI.Renderer.render_operation_doc/2`: `OpenAPI.Renderer.Operation.render_doc/2`
      * `c:OpenAPI.Renderer.render_operation_spec/2`: `OpenAPI.Renderer.Operation.render_spec/2`
      * `c:OpenAPI.Renderer.render_operation_function/2`: `OpenAPI.Renderer.Operation.render_function/2`
  * `c:OpenAPI.Renderer.format/2`: `OpenAPI.Renderer.Util.format/2`
  * `c:OpenAPI.Renderer.location/2`: `OpenAPI.Renderer.Module.filename/2`
  * `c:OpenAPI.Renderer.write/2`: `OpenAPI.Renderer.Util.write/2`

Each callback represents an opportunity for client library authors to inject their own logic into the code generator.
If popular overrides are discovered, they may be added to the default implementation as well.
