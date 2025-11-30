defmodule Klaviyo.GetAccountResponse do
  @moduledoc """
  Provides struct and type for a GetAccountResponse
  """

  @type t :: %__MODULE__{data: Klaviyo.AccountResponseObjectResource.t()}

  defstruct [:data]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [data: {Klaviyo.AccountResponseObjectResource, :t}]
  end
end
