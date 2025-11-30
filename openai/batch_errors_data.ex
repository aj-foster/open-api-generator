defmodule OpenAI.BatchErrorsData do
  @moduledoc """
  Provides struct and type for a BatchErrorsData
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          line: integer | nil,
          message: String.t() | nil,
          param: String.t() | nil
        }

  defstruct [:code, :line, :message, :param]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, line: :integer, message: :string, param: :string]
  end
end
