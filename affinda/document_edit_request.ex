defmodule DocumentEditRequest do
  @moduledoc """
  Provides struct and type for a DocumentEditRequest
  """

  @type t :: %__MODULE__{splits: [DocumentSplit.t()]}

  defstruct [:splits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [splits: [{DocumentSplit, :t}]]
  end
end
