defmodule ContentModerationResponse do
  @moduledoc """
  Provides struct and type for a ContentModerationResponse
  """

  @type t :: %__MODULE__{errors: [String.t()], id: String.t(), name: String.t()}

  defstruct [:errors, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [errors: [string: :generic], id: {:string, :generic}, name: {:const, "content_moderation"}]
  end
end
