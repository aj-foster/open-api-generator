defmodule ProjectApiKeyOwner do
  @moduledoc """
  Provides struct and type for a ProjectApiKeyOwner
  """

  @type t :: %__MODULE__{
          service_account: ProjectServiceAccount.t() | nil,
          type: String.t() | nil,
          user: ProjectUser.t() | nil
        }

  defstruct [:service_account, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      service_account: {ProjectServiceAccount, :t},
      type: {:enum, ["user", "service_account"]},
      user: {ProjectUser, :t}
    ]
  end
end
