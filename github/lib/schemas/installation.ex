defmodule GitHub.Installation do
  @moduledoc """
  Provides struct and types for a Installation
  """
  use GitHub.Encoder

  @type scoped :: %__MODULE__{
          __info__: map,
          account: GitHub.User.simple(),
          has_multiple_single_files: boolean | nil,
          permissions: GitHub.App.Permissions.t(),
          repositories_url: String.t(),
          repository_selection: String.t(),
          single_file_name: String.t() | nil,
          single_file_paths: [String.t()] | nil
        }

  @type t :: %__MODULE__{
          __info__: map,
          access_tokens_url: String.t(),
          account: GitHub.Enterprise.t() | GitHub.User.simple(),
          app_id: integer,
          app_slug: String.t(),
          contact_email: String.t() | nil,
          created_at: DateTime.t(),
          events: [String.t()],
          has_multiple_single_files: boolean | nil,
          html_url: String.t(),
          id: integer,
          permissions: GitHub.App.Permissions.t(),
          repositories_url: String.t(),
          repository_selection: String.t(),
          single_file_name: String.t() | nil,
          single_file_paths: [String.t()] | nil,
          suspended_at: DateTime.t() | nil,
          suspended_by: GitHub.User.simple() | nil,
          target_id: integer,
          target_type: String.t(),
          updated_at: DateTime.t()
        }

  defstruct [
    :__info__,
    :access_tokens_url,
    :account,
    :app_id,
    :app_slug,
    :contact_email,
    :created_at,
    :events,
    :has_multiple_single_files,
    :html_url,
    :id,
    :permissions,
    :repositories_url,
    :repository_selection,
    :single_file_name,
    :single_file_paths,
    :suspended_at,
    :suspended_by,
    :target_id,
    :target_type,
    :updated_at
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:scoped) do
    [
      account: {GitHub.User, :simple},
      has_multiple_single_files: :boolean,
      permissions: {GitHub.App.Permissions, :t},
      repositories_url: {:string, :uri},
      repository_selection: {:enum, ["all", "selected"]},
      single_file_name: {:union, [{:string, :generic}, :null]},
      single_file_paths: [string: :generic]
    ]
  end

  def __fields__(:t) do
    [
      access_tokens_url: {:string, :uri},
      account: {:union, [{GitHub.Enterprise, :t}, {GitHub.User, :simple}]},
      app_id: :integer,
      app_slug: {:string, :generic},
      contact_email: {:union, [{:string, :generic}, :null]},
      created_at: {:string, :date_time},
      events: [string: :generic],
      has_multiple_single_files: :boolean,
      html_url: {:string, :uri},
      id: :integer,
      permissions: {GitHub.App.Permissions, :t},
      repositories_url: {:string, :uri},
      repository_selection: {:enum, ["all", "selected"]},
      single_file_name: {:union, [{:string, :generic}, :null]},
      single_file_paths: [string: :generic],
      suspended_at: {:union, [{:string, :date_time}, :null]},
      suspended_by: {:union, [{GitHub.User, :simple}, :null]},
      target_id: :integer,
      target_type: {:string, :generic},
      updated_at: {:string, :date_time}
    ]
  end
end
