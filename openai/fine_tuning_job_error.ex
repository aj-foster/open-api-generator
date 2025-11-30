defmodule OpenAI.FineTuningJobError do
  @moduledoc """
  Provides struct and type for a FineTuningJobError
  """

  @type t :: %__MODULE__{code: String.t(), message: String.t(), param: String.t() | nil}

  defstruct [:code, :message, :param]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, message: :string, param: :string]
  end
end
