defmodule Sentry.EventUser do
  @moduledoc """
  Provides struct and type for a EventUser
  """

  @type t :: %__MODULE__{
          data: Sentry.EventUserData.t() | nil,
          email: String.t() | nil,
          id: String.t(),
          ip_address: String.t() | nil,
          name: String.t() | nil,
          username: String.t() | nil
        }

  defstruct [:data, :email, :id, :ip_address, :name, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      data: {Sentry.EventUserData, :t},
      email: :string,
      id: :string,
      ip_address: :string,
      name: :string,
      username: :string
    ]
  end
end
