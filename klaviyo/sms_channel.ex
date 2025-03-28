defmodule SMSChannel do
  @moduledoc """
  Provides struct and type for a SMSChannel
  """

  @type t :: %__MODULE__{marketing: SMSMarketing.t() | nil}

  defstruct [:marketing]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [marketing: {SMSMarketing, :t}]
  end
end
