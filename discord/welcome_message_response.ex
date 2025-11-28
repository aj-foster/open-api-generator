defmodule WelcomeMessageResponse do
  @moduledoc """
  Provides struct and type for a WelcomeMessageResponse
  """

  @type t :: %__MODULE__{author_ids: [String.t()], message: String.t()}

  defstruct [:author_ids, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [author_ids: [string: :generic], message: {:string, :generic}]
  end
end
