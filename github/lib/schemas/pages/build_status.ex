defmodule GitHub.Pages.BuildStatus do
  @moduledoc """
  Provides struct and type for a Pages.BuildStatus
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, status: String.t(), url: String.t()}

  defstruct [:__info__, :status, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [status: {:string, :generic}, url: {:string, :uri}]
  end
end
