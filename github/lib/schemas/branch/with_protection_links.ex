defmodule GitHub.Branch.WithProtectionLinks do
  @moduledoc """
  Provides struct and type for a Branch.WithProtectionLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, html: String.t(), self: String.t()}

  defstruct [:__info__, :html, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [html: {:string, :generic}, self: {:string, :uri}]
  end
end
