defmodule ImageUploadQuery do
  @moduledoc """
  Provides struct and type for a ImageUploadQuery
  """

  @type t :: %__MODULE__{file: String.t(), hidden: boolean | nil, name: String.t() | nil}

  defstruct [:file, :hidden, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file: {:string, :generic}, hidden: :boolean, name: {:string, :generic}]
  end
end
