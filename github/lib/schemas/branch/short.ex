defmodule GitHub.Branch.Short do
  @moduledoc """
  Provides struct and type for a Branch.Short
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          commit: GitHub.Branch.ShortCommit.t(),
          name: String.t(),
          protected: boolean
        }

  defstruct [:__info__, :commit, :name, :protected]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [commit: {GitHub.Branch.ShortCommit, :t}, name: {:string, :generic}, protected: :boolean]
  end
end
