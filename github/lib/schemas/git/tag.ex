defmodule GitHub.Git.Tag do
  @moduledoc """
  Provides struct and type for a Git.Tag
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          message: String.t(),
          node_id: String.t(),
          object: GitHub.Git.TagObject.t(),
          sha: String.t(),
          tag: String.t(),
          tagger: GitHub.Git.TagTagger.t(),
          url: String.t(),
          verification: GitHub.Verification.t() | nil
        }

  defstruct [:__info__, :message, :node_id, :object, :sha, :tag, :tagger, :url, :verification]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      message: {:string, :generic},
      node_id: {:string, :generic},
      object: {GitHub.Git.TagObject, :t},
      sha: {:string, :generic},
      tag: {:string, :generic},
      tagger: {GitHub.Git.TagTagger, :t},
      url: {:string, :uri},
      verification: {GitHub.Verification, :t}
    ]
  end
end
