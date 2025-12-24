defmodule OpenAI.AuditLogProjectCreatedData do
  @moduledoc """
  Provides struct and type for a AuditLogProjectCreatedData
  """

  @type t :: %__MODULE__{name: String.t() | nil, title: String.t() | nil}

  defstruct [:name, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: :string, title: :string]
  end
end
