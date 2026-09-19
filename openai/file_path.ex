defmodule OpenAI.FilePath do
  @moduledoc """
  Provides struct and type for a FilePath
  """

  @type t :: %__MODULE__{file_id: String.t(), index: integer, type: String.t()}

  defstruct [:file_id, :index, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file_id: :string, index: :integer, type: {:const, "file_path"}]
  end
end
