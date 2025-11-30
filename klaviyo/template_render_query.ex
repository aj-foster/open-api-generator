defmodule Klaviyo.TemplateRenderQuery do
  @moduledoc """
  Provides struct and type for a TemplateRenderQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.TemplateRenderQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.TemplateRenderQueryResourceObject, :t}]
  end
end
