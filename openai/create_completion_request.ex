defmodule OpenAI.CreateCompletionRequest do
  @moduledoc """
  Provides struct and type for a CreateCompletionRequest
  """

  @type t :: %__MODULE__{
          best_of: integer | nil,
          echo: boolean | nil,
          frequency_penalty: number | nil,
          logit_bias: map | nil,
          logprobs: integer | nil,
          max_tokens: integer | nil,
          model: String.t(),
          n: integer | nil,
          presence_penalty: number | nil,
          prompt: String.t() | [integer] | [String.t()] | [[integer]] | nil,
          seed: integer | nil,
          stop: String.t() | [String.t()] | nil,
          stream: boolean | nil,
          stream_options: OpenAI.ChatCompletionStreamOptions.t() | nil,
          suffix: String.t() | nil,
          temperature: number | nil,
          top_p: number | nil,
          user: String.t() | nil
        }

  defstruct [
    :best_of,
    :echo,
    :frequency_penalty,
    :logit_bias,
    :logprobs,
    :max_tokens,
    :model,
    :n,
    :presence_penalty,
    :prompt,
    :seed,
    :stop,
    :stream,
    :stream_options,
    :suffix,
    :temperature,
    :top_p,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      best_of: :integer,
      echo: :boolean,
      frequency_penalty: :number,
      logit_bias: :map,
      logprobs: :integer,
      max_tokens: :integer,
      model: {:union, [:string, enum: ["gpt-3.5-turbo-instruct", "davinci-002", "babbage-002"]]},
      n: :integer,
      presence_penalty: :number,
      prompt: {:union, [:string, [:integer], [:string], [[:integer]]]},
      seed: {:integer, "int64"},
      stop: {:union, [:string, [:string]]},
      stream: :boolean,
      stream_options: {OpenAI.ChatCompletionStreamOptions, :t},
      suffix: :string,
      temperature: :number,
      top_p: :number,
      user: :string
    ]
  end
end
