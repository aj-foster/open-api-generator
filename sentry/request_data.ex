defmodule Sentry.RequestData do
  @moduledoc """
  Provides struct and type for a RequestData
  """

  @type t :: %__MODULE__{
          cookies: [[String.t()]] | nil,
          data: map | nil,
          env: Sentry.RequestDataEnv.t() | nil,
          fragment: String.t() | nil,
          headers: [[String.t()]],
          inferredContentType: String.t() | nil,
          method: String.t() | nil,
          query: [[String.t()]],
          url: String.t()
        }

  defstruct [
    :cookies,
    :data,
    :env,
    :fragment,
    :headers,
    :inferredContentType,
    :method,
    :query,
    :url
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cookies: [[:string]],
      data: :map,
      env: {Sentry.RequestDataEnv, :t},
      fragment: :string,
      headers: [[:string]],
      inferredContentType: :string,
      method: :string,
      query: [[:string]],
      url: :string
    ]
  end
end
