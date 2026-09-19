defmodule OpenAI.StaticChunkingStrategyResponseParam do
  @moduledoc """
  Provides struct and type for a StaticChunkingStrategyResponseParam
  """

  @type t :: %__MODULE__{static: OpenAI.StaticChunkingStrategy.t(), type: String.t()}

  defstruct [:static, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [static: {OpenAI.StaticChunkingStrategy, :t}, type: {:const, "static"}]
  end
end
