defmodule GitHub.Team.Project do
  @moduledoc """
  Provides struct and type for a Team.Project
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          body: String.t() | nil,
          columns_url: String.t(),
          created_at: String.t(),
          creator: GitHub.User.simple(),
          html_url: String.t(),
          id: integer,
          name: String.t(),
          node_id: String.t(),
          number: integer,
          organization_permission: String.t() | nil,
          owner_url: String.t(),
          permissions: GitHub.Team.ProjectPermissions.t(),
          private: boolean | nil,
          state: String.t(),
          updated_at: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :body,
    :columns_url,
    :created_at,
    :creator,
    :html_url,
    :id,
    :name,
    :node_id,
    :number,
    :organization_permission,
    :owner_url,
    :permissions,
    :private,
    :state,
    :updated_at,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      body: {:union, [{:string, :generic}, :null]},
      columns_url: {:string, :generic},
      created_at: {:string, :generic},
      creator: {GitHub.User, :simple},
      html_url: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      number: :integer,
      organization_permission: {:string, :generic},
      owner_url: {:string, :generic},
      permissions: {GitHub.Team.ProjectPermissions, :t},
      private: :boolean,
      state: {:string, :generic},
      updated_at: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
