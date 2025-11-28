defmodule ListCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ListCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ListCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {ListCreateQueryResourceObjectAttributes, :t}, type: {:const, "list"}]
  end
end
