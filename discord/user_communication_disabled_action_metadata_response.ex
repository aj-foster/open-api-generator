defmodule UserCommunicationDisabledActionMetadataResponse do
  @moduledoc """
  Provides struct and type for a UserCommunicationDisabledActionMetadataResponse
  """

  @type t :: %__MODULE__{duration_seconds: integer}

  defstruct [:duration_seconds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [duration_seconds: :integer]
  end
end
