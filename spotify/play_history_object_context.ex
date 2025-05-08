defmodule PlayHistoryObjectContext do
  @moduledoc """
  Provides struct and type for a PlayHistoryObjectContext
  """

  @type t :: %__MODULE__{
          external_urls: map | nil,
          href: String.t() | nil,
          type: String.t() | nil,
          uri: String.t() | nil
        }

  defstruct [:external_urls, :href, :type, :uri]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      external_urls: :map,
      href: {:string, :generic},
      type: {:string, :generic},
      uri: {:string, :generic}
    ]
  end
end
