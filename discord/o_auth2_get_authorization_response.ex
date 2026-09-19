defmodule Discord.OAuth2GetAuthorizationResponse do
  @moduledoc """
  Provides struct and type for a OAuth2GetAuthorizationResponse
  """

  @type t :: %__MODULE__{
          application: Discord.ApplicationResponse.t(),
          expires: DateTime.t(),
          scopes: [String.t()],
          user: Discord.UserResponse.t() | nil
        }

  defstruct [:application, :expires, :scopes, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application: {Discord.ApplicationResponse, :t},
      expires: {:string, "date-time"},
      scopes: [:string],
      user: {:union, [{Discord.UserResponse, :t}, :null]}
    ]
  end
end
