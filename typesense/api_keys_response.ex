defmodule ApiKeysResponse do
  @moduledoc """
  Provides struct and type for a ApiKeysResponse
  """

  @type t :: %__MODULE__{keys: [ApiKey.t()]}

  defstruct [:keys]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [keys: [{ApiKey, :t}]]
  end
end
