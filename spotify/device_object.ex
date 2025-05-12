defmodule DeviceObject do
  @moduledoc """
  Provides struct and type for a DeviceObject
  """

  @type t :: %__MODULE__{
          id: String.t() | nil,
          is_active: boolean | nil,
          is_private_session: boolean | nil,
          is_restricted: boolean | nil,
          name: String.t() | nil,
          supports_volume: boolean | nil,
          type: String.t() | nil,
          volume_percent: integer | nil
        }

  defstruct [
    :id,
    :is_active,
    :is_private_session,
    :is_restricted,
    :name,
    :supports_volume,
    :type,
    :volume_percent
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:string, :generic},
      is_active: :boolean,
      is_private_session: :boolean,
      is_restricted: :boolean,
      name: {:string, :generic},
      supports_volume: :boolean,
      type: {:string, :generic},
      volume_percent: :integer
    ]
  end
end
