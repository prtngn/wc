defmodule WC do
  def count(filename) do
    stream = File.stream!(filename)
    |> Stream.map(&String.split(&1, ~r{\s}, trim: true))
    |> Stream.map(&Enum.count/1)

    words = Enum.sum(stream)
    IO.puts("Words in file: #{words}")
  end
end

defmodule WC.CLI do
  def main(args) do
    filename = hd(args)
    WC.count(filename)
  end
end
