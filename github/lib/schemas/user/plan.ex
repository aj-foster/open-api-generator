defmodule GitHub.User.Plan do
  @moduledoc """
  Provides struct and types for a User.Plan
  """
  use GitHub.Encoder

  @type private :: %__MODULE__{
          __info__: map,
          collaborators: integer,
          name: String.t(),
          private_repos: integer,
          space: integer
        }

  @type public :: %__MODULE__{
          __info__: map,
          collaborators: integer,
          name: String.t(),
          private_repos: integer,
          space: integer
        }

  defstruct [:__info__, :collaborators, :name, :private_repos, :space]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(:private) do
    [collaborators: :integer, name: {:string, :generic}, private_repos: :integer, space: :integer]
  end

  def __fields__(:public) do
    [collaborators: :integer, name: {:string, :generic}, private_repos: :integer, space: :integer]
  end
end
