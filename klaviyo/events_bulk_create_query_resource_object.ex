defmodule EventsBulkCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a EventsBulkCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: EventsBulkCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {EventsBulkCreateQueryResourceObjectAttributes, :t},
      type: {:const, "event-bulk-create"}
    ]
  end
end
