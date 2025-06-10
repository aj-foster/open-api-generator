defmodule RequestErrorErrors do
  @moduledoc """
  Provides struct and type for a RequestErrorErrors
  """

  @type t :: %__MODULE__{attr: String.t() | nil, code: String.t(), detail: String.t()}

  defstruct [:attr, :code, :detail]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attr: {:string, :generic}, code: {:string, :generic}, detail: {:string, :generic}]
  end
end
