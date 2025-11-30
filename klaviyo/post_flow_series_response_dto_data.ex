defmodule Klaviyo.PostFlowSeriesResponseDTOData do
  @moduledoc """
  Provides struct and type for a PostFlowSeriesResponseDTOData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PostFlowSeriesResponseDTODataAttributes.t(),
          links: Klaviyo.ObjectLinks.t(),
          relationships: Klaviyo.PostFlowSeriesResponseDTODataRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PostFlowSeriesResponseDTODataAttributes, :t},
      links: {Klaviyo.ObjectLinks, :t},
      relationships: {Klaviyo.PostFlowSeriesResponseDTODataRelationships, :t},
      type: {:const, "flow-series-report"}
    ]
  end
end
