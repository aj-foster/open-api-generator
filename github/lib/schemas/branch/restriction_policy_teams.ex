defmodule GitHub.Branch.RestrictionPolicyTeams do
  @moduledoc """
  Provides struct and type for a Branch.RestrictionPolicyTeams
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          description: String.t() | nil,
          html_url: String.t() | nil,
          id: integer | nil,
          members_url: String.t() | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          notification_setting: String.t() | nil,
          parent: String.t() | nil,
          permission: String.t() | nil,
          privacy: String.t() | nil,
          repositories_url: String.t() | nil,
          slug: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [
    :__info__,
    :description,
    :html_url,
    :id,
    :members_url,
    :name,
    :node_id,
    :notification_setting,
    :parent,
    :permission,
    :privacy,
    :repositories_url,
    :slug,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :generic},
      id: :integer,
      members_url: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      notification_setting: {:string, :generic},
      parent: {:union, [{:string, :generic}, :null]},
      permission: {:string, :generic},
      privacy: {:string, :generic},
      repositories_url: {:string, :generic},
      slug: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
