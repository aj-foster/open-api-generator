defmodule :"Elixir.TagCreateQueryResourceObjectRelationshipsTag-group" do
  @moduledoc """
  Provides struct and type for a :"Elixir.TagCreateQueryResourceObjectRelationshipsTag-group"
  """

  @type t :: %__MODULE__{
          data: :"Elixir.:\"Elixir.TagCreateQueryResourceObjectRelationshipsTag-group\"Data".t()
        }

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {:"Elixir.:\"Elixir.TagCreateQueryResourceObjectRelationshipsTag-group\"Data", :t}]
  end
end
