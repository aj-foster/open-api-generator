defmodule GitHub.Dependabot.Alert.SecurityAdvisoryCvss do
  @moduledoc """
  Provides struct and type for a Dependabot.Alert.SecurityAdvisoryCvss
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, score: number, vector_string: String.t() | nil}

  defstruct [:__info__, :score, :vector_string]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [score: :number, vector_string: {:union, [{:string, :generic}, :null]}]
  end
end
