# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

**Add**: Added headers and cookie parameter location handling. The request options now contain tuples such as `{"X-Header-Value", "some header value"}` and `{"cookie-name", "some cookie value"}`.
The options used to generate the cookie and headers value are also forwarded in the `opts` keyword argument to `client.request`

### 0.1.0-rc.3 (2023-09-29)

**Fix**: Cyclical schema references would result in an infinite loop during the read phase.
This has been fixed specifically for schema references; if references that don't point to schemas create a cycle, generation will still fail.

### 0.1.0-rc.2 (2023-09-27)

**Fix**: Schemas that only appeared in union types were not properly processed, resulting in more plain `map` types than intended.

### 0.1.0-rc.1 (2023-09-26)

**Fix**: Schema output was non-deterministic due to map ordering and an issue tracking contexts.
**Fix**: Warn when an enum type is invalid (ex. contains schemas).
In this case, the type will be expanded to `:any` but otherwise continue processing.
**Fix**: Map types were output as the literal atom `:map` instead of `map` in typespecs.
**Fix**: Preserve indentation of operation docstrings.
**Fix**: Always include `args` in client calls, even if the list is empty.
**Fix**: Ensure the app is started in `mix api.gen`.
This resolves an issue in which configured processor or renderer modules may not be available.

## 0.1.0-rc.0 (2023-09-06)

**Breaking**: This is a major release.
See the [migration guide](guides/migration.md) for more information.
**Add**: Plugin system for overriding the behavior of this library.
See the [plugins guide](guides/plugins.md) for more information.
**Add**: Additional internal types to represent string variations, enums, etc.
**Fix**: Uniformly normalize names of operations and schemas.

### 0.0.8 (2023-09-06)

**Fix**: Path parameters are now collected from more locations in the spec.
Previously, the generator only noticed path parameters declared in the individual path _items_.
This may cause breaking changes in some operation functions, however they were likely unusable before.
**Fix**: Ensure all path parameter keys are properly underscored (thanks [wingyplus](https://github.com/wingyplus)!).

### 0.0.7 (2023-06-07)

**Add**: `schema_use` option to add optional `use [Module]` statements within schemas.
**Add**: `operation_default_module` and `operation_use_tags` options for controlling the creation of operation modules (thanks [@xadhoom](https://github.com/xadhoom)!).
**Add**: New _Client Author Guide_ for assisting client library authors.
**Fix**: Allow empty/missing `tags` and `components` keys in the specification (thanks [@rubas](https://github.com/rubas)!).
**Fix**: Allow missing server variable object in the specification (thanks [@xadhoom](https://github.com/xadhoom)!).
**Fix**: Keep acronyms intact when naming operations (thanks [@feynmanliang](https://github.com/feynmanliang)!).

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
