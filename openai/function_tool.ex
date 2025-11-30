defmodule OpenAI.FunctionTool do
  @moduledoc """
  Provides struct and type for a FunctionTool
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t(),
          parameters: map,
          strict: boolean,
          type: String.t()
        }

  defstruct [:description, :name, :parameters, :strict, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: :string,
      name: :string,
      parameters: :map,
      strict: :boolean,
      type: {:const, "function"}
    ]
  end
end
