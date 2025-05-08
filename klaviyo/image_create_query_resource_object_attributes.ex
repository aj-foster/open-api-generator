defmodule ImageCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ImageCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          hidden: boolean | nil,
          import_from_url: String.t(),
          name: String.t() | nil
        }

  defstruct [:hidden, :import_from_url, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hidden: :boolean, import_from_url: {:string, :generic}, name: {:string, :generic}]
  end
end
