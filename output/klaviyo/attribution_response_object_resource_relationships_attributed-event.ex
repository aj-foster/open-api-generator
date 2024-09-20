defmodule :"Elixir.AttributionResponseObjectResourceRelationshipsAttributed-event" do
  @moduledoc """
  Provides struct and type for a :"Elixir.AttributionResponseObjectResourceRelationshipsAttributed-event"
  """

  @type t :: %__MODULE__{
          data:
            :"Elixir.:\"Elixir.AttributionResponseObjectResourceRelationshipsAttributed-event\"Data".t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data:
        {:"Elixir.:\"Elixir.AttributionResponseObjectResourceRelationshipsAttributed-event\"Data",
         :t}
    ]
  end
end
