defmodule ApplicationOAuth2InstallParamsResponse do
  @moduledoc """
  Provides struct and type for a ApplicationOAuth2InstallParamsResponse
  """

  @type t :: %__MODULE__{permissions: String.t(), scopes: [String.t()]}

  defstruct [:permissions, :scopes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [permissions: {:string, :generic}, scopes: [enum: ["applications.commands", "bot"]]]
  end
end
