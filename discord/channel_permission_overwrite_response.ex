defmodule ChannelPermissionOverwriteResponse do
  @moduledoc """
  Provides struct and type for a ChannelPermissionOverwriteResponse
  """

  @type t :: %__MODULE__{allow: String.t(), deny: String.t(), id: String.t(), type: integer}

  defstruct [:allow, :deny, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      allow: {:string, :generic},
      deny: {:string, :generic},
      id: {:string, :generic},
      type: :integer
    ]
  end
end
