defmodule OpenAPI.Test.CodeHelpers do
  @doc """
  compares code with any viable indentation.
  the identation is deduces from the first occurence of the first word in the generated output

  if the generated parameter is a list it is joined before comparing using `gen_list|> Enum.join()`
  """

  def contains_code?(generated, cmp) when is_bitstring(generated) do
    with cmp <-
           (if String.last(cmp) == "\n" do
              String.slice(cmp, 0, String.length(cmp) - 1)
            else
              cmp
            end),
         first_word <-
           Regex.replace(~r/^(\s*[^[:space:]]+).*/, cmp, "\\1")
           |> String.split("\n")
           |> Enum.find(fn
             "" -> false
             _ -> true
           end),
         possible_indents <-
           generated
           |> String.split("\n")
           |> Enum.reduce([], fn line, acc ->
             case String.split(line, first_word) do
               [_just_one] ->
                 acc

               [spaces | _] ->
                 if spaces == String.duplicate(" ", String.length(spaces)) do
                   [String.length(spaces) | acc]
                 else
                   acc
                 end

               _ ->
                 acc
             end
           end) do
      possible_indents
      |> Enum.find(fn indent ->
        prefix = String.duplicate(" ", indent)

        cmp =
          cmp
          |> String.split("\n")
          |> Enum.map(fn
            "" -> ""
            other -> prefix <> other
          end)
          |> Enum.join("\n")

        String.contains?(generated, cmp)
      end)
    end
  end

  def contains_code?(gen_list, cmp) when is_list(gen_list),
    do: gen_list |> Enum.join() |> contains_code?(cmp)

  @doc """
    assert macro for   contains_code?
    the msg argument, if supplied is passed on to assert
  """
  @spec assert_contains_code(any(), any(), any()) ::
          {:assert, [{:column, 9} | {:keep, {any(), any()}}, ...], [...]}
  defmacro assert_contains_code(source, cmp, msg \\ nil) do
    if msg do
      quote location: :keep do
        assert OpenAPI.Test.CodeHelpers.contains_code?(unquote(source), unquote(cmp)),
               unquote(msg)
      end
    else
      quote location: :keep do
        assert OpenAPI.Test.CodeHelpers.contains_code?(unquote(source), unquote(cmp))
      end
    end
  end
end
