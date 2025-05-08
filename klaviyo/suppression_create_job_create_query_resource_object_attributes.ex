defmodule SuppressionCreateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a SuppressionCreateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          profiles: SuppressionCreateJobCreateQueryResourceObjectAttributesProfiles.t()
        }

  defstruct [:profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profiles: {SuppressionCreateJobCreateQueryResourceObjectAttributesProfiles, :t}]
  end
end
