defmodule OpenAI.PredictionContent do
  @moduledoc """
  Provides struct and type for a PredictionContent
  """

  @type t :: %__MODULE__{content: String.t() | [map], type: String.t()}

  defstruct [:content, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [content: {:union, [:string, [:map]]}, type: {:const, "content"}]
  end
end
