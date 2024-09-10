defmodule GitHub.Timeline.CommittedEventParents do
  @moduledoc """
  Provides struct and type for a Timeline.CommittedEventParents
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, html_url: String.t(), sha: String.t(), url: String.t()}

  defstruct [:__info__, :html_url, :sha, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [html_url: {:string, :uri}, sha: {:string, :generic}, url: {:string, :uri}]
  end
end
