defmodule GitHub.Actions.Runner.Jitconfig do
  @moduledoc """
  Provides struct and type for a Actions.Runner.Jitconfig
  """
  use GitHub.Encoder

  @type json_resp :: %__MODULE__{
          __info__: map,
          encoded_jit_config: String.t(),
          runner: GitHub.Actions.Runner.t()
        }

  defstruct [:__info__, :encoded_jit_config, :runner]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [encoded_jit_config: {:string, :generic}, runner: {GitHub.Actions.Runner, :t}]
  end
end
