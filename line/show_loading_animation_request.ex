defmodule ShowLoadingAnimationRequest do
  @moduledoc """
  Provides struct and type for a ShowLoadingAnimationRequest
  """

  @type t :: %__MODULE__{chatId: String.t(), loadingSeconds: integer | nil}

  defstruct [:chatId, :loadingSeconds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [chatId: {:string, :generic}, loadingSeconds: :integer]
  end
end
