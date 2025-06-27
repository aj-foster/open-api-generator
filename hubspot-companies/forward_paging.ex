defmodule ForwardPaging do
  @moduledoc """
  Provides struct and type for a ForwardPaging
  """

  @type t :: %__MODULE__{next: NextPage.t() | nil}

  defstruct [:next]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [next: {NextPage, :t}]
  end
end
