defmodule Klaviyo.PatchSegmentPartialUpdateResponseData do
  @moduledoc """
  Provides struct and type for a PatchSegmentPartialUpdateResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchSegmentPartialUpdateResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchSegmentPartialUpdateResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchSegmentPartialUpdateResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchSegmentPartialUpdateResponseDataRelationships, :t},
      type: {:const, "segment"}
    ]
  end
end
