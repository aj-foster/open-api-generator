defmodule MessageEmbedProviderResponse do
  @moduledoc """
  Provides struct and type for a MessageEmbedProviderResponse
  """

  @type t :: %__MODULE__{name: String.t(), url: String.t() | nil}

  defstruct [:name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, url: {:union, [{:string, :uri}, :null]}]
  end
end
