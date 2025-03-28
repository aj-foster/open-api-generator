defmodule TemplateUpdateQueryResourceObjectAttributes do
  @moduledoc """
  Provides struct and type for a TemplateUpdateQueryResourceObjectAttributes
  """

  @type t :: %__MODULE__{html: String.t() | nil, name: String.t() | nil, text: String.t() | nil}

  defstruct [:html, :name, :text]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [html: {:string, :generic}, name: {:string, :generic}, text: {:string, :generic}]
  end
end
