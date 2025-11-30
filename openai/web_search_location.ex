defmodule OpenAI.WebSearchLocation do
  @moduledoc """
  Provides struct and type for a WebSearchLocation
  """

  @type t :: %__MODULE__{
          city: String.t() | nil,
          country: String.t() | nil,
          region: String.t() | nil,
          timezone: String.t() | nil
        }

  defstruct [:city, :country, :region, :timezone]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [city: :string, country: :string, region: :string, timezone: :string]
  end
end
