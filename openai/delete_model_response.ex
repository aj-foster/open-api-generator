defmodule OpenAI.DeleteModelResponse do
  @moduledoc """
  Provides struct and type for a DeleteModelResponse
  """

  @type t :: %__MODULE__{deleted: boolean, id: String.t(), object: String.t()}

  defstruct [:deleted, :id, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [deleted: :boolean, id: :string, object: :string]
  end
end
