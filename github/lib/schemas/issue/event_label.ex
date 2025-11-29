defmodule GitHub.Issue.EventLabel do
  @moduledoc """
  Provides struct and type for a Issue.EventLabel
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, color: String.t() | nil, name: String.t() | nil}

  defstruct [:__info__, :color, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [color: {:union, [{:string, :generic}, :null]}, name: {:union, [{:string, :generic}, :null]}]
  end
end
