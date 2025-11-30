defmodule Klaviyo.TagCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TagCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.TagCreateQueryResourceObjectAttributes.t(),
          relationships: Klaviyo.TagCreateQueryResourceObjectRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.TagCreateQueryResourceObjectAttributes, :t},
      relationships: {Klaviyo.TagCreateQueryResourceObjectRelationships, :t},
      type: {:const, "tag"}
    ]
  end
end
