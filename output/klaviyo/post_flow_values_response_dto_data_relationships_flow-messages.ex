defmodule :"Elixir.PostFlowValuesResponseDTODataRelationshipsFlow-messages" do
  @moduledoc """
  Provides struct and type for a :"Elixir.PostFlowValuesResponseDTODataRelationshipsFlow-messages"
  """

  @type t :: %__MODULE__{
          data: [
            :"Elixir.:\"Elixir.PostFlowValuesResponseDTODataRelationshipsFlow-messages\"Data".t()
          ],
          links: RelationshipLinks.t() | nil
        }

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: [
        {:"Elixir.:\"Elixir.PostFlowValuesResponseDTODataRelationshipsFlow-messages\"Data", :t}
      ],
      links: {RelationshipLinks, :t}
    ]
  end
end
