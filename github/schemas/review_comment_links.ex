defmodule GitHub.ReviewCommentLinks do
  @moduledoc """
  Provides struct and type for a ReviewCommentLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          html: GitHub.Link.t(),
          pull_request: GitHub.Link.t(),
          self: GitHub.Link.t()
        }

  defstruct [:__info__, :html, :pull_request, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [html: {GitHub.Link, :t}, pull_request: {GitHub.Link, :t}, self: {GitHub.Link, :t}]
  end
end
