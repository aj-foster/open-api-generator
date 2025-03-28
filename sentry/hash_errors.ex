defmodule HashErrors do
  @moduledoc """
  Provides struct and type for a HashErrors
  """

  @type t :: %__MODULE__{
          data: HashErrorsData.t() | nil,
          message: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:data, :message, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {HashErrorsData, :t}, message: {:string, :generic}, type: {:string, :generic}]
  end
end
