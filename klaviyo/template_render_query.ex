defmodule TemplateRenderQuery do
  @moduledoc """
  Provides struct and type for a TemplateRenderQuery
  """

  @type t :: %__MODULE__{data: TemplateRenderQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {TemplateRenderQueryResourceObject, :t}]
  end
end
