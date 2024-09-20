defmodule GitHub.Pages.Build do
  @moduledoc """
  Provides struct and type for a Pages.Build
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          commit: String.t(),
          created_at: DateTime.t(),
          duration: integer,
          error: GitHub.Pages.BuildError.t(),
          pusher: GitHub.User.simple() | nil,
          status: String.t(),
          updated_at: DateTime.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :commit,
    :created_at,
    :duration,
    :error,
    :pusher,
    :status,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commit: {:string, :generic},
      created_at: {:string, :date_time},
      duration: :integer,
      error: {GitHub.Pages.BuildError, :t},
      pusher: {:union, [{GitHub.User, :simple}, :null]},
      status: {:string, :generic},
      updated_at: {:string, :date_time},
      url: {:string, :uri}
    ]
  end
end
