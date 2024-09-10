defmodule PongInteractionCallbackRequest do
  @moduledoc """
  Provides struct and type for a PongInteractionCallbackRequest
  """

  @type t :: %__MODULE__{type: 1}

  defstruct [:type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:const, 1}]
  end
end
