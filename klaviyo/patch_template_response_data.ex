defmodule Klaviyo.PatchTemplateResponseData do
  @moduledoc """
  Provides struct and type for a PatchTemplateResponseData
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.PatchTemplateResponseDataAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.PatchTemplateResponseDataAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      type: {:const, "template"}
    ]
  end
end
