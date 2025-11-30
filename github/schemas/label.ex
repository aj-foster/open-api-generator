defmodule GitHub.Label do
  @moduledoc """
  Provides struct and type for a Label
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          color: String.t(),
          default: boolean,
          description: String.t() | nil,
          id: integer,
          name: String.t(),
          node_id: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :color, :default, :description, :id, :name, :node_id, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      color: :string,
      default: :boolean,
      description: {:union, [:string, :null]},
      id: {:integer, "int64"},
      name: :string,
      node_id: :string,
      url: {:string, "uri"}
    ]
  end
end
