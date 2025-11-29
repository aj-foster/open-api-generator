defmodule SegmentPartialUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a SegmentPartialUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: SegmentPartialUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {SegmentPartialUpdateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "segment"}
    ]
  end
end
