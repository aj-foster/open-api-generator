defmodule Klaviyo.EmailChannel do
  @moduledoc """
  Provides struct and type for a EmailChannel
  """

  @type t :: %__MODULE__{marketing: Klaviyo.EmailMarketing.t() | nil}

  defstruct [:marketing]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [marketing: {Klaviyo.EmailMarketing, :t}]
  end
end
