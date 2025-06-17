defmodule ModifyThreadRequest do
  @moduledoc """
  Provides struct and type for a ModifyThreadRequest
  """

  @type t :: %__MODULE__{
          metadata: Metadata.t() | nil,
          tool_resources: ModifyThreadRequestToolResources.t() | nil
        }

  defstruct [:metadata, :tool_resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: {Metadata, :t}, tool_resources: {ModifyThreadRequestToolResources, :t}]
  end
end
