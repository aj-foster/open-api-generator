defmodule Sentry.Contexts do
  @moduledoc """
  Provides struct and type for a Contexts
  """

  @type t :: %__MODULE__{
          ForbiddenError: Sentry.ContextsForbiddenError.t() | nil,
          browser: Sentry.ContextsBrowser.t() | nil,
          organization: Sentry.ContextsOrganization.t() | nil,
          os: Sentry.ContextsOs.t() | nil,
          trace: Sentry.ContextsTrace.t() | nil
        }

  defstruct [:ForbiddenError, :browser, :organization, :os, :trace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ForbiddenError: {Sentry.ContextsForbiddenError, :t},
      browser: {Sentry.ContextsBrowser, :t},
      organization: {Sentry.ContextsOrganization, :t},
      os: {Sentry.ContextsOs, :t},
      trace: {Sentry.ContextsTrace, :t}
    ]
  end
end
