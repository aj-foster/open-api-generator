defmodule Klaviyo.ProfileSuppressionCreateQueryResourceObject do
  @moduledoc """
  Provides struct and type for a ProfileSuppressionCreateQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.ProfileSuppressionCreateQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.ProfileSuppressionCreateQueryResourceObjectAttributes, :t},
      type: {:const, "profile"}
    ]
  end
end
