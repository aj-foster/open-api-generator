defmodule Sentry.ContextsOs do
  @moduledoc """
  Provides struct and type for a ContextsOs
  """

  @type t :: %__MODULE__{
          name: String.t() | nil,
          type: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [:name, :type, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: :string, type: :string, version: :string]
  end
end
