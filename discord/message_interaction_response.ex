defmodule MessageInteractionResponse do
  @moduledoc """
  Provides struct and type for a MessageInteractionResponse
  """

  @type t :: %__MODULE__{
          id: String.t(),
          name: String.t(),
          name_localized: String.t() | nil,
          type: integer,
          user: UserResponse.t() | nil
        }

  defstruct [:id, :name, :name_localized, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      name: {:string, :generic},
      name_localized: {:union, [{:string, :generic}, :null]},
      type: :integer,
      user: {:union, [{UserResponse, :t}, :null]}
    ]
  end
end
