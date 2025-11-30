defmodule OpenAI.Refusal do
  @moduledoc """
  Provides struct and type for a Refusal
  """

  @type t :: %__MODULE__{refusal: String.t(), type: String.t()}

  defstruct [:refusal, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [refusal: :string, type: {:const, "refusal"}]
  end
end
