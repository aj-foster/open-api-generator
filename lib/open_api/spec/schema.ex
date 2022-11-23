defmodule OpenAPI.Spec.Schema do
  @moduledoc false
  import OpenAPI.Spec.Helper

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

  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, all_of} = decode_all_of(state, yaml)
    {state, one_of} = decode_one_of(state, yaml)
    {state, any_of} = decode_any_of(state, yaml)
    {state, discriminator} = decode_discriminator(state, yaml)
    {state, docs} = decode_external_docs(state, yaml)
    {state, xml} = decode_xml(state, yaml)
    {state, not_schema} = decode_not(state, yaml)
    {state, items} = decode_items(state, yaml)
    {state, properties} = decode_properties(state, yaml)
    {state, additional_properties} = decode_additional_properties(state, yaml)

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
      all_of: all_of,
      one_of: one_of,
      any_of: any_of,
      not: not_schema,
      items: items,
      properties: properties,
      additional_properties: additional_properties,
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

  @spec decode_discriminator(map, map) :: {map, Discriminator.t() | nil}
  defp decode_discriminator(state, %{"discriminator" => discriminator}),
    do: with_path(state, discriminator, "discriminator", &Discriminator.decode/2)

  defp decode_discriminator(state, _discriminator), do: {state, nil}

  @spec decode_external_docs(map, map) :: {map, ExternalDocumentation.t() | nil}
  defp decode_external_docs(state, %{"external_docs" => docs}),
    do: with_path(state, docs, "external_docs", &ExternalDocumentation.decode/2)

  defp decode_external_docs(state, _docs), do: {state, nil}

  @spec decode_xml(map, map) :: {map, XML.t() | nil}
  defp decode_xml(state, %{"xml" => xml}),
    do: with_path(state, xml, "xml", &XML.decode/2)

  defp decode_xml(state, _xml), do: {state, nil}

  @spec decode_all_of(map, map) :: {map, t | nil}
  defp decode_all_of(state, %{"all_of" => all_of}) do
    all_of
    |> Enum.with_index()
    |> Enum.reverse()
    |> Enum.reduce({state, []}, fn
      {%{"$ref" => r}, _index}, {state, list} ->
        {state, element} = ensure_schema(state, r)
        {state, [element | list]}

      {schema, index}, {state, list} ->
        {state, element} = with_path(state, schema, [index, "all_of"], &decode/2)
        {state, [element | list]}
    end)
  end

  defp decode_all_of(state, _schema), do: {state, nil}

  @spec decode_one_of(map, map) :: {map, t | nil}
  defp decode_one_of(state, %{"one_of" => one_of}) do
    one_of
    |> Enum.with_index()
    |> Enum.reverse()
    |> Enum.reduce({state, []}, fn
      {%{"$ref" => r}, _index}, {state, list} ->
        {state, element} = ensure_schema(state, r)
        {state, [element | list]}

      {schema, index}, {state, list} ->
        {state, element} = with_path(state, schema, [index, "one_of"], &decode/2)
        {state, [element | list]}
    end)
  end

  defp decode_one_of(state, _schema), do: {state, nil}

  @spec decode_any_of(map, map) :: {map, t | nil}
  defp decode_any_of(state, %{"any_of" => any_of}) do
    any_of
    |> Enum.with_index()
    |> Enum.reverse()
    |> Enum.reduce({state, []}, fn
      {%{"$ref" => r}, _index}, {state, list} ->
        {state, element} = ensure_schema(state, r)
        {state, [element | list]}

      {schema, index}, {state, list} ->
        {state, element} = with_path(state, schema, [index, "any_of"], &decode/2)
        {state, [element | list]}
    end)
  end

  defp decode_any_of(state, _schema), do: {state, nil}

  @spec decode_not(map, map) :: {map, t | nil}
  defp decode_not(state, %{"not" => %{"$ref" => r}}), do: ensure_schema(state, r)
  defp decode_not(state, %{"not" => schema}), do: with_path(state, schema, "not", &decode/2)
  defp decode_not(state, _schema), do: {state, nil}

  @spec decode_items(map, map) :: {map, t | nil}
  defp decode_items(state, %{"items" => %{"$ref" => r}}), do: ensure_schema(state, r)
  defp decode_items(state, %{"items" => schema}), do: with_path(state, schema, "items", &decode/2)
  defp decode_items(state, _schema), do: {state, nil}

  @spec decode_properties(map, map) :: {map, %{optional(String.t()) => t}}
  defp decode_properties(state, %{"properties" => properties}) do
    Enum.reduce(properties, {state, %{}}, fn
      {key, %{"$ref" => r}}, {state, properties} ->
        {state, property} = ensure_schema(state, r)
        {state, Map.put(properties, key, property)}

      {key, schema}, {state, properties} ->
        {state, property} = with_path(state, schema, [key, "properties"], &decode/2)
        {state, Map.put(properties, key, property)}
    end)
  end

  defp decode_properties(state, _schema), do: {state, %{}}

  @spec decode_additional_properties(map, map) :: {map, t | boolean}
  defp decode_additional_properties(state, %{"additional_properties" => %{"$ref" => r}}),
    do: ensure_schema(state, r)

  defp decode_additional_properties(state, %{"additional_properties" => value})
       when is_boolean(value),
       do: {state, value}

  defp decode_additional_properties(state, %{"additional_properties" => schema}),
    do: with_path(state, schema, "additional_properties", &decode/2)

  defp decode_additional_properties(state, _schema), do: {state, true}

  @spec ensure_schema(map, String.t()) :: {map, t}
  defp ensure_schema(state, schema_ref) do
    stored_ref = state.schemas[schema_ref]

    if stored_ref do
      {state, stored_ref}
    else
      [file, path] = String.split(schema_ref, "#")
      state = OpenAPI.Reader.ensure_file(state, file)
      yaml = get_in(state.files[file], String.split(path, "/", trim: true))

      decode(state, yaml)
    end
  end
end
