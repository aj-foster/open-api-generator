defmodule SimplifiedTrackObjectRestrictions do
  @moduledoc """
  Provides struct and type for a SimplifiedTrackObjectRestrictions
  """

  @type t :: %__MODULE__{reason: String.t() | nil}

  defstruct [:reason]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [reason: {:string, :generic}]
  end
end
