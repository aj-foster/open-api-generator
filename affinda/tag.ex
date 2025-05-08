defmodule Tag do
  @moduledoc """
  Provides struct and type for a Tag
  """

  @type t :: %__MODULE__{
          documentCount: integer,
          id: integer,
          name: String.t(),
          workspace: String.t()
        }

  defstruct [:documentCount, :id, :name, :workspace]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentCount: :integer,
      id: :integer,
      name: {:string, :generic},
      workspace: {:string, :generic}
    ]
  end
end
