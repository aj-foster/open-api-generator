defmodule Discord.InviteChannelResponse do
  @moduledoc """
  Provides struct and type for a InviteChannelResponse
  """

  @type t :: %__MODULE__{
          icon: String.t() | nil,
          id: String.t(),
          name: String.t() | nil,
          recipients: [map] | nil,
          type: integer
        }

  defstruct [:icon, :id, :name, :recipients, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      icon: {:union, [:string, :null]},
      id: {:string, "snowflake"},
      name: {:union, [:string, :null]},
      recipients: {:union, [[:map], :null]},
      type: {:integer, "int32"}
    ]
  end
end
