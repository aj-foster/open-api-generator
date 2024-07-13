defmodule PostFlowSeriesResponseDTODataRelationships do
  @moduledoc """
  Provides struct and type for a PostFlowSeriesResponseDTODataRelationships
  """

  @type t :: %__MODULE__{
          "flow-messages":
            :"Elixir.PostFlowSeriesResponseDTODataRelationshipsFlow-messages".t() | nil,
          flows: PostFlowSeriesResponseDTODataRelationshipsFlows.t() | nil
        }

  defstruct [:"flow-messages", :flows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-messages": {:"Elixir.PostFlowSeriesResponseDTODataRelationshipsFlow-messages", :t},
      flows: {PostFlowSeriesResponseDTODataRelationshipsFlows, :t}
    ]
  end
end
