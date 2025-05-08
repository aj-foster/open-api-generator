defmodule ImagePartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ImagePartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ImagePartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ImagePartialUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "image"}
    ]
  end
end
