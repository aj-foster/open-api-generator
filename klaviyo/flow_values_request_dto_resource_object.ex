defmodule FlowValuesRequestDTOResourceObject do
  @moduledoc """
  Provides struct and type for a FlowValuesRequestDTOResourceObject
  """

  @type t :: %__MODULE__{
          attributes: FlowValuesRequestDTOResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {FlowValuesRequestDTOResourceObjectAttributes, :t},
      type: {:const, "flow-values-report"}
    ]
  end
end
