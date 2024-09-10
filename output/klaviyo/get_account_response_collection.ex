defmodule GetAccountResponseCollection do
  @moduledoc """
  Provides struct and type for a GetAccountResponseCollection
  """

  @type t :: %__MODULE__{data: [AccountResponseObjectResource.t()], links: CollectionLinks.t()}

  defstruct [:data, :links]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{AccountResponseObjectResource, :t}], links: {CollectionLinks, :t}]
  end
end
