defmodule WC do
  @moduledoc """
  This module open file and count words in this file
  """
  @spec count(binary) :: {:ok, number}
  def count(filename) do
    stream = File.stream!(filename)
    |> Stream.map(&String.split(&1, ~r{\s}, trim: true))
    |> Stream.map(&Enum.count/1)

    {:ok, Enum.sum(stream)}
  end
end

defmodule WC.CLI do
  @moduledoc """
  This module get filename from shell and run count
  """
  @spec main(nonempty_maybe_improper_list) :: {:ok, number}
  def main(args) do
    filename = hd(args)
    WC.count(filename)
  end
end
