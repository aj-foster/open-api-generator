defmodule :"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message" do
  @moduledoc """
  Provides struct and type for a :"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message"
  """

  @type t :: %__MODULE__{
          data:
            :"Elixir.:\"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message\"Data".t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data:
        {:"Elixir.:\"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message\"Data", :t}
    ]
  end
end
