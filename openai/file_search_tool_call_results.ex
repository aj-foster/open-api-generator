defmodule OpenAI.FileSearchToolCallResults do
  @moduledoc """
  Provides struct and type for a FileSearchToolCallResults
  """

  @type t :: %__MODULE__{
          attributes: map | nil,
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
      attributes: :map,
      file_id: :string,
      filename: :string,
      score: {:number, "float"},
      text: :string
    ]
  end
end
