defmodule Klaviyo.GetProfileResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetProfileResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.GetProfileResponseCompoundDocumentDataAttributes.t() | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships: Klaviyo.GetProfileResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.GetProfileResponseCompoundDocumentDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetProfileResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "profile"}
    ]
  end
end
