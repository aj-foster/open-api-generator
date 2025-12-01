defmodule GitHub.Issue.Labels do
  @moduledoc """
  Provides struct and type for a Issue.Labels
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
      color: {:union, [:string, :null]},
      default: :boolean,
      description: {:union, [:string, :null]},
      id: {:integer, "int64"},
      name: :string,
      node_id: :string,
      url: {:string, "uri"}
    ]
  end
end
