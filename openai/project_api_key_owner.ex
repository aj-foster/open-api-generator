defmodule OpenAI.ProjectApiKeyOwner do
  @moduledoc """
  Provides struct and type for a ProjectApiKeyOwner
  """

  @type t :: %__MODULE__{
          service_account: OpenAI.ProjectServiceAccount.t() | nil,
          type: String.t() | nil,
          user: OpenAI.ProjectUser.t() | nil
        }

  defstruct [:service_account, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      service_account: {OpenAI.ProjectServiceAccount, :t},
      type: {:enum, ["user", "service_account"]},
      user: {OpenAI.ProjectUser, :t}
    ]
  end
end
