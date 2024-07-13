defmodule ResumeSearchParametersSkill do
  @moduledoc """
  Provides struct and type for a ResumeSearchParametersSkill
  """

  @type t :: %__MODULE__{name: String.t() | nil, required: boolean | nil}

  defstruct [:name, :required]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, required: :boolean]
  end
end
