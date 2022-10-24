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

  @spec decode(map, map, map) :: {map, t}
  def decode(state, spec, yaml) do
    {state, contact} = decode_contact(state, spec, yaml)
    {state, license} = decode_license(state, spec, yaml)

    info = %__MODULE__{
      title: Map.fetch!(yaml, "title"),
      description: Map.get(yaml, "description"),
      terms_of_service: Map.get(yaml, "terms_of_service"),
      contact: contact,
      license: license,
      version: Map.fetch!(yaml, "version")
    }

    {state, info}
  end

  @spec decode_contact(map, map, map) :: {map, Contact.t() | nil}
  defp decode_contact(state, spec, %{"contact" => contact}),
    do: Contact.decode(state, spec, contact)

  defp decode_contact(state, _spec, _yaml), do: {state, nil}

  @spec decode_license(map, map, map) :: {map, License.t() | nil}
  defp decode_license(state, spec, %{"license" => license}),
    do: License.decode(state, spec, license)

  defp decode_license(state, _spec, _yaml), do: {state, nil}
end
