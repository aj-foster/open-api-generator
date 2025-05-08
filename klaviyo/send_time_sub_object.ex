defmodule SendTimeSubObject do
  @moduledoc """
  Provides struct and type for a SendTimeSubObject
  """

  @type t :: %__MODULE__{datetime: DateTime.t(), is_local: boolean}

  defstruct [:datetime, :is_local]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [datetime: {:string, :date_time}, is_local: :boolean]
  end
end
