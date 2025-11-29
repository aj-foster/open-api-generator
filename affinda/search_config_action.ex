defmodule SearchConfigAction do
  @moduledoc """
  Provides struct and type for a SearchConfigAction
  """

  @type t :: %__MODULE__{eventName: String.t(), label: String.t()}

  defstruct [:eventName, :label]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [eventName: {:string, :generic}, label: {:string, :generic}]
  end
end
