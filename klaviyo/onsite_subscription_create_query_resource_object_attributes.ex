defmodule Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a OnsiteSubscriptionCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          custom_source: String.t() | nil,
          profile: Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectAttributesProfile.t()
        }

  defstruct [:custom_source, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      custom_source: :string,
      profile: {Klaviyo.OnsiteSubscriptionCreateQueryResourceObjectAttributesProfile, :t}
    ]
  end
end
