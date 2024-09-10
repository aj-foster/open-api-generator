defmodule ResumeDataName do
  @moduledoc """
  Provides struct and type for a ResumeDataName
  """

  @type t :: %__MODULE__{
          first: String.t() | nil,
          last: String.t() | nil,
          middle: String.t() | nil,
          raw: String.t() | nil,
          title: String.t() | nil
        }

  defstruct [:first, :last, :middle, :raw, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      first: {:string, :generic},
      last: {:string, :generic},
      middle: {:string, :generic},
      raw: {:string, :generic},
      title: {:string, :generic}
    ]
  end
end
