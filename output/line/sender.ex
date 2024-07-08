defmodule Sender do
  @moduledoc """
  Provides struct and type for a Sender
  """

  @type t :: %__MODULE__{iconUrl: String.t() | nil, name: String.t() | nil}

  defstruct [:iconUrl, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [iconUrl: {:string, :uri}, name: {:string, :generic}]
  end
end
