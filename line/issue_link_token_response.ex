defmodule IssueLinkTokenResponse do
  @moduledoc """
  Provides struct and type for a IssueLinkTokenResponse
  """

  @type t :: %__MODULE__{linkToken: String.t()}

  defstruct [:linkToken]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [linkToken: {:string, :generic}]
  end
end
