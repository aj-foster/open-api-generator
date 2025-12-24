defmodule Klaviyo.TemplateCloneQuery do
  @moduledoc """
  Provides struct and type for a TemplateCloneQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.TemplateCloneQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.TemplateCloneQueryResourceObject, :t}]
  end
end
