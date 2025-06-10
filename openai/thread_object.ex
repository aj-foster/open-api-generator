defmodule ThreadObject do
  @moduledoc """
  Provides struct and type for a ThreadObject
  """

  @type t :: %__MODULE__{
          created_at: integer,
          id: String.t(),
          metadata: Metadata.t(),
          object: String.t(),
          tool_resources: ThreadObjectToolResources.t() | nil
        }

  defstruct [:created_at, :id, :metadata, :object, :tool_resources]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: :integer,
      id: {:string, :generic},
      metadata: {Metadata, :t},
      object: {:const, "thread"},
      tool_resources: {ThreadObjectToolResources, :t}
    ]
  end
end
