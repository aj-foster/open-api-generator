defmodule ApiUserCreate do
  @moduledoc """
  Provides struct and type for a ApiUserCreate
  """

  @type t :: %__MODULE__{
          avatar: String.t() | nil,
          email: String.t() | nil,
          name: String.t() | nil,
          organization: String.t(),
          username: String.t() | nil
        }

  defstruct [:avatar, :email, :name, :organization, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar: {:string, :generic},
      email: {:string, :generic},
      name: {:string, :generic},
      organization: {:string, :generic},
      username: {:string, :generic}
    ]
  end
end
