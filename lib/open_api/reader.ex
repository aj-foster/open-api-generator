defmodule OpenAPI.Reader do
  @moduledoc false

  alias OpenAPI.State

  @spec read(map, String.t()) :: State.t()
  def read(state, relative_filename) do
    filename = Path.join(state.current_file, relative_filename) |> Path.expand()
    parsed_file = YamlElixir.read_from_file!(filename)

    %State{state | files: Map.put(state.files, filename, parsed_file)}
  end

  @spec ensure_file(map, String.t()) :: map
  def ensure_file(state, file) do
    if Map.has_key?(state.files, file) do
      state
    else
      read(state, file)
    end
  end
end
