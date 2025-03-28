defmodule GitHub.TagProtection do
  @moduledoc """
  Provides struct and type for a TagProtection
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          created_at: String.t() | nil,
          enabled: boolean | nil,
          id: integer | nil,
          pattern: String.t(),
          updated_at: String.t() | nil
        }

  defstruct [:__info__, :created_at, :enabled, :id, :pattern, :updated_at]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created_at: {:string, :generic},
      enabled: :boolean,
      id: :integer,
      pattern: {:string, :generic},
      updated_at: {:string, :generic}
    ]
  end
end
