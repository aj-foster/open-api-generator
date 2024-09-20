defmodule JobDescriptionSearchEmbed do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchEmbed
  """

  @type t :: %__MODULE__{url: String.t() | nil}

  defstruct [:url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [url: {:string, :generic}]
  end
end
