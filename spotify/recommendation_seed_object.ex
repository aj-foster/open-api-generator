defmodule Spotify.RecommendationSeedObject do
  @moduledoc """
  Provides struct and type for a RecommendationSeedObject
  """

  @type t :: %__MODULE__{
          afterFilteringSize: integer | nil,
          afterRelinkingSize: integer | nil,
          href: String.t() | nil,
          id: String.t() | nil,
          initialPoolSize: integer | nil,
          type: String.t() | nil
        }

  defstruct [:afterFilteringSize, :afterRelinkingSize, :href, :id, :initialPoolSize, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      afterFilteringSize: :integer,
      afterRelinkingSize: :integer,
      href: :string,
      id: :string,
      initialPoolSize: :integer,
      type: :string
    ]
  end
end
