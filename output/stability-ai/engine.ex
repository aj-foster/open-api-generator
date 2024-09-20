defmodule Engine do
  @moduledoc """
  Provides struct and type for a Engine
  """

  @type t :: %__MODULE__{
          description: String.t(),
          id: String.t(),
          name: String.t(),
          type: String.t()
        }

  defstruct [:description, :id, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      type: {:enum, ["AUDIO", "CLASSIFICATION", "PICTURE", "STORAGE", "TEXT", "VIDEO"]}
    ]
  end
end
