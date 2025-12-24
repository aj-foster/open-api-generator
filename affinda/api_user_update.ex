defmodule Affinda.ApiUserUpdate do
  @moduledoc """
  Provides struct and type for a ApiUserUpdate
  """

  @type t :: %__MODULE__{
          avatar: String.t() | nil,
          email: String.t() | nil,
          name: String.t() | nil,
          username: String.t() | nil
        }

  defstruct [:avatar, :email, :name, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [avatar: :string, email: :string, name: :string, username: :string]
  end
end
