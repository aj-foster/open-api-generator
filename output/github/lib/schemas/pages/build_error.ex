defmodule GitHub.Pages.BuildError do
  @moduledoc """
  Provides struct and type for a Pages.BuildError
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{__info__: map, message: String.t() | nil}

  defstruct [:__info__, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [message: {:union, [{:string, :generic}, :null]}]
  end
end
