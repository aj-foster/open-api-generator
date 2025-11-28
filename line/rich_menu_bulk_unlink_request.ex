defmodule RichMenuBulkUnlinkRequest do
  @moduledoc """
  Provides struct and type for a RichMenuBulkUnlinkRequest
  """

  @type t :: %__MODULE__{userIds: [String.t()]}

  defstruct [:userIds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [userIds: [string: :generic]]
  end
end
