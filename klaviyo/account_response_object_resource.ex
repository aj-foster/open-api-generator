defmodule Klaviyo.AccountResponseObjectResource do
  @moduledoc """
  Provides struct and type for a AccountResponseObjectResource
  """

  @type t :: %__MODULE__{
          attributes: Klaviyo.AccountResponseObjectResourceAttributes.t(),
          id: String.t(),
          links: Klaviyo.ObjectLinks.t(),
          type: String.t()
        }

  defstruct [:attributes, :id, :links, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {Klaviyo.AccountResponseObjectResourceAttributes, :t},
      id: :string,
      links: {Klaviyo.ObjectLinks, :t},
      type: {:const, "account"}
    ]
  end
end
