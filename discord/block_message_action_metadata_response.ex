defmodule BlockMessageActionMetadataResponse do
  @moduledoc """
  Provides struct and type for a BlockMessageActionMetadataResponse
  """

  @type t :: %__MODULE__{custom_message: String.t() | nil}

  defstruct [:custom_message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [custom_message: {:union, [{:string, :generic}, :null]}]
  end
end
