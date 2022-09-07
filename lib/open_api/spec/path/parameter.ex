defmodule OpenAPI.Spec.Path.Parameter do
  @moduledoc false
  use OpenAPI.Spec.Helper

  alias OpenAPI.Spec

  @type t :: %__MODULE__{
          name: String.t(),
          in: String.t(),
          description: String.t() | nil,
          required: boolean,
          deprecated: boolean,
          allow_empty_value: boolean,
          style: String.t() | nil,
          explode: boolean,
          allow_reserved: boolean,
          schema: Spec.Schema.t() | Spec.Ref.t() | nil,
          example: any,
          examples: %{optional(String.t()) => nil},
          content: %{optional(String.t()) => nil}
        }

  defstruct [
    :name,
    :in,
    :description,
    :required,
    :deprecated,
    :allow_empty_value,
    :style,
    :explode,
    :allow_reserved,
    :schema,
    :example,
    :examples,
    :content
  ]

  @decoders %{
    name: :string,
    in: ["query", "header", "path", "cookie"],
    description: :string,
    required: {:boolean, default: false},
    deprecated: {:boolean, default: false},
    allow_empty_value: {:boolean, default: false},
    style:
      {["matrix", "label", "form", "simple", "spaceDelimited", "pipeDelimited", "deepObject"],
       default: nil},
    explode: :boolean,
    allow_reserved: {:boolean, default: false},
    schema: [Spec.Schema, Spec.Ref],
    example: :any,
    examples: nil,
    content: nil
  }

  def matches?(value) do
    match?(%{"name" => _, "in" => _}, Enum.into(value, %{}))
  end

  def post(spec) do
    spec
    |> default_style()
    |> default_explode()
  end

  defp default_style(%__MODULE__{in: "query", style: nil} = spec), do: %{spec | style: "form"}
  defp default_style(%__MODULE__{in: "path", style: nil} = spec), do: %{spec | style: "simple"}
  defp default_style(%__MODULE__{in: "header", style: nil} = spec), do: %{spec | style: "simple"}
  defp default_style(%__MODULE__{in: "cookie", style: nil} = spec), do: %{spec | style: "form"}
  defp default_style(spec), do: spec

  defp default_explode(%__MODULE__{style: "form", explode: nil} = spec),
    do: %{spec | explode: true}

  defp default_explode(%__MODULE__{explode: nil} = spec), do: %{spec | explode: false}
  defp default_explode(spec), do: %{spec | explode: false}
end
