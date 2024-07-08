defmodule GetFlowResponseDataRelationships do
  @moduledoc """
  Provides struct and type for a GetFlowResponseDataRelationships
  """

  @type t :: %__MODULE__{
          "flow-actions": :"Elixir.GetFlowResponseDataRelationshipsFlow-actions".t() | nil,
          tags: GetFlowResponseDataRelationshipsTags.t() | nil
        }

  defstruct [:"flow-actions", :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      "flow-actions": {:"Elixir.GetFlowResponseDataRelationshipsFlow-actions", :t},
      tags: {GetFlowResponseDataRelationshipsTags, :t}
    ]
  end
end
