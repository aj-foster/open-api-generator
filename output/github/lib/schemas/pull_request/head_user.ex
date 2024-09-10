defmodule GitHub.PullRequest.HeadUser do
  @moduledoc """
  Provides struct and type for a PullRequest.HeadUser
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          avatar_url: String.t(),
          events_url: String.t(),
          followers_url: String.t(),
          following_url: String.t(),
          gists_url: String.t(),
          gravatar_id: String.t() | nil,
          html_url: String.t(),
          id: integer,
          login: String.t(),
          node_id: String.t(),
          organizations_url: String.t(),
          received_events_url: String.t(),
          repos_url: String.t(),
          site_admin: boolean,
          starred_url: String.t(),
          subscriptions_url: String.t(),
          type: String.t(),
          url: String.t()
        }

  defstruct [
    :__info__,
    :avatar_url,
    :events_url,
    :followers_url,
    :following_url,
    :gists_url,
    :gravatar_id,
    :html_url,
    :id,
    :login,
    :node_id,
    :organizations_url,
    :received_events_url,
    :repos_url,
    :site_admin,
    :starred_url,
    :subscriptions_url,
    :type,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatar_url: {:string, :uri},
      events_url: {:string, :generic},
      followers_url: {:string, :uri},
      following_url: {:string, :generic},
      gists_url: {:string, :generic},
      gravatar_id: {:union, [{:string, :generic}, :null]},
      html_url: {:string, :uri},
      id: :integer,
      login: {:string, :generic},
      node_id: {:string, :generic},
      organizations_url: {:string, :uri},
      received_events_url: {:string, :uri},
      repos_url: {:string, :uri},
      site_admin: :boolean,
      starred_url: {:string, :generic},
      subscriptions_url: {:string, :uri},
      type: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
