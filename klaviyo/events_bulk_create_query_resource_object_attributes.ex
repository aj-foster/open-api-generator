defmodule Klaviyo.EventsBulkCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a EventsBulkCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          events: Klaviyo.EventsBulkCreateQueryResourceObjectAttributesEvents.t(),
          profile: Klaviyo.EventsBulkCreateQueryResourceObjectAttributesProfile.t()
        }

  defstruct [:events, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      events: {Klaviyo.EventsBulkCreateQueryResourceObjectAttributesEvents, :t},
      profile: {Klaviyo.EventsBulkCreateQueryResourceObjectAttributesProfile, :t}
    ]
  end
end
