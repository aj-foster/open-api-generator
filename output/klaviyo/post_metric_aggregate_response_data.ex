defmodule PostMetricAggregateResponseData do
  @moduledoc """
  Provides struct and type for a PostMetricAggregateResponseData
  """

  @type t :: %__MODULE__{
          attributes: PostMetricAggregateResponseDataAttributes.t(),
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
      attributes: {PostMetricAggregateResponseDataAttributes, :t},
      id: {:string, :generic},
      links: {ObjectLinks, :t},
      type: {:const, "metric-aggregate"}
    ]
  end
end
