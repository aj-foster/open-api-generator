defmodule DataPrivacyCreateDeletionJobQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a DataPrivacyCreateDeletionJobQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{
          profile: DataPrivacyCreateDeletionJobQueryResourceObjectAttributesProfile.t()
        }

  defstruct [:profile]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [profile: {DataPrivacyCreateDeletionJobQueryResourceObjectAttributesProfile, :t}]
  end
end
