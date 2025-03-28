defmodule FileSearchToolCallResults do
  @moduledoc """
  Provides struct and type for a FileSearchToolCallResults
  """

  @type t :: %__MODULE__{
          attributes: VectorStoreFileAttributes.t() | nil,
          file_id: String.t() | nil,
          filename: String.t() | nil,
          score: number | nil,
          text: String.t() | nil
        }

  defstruct [:attributes, :file_id, :filename, :score, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {VectorStoreFileAttributes, :t},
      file_id: {:string, :generic},
      filename: {:string, :generic},
      score: {:number, :float},
      text: {:string, :generic}
    ]
  end
end
