defmodule ResumeSearchDetailJobTitleValue do
  @moduledoc """
  Provides struct and type for a ResumeSearchDetailJobTitleValue
  """

  @type t :: %__MODULE__{
          companyName: String.t() | nil,
          endDate: String.t() | nil,
          match: boolean | nil,
          name: String.t() | nil,
          startDate: String.t() | nil
        }

  defstruct [:companyName, :endDate, :match, :name, :startDate]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      companyName: {:string, :generic},
      endDate: {:string, :generic},
      match: :boolean,
      name: {:string, :generic},
      startDate: {:string, :generic}
    ]
  end
end
