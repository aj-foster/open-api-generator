defmodule Index do
  @moduledoc """
  Provides struct and type for a Index
  """

  @type t :: %__MODULE__{documentType: String.t(), name: String.t(), user: IndexUser.t()}

  defstruct [:documentType, :name, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      documentType: {:enum, ["resumes", "job_descriptions"]},
      name: {:string, :generic},
      user: {IndexUser, :t}
    ]
  end
end
