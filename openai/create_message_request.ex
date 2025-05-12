defmodule CreateMessageRequest do
  @moduledoc """
  Provides struct and type for a CreateMessageRequest
  """

  @type t :: %__MODULE__{
          attachments: [CreateMessageRequestAttachments.t()] | nil,
          content:
            String.t()
            | [map | MessageContentImageFileObject.t() | MessageContentImageUrlObject.t()],
          metadata: Metadata.t() | nil,
          role: String.t()
        }

  defstruct [:attachments, :content, :metadata, :role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attachments: [{CreateMessageRequestAttachments, :t}],
      content:
        {:union,
         [
           {:string, :generic},
           [
             union: [
               :map,
               {MessageContentImageFileObject, :t},
               {MessageContentImageUrlObject, :t}
             ]
           ]
         ]},
      metadata: {Metadata, :t},
      role: {:enum, ["user", "assistant"]}
    ]
  end
end
