defmodule OpenAPI.Spec.Info do
  @moduledoc false
  alias OpenAPI.Spec.Info
  alias OpenAPI.Spec.Info.Contact
  alias OpenAPI.Spec.Info.License

  #
  # Definition
  #

  @type t :: %__MODULE__{
          title: String.t(),
          description: String.t() | nil,
          terms_of_service: String.t() | nil,
          contact: Info.Contact.t() | nil,
          license: Info.License.t() | nil,
          version: String.t()
        }

  defstruct [
    :title,
    :description,
    :terms_of_service,
    :contact,
    :license,
    :version
  ]

  #
  # Decoder
  #

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, contact} = decode_contact(state, yaml)
    {state, license} = decode_license(state, yaml)

    info = %__MODULE__{
      title: Map.fetch!(yaml, "title"),
      description: Map.get(yaml, "description"),
      terms_of_service: Map.get(yaml, "termsOfService"),
      contact: contact,
      license: license,
      version: Map.fetch!(yaml, "version")
    }

    {state, info}
  end

  @spec decode_contact(map, map) :: {map, Contact.t() | nil}
  defp decode_contact(state, %{"contact" => contact}),
    do: Contact.decode(state, contact)

  defp decode_contact(state, _yaml), do: {state, nil}

  @spec decode_license(map, map) :: {map, License.t() | nil}
  defp decode_license(state, %{"license" => license}),
    do: License.decode(state, license)

  defp decode_license(state, _yaml), do: {state, nil}
end
