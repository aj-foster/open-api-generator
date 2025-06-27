defmodule GitHub.Link do
  @moduledoc """
  Provides struct and type for a Link
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, href: String.t()}

  defstruct [:__info__, :href]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [href: {:string, :generic}]
  end
end
