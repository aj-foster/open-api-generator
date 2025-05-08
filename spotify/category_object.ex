defmodule CategoryObject do
  @moduledoc """
  Provides struct and type for a CategoryObject
  """

  @type t :: %__MODULE__{
          href: String.t(),
          icons: [ImageObject.t()],
          id: String.t(),
          name: String.t()
        }

  defstruct [:href, :icons, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      href: {:string, :generic},
      icons: [{ImageObject, :t}],
      id: {:string, :generic},
      name: {:string, :generic}
    ]
  end
end
