defmodule GitHub.SSHSigningKey do
  @moduledoc """
  Provides struct and type for a SSHSigningKey
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: DateTime.t(),
          id: integer,
          key: String.t(),
          title: String.t()
        }

  defstruct [:__info__, :created_at, :id, :key, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :date_time},
      id: :integer,
      key: {:string, :generic},
      title: {:string, :generic}
    ]
  end
end
