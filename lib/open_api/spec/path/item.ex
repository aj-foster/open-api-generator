defmodule OpenAPI.Spec.Path.Item do
  @moduledoc "Raw operation path from the OpenAPI spec"
  import OpenAPI.Reader.State

  alias OpenAPI.Spec.Path.Operation
  alias OpenAPI.Spec.Path.Parameter
  alias OpenAPI.Spec.Server

  @type t :: %__MODULE__{
          summary: String.t() | nil,
          description: String.t() | nil,
          get: Operation.t() | nil,
          put: Operation.t() | nil,
          post: Operation.t() | nil,
          delete: Operation.t() | nil,
          options: Operation.t() | nil,
          head: Operation.t() | nil,
          patch: Operation.t() | nil,
          trace: Operation.t() | nil,
          servers: [Server.t()],
          parameters: [Parameter.t()]
        }

  defstruct [
    :summary,
    :description,
    :get,
    :put,
    :post,
    :delete,
    :options,
    :head,
    :patch,
    :trace,
    :servers,
    :parameters
  ]

  @doc false
  @spec decode(map, map) :: {map, t}
  def decode(state, yaml) do
    {state, parameters} = decode_parameters(state, yaml)
    {state, servers} = decode_servers(state, yaml)

    state = %{state | path_parameters: parameters}
    {state, get} = decode_get(state, yaml)
    {state, put} = decode_put(state, yaml)
    {state, post} = decode_post(state, yaml)
    {state, delete} = decode_delete(state, yaml)
    {state, options} = decode_options(state, yaml)
    {state, head} = decode_head(state, yaml)
    {state, patch} = decode_patch(state, yaml)
    {state, trace} = decode_trace(state, yaml)
    state = %{state | path_parameters: []}

    item = %__MODULE__{
      summary: Map.get(yaml, "summary"),
      description: Map.get(yaml, "description"),
      get: get,
      put: put,
      post: post,
      delete: delete,
      options: options,
      head: head,
      patch: patch,
      trace: trace,
      servers: servers,
      parameters: parameters
    }

    {state, item}
  end

  @spec decode_get(map, map) :: {map, Operation.t() | nil}
  def decode_get(state, %{"get" => get}) do
    with_path(state, get, "get", &Operation.decode/2)
  end

  def decode_get(state, _yaml), do: {state, nil}

  @spec decode_put(map, map) :: {map, Operation.t() | nil}
  def decode_put(state, %{"put" => put}) do
    with_path(state, put, "put", &Operation.decode/2)
  end

  def decode_put(state, _yaml), do: {state, nil}

  @spec decode_post(map, map) :: {map, Operation.t() | nil}
  def decode_post(state, %{"post" => post}) do
    with_path(state, post, "post", &Operation.decode/2)
  end

  def decode_post(state, _yaml), do: {state, nil}

  @spec decode_delete(map, map) :: {map, Operation.t() | nil}
  def decode_delete(state, %{"delete" => delete}) do
    with_path(state, delete, "delete", &Operation.decode/2)
  end

  def decode_delete(state, _yaml), do: {state, nil}

  @spec decode_options(map, map) :: {map, Operation.t() | nil}
  def decode_options(state, %{"options" => options}) do
    with_path(state, options, "options", &Operation.decode/2)
  end

  def decode_options(state, _yaml), do: {state, nil}

  @spec decode_head(map, map) :: {map, Operation.t() | nil}
  def decode_head(state, %{"head" => head}) do
    with_path(state, head, "head", &Operation.decode/2)
  end

  def decode_head(state, _yaml), do: {state, nil}

  @spec decode_patch(map, map) :: {map, Operation.t() | nil}
  def decode_patch(state, %{"patch" => patch}) do
    with_path(state, patch, "patch", &Operation.decode/2)
  end

  def decode_patch(state, _yaml), do: {state, nil}

  @spec decode_trace(map, map) :: {map, Operation.t() | nil}
  def decode_trace(state, %{"trace" => trace}) do
    with_path(state, trace, "trace", &Operation.decode/2)
  end

  def decode_trace(state, _yaml), do: {state, nil}

  @spec decode_parameters(map, map) :: {map, [Parameter.t()]}
  def decode_parameters(state, %{"parameters" => parameters}) do
    with_path(state, parameters, "parameters", fn state, parameters ->
      parameters
      |> Enum.with_index()
      |> Enum.reverse()
      |> Enum.reduce({state, []}, fn {parameter, index}, {state, list} ->
        {state, element} = with_path(state, parameter, index, &Parameter.decode/2)
        {state, [element | list]}
      end)
    end)
  end

  def decode_parameters(state, _yaml), do: {state, []}

  @spec decode_servers(map, map) :: {map, [Server.t()]}
  defp decode_servers(state, %{"servers" => servers}) when is_list(servers) do
    with_path(state, servers, "servers", fn state, servers ->
      {state, servers} =
        servers
        |> Enum.with_index()
        |> Enum.reduce({state, []}, fn {server, index}, {state, servers} ->
          {state, server} = with_path(state, server, index, &Server.decode/2)
          {state, [server | servers]}
        end)

      {state, Enum.reverse(servers)}
    end)
  end

  defp decode_servers(state, _yaml), do: {state, [%Server{url: "/"}]}
end
