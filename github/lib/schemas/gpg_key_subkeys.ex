defmodule GitHub.GpgKeySubkeys do
  @moduledoc """
  Provides struct and type for a GpgKeySubkeys
  """
  use GitHub.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          can_certify: boolean | nil,
          can_encrypt_comms: boolean | nil,
          can_encrypt_storage: boolean | nil,
          can_sign: boolean | nil,
          created_at: String.t() | nil,
          emails: [GitHub.GpgKeySubkeysEmails.t()] | nil,
          expires_at: String.t() | nil,
          id: integer | nil,
          key_id: String.t() | nil,
          primary_key_id: integer | nil,
          public_key: String.t() | nil,
          raw_key: String.t() | nil,
          revoked: boolean | nil,
          subkeys: [map] | nil
        }

  defstruct [
    :__info__,
    :can_certify,
    :can_encrypt_comms,
    :can_encrypt_storage,
    :can_sign,
    :created_at,
    :emails,
    :expires_at,
    :id,
    :key_id,
    :primary_key_id,
    :public_key,
    :raw_key,
    :revoked,
    :subkeys
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      can_certify: :boolean,
      can_encrypt_comms: :boolean,
      can_encrypt_storage: :boolean,
      can_sign: :boolean,
      created_at: {:string, :generic},
      emails: [{GitHub.GpgKeySubkeysEmails, :t}],
      expires_at: {:union, [{:string, :generic}, :null]},
      id: :integer,
      key_id: {:string, :generic},
      primary_key_id: :integer,
      public_key: {:string, :generic},
      raw_key: {:union, [{:string, :generic}, :null]},
      revoked: :boolean,
      subkeys: [:map]
    ]
  end
end
