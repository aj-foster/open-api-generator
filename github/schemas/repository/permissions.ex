defmodule GitHub.Repository.Permissions do
  @moduledoc """
  Provides struct and types for a Repository.Permissions
  """
  use GitHub.Encoder

  @type full :: %__MODULE__{
          __info__: map,
          admin: boolean,
          maintain: boolean | nil,
          pull: boolean,
          push: boolean,
          triage: boolean | nil
        }

  @type minimal :: %__MODULE__{
          __info__: map,
          admin: boolean | nil,
          maintain: boolean | nil,
          pull: boolean | nil,
          push: boolean | nil,
          triage: boolean | nil
        }

  @type t :: %__MODULE__{
          __info__: map,
          admin: boolean,
          maintain: boolean | nil,
          pull: boolean,
          push: boolean,
          triage: boolean | nil
        }

  defstruct [:__info__, :admin, :maintain, :pull, :push, :triage]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:full) do
    [admin: :boolean, maintain: :boolean, pull: :boolean, push: :boolean, triage: :boolean]
  end

  def __fields__(:minimal) do
    [admin: :boolean, maintain: :boolean, pull: :boolean, push: :boolean, triage: :boolean]
  end

  def __fields__(:t) do
    [admin: :boolean, maintain: :boolean, pull: :boolean, push: :boolean, triage: :boolean]
  end
end
