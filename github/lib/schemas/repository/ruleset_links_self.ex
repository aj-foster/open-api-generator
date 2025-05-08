defmodule GitHub.Repository.RulesetLinksSelf do
  @moduledoc """
  Provides struct and type for a Repository.RulesetLinksSelf
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, href: String.t() | nil}

  defstruct [:__info__, :href]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [href: {:string, :generic}]
  end
end
