defmodule GitHub.FilePathRestriction do
  @moduledoc """
  Provides struct and type for a FilePathRestriction
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          parameters: GitHub.FilePathRestrictionParameters.t() | nil,
          type: String.t()
        }

  defstruct [:__info__, :parameters, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      parameters: {GitHub.FilePathRestrictionParameters, :t},
      type: {:const, "file_path_restriction"}
    ]
  end
end
