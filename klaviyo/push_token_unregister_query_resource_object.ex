defmodule PushTokenUnregisterQueryResourceObject do
  @moduledoc """
  Provides struct and type for a PushTokenUnregisterQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: PushTokenUnregisterQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {PushTokenUnregisterQueryResourceObjectAttributes, :t},
      type: {:const, "push-token-unregister"}
    ]
  end
end
