defmodule GitHub.Actions.BillingUsageMinutesUsedBreakdown do
  @moduledoc """
  Provides struct and type for a Actions.BillingUsageMinutesUsedBreakdown
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          MACOS: integer | nil,
          UBUNTU: integer | nil,
          WINDOWS: integer | nil,
          __info__: map,
          macos_12_core: integer | nil,
          total: integer | nil,
          ubuntu_16_core: integer | nil,
          ubuntu_32_core: integer | nil,
          ubuntu_4_core: integer | nil,
          ubuntu_64_core: integer | nil,
          ubuntu_8_core: integer | nil,
          windows_16_core: integer | nil,
          windows_32_core: integer | nil,
          windows_4_core: integer | nil,
          windows_64_core: integer | nil,
          windows_8_core: integer | nil
        }

  defstruct [
    :MACOS,
    :UBUNTU,
    :WINDOWS,
    :__info__,
    :macos_12_core,
    :total,
    :ubuntu_16_core,
    :ubuntu_32_core,
    :ubuntu_4_core,
    :ubuntu_64_core,
    :ubuntu_8_core,
    :windows_16_core,
    :windows_32_core,
    :windows_4_core,
    :windows_64_core,
    :windows_8_core
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      MACOS: :integer,
      UBUNTU: :integer,
      WINDOWS: :integer,
      macos_12_core: :integer,
      total: :integer,
      ubuntu_16_core: :integer,
      ubuntu_32_core: :integer,
      ubuntu_4_core: :integer,
      ubuntu_64_core: :integer,
      ubuntu_8_core: :integer,
      windows_16_core: :integer,
      windows_32_core: :integer,
      windows_4_core: :integer,
      windows_64_core: :integer,
      windows_8_core: :integer
    ]
  end
end
