defmodule Sentry.Hash do
  @moduledoc """
  Provides struct and type for a Hash
  """

  @type t :: %__MODULE__{
          _meta: Sentry.HashMeta.t(),
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
          errors: [Sentry.HashErrors.t()],
          eventID: String.t(),
          fingerprints: [String.t()],
          groupID: String.t(),
          id: String.t(),
          message: String.t(),
          metadata: Sentry.HashMetadata.t(),
          packages: map,
          platform: String.t(),
          sdk: Sentry.HashSdk.t(),
          size: integer,
          tags: [Sentry.HashTags.t()],
          title: String.t(),
          type: String.t(),
          user: Sentry.EventUser.t() | nil
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
      _meta: {Sentry.HashMeta, :t},
      context: {Sentry.Context, :t},
      contexts: {Sentry.Contexts, :t},
      dateCreated: :string,
      dateReceived: :string,
      dist: :string,
      entries: [
        union: [
          {Sentry.Breadcrumbs, :t},
          {Sentry.Exception, :t},
          {Sentry.Message, :t},
          {Sentry.Request, :t}
        ]
      ],
      errors: [{Sentry.HashErrors, :t}],
      eventID: :string,
      fingerprints: [:string],
      groupID: :string,
      id: :string,
      message: :string,
      metadata: {Sentry.HashMetadata, :t},
      packages: :map,
      platform: :string,
      sdk: {Sentry.HashSdk, :t},
      size: :integer,
      tags: [{Sentry.HashTags, :t}],
      title: :string,
      type: :string,
      user: {Sentry.EventUser, :t}
    ]
  end
end
