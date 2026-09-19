defmodule GitHub.Repository.RulesetLinks do
  @moduledoc """
  Provides struct and type for a Repository.RulesetLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          html: GitHub.Repository.RulesetLinksHtml.t() | nil,
          self: GitHub.Repository.RulesetLinksSelf.t() | nil
        }

  defstruct [:__info__, :html, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      html: {GitHub.Repository.RulesetLinksHtml, :t},
      self: {GitHub.Repository.RulesetLinksSelf, :t}
    ]
  end
end
