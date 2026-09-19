defmodule OpenAI.Model do
  @moduledoc """
  Provides struct and type for a Model
  """

  @type t :: %__MODULE__{
          created: integer,
          id: String.t(),
          object: String.t(),
          owned_by: String.t()
        }

  defstruct [:created, :id, :object, :owned_by]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [created: :integer, id: :string, object: {:const, "model"}, owned_by: :string]
  end
end
