defmodule CreateFineTuningJobRequest do
  @moduledoc """
  Provides struct and type for a CreateFineTuningJobRequest
  """

  @type t :: %__MODULE__{
          hyperparameters: CreateFineTuningJobRequestHyperparameters.t() | nil,
          integrations: [CreateFineTuningJobRequestIntegrations.t()] | nil,
          metadata: Metadata.t() | nil,
          method: FineTuneMethod.t() | nil,
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
      hyperparameters: {CreateFineTuningJobRequestHyperparameters, :t},
      integrations: [{CreateFineTuningJobRequestIntegrations, :t}],
      metadata: {Metadata, :t},
      method: {FineTuneMethod, :t},
      model:
        {:union,
         enum: ["babbage-002", "davinci-002", "gpt-3.5-turbo", "gpt-4o-mini"], string: :generic},
      seed: :integer,
      suffix: {:string, :generic},
      training_file: {:string, :generic},
      validation_file: {:string, :generic}
    ]
  end
end
