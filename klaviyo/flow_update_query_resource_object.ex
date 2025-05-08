defmodule FlowUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a FlowUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: FlowUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {FlowUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "flow"}
    ]
  end
end
