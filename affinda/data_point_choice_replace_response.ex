defmodule Affinda.DataPointChoiceReplaceResponse do
  @moduledoc """
  Provides struct and type for a DataPointChoiceReplaceResponse
  """

  @type t :: %__MODULE__{
          choices: [Affinda.DataPointChoiceReplaceResponseChoices.t()],
          collection: String.t() | nil,
          dataPoint: String.t(),
          organization: String.t() | nil
        }

  defstruct [:choices, :collection, :dataPoint, :organization]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      choices: [{Affinda.DataPointChoiceReplaceResponseChoices, :t}],
      collection: :string,
      dataPoint: :string,
      organization: :string
    ]
  end
end
