defmodule CreateThreadRequest do
  @moduledoc """
  Provides struct and type for a CreateThreadRequest
  """

  @type t :: %__MODULE__{
          messages: [CreateMessageRequest.t()] | nil,
          metadata: Metadata.t() | nil,
          tool_resources: CreateThreadRequestToolResources.t() | nil
        }

  defstruct [:messages, :metadata, :tool_resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      messages: [{CreateMessageRequest, :t}],
      metadata: {Metadata, :t},
      tool_resources: {CreateThreadRequestToolResources, :t}
    ]
  end
end
