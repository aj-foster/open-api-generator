defmodule GitHub.AuthorizationApp do
  @moduledoc """
  Provides struct and type for a AuthorizationApp
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, client_id: String.t(), name: String.t(), url: String.t()}

  defstruct [:__info__, :client_id, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [client_id: {:string, :generic}, name: {:string, :generic}, url: {:string, :uri}]
  end
end
