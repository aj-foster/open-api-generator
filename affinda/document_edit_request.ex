defmodule Affinda.DocumentEditRequest do
  @moduledoc """
  Provides struct and type for a DocumentEditRequest
  """

  @type t :: %__MODULE__{splits: [Affinda.DocumentSplit.t()]}

  defstruct [:splits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [splits: [{Affinda.DocumentSplit, :t}]]
  end
end
