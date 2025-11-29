defmodule CollectionLinks do
  @moduledoc """
  Provides struct and type for a CollectionLinks
  """

  @type t :: %__MODULE__{
          first: String.t() | nil,
          last: String.t() | nil,
          next: String.t() | nil,
          prev: String.t() | nil,
          self: String.t()
        }

  defstruct [:first, :last, :next, :prev, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      first: {:string, :uri},
      last: {:string, :uri},
      next: {:string, :uri},
      prev: {:string, :uri},
      self: {:string, :uri}
    ]
  end
end
