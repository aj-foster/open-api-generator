defmodule WidgetSettingsResponse do
  @moduledoc """
  Provides struct and type for a WidgetSettingsResponse
  """

  @type t :: %__MODULE__{channel_id: String.t() | nil, enabled: boolean}

  defstruct [:channel_id, :enabled]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [channel_id: {:union, [{:string, :generic}, :null]}, enabled: :boolean]
  end
end
