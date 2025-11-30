defmodule OpenAI.CreateModerationResponseResultsCategories do
  @moduledoc """
  Provides struct and type for a CreateModerationResponseResultsCategories
  """

  @type t :: %__MODULE__{
          harassment: boolean,
          "harassment/threatening": boolean,
          hate: boolean,
          "hate/threatening": boolean,
          illicit: boolean | nil,
          "illicit/violent": boolean | nil,
          "self-harm": boolean,
          "self-harm/instructions": boolean,
          "self-harm/intent": boolean,
          sexual: boolean,
          "sexual/minors": boolean,
          violence: boolean,
          "violence/graphic": boolean
        }

  defstruct [
    :harassment,
    :"harassment/threatening",
    :hate,
    :"hate/threatening",
    :illicit,
    :"illicit/violent",
    :"self-harm",
    :"self-harm/instructions",
    :"self-harm/intent",
    :sexual,
    :"sexual/minors",
    :violence,
    :"violence/graphic"
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      harassment: :boolean,
      "harassment/threatening": :boolean,
      hate: :boolean,
      "hate/threatening": :boolean,
      illicit: :boolean,
      "illicit/violent": :boolean,
      "self-harm": :boolean,
      "self-harm/instructions": :boolean,
      "self-harm/intent": :boolean,
      sexual: :boolean,
      "sexual/minors": :boolean,
      violence: :boolean,
      "violence/graphic": :boolean
    ]
  end
end
