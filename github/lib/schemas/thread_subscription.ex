defmodule GitHub.ThreadSubscription do
  @moduledoc """
  Provides struct and type for a ThreadSubscription
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t() | nil,
          ignored: boolean,
          reason: String.t() | nil,
          repository_url: String.t() | nil,
          subscribed: boolean,
          thread_url: String.t() | nil,
          url: String.t()
        }

  defstruct [
    :__info__,
    :created_at,
    :ignored,
    :reason,
    :repository_url,
    :subscribed,
    :thread_url,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:union, [{:string, :date_time}, :null]},
      ignored: :boolean,
      reason: {:union, [{:string, :generic}, :null]},
      repository_url: {:string, :uri},
      subscribed: :boolean,
      thread_url: {:string, :uri},
      url: {:string, :uri}
    ]
  end
end
