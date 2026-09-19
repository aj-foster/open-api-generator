defmodule Sentry.Event do
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
          tags: [Sentry.EventTags.t()],
          title: String.t(),
          user: Sentry.EventUser.t() | nil
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
      dateCreated: :string,
      "event.type": :string,
      eventID: :string,
      groupID: :string,
      id: :string,
      message: :string,
      platform: :string,
      tags: [{Sentry.EventTags, :t}],
      title: :string,
      user: {Sentry.EventUser, :t}
    ]
  end
end
