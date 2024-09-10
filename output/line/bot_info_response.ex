defmodule BotInfoResponse do
  @moduledoc """
  Provides struct and type for a BotInfoResponse
  """

  @type t :: %__MODULE__{
          basicId: String.t(),
          chatMode: String.t(),
          displayName: String.t(),
          markAsReadMode: String.t(),
          pictureUrl: String.t() | nil,
          premiumId: String.t() | nil,
          userId: String.t()
        }

  defstruct [:basicId, :chatMode, :displayName, :markAsReadMode, :pictureUrl, :premiumId, :userId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      basicId: {:string, :generic},
      chatMode: {:enum, ["chat", "bot"]},
      displayName: {:string, :generic},
      markAsReadMode: {:enum, ["auto", "manual"]},
      pictureUrl: {:string, :uri},
      premiumId: {:string, :generic},
      userId: {:string, :generic}
    ]
  end
end
