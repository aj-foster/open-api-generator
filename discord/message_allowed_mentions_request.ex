defmodule MessageAllowedMentionsRequest do
  @moduledoc """
  Provides struct and type for a MessageAllowedMentionsRequest
  """

  @type t :: %__MODULE__{
          parse: [String.t() | nil] | nil,
          replied_user: boolean | nil,
          roles: [String.t() | nil] | nil,
          users: [String.t() | nil] | nil
        }

  defstruct [:parse, :replied_user, :roles, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      parse: {:union, [[union: [{:string, :generic}, :null]], :null]},
      replied_user: {:union, [:boolean, :null]},
      roles: {:union, [[union: [{:string, :generic}, :null]], :null]},
      users: {:union, [[union: [{:string, :generic}, :null]], :null]}
    ]
  end
end
