defmodule GitHub.Classroom.User do
  @moduledoc """
  Provides struct and type for a Classroom.User
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{
          __info__: map,
          avatar_url: String.t(),
          html_url: String.t(),
          id: integer,
          login: String.t()
        }

  defstruct [:__info__, :avatar_url, :html_url, :id, :login]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:simple) do
    [
      avatar_url: {:string, :uri},
      html_url: {:string, :uri},
      id: :integer,
      login: {:string, :generic}
    ]
  end
end
