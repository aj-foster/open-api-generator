defmodule PatchTemplateResponseData do
  @moduledoc """
  Provides struct and type for a PatchTemplateResponseData
  """

  @type t :: %__MODULE__{
          attributes: PatchTemplateResponseDataAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PatchTemplateResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "template"}
    ]
  end
end
