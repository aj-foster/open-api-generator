defmodule GitHub.CodeOfConduct do
  @moduledoc """
  Provides struct and types for a CodeOfConduct
  """
  use GitHub.Encoder

  @type simple :: %__MODULE__{
          __info__: map,
          html_url: String.t() | nil,
          key: String.t(),
          name: String.t(),
          url: String.t()
        }

  @type t :: %__MODULE__{
          __info__: map,
          body: String.t() | nil,
          html_url: String.t() | nil,
          key: String.t(),
          name: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :body, :html_url, :key, :name, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:simple) do
    [
      html_url: {:union, [{:string, :uri}, :null]},
      key: {:string, :generic},
      name: {:string, :generic},
      url: {:string, :uri}
    ]
  end

  def __fields__(:t) do
    [
      body: {:string, :generic},
      html_url: {:union, [{:string, :uri}, :null]},
      key: {:string, :generic},
      name: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
