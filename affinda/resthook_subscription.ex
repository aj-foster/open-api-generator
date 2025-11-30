defmodule Affinda.ResthookSubscription do
  @moduledoc """
  Provides struct and type for a ResthookSubscription
  """

  @type t :: %__MODULE__{
          active: boolean,
          autoDeactivateReason: String.t(),
          autoDeactivated: boolean,
          event: String.t(),
          id: integer,
          organization: Affinda.Organization.t(),
          targetUrl: String.t(),
          version: String.t(),
          workspace: Affinda.ResthookSubscriptionWorkspace.t()
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
      autoDeactivateReason: :string,
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
      organization: {Affinda.Organization, :t},
      targetUrl: :string,
      version: {:enum, ["v1", "v2", "v3"]},
      workspace: {Affinda.ResthookSubscriptionWorkspace, :t}
    ]
  end
end
