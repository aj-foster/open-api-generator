defmodule Discord.ApplicationUserRoleConnectionResponse do
  @moduledoc """
  Provides struct and type for a ApplicationUserRoleConnectionResponse
  """

  @type t :: %__MODULE__{
          metadata: map | nil,
          platform_name: String.t() | nil,
          platform_username: String.t() | nil
        }

  defstruct [:metadata, :platform_name, :platform_username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      metadata: {:union, [:map, :null]},
      platform_name: {:union, [:string, :null]},
      platform_username: {:union, [:string, :null]}
    ]
  end
end
