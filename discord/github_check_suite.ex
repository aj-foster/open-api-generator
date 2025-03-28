defmodule GithubCheckSuite do
  @moduledoc """
  Provides struct and type for a GithubCheckSuite
  """

  @type t :: %__MODULE__{
          app: GithubCheckApp.t(),
          conclusion: String.t() | nil,
          head_branch: String.t() | nil,
          head_sha: String.t(),
          pull_requests: [map] | nil
        }

  defstruct [:app, :conclusion, :head_branch, :head_sha, :pull_requests]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      app: {GithubCheckApp, :t},
      conclusion: {:union, [{:string, :generic}, :null]},
      head_branch: {:union, [{:string, :generic}, :null]},
      head_sha: {:string, :generic},
      pull_requests: {:union, [[:map], :null]}
    ]
  end
end
