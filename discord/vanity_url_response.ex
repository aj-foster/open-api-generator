defmodule VanityURLResponse do
  @moduledoc """
  Provides struct and type for a VanityURLResponse
  """

  @type t :: %__MODULE__{
          code: String.t() | nil,
          error: VanityURLErrorResponse.t() | nil,
          uses: integer
        }

  defstruct [:code, :error, :uses]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      code: {:union, [{:string, :generic}, :null]},
      error: {:union, [{VanityURLErrorResponse, :t}, :null]},
      uses: :integer
    ]
  end
end
