defmodule OpenAI.ResponseErrorEvent do
  @moduledoc """
  Provides struct and type for a ResponseErrorEvent
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          message: String.t(),
          param: String.t() | nil,
          type: String.t()
        }

  defstruct [:code, :message, :param, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: :string, message: :string, param: :string, type: {:const, "error"}]
  end
end
