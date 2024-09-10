defmodule CommandPermissionResponse do
  @moduledoc """
  Provides struct and type for a CommandPermissionResponse
  """

  @type t :: %__MODULE__{id: String.t(), permission: boolean, type: integer}

  defstruct [:id, :permission, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: {:string, :generic}, permission: :boolean, type: :integer]
  end
end
