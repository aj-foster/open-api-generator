defmodule IndexCreate do
  @moduledoc """
  Provides struct and type for a IndexCreate
  """

  @type t :: %__MODULE__{documentType: String.t() | nil, name: String.t()}

  defstruct [:documentType, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [documentType: {:enum, ["resumes", "job_descriptions"]}, name: {:string, :generic}]
  end
end
