defmodule OpenAPI.Generator.Render do
  @moduledoc false
  require EEx

  @base_path :code.priv_dir(:open_api) |> Path.join("templates")

  EEx.function_from_file(:def, :schema, Path.join(@base_path, "schema.eex"), [:assigns])
end
