defmodule SpaceTraders.JumpGate do
  @moduledoc """
  Provides struct and type for a JumpGate
  """

  @type t :: %__MODULE__{connections: [String.t()], symbol: String.t()}

  defstruct [:connections, :symbol]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [connections: [:string], symbol: :string]
  end
end
