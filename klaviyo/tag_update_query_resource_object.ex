defmodule Klaviyo.TagUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TagUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.TagUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.TagUpdateQueryResourceObjectAttributes, :t},
      id: :string,
      type: {:const, "tag"}
    ]
  end
end
