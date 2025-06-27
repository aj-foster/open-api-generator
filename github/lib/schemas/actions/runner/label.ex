defmodule GitHub.Actions.Runner.Label do
  @moduledoc """
  Provides struct and type for a Actions.Runner.Label
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          id: integer | nil,
          name: String.t(),
          type: String.t() | nil
        }

  defstruct [:__info__, :id, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer, name: {:string, :generic}, type: {:enum, ["read-only", "custom"]}]
  end
end
