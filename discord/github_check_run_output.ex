defmodule GithubCheckRunOutput do
  @moduledoc """
  Provides struct and type for a GithubCheckRunOutput
  """

  @type t :: %__MODULE__{summary: String.t() | nil, title: String.t() | nil}

  defstruct [:summary, :title]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      summary: {:union, [{:string, :generic}, :null]},
      title: {:union, [{:string, :generic}, :null]}
    ]
  end
end
