defmodule :"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message-variation" do
  @moduledoc """
  Provides struct and type for a :"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message-variation"
  """

  @type t :: %__MODULE__{
          data:
            :"Elixir.:\"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message-variation\"Data".t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data:
        {:"Elixir.:\"Elixir.AttributionResponseObjectResourceRelationshipsFlow-message-variation\"Data",
         :t}
    ]
  end
end
