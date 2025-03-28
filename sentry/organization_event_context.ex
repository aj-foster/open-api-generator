defmodule OrganizationEventContext do
  @moduledoc """
  Provides struct and type for a OrganizationEventContext
  """

  @type t :: %__MODULE__{
          length: integer | nil,
          results: [integer] | nil,
          session: OrganizationEventContextSession.t() | nil,
          unauthorized: boolean | nil,
          url: String.t() | nil
        }

  defstruct [:length, :results, :session, :unauthorized, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      length: :integer,
      results: [:integer],
      session: {OrganizationEventContextSession, :t},
      unauthorized: :boolean,
      url: {:string, :generic}
    ]
  end
end
