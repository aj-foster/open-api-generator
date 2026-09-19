defmodule OpenAI.CreateModerationResponseResultsCategoryAppliedInputTypes do
  @moduledoc """
  Provides struct and type for a CreateModerationResponseResultsCategoryAppliedInputTypes
  """

  @type t :: %__MODULE__{
          harassment: [String.t()],
          "harassment/threatening": [String.t()],
          hate: [String.t()],
          "hate/threatening": [String.t()],
          illicit: [String.t()],
          "illicit/violent": [String.t()],
          "self-harm": [String.t()],
          "self-harm/instructions": [String.t()],
          "self-harm/intent": [String.t()],
          sexual: [String.t()],
          "sexual/minors": [String.t()],
          violence: [String.t()],
          "violence/graphic": [String.t()]
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
      harassment: [const: "text"],
      "harassment/threatening": [const: "text"],
      hate: [const: "text"],
      "hate/threatening": [const: "text"],
      illicit: [const: "text"],
      "illicit/violent": [const: "text"],
      "self-harm": [enum: ["text", "image"]],
      "self-harm/instructions": [enum: ["text", "image"]],
      "self-harm/intent": [enum: ["text", "image"]],
      sexual: [enum: ["text", "image"]],
      "sexual/minors": [const: "text"],
      violence: [enum: ["text", "image"]],
      "violence/graphic": [enum: ["text", "image"]]
    ]
  end
end
