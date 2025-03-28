defmodule GitHub.CustomPropertyValue do
  @moduledoc """
  Provides struct and type for a CustomPropertyValue
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          property_name: String.t(),
          value: String.t() | [String.t()]
        }

  defstruct [:__info__, :property_name, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      property_name: {:string, :generic},
      value: {:union, [{:string, :generic}, [string: :generic]]}
    ]
  end
end
