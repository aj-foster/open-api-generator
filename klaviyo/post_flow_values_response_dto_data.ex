defmodule PostFlowValuesResponseDTOData do
  @moduledoc """
  Provides struct and type for a PostFlowValuesResponseDTOData
  """

  @type t :: %__MODULE__{
          attributes: PostFlowValuesResponseDTODataAttributes.t(),
          links: ObjectLinks.t(),
          relationships: PostFlowValuesResponseDTODataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostFlowValuesResponseDTODataAttributes, :t},
      links: {ObjectLinks, :t},
      relationships: {PostFlowValuesResponseDTODataRelationships, :t},
      type: {:const, "flow-values-report"}
    ]
  end
end
