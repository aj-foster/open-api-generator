defmodule EmailSendOptionsSubObject do
  @moduledoc """
  Provides struct and type for a EmailSendOptionsSubObject
  """

  @type t :: %__MODULE__{use_smart_sending: boolean | nil}

  defstruct [:use_smart_sending]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [use_smart_sending: :boolean]
  end
end
