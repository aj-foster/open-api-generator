# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

* **Add**: New `extra_fields` option to allow library authors to create their own private fields on generated structs.
* **Fix**: Include `body` argument in `args` passed to the client.
  Clients may rely on this information (the values themselves, or the arity) for their operations, especially in testing situations.

### 0.0.5

* **Fix**: Replace all non-alphanumeric characters when naming tagged operations.
* **Fix**: Handle nullable union types with no realizable non-null types.
  This case occurred in the GitHub spec (see [github/rest-api-description#2534](https://github.com/github/rest-api-description/issues/2534)).

### 0.0.4

* **Add**: Add `call` information to client calls.
  This will allow specialized clients, like a test mock, to introspect the original calling function without the use of stack traces.
* **Fix**: Add missing type `:map` to `OpenAPI.Generator.Typing.t()`.
* **Fix**: Support `default` entry in responses object (thanks [@aej](https://github.com/aej)!).
* **Fix**: Strip spaces and repetitive dash/underscore/whitespace characters when naming operations (thanks [@feynmanliang](https://github.com/feynmanliang)!).

### 0.0.3

* **Add**: Add `args` keyword list to client calls.
  This will allow specialized clients, like a test mock, to differentiate between static URL segments and dynamic path parameters.

### 0.0.2

* **Add**: Support OpenAPI 3.1 `"null"` type
* **Add**: Support `type` field given as an array of primitive types
* **Fix**: Infer `map` type in more cases when `type` field is unspecified

### 0.0.1

* **Initial Release**
