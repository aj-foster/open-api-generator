defmodule OpenAI.CreateThreadRequest do
  @moduledoc """
  Provides struct and type for a CreateThreadRequest
  """

  @type t :: %__MODULE__{
          messages: [OpenAI.CreateMessageRequest.t()] | nil,
          metadata: map | nil,
          tool_resources: OpenAI.CreateThreadRequestToolResources.t() | nil
        }

  defstruct [:messages, :metadata, :tool_resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      messages: [{OpenAI.CreateMessageRequest, :t}],
      metadata: :map,
      tool_resources: {OpenAI.CreateThreadRequestToolResources, :t}
    ]
  end
end
