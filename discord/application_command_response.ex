defmodule ApplicationCommandResponse do
  @moduledoc """
  Provides struct and type for a ApplicationCommandResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t(),
          default_member_permissions: String.t() | nil,
          description: String.t(),
          description_localizations: ApplicationCommandResponseDescriptionLocalizations.t() | nil,
          description_localized: String.t() | nil,
          dm_permission: boolean | nil,
          guild_id: String.t() | nil,
          id: String.t(),
          name: String.t(),
          name_localizations: ApplicationCommandResponseNameLocalizations.t() | nil,
          name_localized: String.t() | nil,
          nsfw: boolean | nil,
          options: [map] | nil,
          type: integer,
          version: String.t()
        }

  defstruct [
    :application_id,
    :default_member_permissions,
    :description,
    :description_localizations,
    :description_localized,
    :dm_permission,
    :guild_id,
    :id,
    :name,
    :name_localizations,
    :name_localized,
    :nsfw,
    :options,
    :type,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application_id: {:string, :generic},
      default_member_permissions: {:union, [{:string, :generic}, :null]},
      description: {:string, :generic},
      description_localizations:
        {:union, [{ApplicationCommandResponseDescriptionLocalizations, :t}, :null]},
      description_localized: {:union, [{:string, :generic}, :null]},
      dm_permission: {:union, [:boolean, :null]},
      guild_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      name: {:string, :generic},
      name_localizations: {:union, [{ApplicationCommandResponseNameLocalizations, :t}, :null]},
      name_localized: {:union, [{:string, :generic}, :null]},
      nsfw: {:union, [:boolean, :null]},
      options: {:union, [[:map], :null]},
      type: :integer,
      version: {:string, :generic}
    ]
  end
end
