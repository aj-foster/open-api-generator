defmodule DocumentError do
  @moduledoc """
  Provides struct and type for a DocumentError
  """

  @type t :: %__MODULE__{errorCode: String.t() | nil, errorDetail: String.t() | nil}

  defstruct [:errorCode, :errorDetail]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errorCode: {:string, :generic}, errorDetail: {:string, :generic}]
  end
end
