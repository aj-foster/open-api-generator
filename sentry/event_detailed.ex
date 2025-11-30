defmodule Sentry.EventDetailed do
  @moduledoc """
  Provides struct and type for a EventDetailed
  """

  @type t :: %__MODULE__{
          _meta: Sentry.EventDetailedMeta.t(),
          context: Sentry.Context.t(),
          contexts: Sentry.Contexts.t(),
          dateCreated: String.t(),
          dateReceived: String.t(),
          dist: String.t() | nil,
          entries: [
            Sentry.Breadcrumbs.t()
            | Sentry.Exception.t()
            | Sentry.Message.t()
            | Sentry.Request.t()
          ],
          errors: [Sentry.EventDetailedErrors.t()],
          eventID: String.t(),
          fingerprints: [String.t()],
          groupID: String.t(),
          id: String.t(),
          message: String.t(),
          metadata: Sentry.EventDetailedMetadata.t(),
          nextEventID: String.t() | nil,
          packages: map,
          platform: String.t(),
          previousEventID: String.t() | nil,
          release: Sentry.EventDetailedRelease.t() | nil,
          sdk: Sentry.EventDetailedSdk.t(),
          size: integer,
          tags: [Sentry.EventDetailedTags.t()],
          title: String.t(),
          type: String.t(),
          user: Sentry.EventUser.t(),
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
      _meta: {Sentry.EventDetailedMeta, :t},
      context: {Sentry.Context, :t},
      contexts: {Sentry.Contexts, :t},
      dateCreated: {:string, :generic},
      dateReceived: {:string, :generic},
      dist: {:string, :generic},
      entries: [
        union: [
          {Sentry.Breadcrumbs, :t},
          {Sentry.Exception, :t},
          {Sentry.Message, :t},
          {Sentry.Request, :t}
        ]
      ],
      errors: [{Sentry.EventDetailedErrors, :t}],
      eventID: {:string, :generic},
      fingerprints: [string: :generic],
      groupID: {:string, :generic},
      id: {:string, :generic},
      message: {:string, :generic},
      metadata: {Sentry.EventDetailedMetadata, :t},
      nextEventID: {:string, :generic},
      packages: :map,
      platform: {:string, :generic},
      previousEventID: {:string, :generic},
      release: {Sentry.EventDetailedRelease, :t},
      sdk: {Sentry.EventDetailedSdk, :t},
      size: :integer,
      tags: [{Sentry.EventDetailedTags, :t}],
      title: {:string, :generic},
      type: {:string, :generic},
      user: {Sentry.EventUser, :t},
      userReport: :map
    ]
  end
end
