defmodule GitHub.EventRepo do
  @moduledoc """
  Provides struct and type for a EventRepo
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, id: integer, name: String.t(), url: String.t()}

  defstruct [:__info__, :id, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer, name: {:string, :generic}, url: {:string, :uri}]
  end
end
