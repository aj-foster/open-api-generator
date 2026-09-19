defmodule OpenAI.ResponseUsage do
  @moduledoc """
  Provides struct and type for a ResponseUsage
  """

  @type t :: %__MODULE__{
          input_tokens: integer,
          output_tokens: integer,
          output_tokens_details: OpenAI.ResponseUsageOutputTokensDetails.t(),
          total_tokens: integer
        }

  defstruct [:input_tokens, :output_tokens, :output_tokens_details, :total_tokens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      input_tokens: :integer,
      output_tokens: :integer,
      output_tokens_details: {OpenAI.ResponseUsageOutputTokensDetails, :t},
      total_tokens: :integer
    ]
  end
end
