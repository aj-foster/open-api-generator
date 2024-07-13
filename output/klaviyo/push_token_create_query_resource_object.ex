defmodule PushTokenCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a PushTokenCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: PushTokenCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [attributes: {PushTokenCreateQueryResourceObjectAttributes, :t}, type: {:const, "push-token"}]
  end
end
