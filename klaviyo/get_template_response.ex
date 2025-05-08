defmodule GetTemplateResponse do
  @moduledoc """
  Provides struct and type for a GetTemplateResponse
  """

  @type t :: %__MODULE__{data: TemplateResponseObjectResource.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {TemplateResponseObjectResource, :t}]
  end
end
