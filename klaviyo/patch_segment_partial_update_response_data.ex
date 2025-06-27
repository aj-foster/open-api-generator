defmodule PatchSegmentPartialUpdateResponseData do
  @moduledoc """
  Provides struct and type for a PatchSegmentPartialUpdateResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchSegmentPartialUpdateResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchSegmentPartialUpdateResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchSegmentPartialUpdateResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchSegmentPartialUpdateResponseDataRelationships, :t},
      type: {:const, "segment"}
    ]
  end
end
