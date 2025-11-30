defmodule Klaviyo.ImageUploadQuery do
  @moduledoc """
  Provides struct and type for a ImageUploadQuery
  """

  @type t :: %__MODULE__{file: binary, hidden: boolean | nil, name: String.t() | nil}

  defstruct [:file, :hidden, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file: {:string, "binary"}, hidden: :boolean, name: :string]
  end
end
