defmodule GitHub.Branch.WithProtection do
  @moduledoc """
  Provides struct and type for a Branch.WithProtection
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          _links: GitHub.Branch.WithProtectionLinks.t(),
          commit: GitHub.Commit.t(),
          name: String.t(),
          pattern: String.t() | nil,
          protected: boolean,
          protection: GitHub.Branch.Protection.t(),
          protection_url: String.t(),
          required_approving_review_count: integer | nil
        }

  defstruct [
    :__info__,
    :_links,
    :commit,
    :name,
    :pattern,
    :protected,
    :protection,
    :protection_url,
    :required_approving_review_count
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      _links: {GitHub.Branch.WithProtectionLinks, :t},
      commit: {GitHub.Commit, :t},
      name: {:string, :generic},
      pattern: {:string, :generic},
      protected: :boolean,
      protection: {GitHub.Branch.Protection, :t},
      protection_url: {:string, :uri},
      required_approving_review_count: :integer
    ]
  end
end
