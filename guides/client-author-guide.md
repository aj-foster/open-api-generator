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

## Configuration

This project exists for its configuration capabilities.
Most API client libraries are **either** feature complete (due to code generation) **or** ergonomic (due to hand-crafting code), but not both.
With the right configuration — and a little bit of luck with the OpenAPI description — your client library can be both.

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
