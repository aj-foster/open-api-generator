defmodule CreateGuildInviteRequest do
  @moduledoc """
  Provides struct and type for a CreateGuildInviteRequest
  """

  @type t :: %__MODULE__{
          max_age: integer | nil,
          max_uses: integer | nil,
          target_application_id: String.t() | nil,
          target_type: 1 | 2 | nil,
          target_user_id: String.t() | nil,
          temporary: boolean | nil,
          unique: boolean | nil
        }

  defstruct [
    :max_age,
    :max_uses,
    :target_application_id,
    :target_type,
    :target_user_id,
    :temporary,
    :unique
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      max_age: {:union, [:integer, :null]},
      max_uses: {:union, [:integer, :null]},
      target_application_id: {:union, [{:string, :generic}, :null]},
      target_type: {:union, [{:enum, [1, 2]}, :null]},
      target_user_id: {:union, [{:string, :generic}, :null]},
      temporary: {:union, [:boolean, :null]},
      unique: {:union, [:boolean, :null]}
    ]
  end
end
