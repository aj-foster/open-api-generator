defmodule ResumeSearchDetailLanguagesValue do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailLanguagesValue
  """

  @type t :: %__MODULE__{
          lastUsed: String.t() | nil,
          match: boolean | nil,
          name: String.t() | nil,
          numberOfMonths: integer | nil,
          sources: [map] | nil,
          type: String.t() | nil
        }

  defstruct [:lastUsed, :match, :name, :numberOfMonths, :sources, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      lastUsed: {:string, :generic},
      match: :boolean,
      name: {:string, :generic},
      numberOfMonths: :integer,
      sources: [:map],
      type: {:string, :generic}
    ]
  end
end
