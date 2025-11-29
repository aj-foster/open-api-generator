defmodule GitHub.MergedUpstream do
  @moduledoc """
  Provides struct and type for a MergedUpstream
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          base_branch: String.t() | nil,
          merge_type: String.t() | nil,
          message: String.t() | nil
        }

  defstruct [:__info__, :base_branch, :merge_type, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      base_branch: {:string, :generic},
      merge_type: {:enum, ["merge", "fast-forward", "none"]},
      message: {:string, :generic}
    ]
  end
end
