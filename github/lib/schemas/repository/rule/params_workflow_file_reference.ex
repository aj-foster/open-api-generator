defmodule GitHub.Repository.Rule.ParamsWorkflowFileReference do
  @moduledoc """
  Provides struct and type for a Repository.Rule.ParamsWorkflowFileReference
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          path: String.t(),
          ref: String.t() | nil,
          repository_id: integer,
          sha: String.t() | nil
        }

  defstruct [:__info__, :path, :ref, :repository_id, :sha]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      path: {:string, :generic},
      ref: {:string, :generic},
      repository_id: :integer,
      sha: {:string, :generic}
    ]
  end
end
