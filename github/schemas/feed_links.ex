defmodule GitHub.FeedLinks do
  @moduledoc """
  Provides struct and type for a FeedLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          current_user: GitHub.LinkWithType.t() | nil,
          current_user_actor: GitHub.LinkWithType.t() | nil,
          current_user_organization: GitHub.LinkWithType.t() | nil,
          current_user_organizations: [GitHub.LinkWithType.t()] | nil,
          current_user_public: GitHub.LinkWithType.t() | nil,
          repository_discussions: GitHub.LinkWithType.t() | nil,
          repository_discussions_category: GitHub.LinkWithType.t() | nil,
          security_advisories: GitHub.LinkWithType.t() | nil,
          timeline: GitHub.LinkWithType.t(),
          user: GitHub.LinkWithType.t()
        }

  defstruct [
    :__info__,
    :current_user,
    :current_user_actor,
    :current_user_organization,
    :current_user_organizations,
    :current_user_public,
    :repository_discussions,
    :repository_discussions_category,
    :security_advisories,
    :timeline,
    :user
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      current_user: {GitHub.LinkWithType, :t},
      current_user_actor: {GitHub.LinkWithType, :t},
      current_user_organization: {GitHub.LinkWithType, :t},
      current_user_organizations: [{GitHub.LinkWithType, :t}],
      current_user_public: {GitHub.LinkWithType, :t},
      repository_discussions: {GitHub.LinkWithType, :t},
      repository_discussions_category: {GitHub.LinkWithType, :t},
      security_advisories: {GitHub.LinkWithType, :t},
      timeline: {GitHub.LinkWithType, :t},
      user: {GitHub.LinkWithType, :t}
    ]
  end
end
