defmodule Klaviyo.TemplateUpdateQuery do
  @moduledoc """
  Provides struct and type for a TemplateUpdateQuery
  """

  @type t :: %__MODULE__{data: Klaviyo.TemplateUpdateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.TemplateUpdateQueryResourceObject, :t}]
  end
end
