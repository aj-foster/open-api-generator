defmodule GitHub.Root do
  @moduledoc """
  Provides struct and type for a Root
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          authorizations_url: String.t(),
          code_search_url: String.t(),
          commit_search_url: String.t(),
          current_user_authorizations_html_url: String.t(),
          current_user_repositories_url: String.t(),
          current_user_url: String.t(),
          emails_url: String.t(),
          emojis_url: String.t(),
          events_url: String.t(),
          feeds_url: String.t(),
          followers_url: String.t(),
          following_url: String.t(),
          gists_url: String.t(),
          hub_url: String.t() | nil,
          issue_search_url: String.t(),
          issues_url: String.t(),
          keys_url: String.t(),
          label_search_url: String.t(),
          notifications_url: String.t(),
          organization_repositories_url: String.t(),
          organization_teams_url: String.t(),
          organization_url: String.t(),
          public_gists_url: String.t(),
          rate_limit_url: String.t(),
          repository_search_url: String.t(),
          repository_url: String.t(),
          starred_gists_url: String.t(),
          starred_url: String.t(),
          topic_search_url: String.t() | nil,
          user_organizations_url: String.t(),
          user_repositories_url: String.t(),
          user_search_url: String.t(),
          user_url: String.t()
        }

  defstruct [
    :__info__,
    :authorizations_url,
    :code_search_url,
    :commit_search_url,
    :current_user_authorizations_html_url,
    :current_user_repositories_url,
    :current_user_url,
    :emails_url,
    :emojis_url,
    :events_url,
    :feeds_url,
    :followers_url,
    :following_url,
    :gists_url,
    :hub_url,
    :issue_search_url,
    :issues_url,
    :keys_url,
    :label_search_url,
    :notifications_url,
    :organization_repositories_url,
    :organization_teams_url,
    :organization_url,
    :public_gists_url,
    :rate_limit_url,
    :repository_search_url,
    :repository_url,
    :starred_gists_url,
    :starred_url,
    :topic_search_url,
    :user_organizations_url,
    :user_repositories_url,
    :user_search_url,
    :user_url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      authorizations_url: {:string, :uri_template},
      code_search_url: {:string, :uri_template},
      commit_search_url: {:string, :uri_template},
      current_user_authorizations_html_url: {:string, :uri_template},
      current_user_repositories_url: {:string, :uri_template},
      current_user_url: {:string, :uri_template},
      emails_url: {:string, :uri_template},
      emojis_url: {:string, :uri_template},
      events_url: {:string, :uri_template},
      feeds_url: {:string, :uri_template},
      followers_url: {:string, :uri_template},
      following_url: {:string, :uri_template},
      gists_url: {:string, :uri_template},
      hub_url: {:string, :uri_template},
      issue_search_url: {:string, :uri_template},
      issues_url: {:string, :uri_template},
      keys_url: {:string, :uri_template},
      label_search_url: {:string, :uri_template},
      notifications_url: {:string, :uri_template},
      organization_repositories_url: {:string, :uri_template},
      organization_teams_url: {:string, :uri_template},
      organization_url: {:string, :uri_template},
      public_gists_url: {:string, :uri_template},
      rate_limit_url: {:string, :uri_template},
      repository_search_url: {:string, :uri_template},
      repository_url: {:string, :uri_template},
      starred_gists_url: {:string, :uri_template},
      starred_url: {:string, :uri_template},
      topic_search_url: {:string, :uri_template},
      user_organizations_url: {:string, :uri_template},
      user_repositories_url: {:string, :uri_template},
      user_search_url: {:string, :uri_template},
      user_url: {:string, :uri_template}
    ]
  end
end
