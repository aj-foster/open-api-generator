defmodule Discord.ApplicationCommandCreateRequest do
  @moduledoc """
  Provides struct and type for a ApplicationCommandCreateRequest
  """

  @type t :: %__MODULE__{
          default_member_permissions: integer | nil,
          description: String.t() | nil,
          description_localizations: map | nil,
          dm_permission: boolean | nil,
          name: String.t(),
          name_localizations: map | nil,
          options: [map] | nil,
          type: integer | nil
        }

  defstruct [
    :default_member_permissions,
    :description,
    :description_localizations,
    :dm_permission,
    :name,
    :name_localizations,
    :options,
    :type
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default_member_permissions: {:union, [:integer, :null]},
      description: {:union, [:string, :null]},
      description_localizations: {:union, [:map, :null]},
      dm_permission: {:union, [:boolean, :null]},
      name: :string,
      name_localizations: {:union, [:map, :null]},
      options: {:union, [[:map], :null]},
      type: {:union, [{:integer, "int32"}, :null]}
    ]
  end
end
