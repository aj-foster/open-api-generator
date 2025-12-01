defmodule Klaviyo.PatchFlowResponseData do
  @moduledoc """
  Provides struct and type for a PatchFlowResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchFlowResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PatchFlowResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchFlowResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PatchFlowResponseDataRelationships, :t},
      type: {:const, "flow"}
    ]
  end
end
