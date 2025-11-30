defmodule Klaviyo.ProfileMeta do
  @moduledoc """
  Provides struct and type for a ProfileMeta
  """

  @type t :: %__MODULE__{patch_properties: Klaviyo.ProfileMetaPatchProperties.t() | nil}

  defstruct [:patch_properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [patch_properties: {Klaviyo.ProfileMetaPatchProperties, :t}]
  end
end
