defmodule PostCouponCodeResponseDataAttributes do
  @moduledoc """
  Provides struct and type for a PostCouponCodeResponseDataAttributes
  """

  @type t :: %__MODULE__{
          expires_at: DateTime.t() | nil,
          status: String.t() | nil,
          unique_code: String.t() | nil
        }

  defstruct [:expires_at, :status, :unique_code]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expires_at: {:string, :date_time},
      status:
        {:enum,
         ["ASSIGNED_TO_PROFILE", "DELETING", "PROCESSING", "UNASSIGNED", "VERSION_NOT_ACTIVE"]},
      unique_code: {:string, :generic}
    ]
  end
end
