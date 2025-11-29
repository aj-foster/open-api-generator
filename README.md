# OpenAPI Generator for Elixir

[![Hex.pm](https://img.shields.io/hexpm/v/oapi_generator)](https://hex.pm/packages/oapi_generator)
[![Documentation](https://img.shields.io/badge/hex-docs-blue)](https://hexdocs.pm/oapi_generator)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

_A highly-configurable code generator that combines ergonomics with maintainability._

---

[OpenAPI](https://swagger.io/specification/) is a standard way to describe REST APIs on the web.
Anyone can create an OpenAPI description document that includes the available endpoints, expected request data, and possible responses.
For example, [GitHub](https://github.com/github/rest-api-description) maintains a comprehensive OpenAPI description for their services.

Generating code from an OpenAPI description can be relatively easy — this project [certainly isn't the first](https://openapi-generator.tech/docs/generators/elixir) — but there's a catch: API descriptions often don't translate into ergonomic code.
Most users of an API client library don't want to think about the difference between a `NullableRepository` and `Repository`, as in the OpenAPI 3.0 GitHub API description.
(They have the same fields, but one has `nullable: true`.)
Users just want to get back a `%Repository{}` or `nil`.

The goal of this library is to create **ergonomic** client libraries from OpenAPI descriptions.
At the same time, the changes made to the code are easily repeatable (fully automated) for the sake of maintainability.
Think: the friendliness of your favorite hand-crafted client library applied to the scale of large APIs.

> _See an example client library [here](https://github.com/aj-foster/open-api-github)._

For more on how this is accomplished, see **Configuration** below and the [configuration guide](guides/configuration.md).

## Installation

This library is available on Hex.pm.
Add the dependency in `mix.exs`:

```elixir
def deps do
  [
    {:oapi_generator, "~> 0.3.0", only: :dev, runtime: false}
  ]
end
```

Then install the dependency using `mix deps.get`.
Most libraries only need access to the `mix api.gen` task in a development environment.
If your use case requires calling the generator in production or testing, be sure to modify or remove `only: :dev` and `runtime: false` as appropriate.

## Configuration

The real power of this library is in the available configuration.
Although the options are conceptually simple, they add up to a better user experience.

This project uses configuration profiles to allow multiple configurations with the same package.
To get started, create a profile called `default` in your configuration file:

```elixir
# config/config.exs

import Config

config :oapi_generator, default: [
  output: [
    base_module: Example,
    location: "lib/example"
  ]
]
```

This is the minimum viable configuration for most client libraries.
It will create modules namespaced with `Example.` and save files in `lib/example`.

Some the options supported by the generator out-of-the-box include:

- Defining which module executes the requests
- Ignoring schemas and operations
- Renaming schemas
- Grouping schemas into module namespaces
- Merging schemas to create a struct with multiple typespecs
- Writing schemas and operation modules to different locations
- Introducing additional schema fields
- Adding custom `use` statements to generated modules
- Overriding function return types

For more information, see the [configuration guide](guides/configuration.md).

## Plugins

If the available configuration isn't enough, client library authors can also reimplement portions of the code generator using _plugins_.
Most of the crucial parts of the processing and rendering of code are implemented as default callbacks for a behaviour.
These can be overridden for additional flexibility.
See the [plugins guide](guides/plugins.md) for additional information.

## Usage

Once the library is installed and configured, use `mix api.gen` with the name of the configuration profile and the OpenAPI description file(s):

```shell
mix api.gen default path/to/rest-api-description/spec.yaml
```

By default, all of the operation functions end in a call to `client.request/1`, where `client` is a module passed in as an option **or** a default module (set using the `output.default_client` configuration).
As a library author, you create this module and define the `request/1` function.
You can use any HTTP client and handle errors in whatever way best suits your project.

## Further Reading

- [Code of Conduct](CODE_OF_CONDUCT.md)
- [Contribution Guidelines](CONTRIBUTING.md)
- [License](LICENSE)
- [OpenAPI Specification](https://spec.openapis.org/oas/latest.html)

## Sponsorship

If you like this library or it makes you money, please consider [sponsoring](https://github.com/sponsors/aj-foster).
