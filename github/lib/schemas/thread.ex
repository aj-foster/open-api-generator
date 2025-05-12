defmodule GitHub.Thread do
  @moduledoc """
  Provides struct and type for a Thread
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          id: String.t(),
          last_read_at: String.t() | nil,
          reason: String.t(),
          repository: GitHub.Repository.minimal(),
          subject: GitHub.ThreadSubject.t(),
          subscription_url: String.t(),
          unread: boolean,
          updated_at: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :id,
    :last_read_at,
    :reason,
    :repository,
    :subject,
    :subscription_url,
    :unread,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      last_read_at: {:union, [{:string, :generic}, :null]},
      reason: {:string, :generic},
      repository: {GitHub.Repository, :minimal},
      subject: {GitHub.ThreadSubject, :t},
      subscription_url: {:string, :generic},
      unread: :boolean,
      updated_at: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
