defmodule EntitlementResponse do
  @moduledoc """
  Provides struct and type for a EntitlementResponse
  """

  @type t :: %__MODULE__{
          application_id: String.t(),
          consumed: boolean | nil,
          deleted: boolean,
          ends_at: DateTime.t() | nil,
          fulfilled_at: DateTime.t() | nil,
          fulfillment_status: integer | nil,
          guild_id: String.t() | nil,
          id: String.t(),
          sku_id: String.t(),
          starts_at: DateTime.t() | nil,
          type: integer,
          user_id: String.t()
        }

  defstruct [
    :application_id,
    :consumed,
    :deleted,
    :ends_at,
    :fulfilled_at,
    :fulfillment_status,
    :guild_id,
    :id,
    :sku_id,
    :starts_at,
    :type,
    :user_id
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application_id: {:string, :generic},
      consumed: {:union, [:boolean, :null]},
      deleted: :boolean,
      ends_at: {:union, [{:string, :date_time}, :null]},
      fulfilled_at: {:union, [{:string, :date_time}, :null]},
      fulfillment_status: {:union, [:integer, :null]},
      guild_id: {:union, [{:string, :generic}, :null]},
      id: {:string, :generic},
      sku_id: {:string, :generic},
      starts_at: {:union, [{:string, :date_time}, :null]},
      type: :integer,
      user_id: {:string, :generic}
    ]
  end
end
