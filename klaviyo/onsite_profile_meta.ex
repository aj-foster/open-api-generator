defmodule OnsiteProfileMeta do
  @moduledoc """
  Provides struct and type for a OnsiteProfileMeta
  """

  @type t :: %__MODULE__{patch_properties: ProfileMetaPatchProperties.t() | nil}

  defstruct [:patch_properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [patch_properties: {ProfileMetaPatchProperties, :t}]
  end
end
