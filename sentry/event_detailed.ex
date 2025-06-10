defmodule EventDetailed do
  @moduledoc """
  Provides struct and type for a EventDetailed
  """

  @type t :: %__MODULE__{
          _meta: EventDetailedMeta.t(),
          context: Context.t(),
          contexts: Contexts.t(),
          dateCreated: String.t(),
          dateReceived: String.t(),
          dist: String.t() | nil,
          entries: [Breadcrumbs.t() | Exception.t() | Message.t() | Request.t()],
          errors: [EventDetailedErrors.t()],
          eventID: String.t(),
          fingerprints: [String.t()],
          groupID: String.t(),
          id: String.t(),
          message: String.t(),
          metadata: EventDetailedMetadata.t(),
          nextEventID: String.t() | nil,
          packages: map,
          platform: String.t(),
          previousEventID: String.t() | nil,
          release: EventDetailedRelease.t() | nil,
          sdk: EventDetailedSdk.t(),
          size: integer,
          tags: [EventDetailedTags.t()],
          title: String.t(),
          type: String.t(),
          user: EventUser.t(),
          userReport: map | nil
        }

  defstruct [
    :_meta,
    :context,
    :contexts,
    :dateCreated,
    :dateReceived,
    :dist,
    :entries,
    :errors,
    :eventID,
    :fingerprints,
    :groupID,
    :id,
    :message,
    :metadata,
    :nextEventID,
    :packages,
    :platform,
    :previousEventID,
    :release,
    :sdk,
    :size,
    :tags,
    :title,
    :type,
    :user,
    :userReport
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _meta: {EventDetailedMeta, :t},
      context: {Context, :t},
      contexts: {Contexts, :t},
      dateCreated: {:string, :generic},
      dateReceived: {:string, :generic},
      dist: {:string, :generic},
      entries: [union: [{Breadcrumbs, :t}, {Exception, :t}, {Message, :t}, {Request, :t}]],
      errors: [{EventDetailedErrors, :t}],
      eventID: {:string, :generic},
      fingerprints: [string: :generic],
      groupID: {:string, :generic},
      id: {:string, :generic},
      message: {:string, :generic},
      metadata: {EventDetailedMetadata, :t},
      nextEventID: {:string, :generic},
      packages: :map,
      platform: {:string, :generic},
      previousEventID: {:string, :generic},
      release: {EventDetailedRelease, :t},
      sdk: {EventDetailedSdk, :t},
      size: :integer,
      tags: [{EventDetailedTags, :t}],
      title: {:string, :generic},
      type: {:string, :generic},
      user: {EventUser, :t},
      userReport: :map
    ]
  end
end
