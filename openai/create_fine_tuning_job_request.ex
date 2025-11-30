defmodule OpenAI.CreateFineTuningJobRequest do
  @moduledoc """
  Provides struct and type for a CreateFineTuningJobRequest
  """

  @type t :: %__MODULE__{
          hyperparameters: OpenAI.CreateFineTuningJobRequestHyperparameters.t() | nil,
          integrations: [OpenAI.CreateFineTuningJobRequestIntegrations.t()] | nil,
          metadata: map | nil,
          method: OpenAI.FineTuneMethod.t() | nil,
          model: String.t(),
          seed: integer | nil,
          suffix: String.t() | nil,
          training_file: String.t(),
          validation_file: String.t() | nil
        }

  defstruct [
    :hyperparameters,
    :integrations,
    :metadata,
    :method,
    :model,
    :seed,
    :suffix,
    :training_file,
    :validation_file
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      hyperparameters: {OpenAI.CreateFineTuningJobRequestHyperparameters, :t},
      integrations: [{OpenAI.CreateFineTuningJobRequestIntegrations, :t}],
      metadata: :map,
      method: {OpenAI.FineTuneMethod, :t},
      model:
        {:union, [:string, enum: ["babbage-002", "davinci-002", "gpt-3.5-turbo", "gpt-4o-mini"]]},
      seed: :integer,
      suffix: :string,
      training_file: :string,
      validation_file: :string
    ]
  end
end
