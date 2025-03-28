defmodule GitHub.License.ContentLinks do
  @moduledoc """
  Provides struct and type for a License.ContentLinks
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          git: String.t() | nil,
          html: String.t() | nil,
          self: String.t()
        }

  defstruct [:__info__, :git, :html, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      git: {:union, [{:string, :uri}, :null]},
      html: {:union, [{:string, :uri}, :null]},
      self: {:string, :uri}
    ]
  end
end
