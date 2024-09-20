defmodule ContextsBrowser do
  @moduledoc """
  Provides struct and type for a ContextsBrowser
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
    [name: {:string, :generic}, type: {:string, :generic}, version: {:string, :generic}]
  end
end
