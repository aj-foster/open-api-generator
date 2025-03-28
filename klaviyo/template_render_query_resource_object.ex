defmodule TemplateRenderQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TemplateRenderQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: TemplateRenderQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {TemplateRenderQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "template"}
    ]
  end
end
