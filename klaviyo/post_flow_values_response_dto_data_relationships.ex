defmodule Klaviyo.PostFlowValuesResponseDTODataRelationships do
  @moduledoc """
  Provides struct and type for a PostFlowValuesResponseDTODataRelationships
  """

  @type t :: %__MODULE__{
          "flow-messages":
            Klaviyo.PostFlowValuesResponseDTODataRelationshipsFlowMessages.t() | nil,
          flows: Klaviyo.PostFlowValuesResponseDTODataRelationshipsFlows.t() | nil
        }

  defstruct [:"flow-messages", :flows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-messages": {Klaviyo.PostFlowValuesResponseDTODataRelationshipsFlowMessages, :t},
      flows: {Klaviyo.PostFlowValuesResponseDTODataRelationshipsFlows, :t}
    ]
  end
end
