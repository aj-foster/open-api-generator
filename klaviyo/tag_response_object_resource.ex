defmodule Klaviyo.TagResponseObjectResource do
  @moduledoc """
  Provides struct and type for a TagResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: map,
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: :map, id: :string, links: {Klaviyo.ObjectLinks, :t}, type: {:const, "tag"}]
  end
end
