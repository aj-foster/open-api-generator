defmodule OpenAI.FunctionObject do
  @moduledoc """
  Provides struct and type for a FunctionObject
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t(),
          parameters: map | nil,
          strict: boolean | nil
        }

  defstruct [:description, :name, :parameters, :strict]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: :string, name: :string, parameters: :map, strict: :boolean]
  end
end
