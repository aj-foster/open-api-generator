defmodule OpenAI.UsageEmbeddingsResult do
  @moduledoc """
  Provides struct and type for a UsageEmbeddingsResult
  """

  @type t :: %__MODULE__{
          api_key_id: String.t() | nil,
          input_tokens: integer,
          model: String.t() | nil,
          num_model_requests: integer,
          object: String.t(),
          project_id: String.t() | nil,
          user_id: String.t() | nil
        }

  defstruct [
    :api_key_id,
    :input_tokens,
    :model,
    :num_model_requests,
    :object,
    :project_id,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      api_key_id: :string,
      input_tokens: :integer,
      model: :string,
      num_model_requests: :integer,
      object: {:const, "organization.usage.embeddings.result"},
      project_id: :string,
      user_id: :string
    ]
  end
end
