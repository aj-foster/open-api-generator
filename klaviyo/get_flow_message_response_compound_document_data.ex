defmodule Klaviyo.GetFlowMessageResponseCompoundDocumentData do
  @moduledoc """
  Provides struct and type for a GetFlowMessageResponseCompoundDocumentData
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
          id: String.t() | nil,
          links: Klaviyo.ObjectLinks.t() | nil,
          relationships:
            Klaviyo.GetFlowMessageResponseCompoundDocumentDataRelationships.t() | nil,
          type: String.t() | nil
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: :map,
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.GetFlowMessageResponseCompoundDocumentDataRelationships, :t},
      type: {:const, "flow-message"}
    ]
  end
end
