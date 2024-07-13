defmodule :"Elixir.GetCampaignResponseDataRelationshipsCampaign-messages" do
  @moduledoc """
  Provides struct and type for a :"Elixir.GetCampaignResponseDataRelationshipsCampaign-messages"
  """

  @type t :: %__MODULE__{links: RelationshipLinks.t() | nil}

  defstruct [:links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [links: {RelationshipLinks, :t}]
  end
end
