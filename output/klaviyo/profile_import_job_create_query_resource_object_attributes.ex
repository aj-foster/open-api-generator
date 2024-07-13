defmodule ProfileImportJobCreateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a ProfileImportJobCreateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          profiles: ProfileImportJobCreateQueryResourceObjectAttributesProfiles.t()
        }

  defstruct [:profiles]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profiles: {ProfileImportJobCreateQueryResourceObjectAttributesProfiles, :t}]
  end
end
