defmodule Sentry.ServiceHook do
  @moduledoc """
  Provides struct and type for a ServiceHook
  """

  @type t :: %__MODULE__{
          dateCreated: String.t(),
          events: [String.t()],
          id: String.t(),
          secret: String.t(),
          status: String.t(),
          url: String.t()
        }

  defstruct [:dateCreated, :events, :id, :secret, :status, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dateCreated: :string,
      events: [:string],
      id: :string,
      secret: :string,
      status: :string,
      url: :string
    ]
  end
end
