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
    with_path(state, all_of, "all_of", fn state, all_of ->
      all_of
      |> Enum.with_index()
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn {schema_or_ref, index}, {state, list} ->
        {state, element} =
          with_path(state, schema_or_ref, index, fn state, schema_or_ref ->
            with_ref(state, schema_or_ref, &decode/2)
          end)

        {state, [element | list]}
      end)
    end)
  end

  defp decode_all_of(state, _schema), do: {state, nil}

  @spec decode_one_of(map, map) :: {map, t | nil}
  defp decode_one_of(state, %{"one_of" => one_of}) do
    with_path(state, one_of, "one_of", fn state, one_of ->
      one_of
      |> Enum.with_index()
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn {schema_or_ref, index}, {state, list} ->
        {state, element} =
          with_path(state, schema_or_ref, index, fn state, schema_or_ref ->
            with_ref(state, schema_or_ref, &decode/2)
          end)

        {state, [element | list]}
      end)
    end)
  end

  defp decode_one_of(state, _schema), do: {state, nil}

  @spec decode_any_of(map, map) :: {map, t | nil}
  defp decode_any_of(state, %{"any_of" => any_of}) do
    with_path(state, any_of, "any_of", fn state, any_of ->
      any_of
      |> Enum.with_index()
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn {schema_or_ref, index}, {state, list} ->
        {state, element} =
          with_path(state, schema_or_ref, index, fn state, schema_or_ref ->
            with_ref(state, schema_or_ref, &decode/2)
          end)

        {state, [element | list]}
      end)
    end)
  end

  defp decode_any_of(state, _schema), do: {state, nil}

  @spec decode_not(map, map) :: {map, t | nil}
  defp decode_not(state, %{"not" => schema}) do
    with_path(state, schema, "not", fn state, schema ->
      with_ref(state, schema, &decode/2)
    end)
  end

  defp decode_not(state, _schema), do: {state, nil}

  @spec decode_items(map, map) :: {map, t | nil}
  defp decode_items(state, %{"items" => schema}) do
    with_path(state, schema, "items", fn state, schema ->
      with_ref(state, schema, &decode/2)
    end)
  end

  defp decode_items(state, _schema), do: {state, nil}

  @spec decode_properties(map, map) :: {map, %{optional(String.t()) => t}}
  defp decode_properties(state, %{"properties" => properties}) do
    with_path(state, properties, "properties", fn state, properties ->
      Enum.reduce(properties, {state, %{}}, fn
        {key, schema}, {state, properties} ->
          {state, property} =
            with_path(state, schema, key, fn state, schema ->
              with_ref(state, schema, &decode/2)
            end)

          {state, Map.put(properties, key, property)}
      end)
    end)
  end

  defp decode_properties(state, _schema), do: {state, %{}}

  @spec decode_additional_properties(map, map) :: {map, t | boolean}
  defp decode_additional_properties(state, %{"additional_properties" => value})
       when is_boolean(value),
       do: {state, value}

  defp decode_additional_properties(state, %{"additional_properties" => schema}) do
    with_path(state, schema, "additional_properties", fn state, schema ->
      with_ref(state, schema, &decode/2)
    end)
  end

  defp decode_additional_properties(state, _schema), do: {state, true}
end
