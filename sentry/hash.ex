defmodule Hash do
  @moduledoc """
  Provides struct and type for a Hash
  """

  @type t :: %__MODULE__{
          _meta: HashMeta.t(),
          context: Context.t(),
          contexts: Contexts.t(),
          dateCreated: String.t(),
          dateReceived: String.t(),
          dist: String.t() | nil,
          entries: [Breadcrumbs.t() | Exception.t() | Message.t() | Request.t()],
          errors: [HashErrors.t()],
          eventID: String.t(),
          fingerprints: [String.t()],
          groupID: String.t(),
          id: String.t(),
          message: String.t(),
          metadata: HashMetadata.t(),
          packages: map,
          platform: String.t(),
          sdk: HashSdk.t(),
          size: integer,
          tags: [HashTags.t()],
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
      _meta: {HashMeta, :t},
      context: {Context, :t},
      contexts: {Contexts, :t},
      dateCreated: {:string, :generic},
      dateReceived: {:string, :generic},
      dist: {:string, :generic},
      entries: [union: [{Breadcrumbs, :t}, {Exception, :t}, {Message, :t}, {Request, :t}]],
      errors: [{HashErrors, :t}],
      eventID: {:string, :generic},
      fingerprints: [string: :generic],
      groupID: {:string, :generic},
      id: {:string, :generic},
      message: {:string, :generic},
      metadata: {HashMetadata, :t},
      packages: :map,
      platform: {:string, :generic},
      sdk: {HashSdk, :t},
      size: :integer,
      tags: [{HashTags, :t}],
      title: {:string, :generic},
      type: {:string, :generic},
      user: {EventUser, :t}
    ]
  end
end
