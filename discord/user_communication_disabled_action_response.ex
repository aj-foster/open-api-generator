defmodule Discord.UserCommunicationDisabledActionResponse do
  @moduledoc """
  Provides struct and type for a UserCommunicationDisabledActionResponse
  """

  @type t :: %__MODULE__{
          metadata: Discord.UserCommunicationDisabledActionMetadataResponse.t(),
          type: 3
        }

  defstruct [:metadata, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: {Discord.UserCommunicationDisabledActionMetadataResponse, :t}, type: {:const, 3}]
  end
end
