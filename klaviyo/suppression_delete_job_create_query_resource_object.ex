defmodule SuppressionDeleteJobCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a SuppressionDeleteJobCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: SuppressionDeleteJobCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {SuppressionDeleteJobCreateQueryResourceObjectAttributes, :t},
      type: {:const, "profile-suppression-bulk-delete-job"}
    ]
  end
end
