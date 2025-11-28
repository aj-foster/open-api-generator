defmodule PostFlowSeriesResponseDTOData do
  @moduledoc """
  Provides struct and type for a PostFlowSeriesResponseDTOData
  """

  @type t :: %__MODULE__{
          attributes: PostFlowSeriesResponseDTODataAttributes.t(),
          links: ObjectLinks.t(),
          relationships: PostFlowSeriesResponseDTODataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PostFlowSeriesResponseDTODataAttributes, :t},
      links: {ObjectLinks, :t},
      relationships: {PostFlowSeriesResponseDTODataRelationships, :t},
      type: {:const, "flow-series-report"}
    ]
  end
end
