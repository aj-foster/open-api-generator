defmodule GitHub.Key do
  @moduledoc """
  Provides struct and types for a Key
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{__info__: map, id: integer, key: String.t()}

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          id: integer,
          key: String.t(),
          read_only: boolean,
          title: String.t(),
          url: String.t(),
          verified: boolean
        }

  defstruct [:__info__, :created_at, :id, :key, :read_only, :title, :url, :verified]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:simple) do
    [id: :integer, key: {:string, :generic}]
  end

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      id: :integer,
      key: {:string, :generic},
      read_only: :boolean,
      title: {:string, :generic},
      url: {:string, :generic},
      verified: :boolean
    ]
  end
end
