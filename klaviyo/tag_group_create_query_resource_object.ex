defmodule Klaviyo.TagGroupCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TagGroupCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.TagGroupCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.TagGroupCreateQueryResourceObjectAttributes, :t},
      type: {:const, "tag-group"}
    ]
  end
end
