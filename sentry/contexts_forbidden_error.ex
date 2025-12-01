defmodule Sentry.ContextsForbiddenError do
  @moduledoc """
  Provides struct and type for a ContextsForbiddenError
  """

  @type t :: %__MODULE__{
          responseJSON: Sentry.ContextsForbiddenErrorResponseJSON.t() | nil,
          status: integer | nil,
          statusText: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:responseJSON, :status, :statusText, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      responseJSON: {Sentry.ContextsForbiddenErrorResponseJSON, :t},
      status: :integer,
      statusText: :string,
      type: :string
    ]
  end
end
