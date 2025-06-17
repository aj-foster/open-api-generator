defmodule GitHub.CodeScanning.AlertInstanceMessage do
  @moduledoc """
  Provides struct and type for a CodeScanning.AlertInstanceMessage
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, text: String.t() | nil}

  defstruct [:__info__, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [text: {:string, :generic}]
  end
end
