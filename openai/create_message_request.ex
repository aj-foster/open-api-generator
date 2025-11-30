defmodule OpenAI.CreateMessageRequest do
  @moduledoc """
  Provides struct and type for a CreateMessageRequest
  """

  @type t :: %__MODULE__{
          attachments: [OpenAI.CreateMessageRequestAttachments.t()] | nil,
          content:
            String.t()
            | [
                map
                | OpenAI.MessageContentImageFileObject.t()
                | OpenAI.MessageContentImageUrlObject.t()
              ],
          metadata: map | nil,
          role: String.t()
        }

  defstruct [:attachments, :content, :metadata, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attachments: [{OpenAI.CreateMessageRequestAttachments, :t}],
      content:
        {:union,
         [
           :string,
           [
             union: [
               :map,
               {OpenAI.MessageContentImageFileObject, :t},
               {OpenAI.MessageContentImageUrlObject, :t}
             ]
           ]
         ]},
      metadata: :map,
      role: {:enum, ["user", "assistant"]}
    ]
  end
end
