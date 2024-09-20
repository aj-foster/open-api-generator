defmodule ListPartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ListPartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ListPartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ListPartialUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "list"}
    ]
  end
end
