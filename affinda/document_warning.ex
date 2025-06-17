defmodule DocumentWarning do
  @moduledoc """
  Provides struct and type for a DocumentWarning
  """

  @type t :: %__MODULE__{warningCode: String.t() | nil, warningDetail: String.t() | nil}

  defstruct [:warningCode, :warningDetail]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [warningCode: {:string, :generic}, warningDetail: {:string, :generic}]
  end
end
