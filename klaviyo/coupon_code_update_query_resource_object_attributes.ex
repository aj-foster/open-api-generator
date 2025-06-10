defmodule CouponCodeUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a CouponCodeUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{expires_at: DateTime.t() | nil, status: String.t() | nil}

  defstruct [:expires_at, :status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      expires_at: {:string, :date_time},
      status:
        {:enum,
         ["ASSIGNED_TO_PROFILE", "DELETING", "PROCESSING", "UNASSIGNED", "VERSION_NOT_ACTIVE"]}
    ]
  end
end
