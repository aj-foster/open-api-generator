defmodule ResthookSubscriptionUpdate do
  @moduledoc """
  Provides struct and type for a ResthookSubscriptionUpdate
  """

  @type t :: %__MODULE__{
          event: String.t() | nil,
          organization: String.t() | nil,
          version: String.t() | nil,
          workspace: String.t() | nil
        }

  defstruct [:event, :organization, :version, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
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
      organization: {:string, :generic},
      version: {:enum, ["v1", "v2", "v3"]},
      workspace: {:string, :generic}
    ]
  end
end
