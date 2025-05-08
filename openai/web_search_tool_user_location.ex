defmodule WebSearchToolUserLocation do
  @moduledoc """
  Provides struct and type for a WebSearchToolUserLocation
  """

  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t() | nil,
          region: String.t() | nil,
          timezone: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:city, :country, :region, :timezone, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      city: {:string, :generic},
      country: {:string, :generic},
      region: {:string, :generic},
      timezone: {:string, :generic},
      type: {:const, "approximate"}
    ]
  end
end
