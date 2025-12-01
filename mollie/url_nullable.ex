defmodule Mollie.UrlNullable do
  @moduledoc """
  Provides struct and type for a UrlNullable
  """

  @type t :: %__MODULE__{href: String.t() | nil, type: String.t() | nil}

  defstruct [:href, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [href: :string, type: :string]
  end
end
