defmodule TemplateCreateQuery do
  @moduledoc """
  Provides struct and type for a TemplateCreateQuery
  """

  @type t :: %__MODULE__{data: TemplateCreateQueryResourceObject.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {TemplateCreateQueryResourceObject, :t}]
  end
end
