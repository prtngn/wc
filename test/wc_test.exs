defmodule WCTest do
  use ExUnit.Case
  doctest WC.CLI

  test "return word count" do
    assert WC.CLI.main(["file.txt"]) == {:ok, 14}
  end

  test "return error if file not exist" do
    assert_raise File.Error, fn ->
      WC.CLI.main(["not_exist_file.txt"])
    end
  end
end
