defmodule SubscriptionCreateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          custom_source: String.t() | nil,
          profiles: SubscriptionCreateJobCreateQueryResourceObjectAttributesProfiles.t()
        }

  defstruct [:custom_source, :profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_source: {:string, :generic},
      profiles: {SubscriptionCreateJobCreateQueryResourceObjectAttributesProfiles, :t}
    ]
  end
end
