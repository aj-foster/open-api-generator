# Migration Guide

This document assists in the migration across breaking changes of the library.

## 0.0.x to 0.1.0

This version change represents a major rewrite of the core logic of the library.
There are many new features, such as the ability to override the default implementation of most parts of the processing and rendering of the code.
To facilitate this, much of the configuration has moved.

### Move Configuration

Within a configuration profile, make the following changes to configuration keys:

* `base_location` -> `output.location`
* `base_module` -> `output.base_module`
* `default_client` -> `output.default_client`
* `extra_fields` -> `output.extra_fields`
* `group` -> `naming.group`
* `merge` -> `naming.merge`
* `operation_default_module` -> `naming.default_operation_module`
* `operation_location` -> `output.operation_subdirectory`
* `operation_use_tags` -> `naming.operation_use_tags`
* `rename` -> `naming.rename`
* `schema_location` -> `output.schema_subdirectory`
* `schema_use` -> `output.schema_use`
* `types` -> `output.types`

For example, if your configuration previously had the following:

```elixir
config :oapi_generator, default: [
  base_module: MyClient
]
```

Now, you should have:

```elixir
config :oapi_generator, default: [
  output: [
    base_module: MyClient
  ]
]
```

### Adopt New Types

There are new (and modified) internal representations of types returned from `field/1` schema functions.
If you use this information in a typed decoder, for example, it is necessary to adopt the new types.
See `OpenAPI.Processor.Type` for more information.
