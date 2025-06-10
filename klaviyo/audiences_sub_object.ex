defmodule AudiencesSubObject do
  @moduledoc """
  Provides struct and type for a AudiencesSubObject
  """

  @type t :: %__MODULE__{excluded: [String.t()] | nil, included: [String.t()] | nil}

  defstruct [:excluded, :included]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [excluded: [string: :generic], included: [string: :generic]]
  end
end
