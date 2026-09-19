defmodule Mollie.ProfileResponseReview do
  @moduledoc """
  Provides struct and type for a ProfileResponseReview
  """

  @type t :: %__MODULE__{status: String.t() | nil}

  defstruct [:status]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [status: {:enum, ["pending", "rejected"]}]
  end
end
