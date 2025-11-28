defmodule GitHub.Issue.SearchResultItemPullRequest do
  @moduledoc """
  Provides struct and type for a Issue.SearchResultItemPullRequest
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          diff_url: String.t() | nil,
          html_url: String.t() | nil,
          merged_at: DateTime.t() | nil,
          patch_url: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :diff_url, :html_url, :merged_at, :patch_url, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      diff_url: {:union, [{:string, :uri}, :null]},
      html_url: {:union, [{:string, :uri}, :null]},
      merged_at: {:union, [{:string, :date_time}, :null]},
      patch_url: {:union, [{:string, :uri}, :null]},
      url: {:union, [{:string, :uri}, :null]}
    ]
  end
end
