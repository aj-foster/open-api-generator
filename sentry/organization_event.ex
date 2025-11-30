defmodule Sentry.OrganizationEvent do
  @moduledoc """
  Provides struct and type for a OrganizationEvent
  """

  @type t :: %__MODULE__{
          _meta: Sentry.OrganizationEventMeta.t(),
          context: Sentry.OrganizationEventContext.t(),
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
          errors: [Sentry.OrganizationEventErrors.t()],
          eventID: String.t(),
          fingerprints: [String.t()],
          groupID: String.t(),
          id: String.t(),
          message: String.t(),
          metadata: Sentry.OrganizationEventMetadata.t(),
          packages: Sentry.OrganizationEventPackages.t(),
          platform: String.t(),
          sdk: map | nil,
          size: integer,
          tags: [Sentry.OrganizationEventTags.t()],
          title: String.t(),
          type: String.t(),
          user: Sentry.EventUser.t()
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
    :packages,
    :platform,
    :sdk,
    :size,
    :tags,
    :title,
    :type,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _meta: {Sentry.OrganizationEventMeta, :t},
      context: {Sentry.OrganizationEventContext, :t},
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
      errors: [{Sentry.OrganizationEventErrors, :t}],
      eventID: {:string, :generic},
      fingerprints: [string: :generic],
      groupID: {:string, :generic},
      id: {:string, :generic},
      message: {:string, :generic},
      metadata: {Sentry.OrganizationEventMetadata, :t},
      packages: {Sentry.OrganizationEventPackages, :t},
      platform: {:string, :generic},
      sdk: :map,
      size: :integer,
      tags: [{Sentry.OrganizationEventTags, :t}],
      title: {:string, :generic},
      type: {:string, :generic},
      user: {Sentry.EventUser, :t}
    ]
  end
end
