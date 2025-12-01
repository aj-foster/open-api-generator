defmodule Spotify.ManyDevices do
  @moduledoc """
  Provides struct and type for a ManyDevices
  """

  @type json_resp :: %__MODULE__{devices: [Spotify.DeviceObject.t()]}

  defstruct [:devices]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:json_resp) do
    [devices: [{Spotify.DeviceObject, :t}]]
  end
end
