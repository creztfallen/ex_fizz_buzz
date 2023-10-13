defmodule FizzBuzz do
  def build(file_name) do
    # forma 1
    # case File.read(file_name) do
    #   {:ok, file} -> file
    #   {:error, reason} -> reason
    # end

    # forma 2
    # file = File.read(file_name)
    # handle_file(file)

    # maneira mais elixir de fazer
    file_name
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    # Enum.map(list, fn number -> String.to_integer(number) end)
    {:ok, result}
  end

  defp handle_file({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 15) == 0, do: :Fizzbuzz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :Buzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :Fizz
  defp evaluate_number(number), do: number
end
