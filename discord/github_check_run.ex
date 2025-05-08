defmodule GithubCheckRun do
  @moduledoc """
  Provides struct and type for a GithubCheckRun
  """

  @type t :: %__MODULE__{
          check_suite: GithubCheckSuite.t(),
          conclusion: String.t() | nil,
          details_url: String.t() | nil,
          html_url: String.t(),
          name: String.t(),
          output: GithubCheckRunOutput.t() | nil,
          pull_requests: [map] | nil
        }

  defstruct [:check_suite, :conclusion, :details_url, :html_url, :name, :output, :pull_requests]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      check_suite: {GithubCheckSuite, :t},
      conclusion: {:union, [{:string, :generic}, :null]},
      details_url: {:union, [{:string, :uri}, :null]},
      html_url: {:string, :uri},
      name: {:string, :generic},
      output: {:union, [{GithubCheckRunOutput, :t}, :null]},
      pull_requests: {:union, [[:map], :null]}
    ]
  end
end
