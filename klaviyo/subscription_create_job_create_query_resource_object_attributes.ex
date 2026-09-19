defmodule Klaviyo.SubscriptionCreateJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a SubscriptionCreateJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          custom_source: String.t() | nil,
          profiles: Klaviyo.SubscriptionCreateJobCreateQueryResourceObjectAttributesProfiles.t()
        }

  defstruct [:custom_source, :profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_source: :string,
      profiles: {Klaviyo.SubscriptionCreateJobCreateQueryResourceObjectAttributesProfiles, :t}
    ]
  end
end
