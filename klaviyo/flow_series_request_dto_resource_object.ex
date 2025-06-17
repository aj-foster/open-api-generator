defmodule FlowSeriesRequestDTOResourceObject do
  @moduledoc """
  Provides struct and type for a FlowSeriesRequestDTOResourceObject
  """

  @type t :: %__MODULE__{
          attributes: FlowSeriesRequestDTOResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {FlowSeriesRequestDTOResourceObjectAttributes, :t},
      type: {:const, "flow-series-report"}
    ]
  end
end
