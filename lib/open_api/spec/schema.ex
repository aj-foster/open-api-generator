defmodule OpenAPI.Spec.Schema do
  @moduledoc "Raw JSON schema specification from the OpenAPI spec"
  import OpenAPI.Reader.State

  alias OpenAPI.Spec
  alias OpenAPI.Spec.ExternalDocumentation
  alias OpenAPI.Spec.Schema.Discriminator
  alias OpenAPI.Spec.Schema.XML

  #
  # Definition
  #

  @typedoc """
  JSON Schema specification

  In addition to the data derived from the JSON or Yaml specification, this struct also contains
  some contextual information including its absolute and referenced location in the spec. All
  such fields are prefixed with `$oag_`.
  """
  @type t :: %__MODULE__{
          "$oag_base_file": String.t(),
          "$oag_base_file_path": [Spec.path_segment()],
          "$oag_last_ref_file": String.t() | nil,
          "$oag_last_ref_path": [Spec.path_segment()],
          "$oag_schema_context": [tuple],
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
          const: any,
          enum: [any] | nil,
          type: String.t() | nil,
          all_of: [t | Spec.ref()] | nil,
          one_of: [t | Spec.ref()] | nil,
          any_of: [t | Spec.ref()] | nil,
          not: t | Spec.ref() | nil,
          items: t | Spec.ref() | nil,
          properties: %{optional(String.t()) => t | Spec.ref()},
          additional_properties: boolean | t | Spec.ref(),
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
          examples: list() | nil,
          deprecated: boolean
        }

  defstruct [
    :"$oag_base_file",
    :"$oag_base_file_path",
    :"$oag_last_ref_file",
    :"$oag_last_ref_path",
    :"$oag_schema_context",
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
    :const,
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
    :examples,
    :deprecated
  ]

  #
  # Helpers
  #

  @doc false
  @spec add_context(t, term) :: t
  def add_context(%__MODULE__{"$oag_schema_context": contexts} = schema, new_context) do
    %__MODULE__{schema | "$oag_schema_context": [new_context | contexts]}
  end

  @doc false
  @spec merge_contexts(t, t) :: t
  def merge_contexts(
        %__MODULE__{"$oag_schema_context": contexts} = schema,
        %__MODULE__{"$oag_schema_context": new_contexts}
      ) do
    %__MODULE__{schema | "$oag_schema_context": new_contexts ++ contexts}
  end

  #
  # Decoder
  #

  @doc false
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
      "$oag_base_file": Map.fetch!(state, :base_file),
      "$oag_base_file_path": Map.fetch!(state, :base_file_path) |> Enum.reverse(),
      "$oag_last_ref_file": Map.fetch!(state, :last_ref_file),
      "$oag_last_ref_path": Map.fetch!(state, :last_ref_path) |> Enum.reverse(),
      "$oag_schema_context": [],
      title: Map.get(yaml, "title"),
      multiple_of: Map.get(yaml, "multipleOf"),
      maximum: Map.get(yaml, "maximum"),
      exclusive_maximum: Map.get(yaml, "exclusiveMaximum", false),
      minimum: Map.get(yaml, "minimum"),
      exclusive_minimum: Map.get(yaml, "exclusiveMinimum", false),
      max_length: Map.get(yaml, "maxLength"),
      min_length: Map.get(yaml, "minLength"),
      pattern: Map.get(yaml, "pattern"),
      max_items: Map.get(yaml, "maxItems"),
      min_items: Map.get(yaml, "minItems"),
      unique_items: Map.get(yaml, "uniqueItems", false),
      max_properties: Map.get(yaml, "maxProperties"),
      min_properties: Map.get(yaml, "minProperties"),
      required: Map.get(yaml, "required"),
      const: Map.get(yaml, "const"),
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
      read_only: Map.get(yaml, "readOnly", false),
      write_only: Map.get(yaml, "writeOnly", false),
      xml: xml,
      external_docs: docs,
      example: Map.get(yaml, "example"),
      examples: Map.get(yaml, "examples"),
      deprecated: Map.get(yaml, "deprecated", false)
    }

    {state, schema}
  end

  @spec decode_discriminator(map, map) :: {map, Discriminator.t() | nil}
  defp decode_discriminator(state, %{"discriminator" => discriminator}),
    do: with_path(state, discriminator, "discriminator", &Discriminator.decode/2)

  defp decode_discriminator(state, _discriminator), do: {state, nil}

  @spec decode_external_docs(map, map) :: {map, ExternalDocumentation.t() | nil}
  defp decode_external_docs(state, %{"externalDocs" => docs}),
    do: with_path(state, docs, "externalDocs", &ExternalDocumentation.decode/2)

  defp decode_external_docs(state, _docs), do: {state, nil}

  @spec decode_xml(map, map) :: {map, XML.t() | nil}
  defp decode_xml(state, %{"xml" => xml}),
    do: with_path(state, xml, "xml", &XML.decode/2)

  defp decode_xml(state, _xml), do: {state, nil}

  @spec decode_all_of(map, map) :: {map, t | nil}
  defp decode_all_of(state, %{"allOf" => all_of}) do
    with_path(state, all_of, "allOf", fn state, all_of ->
      all_of
      |> Enum.with_index()
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn {schema_or_ref, index}, {state, list} ->
        {state, element} =
          with_path(state, schema_or_ref, index, fn state, schema_or_ref ->
            with_schema_ref(state, schema_or_ref, &decode/2)
          end)

        {state, [element | list]}
      end)
    end)
  end

  defp decode_all_of(state, _schema), do: {state, nil}

  @spec decode_one_of(map, map) :: {map, t | nil}
  defp decode_one_of(state, %{"oneOf" => one_of}) do
    with_path(state, one_of, "oneOf", fn state, one_of ->
      one_of
      |> Enum.with_index()
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn {schema_or_ref, index}, {state, list} ->
        {state, element} =
          with_path(state, schema_or_ref, index, fn state, schema_or_ref ->
            with_schema_ref(state, schema_or_ref, &decode/2)
          end)

        {state, [element | list]}
      end)
    end)
  end

  defp decode_one_of(state, _schema), do: {state, nil}

  @spec decode_any_of(map, map) :: {map, t | nil}
  defp decode_any_of(state, %{"anyOf" => any_of}) do
    with_path(state, any_of, "anyOf", fn state, any_of ->
      any_of
      |> Enum.with_index()
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn {schema_or_ref, index}, {state, list} ->
        {state, element} =
          with_path(state, schema_or_ref, index, fn state, schema_or_ref ->
            with_schema_ref(state, schema_or_ref, &decode/2)
          end)

        {state, [element | list]}
      end)
    end)
  end

  defp decode_any_of(state, _schema), do: {state, nil}

  @spec decode_not(map, map) :: {map, t | nil}
  defp decode_not(state, %{"not" => schema}) do
    with_path(state, schema, "not", fn state, schema ->
      with_schema_ref(state, schema, &decode/2)
    end)
  end

  defp decode_not(state, _schema), do: {state, nil}

  @spec decode_items(map, map) :: {map | false, t | nil}
  defp decode_items(state, %{"items" => value})
       when is_boolean(value),
       do: {state, false}

  defp decode_items(state, %{"items" => schema}) do
    with_path(state, schema, "items", fn state, schema ->
      with_schema_ref(state, schema, &decode/2)
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
              with_schema_ref(state, schema, &decode/2)
            end)

          {state, Map.put(properties, key, property)}
      end)
    end)
  end

  defp decode_properties(state, _schema), do: {state, %{}}

  @spec decode_additional_properties(map, map) :: {map, t | boolean}
  defp decode_additional_properties(state, %{"additionalProperties" => value})
       when is_boolean(value),
       do: {state, value}

  defp decode_additional_properties(state, %{"additionalProperties" => schema}) do
    with_path(state, schema, "additionalProperties", fn state, schema ->
      with_schema_ref(state, schema, &decode/2)
    end)
  end

  defp decode_additional_properties(state, _schema), do: {state, true}
end
