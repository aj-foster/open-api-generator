defmodule OpenAPI.Reader do
  @moduledoc """
  Provides an Open API spec reader for Yaml and JSON.
  """

  def read(filename) do
    absolute_path_of_base_file = Path.absname(filename, File.cwd!())

    %{
      base_file: absolute_path_of_base_file,
      files: %{},
      schemas: %{},
      current_file: absolute_path_of_base_file,
      current_path: [],
      refs: %{}
    }
    |> read("")
  end

  def read(state, relative_filename) do
    filename = Path.join(state.current_file, relative_filename)
    parsed_file = YamlElixir.read_from_file!(filename)

    put_in(state, [:files, relative_filename], parsed_file)
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
