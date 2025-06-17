defmodule GitHub.SecretScanning.LocationDiscussionTitle do
  @moduledoc """
  Provides struct and type for a SecretScanning.LocationDiscussionTitle
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, discussion_title_url: String.t()}

  defstruct [:__info__, :discussion_title_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [discussion_title_url: {:string, :uri}]
  end
end
