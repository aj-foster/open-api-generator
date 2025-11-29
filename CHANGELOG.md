# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

_Nothing yet._

## 0.3.0 (2025-11-29)

- **Breaking**: Officially drop support for Elixir 1.14 (and lower) and Erlang/OTP 23 (and lower).
  Elixir 1.15+ and Erlang/OTP 24+ are supported.
- **Breaking**: Operation modules are now renamed using the same `naming.rename` configuration as schema modules.
- **Breaking**: Configuration option `field_casing` is now `output.field_casing` (which was previously, incorrectly, documented as `naming.field_casing`).

- **Add**: Processor and Renderer modules now have proper `@behaviour` and `@impl` annotations.
  Thanks [@McSym28](https://github.com/aj-foster/open-api-generator/pull/70)!
- **Add**: Arguments in operation type specifications are now labeled by name (ex. `body :: map`) for additional clarity.
  Thanks [@McSym28](https://github.com/aj-foster/open-api-generator/pull/71)!
- **Add**: Option `ignore` can now accept `:deprecated`, `:deprecated_schemas`, and `:deprecated_operations` to optionally ignore portions of the API description that have been marked as deprecated.
- **Add**: Add request body content type and description to the docstring of an operation.
  Thanks [@wakeless](https://github.com/aj-foster/open-api-generator/pull/89)!
- **Add**: Keep information about default field values through the processing phase.
  Thanks [@jaeyson](https://github.com/aj-foster/open-api-generator/issues/87)!

- **Fix**: Module name generation when field name has `.` in it.
  Thanks [@bulld0zer](https://github.com/aj-foster/open-api-generator/pull/76)!
- **Fix**: Successfully merge paths from multiple descriptions, and merge path items.
  Thanks [@florius0](https://github.com/aj-foster/open-api-generator/pull/61)!
- **Fix**: Output format, output location, and grouping of sub-fields now supports multiple levels of nesting.
- **Fix**: Object fields on response schemas are now named and output correctly based on the determined output format.
- **Fix**: Fix an issue with the default type given to parameters (thanks [@dballance](https://github.com/aj-foster/open-api-generator/issues/86))!
- **Fix**: Typed map responses are now properly represented in their operations' function specs.
- **Fix**: Fix warnings related to struct update syntax in Elixir 1.19.
- **Fix**: Fix an issue where refs were not handled for `requestBody` schemas
  Thanks [@mjquinlan2000](https://github.com/aj-foster/open-api-generator/pull/91)!
- **Fix**: Raise an error if a schema has a name that is incompatible with Elixir module names (for example, all numbers).
  Thanks [@ericphanson](https://github.com/aj-foster/open-api-generator/issues/74)!

- **Chore**: GitHub Action runner version has been updated.
- **Chore**: `.tool-versions` updated to latest Erlang + Elixir

## 0.2.0 (2024-07-08)

- **Breaking**: Snake case normalization (ex. function names) now correctly segments numbers.
  For example, an operation `v2example` is now output as `v2_example`.
  This may be a breaking change for clients with numbers in operation IDs.

- **Add**: New configuration option `output.field_casing` to choose between `:camel` case, `:snake` case, or performing no normalization (`nil`, the default).
  Using this option may be necessary for API descriptions that include non-normalized field names (for example, fields that begin with a number or symbol).
  Setting this configuration would be a breaking change for any clients based on API descriptions that have inconsistent field casing.

- **Fix**: Parameters listed in path items (as opposed to operations) now support refs.
- **Fix**: References that point to references are now handled correctly.

### 0.1.1 (2024-05-17)

- **Fix**: Allow HTTP response codes encoded as integer keys instead of string keys.

## 0.1.0 (2024-04-25)

This release is a major change from version `0.0.8`.
It includes support for plugins, sub-schemas, and more.
See the [plugins guide](guides/plugins.md) and [migration guide](guides/migration.md) for more information, and check out the release candidate notes below for a comprehensive list of changes.

Changes since the last release candidate:

- **Fix**: `anyOf` and `oneOf` definitions now take precedence over generic union types.
- **Fix**: Modules with both schema(s) and operations no longer define `__field__/1` twice.
- **Fix**: Add URL encoded form types to the readable type helper, and fix its fallback clause.
- **Fix**: Warn about unknown types (for example, null schemas) instead of raising.
- **Fix**: Avoid outputting empty schemas that have no properties but accept arbitrary additional properties.

### 0.1.0-rc.4 (2024-03-08)

- **Breaking**: Output schemas that represent subfields of an already-output schema.

- **Add**: Output full structs for any schemas in the `responses` component portion of the spec.
- **Add**: New plugin callback `c:OpenAPI.Processor.schema_format/2` to set the output format of a schema (ex. `:struct` or `:typed_map`).
- **Add**: Support schemas that utilize `allOf` with a naive intersection type.
- **Add**: New configuration option `output.operation_call.request` to modify the format of output request information in the operation function call.
  Use `:map` to output it as a map instead of a list of tuples.

- **Fix**: Avoid outputting empty files.
- **Fix**: Avoid accidentally unwrapping array types in operation typespecs.
- **Fix**: Support API descriptions that have a discriminator without a `mapping` key (thanks [@s3cur3](https://github.com/s3cur3)!).

### 0.1.0-rc.3 (2023-09-29)

- **Fix**: Cyclical schema references would result in an infinite loop during the read phase.
  This has been fixed specifically for schema references; if references that don't point to schemas create a cycle, generation will still fail.

### 0.1.0-rc.2 (2023-09-27)

- **Fix**: Schemas that only appeared in union types were not properly processed, resulting in more plain `map` types than intended.

### 0.1.0-rc.1 (2023-09-26)

- **Fix**: Schema output was non-deterministic due to map ordering and an issue tracking contexts.
- **Fix**: Warn when an enum type is invalid (ex. contains schemas).
  In this case, the type will be expanded to `:any` but otherwise continue processing.
- **Fix**: Map types were output as the literal atom `:map` instead of `map` in typespecs.
- **Fix**: Preserve indentation of operation docstrings.
- **Fix**: Always include `args` in client calls, even if the list is empty.
- **Fix**: Ensure the app is started in `mix api.gen`.
  This resolves an issue in which configured processor or renderer modules may not be available.

## 0.1.0-rc.0 (2023-09-06)

- **Breaking**: This is a major release.
  See the [migration guide](guides/migration.md) for more information.
- **Add**: Plugin system for overriding the behavior of this library.
  See the [plugins guide](guides/plugins.md) for more information.
- **Add**: Additional internal types to represent string variations, enums, etc.
- **Fix**: Uniformly normalize names of operations and schemas.

### 0.0.8 (2023-09-06)

- **Fix**: Path parameters are now collected from more locations in the spec.
  Previously, the generator only noticed path parameters declared in the individual path _items_.
  This may cause breaking changes in some operation functions, however they were likely unusable before.
- **Fix**: Ensure all path parameter keys are properly underscored (thanks [wingyplus](https://github.com/wingyplus)!).

### 0.0.7 (2023-06-07)

- **Add**: `schema_use` option to add optional `use [Module]` statements within schemas.
- **Add**: `operation_default_module` and `operation_use_tags` options for controlling the creation of operation modules (thanks [@xadhoom](https://github.com/xadhoom)!).
- **Add**: New _Client Author Guide_ for assisting client library authors.
- **Fix**: Allow empty/missing `tags` and `components` keys in the specification (thanks [@rubas](https://github.com/rubas)!).
- **Fix**: Allow missing server variable object in the specification (thanks [@xadhoom](https://github.com/xadhoom)!).
- **Fix**: Keep acronyms intact when naming operations (thanks [@feynmanliang](https://github.com/feynmanliang)!).

### 0.0.6 (2023-05-17)

- **Add**: New `extra_fields` option to allow library authors to create their own private fields on generated structs.
  The location and semantics of this option are likely to be changed in the future.
- **Fix**: Include `body` argument in `args` passed to the client.
  Clients may rely on this information (the values themselves, or the arity) for their operations, especially in testing situations.

### 0.0.5 (2023-05-16)

- **Fix**: Replace all non-alphanumeric characters when naming tagged operations.
- **Fix**: Handle nullable union types with no realizable non-null types.
  This case occurred in the GitHub spec (see [github/rest-api-description#2534](https://github.com/github/rest-api-description/issues/2534)).

### 0.0.4 (2023-05-10)

- **Add**: Add `call` information to client calls.
  This will allow specialized clients, like a test mock, to introspect the original calling function without the use of stack traces.
- **Fix**: Add missing type `:map` to `OpenAPI.Generator.Typing.t()`.
- **Fix**: Support `default` entry in responses object (thanks [@aej](https://github.com/aej)!).
- **Fix**: Strip spaces and repetitive dash/underscore/whitespace characters when naming operations (thanks [@feynmanliang](https://github.com/feynmanliang)!).

### 0.0.3 (2023-02-19)

- **Add**: Add `args` keyword list to client calls.
  This will allow specialized clients, like a test mock, to differentiate between static URL segments and dynamic path parameters.

### 0.0.2 (2023-02-17)

- **Add**: Support OpenAPI 3.1 `"null"` type
- **Add**: Support `type` field given as an array of primitive types
- **Fix**: Infer `map` type in more cases when `type` field is unspecified

### 0.0.1 (2023-01-05)

- **Initial Release**
