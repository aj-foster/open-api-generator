defmodule MetricResponseObjectResource do
  @moduledoc """
  Provides struct and type for a MetricResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: MetricResponseObjectResourceAttributes.t(),
          id: String.t(),
          links: ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {MetricResponseObjectResourceAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "metric"}
    ]
  end
end
