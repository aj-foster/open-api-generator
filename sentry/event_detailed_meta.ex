defmodule EventDetailedMeta do
  @moduledoc """
  Provides struct and type for a EventDetailedMeta
  """

  @type t :: %__MODULE__{
          context: String.t() | nil,
          contexts: String.t() | nil,
          entries: map | nil,
          message: String.t() | nil,
          packages: String.t() | nil,
          sdk: String.t() | nil,
          tags: map | nil,
          user: String.t() | nil
        }

  defstruct [:context, :contexts, :entries, :message, :packages, :sdk, :tags, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      context: {:string, :generic},
      contexts: {:string, :generic},
      entries: :map,
      message: {:string, :generic},
      packages: {:string, :generic},
      sdk: {:string, :generic},
      tags: :map,
      user: {:string, :generic}
    ]
  end
end
