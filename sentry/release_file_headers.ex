defmodule ReleaseFileHeaders do
  @moduledoc """
  Provides struct and type for a ReleaseFileHeaders
  """

  @type t :: %__MODULE__{"Content-Type": String.t() | nil}

  defstruct [:"Content-Type"]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    ["Content-Type": {:string, :generic}]
  end
end
