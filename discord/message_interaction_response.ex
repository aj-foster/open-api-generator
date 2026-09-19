defmodule Discord.MessageInteractionResponse do
  @moduledoc """
  Provides struct and type for a MessageInteractionResponse
  """

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          name_localized: String.t() | nil,
          type: integer,
          user: Discord.UserResponse.t() | nil
        }

  defstruct [:id, :name, :name_localized, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, "snowflake"},
      name: :string,
      name_localized: {:union, [:string, :null]},
      type: {:integer, "int32"},
      user: {:union, [{Discord.UserResponse, :t}, :null]}
    ]
  end
end
