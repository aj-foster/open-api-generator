defmodule GitHub.CodeScanning.SarifsReceipt do
  @moduledoc """
  Provides struct and type for a CodeScanning.SarifsReceipt
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, id: String.t() | nil, url: String.t() | nil}

  defstruct [:__info__, :id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, url: {:string, :uri}]
  end
end
