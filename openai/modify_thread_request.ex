defmodule OpenAI.ModifyThreadRequest do
  @moduledoc """
  Provides struct and type for a ModifyThreadRequest
  """

  @type t :: %__MODULE__{
          metadata: map | nil,
          tool_resources: OpenAI.ModifyThreadRequestToolResources.t() | nil
        }

  defstruct [:metadata, :tool_resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: :map, tool_resources: {OpenAI.ModifyThreadRequestToolResources, :t}]
  end
end
