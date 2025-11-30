defmodule GitHub.FileExtensionRestriction do
  @moduledoc """
  Provides struct and type for a FileExtensionRestriction
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          parameters: GitHub.FileExtensionRestrictionParameters.t() | nil,
          type: String.t()
        }

  defstruct [:__info__, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      parameters: {GitHub.FileExtensionRestrictionParameters, :t},
      type: {:const, "file_extension_restriction"}
    ]
  end
end
