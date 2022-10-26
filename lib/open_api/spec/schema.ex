defmodule OpenAPI.Spec.Schema do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec
  alias OpenAPI.Spec.ExternalDocumentation
  alias OpenAPI.Spec.Schema.Discriminator
  alias OpenAPI.Spec.Schema.XML

  #
  # Definition
  #

  @type t :: %__MODULE__{
          title: String.t() | nil,
          multiple_of: pos_integer | nil,
          maximum: integer | nil,
          exclusive_maximum: boolean,
          minimum: integer | nil,
          exclusive_minimum: boolean,
          max_length: non_neg_integer | nil,
          min_length: non_neg_integer | nil,
          pattern: String.t() | nil,
          max_items: non_neg_integer | nil,
          min_items: non_neg_integer | nil,
          unique_items: boolean,
          max_properties: non_neg_integer | nil,
          min_properties: non_neg_integer | nil,
          required: [String.t()] | nil,
          enum: [any] | nil,
          type: String.t() | nil,
          all_of: [t] | nil,
          one_of: [t] | nil,
          any_of: [t] | nil,
          not: t | nil,
          items: t | nil,
          properties: %{optional(String.t()) => t},
          additional_properties: boolean | t,
          description: String.t() | nil,
          format: String.t() | nil,
          default: any,
          nullable: boolean,
          discriminator: Spec.Schema.Discriminator.t(),
          read_only: boolean,
          write_only: boolean,
          xml: Spec.Schema.XML.t(),
          external_docs: Spec.ExternalDocumentation.t() | nil,
          example: any,
          deprecated: boolean
        }

  defstruct [
    :title,
    :multiple_of,
    :maximum,
    :exclusive_maximum,
    :minimum,
    :exclusive_minimum,
    :max_length,
    :min_length,
    :pattern,
    :max_items,
    :min_items,
    :unique_items,
    :max_properties,
    :min_properties,
    :required,
    :enum,
    :type,
    :all_of,
    :one_of,
    :any_of,
    :not,
    :items,
    :properties,
    :additional_properties,
    :description,
    :format,
    :default,
    :nullable,
    :discriminator,
    :read_only,
    :write_only,
    :xml,
    :external_docs,
    :example,
    :deprecated
  ]

  #
  # Decoder
  #

  @decoders %{
    title: :string,
    multiple_of: :integer,
    maximum: :integer,
    exclusive_maximum: {:boolean, default: false},
    minimum: :integer,
    exclusive_minimum: {:boolean, default: false},
    max_length: :integer,
    min_length: :integer,
    pattern: :string,
    max_items: :integer,
    min_items: :integer,
    unique_items: {:boolean, default: false},
    max_properties: :integer,
    min_properties: :integer,
    required: [:string],
    enum: [:any],
    type: :string,
    all_of: [[Spec.Ref, __MODULE__]],
    one_of: [[Spec.Ref, __MODULE__]],
    any_of: [[Spec.Ref, __MODULE__]],
    not: [Spec.Ref, __MODULE__],
    items: [Spec.Ref, __MODULE__],
    properties: {%{:string => [Spec.Ref, __MODULE__]}, default: %{}},
    additional_properties: {[:boolean, Spec.Ref, __MODULE__], default: true},
    description: :string,
    format: :string,
    default: :any,
    nullable: {:boolean, default: false},
    discriminator: Spec.Schema.Discriminator,
    read_only: {:boolean, default: false},
    write_only: {:boolean, default: false},
    xml: Spec.Schema.XML,
    external_docs: Spec.ExternalDocumentation,
    example: :any,
    deprecated: {:boolean, default: false}
  }

  def matches?(_value), do: true

  @spec decode(map, map, map) :: {map, t}
  def decode(state, spec, yaml) do
    {state, discriminator} = decode_discriminator(state, spec, yaml)
    {state, docs} = decode_external_docs(state, spec, yaml)
    {state, xml} = decode_xml(state, spec, yaml)
    {state, not_schema} = decode_not(state, spec, yaml)

    schema = %__MODULE__{
      title: Map.get(yaml, "title"),
      multiple_of: Map.get(yaml, "multiple_of"),
      maximum: Map.get(yaml, "maximum"),
      exclusive_maximum: Map.get(yaml, "exclusive_maximum", false),
      minimum: Map.get(yaml, "minimum"),
      exclusive_minimum: Map.get(yaml, "exclusive_minimum", false),
      max_length: Map.get(yaml, "max_length"),
      min_length: Map.get(yaml, "min_length"),
      pattern: Map.get(yaml, "pattern"),
      max_items: Map.get(yaml, "max_items"),
      min_items: Map.get(yaml, "min_items"),
      unique_items: Map.get(yaml, "unique_items", false),
      max_properties: Map.get(yaml, "max_properties"),
      min_properties: Map.get(yaml, "min_properties"),
      required: Map.get(yaml, "required"),
      enum: Map.get(yaml, "enum"),
      type: Map.get(yaml, "type"),

      # More stuff here...
      not: not_schema,
      description: Map.get(yaml, "description"),
      format: Map.get(yaml, "format"),
      default: Map.get(yaml, "default"),
      nullable: Map.get(yaml, "nullable", false),
      discriminator: discriminator,
      read_only: Map.get(yaml, "read_only", false),
      write_only: Map.get(yaml, "write_only", false),
      xml: xml,
      external_docs: docs,
      example: Map.get(yaml, "example"),
      deprecated: Map.get(yaml, "deprecated", false)
    }

    {state, schema}
  end

  @spec decode_discriminator(map, map, map) :: {map, Discriminator.t() | nil}
  defp decode_discriminator(state, spec, %{"discriminator" => discriminator}),
    do: Discriminator.decode(state, spec, discriminator)

  defp decode_discriminator(state, _spec, _discriminator), do: {state, nil}

  @spec decode_external_docs(map, map, map) :: {map, ExternalDocumentation.t() | nil}
  defp decode_external_docs(state, spec, %{"external_docs" => docs}),
    do: ExternalDocumentation.decode(state, spec, docs)

  defp decode_external_docs(state, _spec, _docs), do: {state, nil}

  @spec decode_xml(map, map, map) :: {map, XML.t() | nil}
  defp decode_xml(state, spec, %{"xml" => xml}),
    do: XML.decode(state, spec, xml)

  defp decode_xml(state, _spec, _xml), do: {state, nil}

  @spec decode_not(map, map, map) :: {map, t | nil}
  defp decode_not(state, spec, %{"not" => %{"$ref" => r}}), do: ensure_schema(state, spec, r)
  defp decode_not(state, spec, %{"not" => schema}), do: decode(state, spec, schema)
  defp decode_not(state, _spec, _schema), do: {state, nil}

  @spec ensure_schema(map, map, String.t()) :: {map, t}
  defp ensure_schema(state, spec, schema_ref) do
    if Map.has_key?(state.schemas, schema_ref) do
      state
    else
      [file, path] = String.split(schema_ref, "#")
      state = ensure_file(state, file)
      yaml = get_in(state.files[file], String.split(path, "/"))

      decode(state, spec, yaml)
    end
  end

  @spec ensure_file(map, String.t()) :: map
  defp ensure_file(state, file) do
    if Map.has_key?(state.files, file) do
      state
    else
      OpenAPI.Reader.read(state, file)
    end
  end
end
