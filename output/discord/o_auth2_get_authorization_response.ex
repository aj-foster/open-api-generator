defmodule OAuth2GetAuthorizationResponse do
  @moduledoc """
  Provides struct and type for a OAuth2GetAuthorizationResponse
  """

  @type t :: %__MODULE__{
          application: ApplicationResponse.t(),
          expires: DateTime.t(),
          scopes: [String.t()],
          user: UserResponse.t() | nil
        }

  defstruct [:application, :expires, :scopes, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application: {ApplicationResponse, :t},
      expires: {:string, :date_time},
      scopes: [string: :generic],
      user: {:union, [{UserResponse, :t}, :null]}
    ]
  end
end
