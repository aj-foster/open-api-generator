defmodule Event do
  @moduledoc """
  Provides struct and type for a Event
  """

  @type t :: %__MODULE__{
          dateCreated: String.t(),
          "event.type": String.t(),
          eventID: String.t(),
          groupID: String.t(),
          id: String.t(),
          message: String.t(),
          platform: String.t(),
          tags: [EventTags.t()],
          title: String.t(),
          user: EventUser.t()
        }

  defstruct [
    :dateCreated,
    :"event.type",
    :eventID,
    :groupID,
    :id,
    :message,
    :platform,
    :tags,
    :title,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dateCreated: {:string, :generic},
      "event.type": {:string, :generic},
      eventID: {:string, :generic},
      groupID: {:string, :generic},
      id: {:string, :generic},
      message: {:string, :generic},
      platform: {:string, :generic},
      tags: [{EventTags, :t}],
      title: {:string, :generic},
      user: {EventUser, :t}
    ]
  end
end
