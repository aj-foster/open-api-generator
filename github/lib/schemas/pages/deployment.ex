defmodule GitHub.Pages.Deployment do
  @moduledoc """
  Provides struct and type for a Pages.Deployment
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          id: integer | String.t(),
          page_url: String.t(),
          preview_url: String.t() | nil,
          status_url: String.t()
        }

  defstruct [:__info__, :id, :page_url, :preview_url, :status_url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      id: {:union, [:integer, string: :generic]},
      page_url: {:string, :uri},
      preview_url: {:string, :uri},
      status_url: {:string, :uri}
    ]
  end
end
