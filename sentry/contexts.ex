defmodule Contexts do
  @moduledoc """
  Provides struct and type for a Contexts
  """

  @type t :: %__MODULE__{
          ForbiddenError: ContextsForbiddenError.t() | nil,
          browser: ContextsBrowser.t() | nil,
          organization: ContextsOrganization.t() | nil,
          os: ContextsOs.t() | nil,
          trace: ContextsTrace.t() | nil
        }

  defstruct [:ForbiddenError, :browser, :organization, :os, :trace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ForbiddenError: {ContextsForbiddenError, :t},
      browser: {ContextsBrowser, :t},
      organization: {ContextsOrganization, :t},
      os: {ContextsOs, :t},
      trace: {ContextsTrace, :t}
    ]
  end
end
