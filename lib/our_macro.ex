defmodule OurMacro do
  defmacro unless(expr, do: block) do
    quote do
      if !unquote(expr), do: unquote(block)
    end
  end

  defmacro hygienic do
    quote do: val = -1
  end

  defmacro unhygienic do
    quote do: var!(val) = -1
  end

  defmacro double_puts(expr) do
    quote bind_quoted: [expr: expr] do
      IO.puts(unquote(expr))
      IO.puts(unquote(expr))
    end
  end
end
