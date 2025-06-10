defmodule AttributionResponseObjectResource do
  @moduledoc """
  Provides struct and type for a AttributionResponseObjectResource
  """

  @type t :: %__MODULE__{
          id: String.t(),
          links: ObjectLinks.t(),
          relationships: AttributionResponseObjectResourceRelationships.t() | nil,
          type: String.t()
        }

  defstruct [:id, :links, :relationships, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      relationships: {AttributionResponseObjectResourceRelationships, :t},
      type: {:const, "attribution"}
    ]
  end
end
