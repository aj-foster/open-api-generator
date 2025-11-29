defmodule DataPointChoiceReplaceRequest do
  @moduledoc """
  Provides struct and type for a DataPointChoiceReplaceRequest
  """

  @type t :: %__MODULE__{
          choices: [DataPointChoiceForReplace.t()],
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
      choices: [{DataPointChoiceForReplace, :t}],
      collection: {:string, :generic},
      dataPoint: {:string, :generic},
      organization: {:string, :generic}
    ]
  end
end
