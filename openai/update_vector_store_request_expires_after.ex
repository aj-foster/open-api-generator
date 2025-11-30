defmodule OpenAI.UpdateVectorStoreRequestExpiresAfter do
  @moduledoc """
  Provides struct and type for a UpdateVectorStoreRequestExpiresAfter
  """

  @type t :: %__MODULE__{anchor: String.t() | nil, days: integer | nil}

  defstruct [:anchor, :days]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [anchor: {:const, "last_active_at"}, days: :integer]
  end
end
