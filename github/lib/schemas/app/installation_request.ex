defmodule GitHub.App.InstallationRequest do
  @moduledoc """
  Provides struct and type for a App.InstallationRequest
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          account: GitHub.Enterprise.t() | GitHub.User.simple(),
          created_at: DateTime.t(),
          id: integer,
          node_id: String.t() | nil,
          requester: GitHub.User.simple()
        }

  defstruct [:__info__, :account, :created_at, :id, :node_id, :requester]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      account: {:union, [{GitHub.Enterprise, :t}, {GitHub.User, :simple}]},
      created_at: {:string, :date_time},
      id: :integer,
      node_id: {:string, :generic},
      requester: {GitHub.User, :simple}
    ]
  end
end
