defmodule Klaviyo.TemplateUpdateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a TemplateUpdateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.TemplateUpdateQueryResourceObjectAttributes.t(),
          id: String.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.TemplateUpdateQueryResourceObjectAttributes, :t},
      id: :string,
      type: {:const, "template"}
    ]
  end
end
