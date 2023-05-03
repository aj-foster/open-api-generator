# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

* **Add**: Add `call` information to client calls.
  This will allow specialized clients, like a test mock, to introspect the original calling function without the use of stack traces.
* **Fix**: Add missing type `:map` to `OpenAPI.Generator.Typing.t()`.

<!-- _Nothing yet._ -->

### 0.0.3

* **Add**: Add `args` keyword list to client calls.
  This will allow specialized clients, like a test mock, to differentiate between static URL segments and dynamic path parameters.

### 0.0.2

* **Add**: Support OpenAPI 3.1 `"null"` type
* **Add**: Support `type` field given as an array of primitive types
* **Fix**: Infer `map` type in more cases when `type` field is unspecified

### 0.0.1

* **Initial Release**
