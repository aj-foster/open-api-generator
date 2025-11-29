defmodule GitHub.Marketplace.Account do
  @moduledoc """
  Provides struct and type for a Marketplace.Account
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          email: String.t() | nil,
          id: integer,
          login: String.t(),
          node_id: String.t() | nil,
          organization_billing_email: String.t() | nil,
          type: String.t(),
          url: String.t()
        }

  defstruct [:__info__, :email, :id, :login, :node_id, :organization_billing_email, :type, :url]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      email: {:union, [{:string, :email}, :null]},
      id: :integer,
      login: {:string, :generic},
      node_id: {:string, :generic},
      organization_billing_email: {:union, [{:string, :email}, :null]},
      type: {:string, :generic},
      url: {:string, :uri}
    ]
  end
end
