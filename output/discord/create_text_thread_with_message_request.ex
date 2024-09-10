defmodule CreateTextThreadWithMessageRequest do
  @moduledoc """
  Provides struct and type for a CreateTextThreadWithMessageRequest
  """

  @type t :: %__MODULE__{
          auto_archive_duration: integer | nil,
          name: String.t(),
          rate_limit_per_user: integer | nil
        }

  defstruct [:auto_archive_duration, :name, :rate_limit_per_user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      auto_archive_duration: {:union, [:integer, :null]},
      name: {:string, :generic},
      rate_limit_per_user: {:union, [:integer, :null]}
    ]
  end
end
