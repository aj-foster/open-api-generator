defmodule Klaviyo.ImagePartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ImagePartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.ImagePartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.ImagePartialUpdateQueryResourceObjectAttributes, :t},
      id: :string,
      type: {:const, "image"}
    ]
  end
end
