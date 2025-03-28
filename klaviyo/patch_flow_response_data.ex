defmodule PatchFlowResponseData do
  @moduledoc """
  Provides struct and type for a PatchFlowResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchFlowResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: PatchFlowResponseDataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchFlowResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {PatchFlowResponseDataRelationships, :t},
      type: {:const, "flow"}
    ]
  end
end
