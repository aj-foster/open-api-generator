# Implementation

This document outlines the implementation of the code generator and the various points of configuration available.

## Phases

There are three overall phases involved in code generation:

1. **Read** the API description, dereference it, and create a large in-memory data structure representing the specification.
  This phase begins with one or more filenames (JSON or YAML) to read and ends with an Elixir representation of each document.
2. **Process** the description, converting the data into structures that are more useful for code generation.
  This phase begins with the dereferenced API description and ends with a modified set of structs that represent the files to be written.
3. **Generate** the code using an AST-based renderer.
  This phase begins with the final state of the API description and ends with formatted Elixir code written to the filesystem.

Through all three phases, the library uses an `OpenAPI.State` struct to keep track of changes.
Configuration may be predefined through the Application environment or implemented through plugins at various stages in the process.
