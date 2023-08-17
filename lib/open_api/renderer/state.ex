defmodule OpenAPI.Renderer.State do
  @type file :: %{
          name: String.t(),
          docstring: String.t(),
          fields: map,
          methods: [term],
          using: [module]
        }
end
