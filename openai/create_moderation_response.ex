defmodule CreateModerationResponse do
  @moduledoc """
  Provides struct and type for a CreateModerationResponse
  """

  @type t :: %__MODULE__{
          id: String.t(),
          model: String.t(),
          results: [CreateModerationResponseResults.t()]
        }

  defstruct [:id, :model, :results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      model: {:string, :generic},
      results: [{CreateModerationResponseResults, :t}]
    ]
  end
end
