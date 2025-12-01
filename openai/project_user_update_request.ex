defmodule OpenAI.ProjectUserUpdateRequest do
  @moduledoc """
  Provides struct and type for a ProjectUserUpdateRequest
  """

  @type t :: %__MODULE__{role: String.t()}

  defstruct [:role]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [role: {:enum, ["owner", "member"]}]
  end
end
