defmodule RealtimeSessionCreateRequestTools do
  @moduledoc """
  Provides struct and type for a RealtimeSessionCreateRequestTools
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t() | nil,
          parameters: map | nil,
          type: String.t() | nil
        }

  defstruct [:description, :name, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      name: {:string, :generic},
      parameters: :map,
      type: {:const, "function"}
    ]
  end
end
