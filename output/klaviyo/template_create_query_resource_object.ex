defmodule TemplateCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TemplateCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: TemplateCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {TemplateCreateQueryResourceObjectAttributes, :t}, type: {:const, "template"}]
  end
end
