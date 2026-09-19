defmodule OpenAI.UsageVectorStoresResult do
  @moduledoc """
  Provides struct and type for a UsageVectorStoresResult
  """

  @type t :: %__MODULE__{object: String.t(), project_id: String.t() | nil, usage_bytes: integer}

  defstruct [:object, :project_id, :usage_bytes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      object: {:const, "organization.usage.vector_stores.result"},
      project_id: :string,
      usage_bytes: :integer
    ]
  end
end
