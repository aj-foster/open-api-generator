defmodule SendOptions do
  @moduledoc """
  Provides struct and type for a SendOptions
  """

  @type t :: %__MODULE__{is_transactional: boolean, use_smart_sending: boolean}

  defstruct [:is_transactional, :use_smart_sending]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [is_transactional: :boolean, use_smart_sending: :boolean]
  end
end
