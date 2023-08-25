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

Operations are the actions you can take in an API: the actual HTTP requests that are possible.
This code generator takes an operation-first mindset when generating code.
For example, schemas that are defined in a description but not referenced in any API operation will not be output.

Following are some of the available configuration options targeted at making the generated functions more flexible for library authors:

### Naming

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

Learn more in the documentation for `OpenAPI.Processor.Naming`.

### Default Client

`default_client` defines the module that will be called in each operation function.
By allowing the client module to be defined at the time of code generation (with this option) and at runtime (with the `client` option passed to any operation call), this code generator maximizes flexibility.
For example, tests can supply a special test client module when they call client operations.

This need not be the end of the flexibility, however.
The GitHub client library defines a "stack" system within its client module, allowing users to easily swap libraries for handling HTTP requests and decoding JSON.

### Types

`types`, and specifically its `error` key, allows library authors to override the return type of operation functions.
It's fairly common for client libraries to create their own error that acts as a superset for all of the errors defined in the OpenAPI description.
This provides a consistent interface for client library consumers.

---

## Schemas

Much of the configuration of this code generator relates to the naming and output of schemas.
For more information, check out the **Naming** section of the `OpenAPI.Config` module documentation.

There are also configuration options targeted at making the generated modules more flexible for library authors:

### Extra Fields

`extra_fields` allows authors to insert additional fields into every outputted schema.
For example, the GitHub library adds an `__info__` map to each schema.
Like the `__meta__` field provided by `Ecto.Schema` or the `private` field on `Plug.Conn`, this field can hold additional library-specific information without interfering with the API's own data.

### Schema "use"

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
