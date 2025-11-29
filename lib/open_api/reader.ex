defmodule OpenAPI.Reader do
  @moduledoc """
  Phase one of code generation

  The **read** phase begins with one or more filenames (JSON or YAML) to read. Each document
  should be the root of an OpenAPI description (usually beginning with an `openapi` key and
  version number). As the first step, they are parsed into large, nested maps and stored in the
  state based on their filename. Then, each document is parsed into structs based on the OpenAPI
  document definition.

  Note that this library is not meant to "validate" OpenAPI descriptions. Errors may be thrown
  only when there are details missing that affect the operation of the code generator. Because of
  this, you may be able to "get away with" generating code from an incomplete or invalid document.

  > #### Note {:.info}
  >
  > Functions in this module are used by the main `OpenAPI` module. It is unlikely that you will
  > call these functions directly, unless you are reimplementing one of the core functions. If
  > this happens, please share your use-case with the maintainers; a plugin might be warranted.

  ## Configuration

  All configuration for this phase lives under the `reader` key in each profile:

      config :oapi_generator,
        default: [
          reader: [
            ...
          ]
        ]

  The following options are available:

    * `additional_files`: List of paths to supplemental root files of an API description. See
      **Supplemental Descriptions** below for more information. Defaults to no additional files.

    * `file`: Path to the (likely vendor-supplied) root file of an API description. This
      information is often supplied to the `mix api.gen` task, since individual client library
      maintainers may keep the API description document in different locations. However, if the
      API description is included in the client library repository, then this configuration can be
      used instead. If unset, the filename must be supplied to `mix api.gen`.

  ## Supplemental Descriptions

  Sometimes, the OpenAPI description provided by a vendor is incomplete. Client library authors
  may choose to write supplemental descriptions that "fill in the gaps". Although these files
  must contain the root of an OpenAPI description (including an `openapi` key and version number)
  they may reference parts of the vendor-provided specification.

  For example, GitHub provides special ID-based API routes like `/repositories/{id}` that are
  not documented in its OpenAPI description. A client library author may create a supplemental
  description that looks like this (abbreviated):

  ```yaml
  openapi: 3.1.0
  paths:
    "/repositories/{id}":
      get:
        summary: Get a repository by ID
        operationId: repos/get-by-id
        parameters:
        - "$ref": "#/components/parameters/id"
        responses:
          '200':
            description: Response
            content:
              application/json:
                schema:
                  "$ref": "#/components/schemas/full-repository"
  ```

  Note that references to schemas contained in the vendor-supplied description must be modified
  to use accurate paths. Assuming the supplemental file is committed in the client library
  repository, authors may use the `additional_files` configuration to ensure it is always
  processed along with the vendor-supplied description:

      config :oapi_generator,
        default: [
          reader: [
            additional_files: ["path/to/supplement.yaml"]
          ]
        ]

  During the reading phase, the two root documents will be combined as if each root key were
  concatenated (for example, the paths from one file were copied to the other). Keys like `info`
  will always use the vendor-supplied data. After the reading phase, the documents will be treated
  as one API description, although plugins will have the opportunity to see the source of the data
  when necessary.
  """
  require Logger

  alias OpenAPI.Reader.Config
  alias OpenAPI.Reader.State
  alias OpenAPI.Spec

  @doc "Run the reading phase of the code generator"
  @spec run(OpenAPI.State.t()) :: OpenAPI.State.t()
  def run(%OpenAPI.State{} = state) do
    reader_result =
      state
      |> Config.new()
      |> State.new()
      |> read_all()
      |> decode_all()

    %OpenAPI.State{
      state
      | spec: reader_result.spec,
        schema_specs_by_path: reader_result.schema_specs_by_path
    }
  end

  @spec read_all(State.t()) :: State.t()
  defp read_all(%State{files: files} = state) do
    files
    |> Map.keys()
    |> Enum.reduce(state, fn relative_filename, state ->
      Logger.debug("Reading file #{relative_filename}")
      read_file(state, relative_filename)
    end)
  end

  @spec read_file(State.t(), String.t()) :: State.yaml()
  defp read_file(%State{} = state, relative_filename) do
    filename = Path.absname(relative_filename) |> Path.expand()

    if File.exists?(filename) do
      contents = YamlElixir.read_from_file!(filename)
      files = state.files |> Map.delete(relative_filename) |> Map.put(filename, contents)
      %State{state | files: files}
    else
      raise RuntimeError, "File #{relative_filename} not found (expanded as #{filename})"
    end
  end

  @spec decode_all(State.t()) :: State.t()
  defp decode_all(%State{files: files} = state) do
    files
    |> Map.keys()
    |> Enum.reduce(state, fn relative_filename, %State{} = state ->
      state = %State{
        state
        | base_file: relative_filename,
          current_file: relative_filename,
          last_ref_file: relative_filename
      }

      Spec.decode(state, relative_filename)
    end)
  end

  @spec ensure_file(map, String.t()) :: map
  def ensure_file(state, file) do
    filename = Path.absname(file) |> Path.expand()

    if Map.has_key?(state.files, filename) do
      state
    else
      read_file(state, filename)
    end
  end
end
