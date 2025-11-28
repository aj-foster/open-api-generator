defmodule NextPage do
  @moduledoc """
  Provides struct and type for a NextPage
  """

  @type t :: %__MODULE__{after: String.t(), link: String.t() | nil}

  defstruct [:after, :link]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [after: {:string, :generic}, link: {:string, :generic}]
  end
end
