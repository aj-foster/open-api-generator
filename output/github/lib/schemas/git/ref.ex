defmodule GitHub.Git.Ref do
  @moduledoc """
  Provides struct and type for a Git.Ref
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          node_id: String.t(),
          object: GitHub.Git.RefObject.t(),
          ref: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :node_id, :object, :ref, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      node_id: {:string, :generic},
      object: {GitHub.Git.RefObject, :t},
      ref: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
