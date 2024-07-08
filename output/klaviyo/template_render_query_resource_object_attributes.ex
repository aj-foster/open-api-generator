defmodule TemplateRenderQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a TemplateRenderQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{context: map}

  defstruct [:context]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [context: :map]
  end
end
