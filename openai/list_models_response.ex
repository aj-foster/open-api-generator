defmodule OpenAI.ListModelsResponse do
  @moduledoc """
  Provides struct and type for a ListModelsResponse
  """

  @type t :: %__MODULE__{data: [OpenAI.Model.t()], object: String.t()}

  defstruct [:data, :object]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: [{OpenAI.Model, :t}], object: {:const, "list"}]
  end
end
