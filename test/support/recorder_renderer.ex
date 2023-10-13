defmodule OpenAPI.Test.RecorderRenderer do
  @moduledoc """
  Renderer recording the output and state into an Agent instead of writing to files

  These callbacks are recorded:

  * &OpenAPI.Renderer.write/2
  * TODO: Expand with other renderer overrides

  For testing use OpenAPI.Test.RecorderCase in test files
  """

  use OpenAPI.Renderer
  use Agent

  alias OpenAPI.Renderer.File

  def start_link(),
    do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  @impl true
  def write(gen_state, %File{} = file) do
    runner_process = self()
    # returns :ok, as expected for write too
    Agent.update(__MODULE__, fn state ->
      case Map.get(state, runner_process) do
        nil ->
          Map.put(state, runner_process, [%{file: file, state: gen_state}])

        l when is_list(l) ->
          state |> Map.put(runner_process, l ++ [%{file: file, state: gen_state}])
      end
    end)
  end

  @doc """
    gets a file from the agent. the file must have been previously recorded
  """
  @spec get_file(bitstring() | Regex.t()) :: any()
  def get_file(%Regex{} = rex),
    do: do_get_file(rex)

  def get_file(str) when is_bitstring(str),
    do: do_get_file(str)

  defp do_get_file(match_location) do
    runner_process = self()
    matches? = location_matcher(match_location)

    Agent.get(__MODULE__, fn
      %{^runner_process => records} ->
        records
        |> Enum.find(matches?)

      _ ->
        nil
    end)
  end

  defp location_matcher(%Regex{} = rex),
    do: fn {location, _, _} -> Regex.match?(rex, location) end

  defp location_matcher(cmp),
    do: fn
      %{file: %{location: ^cmp}} -> true
      _ -> false
    end
end
