defmodule EmailChannel do
  @moduledoc """
  Provides struct and type for a EmailChannel
  """

  @type t :: %__MODULE__{marketing: EmailMarketing.t() | nil}

  defstruct [:marketing]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [marketing: {EmailMarketing, :t}]
  end
end
