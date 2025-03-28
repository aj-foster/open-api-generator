defmodule ProfileSubscriptionCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileSubscriptionCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: ProfileSubscriptionCreateQueryResourceObjectAttributes.t(),
          id: String.t() | nil,
          type: String.t()
        }

  defstruct [:attributes, :id, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {ProfileSubscriptionCreateQueryResourceObjectAttributes, :t},
      id: {:string, :generic},
      type: {:const, "profile"}
    ]
  end
end
