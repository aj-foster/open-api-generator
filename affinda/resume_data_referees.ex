defmodule ResumeDataReferees do
  @moduledoc """
  Provides struct and type for a ResumeDataReferees
  """

  @type t :: %__MODULE__{
          email: String.t() | nil,
          name: String.t() | nil,
          number: String.t() | nil,
          position: String.t() | nil,
          text: String.t() | nil
        }

  defstruct [:email, :name, :number, :position, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:string, :email},
      name: {:string, :generic},
      number: {:string, :generic},
      position: {:string, :generic},
      text: {:string, :generic}
    ]
  end
end
