defmodule Spotify.CategoryObject do
  @moduledoc """
  Provides struct and type for a CategoryObject
  """

  @type t :: %__MODULE__{
          href: String.t(),
          icons: [Spotify.ImageObject.t()],
          id: String.t(),
          name: String.t()
        }

  defstruct [:href, :icons, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [href: :string, icons: [{Spotify.ImageObject, :t}], id: :string, name: :string]
  end
end
