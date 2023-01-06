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
Most users of an API client library don't want to think about the difference between a `NullableRepository` and `Repository`, as in the GitHub API description.
(They have the same fields, but one has `nullable: true`.)
Users just want to get back a `%Repository{}` or `nil`.

The goal of this library is to create **ergonomic** client libraries from OpenAPI descriptions.
At the same time, the changes made to the code are easily repeatable (fully automated) for the sake of maintainability.
Think: the friendliness of your favorite hand-crafted client library applied to the scale of large APIs.

For more on how this is accomplished, see **Configuration** below.


## Installation

This library is available on Hex.pm.
Add the dependency in `mix.exs`:

```elixir
def deps do
  [
    {:oapi_generator, "~> 0.0.1"}
  ]
end
```

Then install the dependency using `mix deps.get`.


## Configuration

The real power of this library is in the available configuration.
Although the options are conceptually simple, they add up to a better user experience.

This project uses configuration profiles to allow multiple configurations with the same package.
To get started, create a profile called `default` in your configuration:

```elixir
config :oapi_generator,
  default: [
    base_location: "lib/example",
    base_module: Example
  ]
```

This is the minimum viable configuration for the generator.
It will create modules namespaced with `Example.` and save files in `lib/example`.
For a full list of configuration options, see the documentation for `OpenAPI.Config`.

### Output Module Naming

When the generator encounters a schema in the OpenAPI description, it performs a number of steps to determine the final name (module and type) of the schema that will be output to a file:

1. Based on the schema's location in the document, a provisional name is assigned.
  For example, `#/components/schemas/full-repository` becomes `FullRepository.t()`.

2. Schemas are **merged** based on the `merge` configuration key.
  For example, you may choose to merge `FullRepository.t()` into the `Repository.t()` schema to create `Repository.full()`.
  If two merged schemas have identical fields, then they will get the same name.

3. Schemas can be **ignored** using the `ignore` configuration key.
  Ignored schemas will be typed as simple `map()` types elsewhere in the generated code.

4. Schemas can be **renamed** using the `rename` configuration key.
  For example, you may wish to add or remove a word, change plurality, etc.

5. Finally, schemas can be **grouped** using the `group` configuration key.
  For example, a group of `Repository` would change `RepositoryInvitation` to `Repository.Invitation`.

The final module and type will be consistent in the output schema files and other files that reference them.

The `config/config.exs` file for this repository contains an example configuration related to the GitHub API description.
It includes a large number of groups for easily readable module names, merges for repeated or highly related schemas, and some module renaming for ease-of-use.


## Usage

Once the library is installed and configured, use `mix api.gen` with the name of the configuration profile and the OpenAPI description file:

```shell
mix api.gen default ../rest-api-description/spec.yaml
```

## Further Reading

* [Code of Conduct](CODE_OF_CONDUCT.md)
* [Contribution Guidelines](CONTRIBUTING.md)
* [License](LICENSE)
* [OpenAPI Specification](https://swagger.io/specification/)


## Sponsorship

If you like this library or it makes you money, please consider [sponsoring](https://github.com/sponsors/aj-foster).
