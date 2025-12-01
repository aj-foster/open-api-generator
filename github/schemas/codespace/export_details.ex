defmodule GitHub.Codespace.ExportDetails do
  @moduledoc """
  Provides struct and type for a Codespace.ExportDetails
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          branch: String.t() | nil,
          completed_at: DateTime.t() | nil,
          export_url: String.t() | nil,
          html_url: String.t() | nil,
          id: String.t() | nil,
          sha: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [:__info__, :branch, :completed_at, :export_url, :html_url, :id, :sha, :state]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      branch: {:union, [:string, :null]},
      completed_at: {:union, [{:string, "date-time"}, :null]},
      export_url: :string,
      html_url: {:union, [:string, :null]},
      id: :string,
      sha: {:union, [:string, :null]},
      state: {:union, [:string, :null]}
    ]
  end
end
