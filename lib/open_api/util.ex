defmodule OpenAPI.Util do
  def decode({type, opts}, parsed_value) when is_list(opts) do
    for option <- opts, reduce: parsed_value do
      parsed_value -> handle_option(type, option, parsed_value)
    end
  end

  def decode([type], parsed_value), do: Enum.map(parsed_value, &decode(type, &1))
  def decode(:string, parsed_value), do: to_string(parsed_value)
  def decode(nil, _parsed_value), do: nil

  def decode(module, parsed_value) when is_atom(module) do
    decoders = module.decoders()

    parsed_value =
      Enum.into(parsed_value, %{}, fn {k, v} ->
        key = to_string(k) |> Macro.underscore()
        {key, v}
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
end
