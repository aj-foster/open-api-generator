defmodule ModifyMessageRequest do
  @moduledoc """
  Provides struct and type for a ModifyMessageRequest
  """

  @type t :: %__MODULE__{metadata: Metadata.t() | nil}

  defstruct [:metadata]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [metadata: {Metadata, :t}]
  end
end
