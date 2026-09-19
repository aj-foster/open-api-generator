defmodule Klaviyo.ProfileSubscriptionDeleteQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileSubscriptionDeleteQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.ProfileSubscriptionDeleteQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.ProfileSubscriptionDeleteQueryResourceObjectAttributes, :t},
      type: {:const, "profile"}
    ]
  end
end
