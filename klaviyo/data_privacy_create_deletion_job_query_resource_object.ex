defmodule DataPrivacyCreateDeletionJobQueryResourceObject do
  @moduledoc """
  Provides struct and type for a DataPrivacyCreateDeletionJobQueryResourceObject
  """

  @type t :: %__MODULE__{
          attributes: DataPrivacyCreateDeletionJobQueryResourceObjectAttributes.t(),
          type: String.t()
        }

  defstruct [:attributes, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      attributes: {DataPrivacyCreateDeletionJobQueryResourceObjectAttributes, :t},
      type: {:const, "data-privacy-deletion-job"}
    ]
  end
end
