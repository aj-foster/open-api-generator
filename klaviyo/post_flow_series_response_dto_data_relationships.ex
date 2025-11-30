defmodule Klaviyo.PostFlowSeriesResponseDTODataRelationships do
  @moduledoc """
  Provides struct and type for a PostFlowSeriesResponseDTODataRelationships
  """

  @type t :: %__MODULE__{
          "flow-messages":
            Klaviyo.PostFlowSeriesResponseDTODataRelationshipsFlowMessages.t() | nil,
          flows: Klaviyo.PostFlowSeriesResponseDTODataRelationshipsFlows.t() | nil
        }

  defstruct [:"flow-messages", :flows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-messages": {Klaviyo.PostFlowSeriesResponseDTODataRelationshipsFlowMessages, :t},
      flows: {Klaviyo.PostFlowSeriesResponseDTODataRelationshipsFlows, :t}
    ]
  end
end
