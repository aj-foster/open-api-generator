defmodule AccountResponse do
  @moduledoc """
  Provides struct and type for a AccountResponse
  """

  @type t :: %__MODULE__{id: String.t(), name: String.t() | nil}

  defstruct [:id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, name: {:union, [{:string, :generic}, :null]}]
  end
end
