defmodule GitHub.Reaction do
  @moduledoc """
  Provides struct and type for a Reaction
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          content: String.t(),
          created_at: DateTime.t(),
          id: integer,
          node_id: String.t(),
          user: GitHub.User.simple() | nil
        }

  defstruct [:__info__, :content, :created_at, :id, :node_id, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:enum, ["+1", "-1", "laugh", "confused", "heart", "hooray", "rocket", "eyes"]},
      created_at: {:string, :date_time},
      id: :integer,
      node_id: {:string, :generic},
      user: {:union, [{GitHub.User, :simple}, :null]}
    ]
  end
end
