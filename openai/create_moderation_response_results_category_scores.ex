defmodule OpenAI.CreateModerationResponseResultsCategoryScores do
  @moduledoc """
  Provides struct and type for a CreateModerationResponseResultsCategoryScores
  """

  @type t :: %__MODULE__{
          harassment: number,
          "harassment/threatening": number,
          hate: number,
          "hate/threatening": number,
          illicit: number,
          "illicit/violent": number,
          "self-harm": number,
          "self-harm/instructions": number,
          "self-harm/intent": number,
          sexual: number,
          "sexual/minors": number,
          violence: number,
          "violence/graphic": number
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
      harassment: :number,
      "harassment/threatening": :number,
      hate: :number,
      "hate/threatening": :number,
      illicit: :number,
      "illicit/violent": :number,
      "self-harm": :number,
      "self-harm/instructions": :number,
      "self-harm/intent": :number,
      sexual: :number,
      "sexual/minors": :number,
      violence: :number,
      "violence/graphic": :number
    ]
  end
end
