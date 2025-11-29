defmodule JobDescriptionSearchDetailJobTitleValue do
  @moduledoc """
  Provides struct and type for a JobDescriptionSearchDetailJobTitleValue
  """

  @type t :: %__MODULE__{
          companyName: String.t() | nil,
          match: boolean | nil,
          name: String.t() | nil
        }

  defstruct [:companyName, :match, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [companyName: {:string, :generic}, match: :boolean, name: {:string, :generic}]
  end
end
