defmodule PostFlowValuesResponseDTODataRelationships do
  @moduledoc """
  Provides struct and type for a PostFlowValuesResponseDTODataRelationships
  """

  @type t :: %__MODULE__{
          "flow-messages":
            :"Elixir.PostFlowValuesResponseDTODataRelationshipsFlow-messages".t() | nil,
          flows: PostFlowValuesResponseDTODataRelationshipsFlows.t() | nil
        }

  defstruct [:"flow-messages", :flows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-messages": {:"Elixir.PostFlowValuesResponseDTODataRelationshipsFlow-messages", :t},
      flows: {PostFlowValuesResponseDTODataRelationshipsFlows, :t}
    ]
  end
end
