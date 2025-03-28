defmodule SMSContentSubObjectCreate do
  @moduledoc """
  Provides struct and type for a SMSContentSubObjectCreate
  """

  @type t :: %__MODULE__{body: String.t() | nil}

  defstruct [:body]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [body: {:string, :generic}]
  end
end
