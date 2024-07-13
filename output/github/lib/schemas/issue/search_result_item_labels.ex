defmodule GitHub.Issue.SearchResultItemLabels do
  @moduledoc """
  Provides struct and type for a Issue.SearchResultItemLabels
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          color: String.t() | nil,
          default: boolean | nil,
          description: String.t() | nil,
          id: integer | nil,
          name: String.t() | nil,
          node_id: String.t() | nil,
          url: String.t() | nil
        }

  defstruct [:__info__, :color, :default, :description, :id, :name, :node_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: {:string, :generic},
      default: :boolean,
      description: {:union, [{:string, :generic}, :null]},
      id: :integer,
      name: {:string, :generic},
      node_id: {:string, :generic},
      url: {:string, :generic}
    ]
  end
end
