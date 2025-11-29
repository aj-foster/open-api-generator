defmodule ApplicationOAuth2InstallParams do
  @moduledoc """
  Provides struct and type for a ApplicationOAuth2InstallParams
  """

  @type t :: %__MODULE__{permissions: integer | nil, scopes: [String.t()] | nil}

  defstruct [:permissions, :scopes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      permissions: {:union, [:integer, :null]},
      scopes: {:union, [[enum: ["applications.commands", "bot"]], :null]}
    ]
  end
end
