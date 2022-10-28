defmodule OpenAPI.Spec.Server do
  @moduledoc false
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
    Enum.reduce(vars, {state, %{}}, fn {name, var}, {state, vars} ->
      var = Variable.decode(state, var)
      {state, Map.put(vars, name, var)}
    end)
  end

  defp decode_variables(state, _yaml), do: {state, %{}}
end
