defmodule GitHub.Dependabot.Alert.SecurityAdvisoryReferences do
  @moduledoc """
  Provides struct and type for a Dependabot.Alert.SecurityAdvisoryReferences
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, url: String.t()}

  defstruct [:__info__, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [url: {:string, :uri}]
  end
end
