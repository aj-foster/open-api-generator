defmodule Discord.ModalInteractionCallbackRequest do
  @moduledoc """
  Provides struct and type for a ModalInteractionCallbackRequest
  """

  @type t :: %__MODULE__{data: Discord.ModalInteractionCallbackData.t(), type: 9}

  defstruct [:data, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Discord.ModalInteractionCallbackData, :t}, type: {:const, 9}]
  end
end
