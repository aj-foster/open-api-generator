defmodule ProfileMetaPatchProperties do
  @moduledoc """
  Provides struct and type for a ProfileMetaPatchProperties
  """

  @type t :: %__MODULE__{
          append: map | nil,
          unappend: map | nil,
          unset: String.t() | [String.t()] | nil
        }

  defstruct [:append, :unappend, :unset]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [append: :map, unappend: :map, unset: {:union, [{:string, :generic}, [string: :generic]]}]
  end
end
