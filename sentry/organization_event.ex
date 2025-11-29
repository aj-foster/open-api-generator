defmodule OrganizationEvent do
  @moduledoc """
  Provides struct and type for a OrganizationEvent
  """

  @type t :: %__MODULE__{
          _meta: OrganizationEventMeta.t(),
          context: OrganizationEventContext.t(),
          contexts: Contexts.t(),
          dateCreated: String.t(),
          dateReceived: String.t(),
          dist: String.t() | nil,
          entries: [Breadcrumbs.t() | Exception.t() | Message.t() | Request.t()],
          errors: [OrganizationEventErrors.t()],
          eventID: String.t(),
          fingerprints: [String.t()],
          groupID: String.t(),
          id: String.t(),
          message: String.t(),
          metadata: OrganizationEventMetadata.t(),
          packages: OrganizationEventPackages.t(),
          platform: String.t(),
          sdk: map | nil,
          size: integer,
          tags: [OrganizationEventTags.t()],
          title: String.t(),
          type: String.t(),
          user: EventUser.t()
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
      _meta: {OrganizationEventMeta, :t},
      context: {OrganizationEventContext, :t},
      contexts: {Contexts, :t},
      dateCreated: {:string, :generic},
      dateReceived: {:string, :generic},
      dist: {:string, :generic},
      entries: [union: [{Breadcrumbs, :t}, {Exception, :t}, {Message, :t}, {Request, :t}]],
      errors: [{OrganizationEventErrors, :t}],
      eventID: {:string, :generic},
      fingerprints: [string: :generic],
      groupID: {:string, :generic},
      id: {:string, :generic},
      message: {:string, :generic},
      metadata: {OrganizationEventMetadata, :t},
      packages: {OrganizationEventPackages, :t},
      platform: {:string, :generic},
      sdk: :map,
      size: :integer,
      tags: [{OrganizationEventTags, :t}],
      title: {:string, :generic},
      type: {:string, :generic},
      user: {EventUser, :t}
    ]
  end
end
