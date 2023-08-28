defmodule OpenAPI.Spec.Server do
  @moduledoc "Raw server from the OpenAPI spec"
  import OpenAPI.Reader.State

  alias OpenAPI.Spec.Server.Variable

  #
  # Definition
  #

  @type t :: %__MODULE__{
          url: String.t(),
          description: String.t() | nil,
          variables: %{optional(String.t()) => Variable.t()}
        }

  defstruct [
    :url,
    :description,
    :variables
  ]

  #
  # Decoder
  #

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, variables} = decode_variables(state, yaml)

    server = %__MODULE__{
      url: Map.fetch!(yaml, "url"),
      description: Map.get(yaml, "description"),
      variables: variables
    }

    {state, server}
  end

  @spec decode_variables(map, map) :: {map, %{optional(String.t()) => Variable.t()}}
  defp decode_variables(state, %{"variables" => %{} = vars}) do
    with_path(state, vars, "variables", fn state, vars ->
      Enum.reduce(vars, {state, %{}}, fn {name, var}, {state, vars} ->
        var = with_path(state, var, name, &Variable.decode/2)
        {state, Map.put(vars, name, var)}
      end)
    end)
  end

  defp decode_variables(state, _yaml), do: {state, %{}}
end
