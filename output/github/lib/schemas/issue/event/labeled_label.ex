defmodule GitHub.Issue.Event.LabeledLabel do
  @moduledoc """
  Provides struct and type for a Issue.Event.LabeledLabel
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, color: String.t(), name: String.t()}

  defstruct [:__info__, :color, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [color: {:string, :generic}, name: {:string, :generic}]
  end
end
