defmodule OpenAPI.Reader do
  @moduledoc """
  Provides an Open API spec reader for Yaml and JSON.
  """

  def read(filename) do
    absolute_path_of_base_file = Path.absname(filename, File.cwd!())

    %{
      base_file: absolute_path_of_base_file,
      files: %{},
      schemas: %{},
      current_file: absolute_path_of_base_file,
      current_path: []
    }
    |> read("")
  end

  def read(state, relative_filename) do
    filename = Path.join(state.current_file, relative_filename)
    parsed_file = YamlElixir.read_from_file!(filename)

    put_in(state, [:files, relative_filename], parsed_file)
  end

  def decode({type, opts}, parsed_value) when is_list(opts) do
    for option <- opts, reduce: parsed_value do
      parsed_value -> handle_option(type, option, parsed_value)
    end
  end

  def decode(type, nil) when is_map(type), do: nil

  def decode(type, parsed_value) when is_map(type) do
    Enum.map(parsed_value, fn {key, value} ->
      case Enum.find(type, fn {key_type, _value_type} -> matches_type?(key_type, key) end) do
        {key_type, value_type} ->
          {decode(key_type, key), decode(value_type, value)}

        nil ->
          raise "Unknown type for #{inspect(parsed_value)}, decoder #{inspect(type)}"
      end
    end)
    |> Enum.into(%{})
  end

  def decode([_type], nil), do: nil
  def decode([type], parsed_value), do: Enum.map(parsed_value, &decode(type, &1))

  def decode(types, parsed_value) when is_list(types) do
    case Enum.find(types, :not_found, fn type -> matches_type?(type, parsed_value) end) do
      :not_found ->
        raise "Unknown type for #{inspect(parsed_value)}, decoder #{inspect(types)}"

      nil ->
        nil

      type ->
        decode(type, parsed_value)
    end
  end

  def decode(:any, parsed_value), do: parsed_value
  def decode(:boolean, parsed_value) when is_boolean(parsed_value), do: parsed_value
  def decode(:integer, parsed_value) when is_integer(parsed_value), do: parsed_value
  def decode(:string, parsed_value) when is_binary(parsed_value), do: parsed_value
  def decode(literal, literal) when is_binary(literal), do: literal
  def decode(nil, _parsed_value), do: nil
  def decode(_type, nil), do: nil

  def decode(module, parsed_value) when is_atom(module) do
    decoders = module.decoders()

    parsed_value =
      Enum.into(parsed_value, %{}, fn {k, v} ->
        {Macro.underscore(k), v}
      end)

    fields =
      for {key, decoder} <- decoders do
        parsed_key = to_string(key)
        value = decode(decoder, parsed_value[parsed_key])

        {key, value}
      end

    struct!(module, fields)
  end

  defp handle_option(type, option, value)
  defp handle_option(_type, {:default, default}, nil), do: default
  defp handle_option(type, {:default, _default}, value), do: decode(type, value)
  defp handle_option(_type, option, _value), do: raise("Unknown option #{inspect(option)}")

  defp matches_type?(nil, _value), do: true
  defp matches_type?(_type, nil), do: true
  defp matches_type?(:any, _value), do: true
  defp matches_type?(:boolean, value), do: is_boolean(value)
  defp matches_type?(:integer, value), do: is_integer(value)
  defp matches_type?(:string, value), do: is_binary(value)
  defp matches_type?(literal, value) when is_binary(literal), do: value == literal
  defp matches_type?(module, value) when is_atom(module), do: module.matches?(value)
end
