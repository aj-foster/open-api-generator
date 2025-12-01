defmodule Mollie.ListLinks do
  @moduledoc """
  Provides struct and type for a ListLinks
  """

  @type t :: %__MODULE__{
          documentation: Mollie.Url.t(),
          next: Mollie.UrlNullable.t() | nil,
          previous: Mollie.UrlNullable.t() | nil,
          self: Mollie.Url.t()
        }

  defstruct [:documentation, :next, :previous, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentation: {Mollie.Url, :t},
      next: {:union, [{Mollie.UrlNullable, :t}, :null]},
      previous: {:union, [{Mollie.UrlNullable, :t}, :null]},
      self: {Mollie.Url, :t}
    ]
  end
end
