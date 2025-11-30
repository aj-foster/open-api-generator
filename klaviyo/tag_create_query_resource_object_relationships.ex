defmodule Klaviyo.TagCreateQueryResourceObjectRelationships do
  @moduledoc """
  Provides struct and type for a TagCreateQueryResourceObjectRelationships
  """

  @type t :: %__MODULE__{
          "tag-group": Klaviyo.TagCreateQueryResourceObjectRelationshipsTagGroup.t() | nil
        }

  defstruct [:"tag-group"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["tag-group": {Klaviyo.TagCreateQueryResourceObjectRelationshipsTagGroup, :t}]
  end
end
