defmodule WebhookSourceGuildResponse do
  @moduledoc """
  Provides struct and type for a WebhookSourceGuildResponse
  """

  @type t :: %__MODULE__{icon: String.t() | nil, id: String.t(), name: String.t()}

  defstruct [:icon, :id, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      icon: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      name: {:string, :generic}
    ]
  end
end
