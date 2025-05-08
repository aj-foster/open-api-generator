defmodule MessageQuotaResponse do
  @moduledoc """
  Provides struct and type for a MessageQuotaResponse
  """

  @type t :: %__MODULE__{type: String.t(), value: integer | nil}

  defstruct [:type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["none", "limited"]}, value: :integer]
  end
end
