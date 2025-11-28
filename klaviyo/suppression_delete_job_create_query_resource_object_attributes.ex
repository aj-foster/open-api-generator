defmodule SuppressionDeleteJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a SuppressionDeleteJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          profiles: SuppressionDeleteJobCreateQueryResourceObjectAttributesProfiles.t()
        }

  defstruct [:profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profiles: {SuppressionDeleteJobCreateQueryResourceObjectAttributesProfiles, :t}]
  end
end
