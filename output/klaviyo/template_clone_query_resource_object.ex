defmodule TemplateCloneQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TemplateCloneQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: TemplateCloneQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {TemplateCloneQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "template"}
    ]
  end
end
