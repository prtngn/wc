defmodule Wc do
  def count do
    {:ok, file} = File.read("book.txt")
    file
    |> String.split(~r{[\r\n\[\]()\s.,]}, trim: true)
    |> Enum.count
  end
end

