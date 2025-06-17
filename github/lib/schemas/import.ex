defmodule GitHub.Import do
  @moduledoc """
  Provides struct and type for a Import
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          authors_count: integer | nil,
          authors_url: String.t(),
          commit_count: integer | nil,
          error_message: String.t() | nil,
          failed_step: String.t() | nil,
          has_large_files: boolean | nil,
          html_url: String.t(),
          import_percent: integer | nil,
          large_files_count: integer | nil,
          large_files_size: integer | nil,
          message: String.t() | nil,
          project_choices: [GitHub.ImportProjectChoices.t()] | nil,
          push_percent: integer | nil,
          repository_url: String.t(),
          status: String.t(),
          status_text: String.t() | nil,
          svc_root: String.t() | nil,
          svn_root: String.t() | nil,
          tfvc_project: String.t() | nil,
          url: String.t(),
          use_lfs: boolean | nil,
          vcs: String.t() | nil,
          vcs_url: String.t()
        }

  defstruct [
    :__info__,
    :authors_count,
    :authors_url,
    :commit_count,
    :error_message,
    :failed_step,
    :has_large_files,
    :html_url,
    :import_percent,
    :large_files_count,
    :large_files_size,
    :message,
    :project_choices,
    :push_percent,
    :repository_url,
    :status,
    :status_text,
    :svc_root,
    :svn_root,
    :tfvc_project,
    :url,
    :use_lfs,
    :vcs,
    :vcs_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      authors_count: {:union, [:integer, :null]},
      authors_url: {:string, :uri},
      commit_count: {:union, [:integer, :null]},
      error_message: {:union, [{:string, :generic}, :null]},
      failed_step: {:union, [{:string, :generic}, :null]},
      has_large_files: :boolean,
      html_url: {:string, :uri},
      import_percent: {:union, [:integer, :null]},
      large_files_count: :integer,
      large_files_size: :integer,
      message: {:string, :generic},
      project_choices: [{GitHub.ImportProjectChoices, :t}],
      push_percent: {:union, [:integer, :null]},
      repository_url: {:string, :uri},
      status:
        {:enum,
         [
           "auth",
           "error",
           "none",
           "detecting",
           "choose",
           "auth_failed",
           "importing",
           "mapping",
           "waiting_to_push",
           "pushing",
           "complete",
           "setup",
           "unknown",
           "detection_found_multiple",
           "detection_found_nothing",
           "detection_needs_auth"
         ]},
      status_text: {:union, [{:string, :generic}, :null]},
      svc_root: {:string, :generic},
      svn_root: {:string, :generic},
      tfvc_project: {:string, :generic},
      url: {:string, :uri},
      use_lfs: :boolean,
      vcs: {:union, [{:string, :generic}, :null]},
      vcs_url: {:string, :generic}
    ]
  end
end
