defmodule CommandPermissionsResponse do
  @moduledoc """
  Provides struct and type for a CommandPermissionsResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t(),
          guild_id: String.t(),
          id: String.t(),
          permissions: [CommandPermissionResponse.t()]
        }

  defstruct [:application_id, :guild_id, :id, :permissions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application_id: {:string, :generic},
      guild_id: {:string, :generic},
      id: {:string, :generic},
      permissions: [{CommandPermissionResponse, :t}]
    ]
  end
end
