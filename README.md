# OpenAPI Generator for Elixir

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

OpenAPI Generator is not yet available on Hex.pm.
In the meantime, please install it directly from GitHub:

```elixir
def deps do
  [
    {:open_api, github: "aj-foster/open-api-generator", branch: "main"}
  ]
end
```

Be aware that the `main` branch may occasionally include unstable updates.


## Configuration

The real power of this library is in the available configuration.
Although the options are conceptually simple, they add up to a better user experience.

This project uses configuration profiles to allow multiple configurations with the same package.
To get started, create a profile called `default` in your configuration:

```elixir
config :open_api,
  default: [
    base_location: "lib/example",
    base_module: Example
  ]
```

This is the minimum viable configuration for the generator.
It will create modules namespaced with `Example.` and save files in `lib/example`.

### Output Module Naming

TODO.
