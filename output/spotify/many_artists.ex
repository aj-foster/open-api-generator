defmodule ManyArtists do
  @moduledoc """
  Provides struct and type for a ManyArtists
  """

  @type json_resp :: %__MODULE__{artists: [ArtistObject.t()]}

  defstruct [:artists]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [artists: [{ArtistObject, :t}]]
  end
end
