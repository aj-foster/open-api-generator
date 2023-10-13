defmodule OpenAPI.Test.RecorderCase do
  use ExUnit.CaseTemplate

  @moduledoc """
  Test Case for using specs in fixture and recording the generation process

  """
  using do
    module = __MODULE__

    quote do
      alias OpenAPI.Test.RecorderRenderer
      import OpenAPI.Test.CodeHelpers
      require OpenAPI.Test.CodeHelpers

      defdelegate fixture_file_path(name_or_atom), to: unquote(module)
      defdelegate recorder_profile(), to: unquote(module)
      defdelegate run_fixture(name_or_atom), to: unquote(module)
      defdelegate output_file(file), to: unquote(module)
    end
  end

  @doc """
  Retrieves the contents of the output file, and the state from the renderer call as a string.
  returns nil if file does not exist
  """
  @spec output_file(bitstring()) :: any()
  def output_file(file) when is_bitstring(file),
    do: OpenAPI.Test.RecorderRenderer.get_file(file)

  @doc """
  runs the fixture with test recording
  """
  @spec run_fixture(atom() | binary()) :: :ok
  def run_fixture(name_or_atom) do
    with spec_path <-
           fixture_file_path!(name_or_atom),
         profile <-
           recorder_profile(),
         initial_test_profile <-
           Application.get_env(:oapi_generator, :test_profile) do
      Application.put_env(:oapi_generator, :test_profile, profile)
      OpenAPI.run("test_profile", [spec_path])
      Application.put_env(:oapi_generator, :test_profile, initial_test_profile)
    end
  end

  def fixture_file_path!(atom_or_name) do
    case fixture_file_path(atom_or_name) do
      nil -> throw("No Fixture file found for #{inspect(atom_or_name)}")
      path -> path
    end
  end

  @doc """
  Finds a fixture file from it's name (string or atom) without path or extension:

  `fixture_file_path(:cookie_header_params)` -> 'test/fixture/cookie_header_params.yaml'
  """
  @spec fixture_file_path(binary() | atom()) :: binary() | nil
  def fixture_file_path(atom_name) when is_atom(atom_name),
    do: atom_name |> to_string() |> fixture_file_path()

  def fixture_file_path(fixture_file_param) when is_bitstring(fixture_file_param) do
    fixture_file =
      case Path.split(fixture_file_param) do
        [file_name] -> Path.join(["test", "fixture", file_name])
        _ -> fixture_file_param
      end

    [fixture_file, fixture_file <> ".yml", fixture_file <> ".yaml"]
    |> Enum.find(fn path ->
      case Path.wildcard(path) do
        [file] -> file
        _ -> nil
      end
    end)
  end

  @spec recorder_profile() :: [{:renderer, OpenAPI.Test.RecorderRenderer}, ...]
  def recorder_profile(),
    do: [
      renderer: OpenAPI.Test.RecorderRenderer
    ]
end
