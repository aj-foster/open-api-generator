defmodule BaseEventCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a BaseEventCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: BaseEventCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {BaseEventCreateQueryResourceObjectAttributes, :t}, type: {:const, "event"}]
  end
end
