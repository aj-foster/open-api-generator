defmodule TagCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a TagCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          "tag-group": :"Elixir.TagCreateQueryResourceObjectRelationshipsTag-group".t() | nil
        }

  defstruct [:"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["tag-group": {:"Elixir.TagCreateQueryResourceObjectRelationshipsTag-group", :t}]
  end
end
