defmodule GitHub.EventPayload do
  @moduledoc """
  Provides struct and type for a EventPayload
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          action: String.t() | nil,
          comment: GitHub.Issue.Comment.t() | nil,
          issue: GitHub.Issue.t() | nil,
          pages: [GitHub.EventPayloadPages.t()] | nil
        }

  defstruct [:__info__, :action, :comment, :issue, :pages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: {:string, :generic},
      comment: {GitHub.Issue.Comment, :t},
      issue: {GitHub.Issue, :t},
      pages: [{GitHub.EventPayloadPages, :t}]
    ]
  end
end
