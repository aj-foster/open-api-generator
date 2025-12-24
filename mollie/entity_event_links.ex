defmodule Mollie.EntityEventLinks do
  @moduledoc """
  Provides struct and type for a EntityEventLinks
  """

  @type t :: %__MODULE__{url: Mollie.Url.t() | nil}

  defstruct [:url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [url: {Mollie.Url, :t}]
  end
end
