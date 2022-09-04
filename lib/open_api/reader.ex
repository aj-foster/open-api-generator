defmodule OpenAPI.Reader do
  @moduledoc """
  Provides an Open API spec reader for Yaml and JSON.
  """

  def read(filename) do
    [parsed_yaml] = :yamerl.decode_file(filename)
    OpenAPI.Util.decode(OpenAPI.Spec, parsed_yaml)
  end

  #   #
  #   # Schema
  #   #

  #   defp decode(parsed_yaml) do
  #     do_decode(parsed_yaml, %{})
  #   end

  #   @spec do_decode(:yamerl_constr.yamerl_simple_doc(), map) :: map
  #   defp do_decode(parsed_yaml, result)
  #   defp do_decode([], result), do: result

  #   defp do_decode([{'openapi', version} | rest], result) do
  #     result = Map.put(result, "openapi", to_string(version))
  #     do_decode(rest, result)
  #   end

  #   defp do_decode([{'info', info} | rest], result) do
  #     do_decode(rest, Map.put(result, "info", decode_info(info)))
  #   end

  #   #
  #   # Info
  #   #

  #   defp decode_info(info_yaml) do
  #     do_decode_info(info_yaml, %{})
  #   end

  #   @spec do_decode_info(:yamerl_constr.yamerl_simple_doc(), map) :: map
  #   defp do_decode_info(parsed_yaml, result)
  #   defp do_decode_info([], result), do: result

  #   defp do_decode_info([{'title', title} | rest], result) do
  #     do_decode(rest, Map.put(result, "title", to_string(title)))
  #   end
end
