defmodule SuppressionCreateJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a SuppressionCreateJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: SuppressionCreateJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {SuppressionCreateJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "profile-suppression-bulk-create-job"}
    ]
  end
end
