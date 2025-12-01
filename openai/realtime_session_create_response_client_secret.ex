defmodule OpenAI.RealtimeSessionCreateResponseClientSecret do
  @moduledoc """
  Provides struct and type for a RealtimeSessionCreateResponseClientSecret
  """

  @type t :: %__MODULE__{expires_at: integer, value: String.t()}

  defstruct [:expires_at, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expires_at: :integer, value: :string]
  end
end
