defmodule EventCreateQueryV2ResourceObject do
  @moduledoc """
  Provides struct and type for a EventCreateQueryV2ResourceObject
  """

  @type t :: %__MODULE__{
          attributes: EventCreateQueryV2ResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {EventCreateQueryV2ResourceObjectAttributes, :t}, type: {:const, "event"}]
  end
end
