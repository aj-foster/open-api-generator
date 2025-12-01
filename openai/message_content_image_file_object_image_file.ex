defmodule OpenAI.MessageContentImageFileObjectImageFile do
  @moduledoc """
  Provides struct and type for a MessageContentImageFileObjectImageFile
  """

  @type t :: %__MODULE__{detail: String.t() | nil, file_id: String.t()}

  defstruct [:detail, :file_id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [detail: {:enum, ["auto", "low", "high"]}, file_id: :string]
  end
end
