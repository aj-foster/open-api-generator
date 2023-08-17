defmodule OpenAPI.Renderer do
  @moduledoc """
  Phase three of code generation

  The **render** phase begins with operation and schema structs created during the **process**
  phase. It uses this data to construct and save files containing Elixir source code. Most of
  the work done by this phase involves the manipulation of Elixir ASTs.
  """
  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Schema
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State

  @spec run(OpenAPI.State.t()) :: OpenAPI.State.t()
  def run(state) do
    %State{files: files_by_module} =
      state
      |> State.new()
      |> collect_files()
      |> render_files()

    %OpenAPI.State{state | files: Map.values(files_by_module)}
  end

  #
  # Integration
  #

  defmacro __using__(_opts) do
    quote do
      defdelegate location(state, file), to: OpenAPI.Renderer
      defdelegate render(state, file), to: OpenAPI.Renderer
      defdelegate write(state, file), to: OpenAPI.Renderer

      defoverridable location: 2,
                     render: 2,
                     write: 2
    end
  end

  #
  # Callbacks
  #

  @optional_callbacks location: 2,
                      render: 2,
                      write: 2

  @doc """
  Choose the filesystem location for a rendered file to be written
  """
  @callback location(State.t(), File.t()) :: String.t()

  @doc """
  Create the contents of a file in quoted Abstract Syntax Tree (AST) form
  """
  @callback render(State.t(), File.t()) :: Macro.t()

  @doc """
  Write a rendered file to the filesystem
  """
  @callback write(State.t(), File.t()) :: :ok

  #
  # Default Implementations
  #

  def location(_state, _file) do
    ""
  end

  def render(_state, _file) do
    {nil, nil, nil}
  end

  def write(_state, _file) do
    :ok
  end

  #
  # Helpers
  #

  @spec collect_files(State.t()) :: State.t()
  defp collect_files(state) do
    %State{operations: operations, schemas: schemas} = state

    for item <- operations ++ Map.values(schemas), reduce: state do
      state -> collect_file(state, item)
    end
  end

  @spec collect_file(State.t(), Operation.t()) :: State.t()
  @spec collect_file(State.t(), Schema.t()) :: State.t()
  defp collect_file(state, %Operation{module_name: module} = operation) do
    State.update_files(state, module, operation)
  end

  defp collect_file(state, %Schema{module_name: nil}) do
    state
  end

  defp collect_file(state, %Schema{module_name: module} = schema) do
    State.update_files(state, module, schema)
  end

  @spec render_files(State.t()) :: State.t()
  def render_files(state) do
    %State{files: files_by_module, implementation: implementation} = state

    for {module, file} <- files_by_module, reduce: state do
      %State{files: files_by_module} = state ->
        file = %File{
          file
          | ast: implementation.render(state, file),
            location: implementation.render(state, file)
        }

        implementation.write(state, file)

        %State{state | files: Map.put(files_by_module, module, file)}
    end
  end
end
