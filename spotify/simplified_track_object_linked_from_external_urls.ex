defmodule SimplifiedTrackObjectLinkedFromExternalUrls do
  @moduledoc """
  Provides struct and type for a SimplifiedTrackObjectLinkedFromExternalUrls
  """

  @type t :: %__MODULE__{spotify: String.t() | nil}

  defstruct [:spotify]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [spotify: {:string, :generic}]
  end
end
