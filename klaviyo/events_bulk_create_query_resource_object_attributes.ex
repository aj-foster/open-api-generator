defmodule EventsBulkCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a EventsBulkCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          events: EventsBulkCreateQueryResourceObjectAttributesEvents.t(),
          profile: EventsBulkCreateQueryResourceObjectAttributesProfile.t()
        }

  defstruct [:events, :profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      events: {EventsBulkCreateQueryResourceObjectAttributesEvents, :t},
      profile: {EventsBulkCreateQueryResourceObjectAttributesProfile, :t}
    ]
  end
end
