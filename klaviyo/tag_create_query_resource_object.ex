defmodule TagCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TagCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: TagCreateQueryResourceObjectAttributes.t(),
          relationships: TagCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {TagCreateQueryResourceObjectAttributes, :t},
      relationships: {TagCreateQueryResourceObjectRelationships, :t},
      type: {:const, "tag"}
    ]
  end
end
