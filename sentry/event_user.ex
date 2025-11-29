defmodule EventUser do
  @moduledoc """
  Provides struct and type for a EventUser
  """

  @type t :: %__MODULE__{
          data: EventUserData.t() | nil,
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
      data: {EventUserData, :t},
      email: {:string, :generic},
      id: {:string, :generic},
      ip_address: {:string, :generic},
      name: {:string, :generic},
      username: {:string, :generic}
    ]
  end
end
