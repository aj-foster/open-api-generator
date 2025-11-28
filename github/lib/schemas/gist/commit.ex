defmodule GitHub.Gist.Commit do
  @moduledoc """
  Provides struct and type for a Gist.Commit
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          change_status: GitHub.Gist.CommitChangeStatus.t(),
          committed_at: DateTime.t(),
          url: String.t(),
          user: GitHub.User.simple() | nil,
          version: String.t()
        }

  defstruct [:__info__, :change_status, :committed_at, :url, :user, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      change_status: {GitHub.Gist.CommitChangeStatus, :t},
      committed_at: {:string, :date_time},
      url: {:string, :uri},
      user: {:union, [{GitHub.User, :simple}, :null]},
      version: {:string, :generic}
    ]
  end
end
