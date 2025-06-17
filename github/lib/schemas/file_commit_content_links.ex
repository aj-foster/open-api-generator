defmodule GitHub.FileCommitContentLinks do
  @moduledoc """
  Provides struct and type for a FileCommitContentLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          git: String.t() | nil,
          html: String.t() | nil,
          self: String.t() | nil
        }

  defstruct [:__info__, :git, :html, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [git: {:string, :generic}, html: {:string, :generic}, self: {:string, :generic}]
  end
end
