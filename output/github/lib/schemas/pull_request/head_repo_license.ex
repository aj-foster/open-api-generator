defmodule GitHub.PullRequest.HeadRepoLicense do
  @moduledoc """
  Provides struct and type for a PullRequest.HeadRepoLicense
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          key: String.t(),
          name: String.t(),
          node_id: String.t(),
          spdx_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :key, :name, :node_id, :spdx_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      key: {:string, :generic},
      name: {:string, :generic},
      node_id: {:string, :generic},
      spdx_id: {:union, [{:string, :generic}, :null]},
      url: {:union, [{:string, :uri}, :null]}
    ]
  end
end
