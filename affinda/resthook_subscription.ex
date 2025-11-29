defmodule ResthookSubscription do
  @moduledoc """
  Provides struct and type for a ResthookSubscription
  """

  @type t :: %__MODULE__{
          active: boolean,
          autoDeactivateReason: String.t(),
          autoDeactivated: boolean,
          event: String.t(),
          id: integer,
          organization: Organization.t(),
          targetUrl: String.t(),
          version: String.t(),
          workspace: ResthookSubscriptionWorkspace.t()
        }

  defstruct [
    :active,
    :autoDeactivateReason,
    :autoDeactivated,
    :event,
    :id,
    :organization,
    :targetUrl,
    :version,
    :workspace
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      active: :boolean,
      autoDeactivateReason: {:string, :generic},
      autoDeactivated: :boolean,
      event:
        {:enum,
         [
           "resume.parse.succeeded",
           "resume.parse.failed",
           "resume.parse.completed",
           "invoice.parse.succeeded",
           "invoice.parse.failed",
           "invoice.parse.completed",
           "invoice.validate.completed",
           "document.parse.succeeded",
           "document.parse.failed",
           "document.parse.completed",
           "document.validate.completed",
           "document.classify.succeeded",
           "document.classify.failed",
           "document.classify.completed",
           "document.rejected",
           "annotation.validated"
         ]},
      id: :integer,
      organization: {Organization, :t},
      targetUrl: {:string, :generic},
      version: {:enum, ["v1", "v2", "v3"]},
      workspace: {ResthookSubscriptionWorkspace, :t}
    ]
  end
end
