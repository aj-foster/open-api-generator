defmodule Line.QuickReplyItem do
  @moduledoc """
  Provides struct and type for a QuickReplyItem
  """

  @type t :: %__MODULE__{
          action: Line.Action.t() | nil,
          imageUrl: String.t() | nil,
          type: String.t() | nil
        }

  defstruct [:action, :imageUrl, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [action: {Line.Action, :t}, imageUrl: {:string, "uri"}, type: :string]
  end
end
