defmodule ApplicationCommandPatchRequestPartial do
  @moduledoc """
  Provides struct and type for a ApplicationCommandPatchRequestPartial
  """

  @type t :: %__MODULE__{
          default_member_permissions: integer | nil,
          description: String.t() | nil,
          description_localizations:
            ApplicationCommandPatchRequestPartialDescriptionLocalizations.t() | nil,
          dm_permission: boolean | nil,
          name: String.t() | nil,
          name_localizations: ApplicationCommandPatchRequestPartialNameLocalizations.t() | nil,
          options: [map] | nil
        }

  defstruct [
    :default_member_permissions,
    :description,
    :description_localizations,
    :dm_permission,
    :name,
    :name_localizations,
    :options
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default_member_permissions: {:union, [:integer, :null]},
      description: {:union, [{:string, :generic}, :null]},
      description_localizations:
        {:union, [{ApplicationCommandPatchRequestPartialDescriptionLocalizations, :t}, :null]},
      dm_permission: {:union, [:boolean, :null]},
      name: {:string, :generic},
      name_localizations:
        {:union, [{ApplicationCommandPatchRequestPartialNameLocalizations, :t}, :null]},
      options: {:union, [[:map], :null]}
    ]
  end
end
