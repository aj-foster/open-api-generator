defmodule GitHub.Team.Permissions do
  @moduledoc """
  Provides struct and type for a Team.Permissions
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          admin: boolean,
          maintain: boolean,
          pull: boolean,
          push: boolean,
          triage: boolean
        }

  defstruct [:__info__, :admin, :maintain, :pull, :push, :triage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [admin: :boolean, maintain: :boolean, pull: :boolean, push: :boolean, triage: :boolean]
  end
end
