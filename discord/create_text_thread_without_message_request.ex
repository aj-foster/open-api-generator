defmodule Discord.CreateTextThreadWithoutMessageRequest do
  @moduledoc """
  Provides struct and type for a CreateTextThreadWithoutMessageRequest
  """

  @type t :: %__MODULE__{
          auto_archive_duration: integer | nil,
          invitable: boolean | nil,
          name: String.t(),
          rate_limit_per_user: integer | nil,
          type: 10 | 11 | 12 | nil
        }

  defstruct [:auto_archive_duration, :invitable, :name, :rate_limit_per_user, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      auto_archive_duration: {:union, [{:integer, "int32"}, :null]},
      invitable: {:union, [:boolean, :null]},
      name: :string,
      rate_limit_per_user: {:union, [:integer, :null]},
      type: {:union, [{:enum, ~c"
"}, :null]}
    ]
  end
end
