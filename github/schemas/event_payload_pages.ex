defmodule GitHub.EventPayloadPages do
  @moduledoc """
  Provides struct and type for a EventPayloadPages
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          action: String.t() | nil,
          html_url: String.t() | nil,
          page_name: String.t() | nil,
          sha: String.t() | nil,
          summary: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:__info__, :action, :html_url, :page_name, :sha, :summary, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: :string,
      html_url: :string,
      page_name: :string,
      sha: :string,
      summary: {:union, [:string, :null]},
      title: :string
    ]
  end
end
