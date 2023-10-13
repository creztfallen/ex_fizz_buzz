defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      response = {:ok, [1, 2, :Fizz, 4, :Buzz, :Buzz, :Fizzbuzz, :Buzz, :Buzz]}
      assert FizzBuzz.build("numbers.txt") == response
    end

    test "when an invalid file is provided, returns an error" do
      response = {:error, "Error reading the file: enoent"}
      assert FizzBuzz.build("invalid_file.txt") == response
    end
  end
end
