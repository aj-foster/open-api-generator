defmodule GitHub.EnvironmentProtectionRulesReviewers do
  @moduledoc """
  Provides struct and type for a EnvironmentProtectionRulesReviewers
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          reviewer: GitHub.Team.t() | GitHub.User.simple() | nil,
          type: String.t() | nil
        }

  defstruct [:__info__, :reviewer, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      reviewer: {:union, [{GitHub.Team, :t}, {GitHub.User, :simple}]},
      type: {:enum, ["User", "Team"]}
    ]
  end
end
