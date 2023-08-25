# Client Author Guide

Unlike most packages on Hex.pm, the target audience for this project is _other library authors_, and not necessarily end-users.
While it is certainly possible for application developers to generate code directly in their Elixir apps, it's likely that most OpenAPI specifications will be consumed by a generic client library (like [oapi_github](https://github.com/aj-foster/open-api-github)) instead.

With that in mind, this guide provides additional information and guidance for authors of client libraries.

## Code Generation

As the author of a library with code generated from an OpenAPI description, it's important to establish a healthy relationship between your library and the spec.
For example, if your library is based on a specification that is updated often, you likely want to set a reasonable cadence (ex. monthly) for updating the generated code.
Otherwise, maintenance can become a burden very quickly.

Following are some recommendations for how to establish this relationship.

### Cadence

As mentioned above, some OpenAPI descriptions are updated often.
Before introducing API versioning, GitHub continuously updated its OpenAPI spec with both new endpoints and corrections for existing ones.
A library author could potentially release new versions every week in an attempt to keep up.
However, it's unlikely that real-time updates of the generated code is necessary.

Here are a few options for releasing updates to the generated code:

1. If the description updates often with new endpoints that consumers of your library are eager to use, a rapid or as-needed release cadence may be appropriate.
  This might mean creating a scheduled CI job that regularly re-generates the code based on the latest copy of the specification and opens a pull request with the changes.
  Or, it might mean encouraging users of the library to open an issue or pull request when they encounter an unsupported endpoint.

2. If the description updates often with fixes to the specification, then a periodic release cadence may be appropriate.
  This would help users of the library avoid issues while also reducing the maintenance burden.

3. If the description has well-versioned or occasional updates, the client may wish to "follow" the release cadence of the specification.
  In this case, the version of the description may play a central role in the client, and should likely be included as an `.api-version` file in the release.
  This makes it clear to users of the library what API version they can expect.

### Contributions

Some libraries will be best served by an as-needed update cadence.
In this case, simple guidelines around the contribution of generated code can make a big difference.

Here is an excerpt from the contribution guidelines for the GitHub client library that uses this generator:

> ### Updating the Generated Code
>
> If you intend to open a PR with updates to the generated code based on the latest GitHub OpenAPI description, please read carefully:
> 
> 1. Please use the latest commit from the [official repository](https://github.com/github/rest-api-description) at the time of your contribution.
> 2. Please use `descriptions-next/api.github.com/api.github.com.yaml` — **not** `descriptions` or a GitHub Enterprise release.
> 3. Use `mix api.gen default path/to/descriptions-next/api.github.com/api.github.com.yaml` to regenerate the code.
> 4. Please also change the `.api-version` file if appropriate.
> 5. Please include the commit SHA of the official repository in the description of your pull request.
> 6. Please do not make any other changes in the same PR (for example, changing this library's version).
>
> If you run into any unexpected issues while generating the code, please open an issue.
>
> Thank you for your help!

Although not all contributors will read this guidance, steps like this can make it much easier for you as a library author to simply merge the pull request and release a new version.

### Supplemental Specs

Despite best efforts, OpenAPI descriptions often don't cover all of the API endpoints available.
For example, although GitHub provides a nearly-comprehensive specification of hundreds of endpoints, there are ID-based endpoints like `/repositories/{id}` that are not publicly documented.
A library author may know this _a priori_ and wish to include these endpoints in the generated code.

For this case, it is recommended that the author **maintain a separate, supplemental OpenAPI description document** with just enough information to generate the additional code.

<!-- TODO: Give additional information about referencing existing schemas -->

---

## Configuration

This project exists for its configuration capabilities.
Most API client libraries are **either** feature complete (due to code generation) **or** ergonomic (due to hand-crafting code), but not both.
With the right configuration — and a little bit of luck with the OpenAPI description — your client library can be both.

The following sections outline the configuration available for the _default implementations_ of the various callbacks used by this library.
See the [Plugins](#plugins) section for information about overriding the default behaviours with custom implementations.

### Operations

Operations are the actions you can take in an API: the actual HTTP requests that are possible.
This code generator takes an operation-first mindset when generating code.
For example, schemas that are defined in a description but not referenced in any API operation will not be output.

At the moment, configuration related to the naming and placement of operation functions is limited.
If you have ideas related to this, please share them in GitHub Discussions.

<!-- TODO: Provide naming options for operations -->

There are configuration options targeted at making the generated functions more flexible for library authors:

#### Default Client

`default_client` defines the module that will be called in each operation function.
By allowing the client module to be defined at the time of code generation (with this option) and at runtime (with the `client` option passed to any operation call), this code generator maximizes flexibility.
For example, tests can supply a special test client module when they call client operations.

This need not be the end of the flexibility, however.
The GitHub client library defines a "stack" system within its client module, allowing users to easily swap libraries for handling HTTP requests and decoding JSON.

#### Types

`types`, and specifically its `error` key, allows library authors to override the return type of operation functions.
It's fairly common for client libraries to create their own error that acts as a superset for all of the errors defined in the OpenAPI description.
This provides a consistent interface for client library consumers.

### Schemas

Much of the configuration of this code generator relates to the naming and output of schemas.
For more information, check out the **Naming** section of the `OpenAPI.Config` module documentation.

There are also configuration options targeted at making the generated modules more flexible for library authors:

#### Extra Fields

`extra_fields` allows authors to insert additional fields into every outputted schema.
For example, the GitHub library adds an `__info__` map to each schema.
Like the `__meta__` field provided by `Ecto.Schema` or the `private` field on `Plug.Conn`, this field can hold additional library-specific information without interfering with the API's own data.

#### Schema "use"

`schema_use` allows authors to insert a `use [Module]` statement at the top of every schema.
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

## Plugins

Sometimes, the configuration available using the default implementation of this library isn't enough.
For advanced use-cases, library authors have the option to override the default implementations and create their own workflows.
This section provides more details and a brief example of such an integration.

First, however, it is important to understand how the library is divided up:

### Phases

There are three overall phases involved in code generation:

1. **Read** the API description, dereference it, and create a large in-memory data structure representing the specification.
  This phase begins with one or more filenames (JSON or YAML) to read and ends with an Elixir representation of each document.
2. **Process** the description, converting the data into structures that are more useful for code generation.
  This phase begins with the dereferenced API description and ends with a modified set of structs that represent the files to be written.
3. **Render** the code using an AST-based renderer.
  This phase begins with the final state of the API description and ends with formatted Elixir code written to the filesystem.

Through all three phases, the library uses an `OpenAPI.State` struct to keep track of changes.
Each phase also implements its own "state" struct, with intermediate data useful for that phase.

### Behaviours

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
# config.exs

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

The full list of callbacks can be found below and in the documentation for `OpenAPI.Processor` and `OpenAPI.Renderer`.

### Configuration

Since custom plugins are implemented in each client applications, authors can choose to configure them in whatever manner suits the client application best.
It is recommended that the method of configuration maximize the repeatability of the code generation for easier contributions.

Default implementations of each callback generally use the application environment for configuration.
Because of this, if library authors use the same configuration profiles setup as the default implementations, it is recommended that each custom plugin choose a unique configuration key within the profile that does not conflict with other callbacks.

### Callbacks

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
