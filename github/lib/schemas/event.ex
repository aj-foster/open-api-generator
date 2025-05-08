defmodule GitHub.Event do
  @moduledoc """
  Provides struct and type for a Event
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          actor: GitHub.Actor.t(),
          created_at: DateTime.t() | nil,
          id: String.t(),
          org: GitHub.Actor.t() | nil,
          payload: GitHub.EventPayload.t(),
          public: boolean,
          repo: GitHub.EventRepo.t(),
          type: String.t() | nil
        }

  defstruct [:__info__, :actor, :created_at, :id, :org, :payload, :public, :repo, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actor: {GitHub.Actor, :t},
      created_at: {:union, [{:string, :date_time}, :null]},
      id: {:string, :generic},
      org: {GitHub.Actor, :t},
      payload: {GitHub.EventPayload, :t},
      public: :boolean,
      repo: {GitHub.EventRepo, :t},
      type: {:union, [{:string, :generic}, :null]}
    ]
  end
end
