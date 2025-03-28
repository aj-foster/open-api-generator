defmodule GitHub.Branch.RestrictionPolicyUsers do
  @moduledoc """
  Provides struct and type for a Branch.RestrictionPolicyUsers
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          avatar_url: String.t() | nil,
          events_url: String.t() | nil,
          followers_url: String.t() | nil,
          following_url: String.t() | nil,
          gists_url: String.t() | nil,
          gravatar_id: String.t() | nil,
          html_url: String.t() | nil,
          id: integer | nil,
          login: String.t() | nil,
          node_id: String.t() | nil,
          organizations_url: String.t() | nil,
          received_events_url: String.t() | nil,
          repos_url: String.t() | nil,
          site_admin: boolean | nil,
          starred_url: String.t() | nil,
          subscriptions_url: String.t() | nil,
          type: String.t() | nil,
          url: String.t() | nil
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
      avatar_url: {:string, :generic},
      events_url: {:string, :generic},
      followers_url: {:string, :generic},
      following_url: {:string, :generic},
      gists_url: {:string, :generic},
      gravatar_id: {:string, :generic},
      html_url: {:string, :generic},
      id: :integer,
      login: {:string, :generic},
      node_id: {:string, :generic},
      organizations_url: {:string, :generic},
      received_events_url: {:string, :generic},
      repos_url: {:string, :generic},
      site_admin: :boolean,
      starred_url: {:string, :generic},
      subscriptions_url: {:string, :generic},
      type: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
