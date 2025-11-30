defmodule Klaviyo.PatchListPartialUpdateResponseData do
  @moduledoc """
  Provides struct and type for a PatchListPartialUpdateResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchListPartialUpdateResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchListPartialUpdateResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchListPartialUpdateResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchListPartialUpdateResponseDataRelationships, :t},
      type: {:const, "list"}
    ]
  end
end
