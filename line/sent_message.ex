defmodule SentMessage do
  @moduledoc """
  Provides struct and type for a SentMessage
  """

  @type t :: %__MODULE__{id: String.t(), quoteToken: String.t() | nil}

  defstruct [:id, :quoteToken]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, quoteToken: {:string, :generic}]
  end
end
