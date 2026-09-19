defmodule GitHub.Repository.Advisory.Submission do
  @moduledoc """
  Provides struct and type for a Repository.Advisory.Submission
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, accepted: boolean}

  defstruct [:__info__, :accepted]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [accepted: :boolean]
  end
end
