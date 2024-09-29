defmodule FastInverseSquareRoot do

  @magic_number 0x5f3759df

  # Quake Fast Inverse Square Root

  # steps
    # integer into a 32 bit integer.
    # the magic number - (the integer shifted to the right)
    # turn the int32integer to a float
    # return the newton formula: y * (1.5 - 0.5 * x * y * y); for a very close approximation

  # Convert the float to a 32-bit integer
  def float_to_binary(f) when is_float(f) do
    <<int::32>> = <<f::float-32>>
    int
  end

  # Convert the 32-bit integer back to a float
  def int_to_float(int) do
    <<f::float-32>> = <<int::32>>
    f
  end

  def apply(x) when is_float(x) do
    half_x = x * 0.5

    i = float_to_binary(x)

    i = @magic_number - Bitwise.bsr(i, 1)

    y = int_to_float(i)

    # Newton's approximation
    y = y * (1.5 - half_x * y * y)

    y
  end

    def benchmark do
      normal_inverse_square_root_time = measure_time(fn -> 1.0 / :math.sqrt(0.04598) end)
      fast_inverse_square_root_time = measure_time(fn -> FastInverseSquareRoot.apply(0.04598) end)

      IO.puts("Normal inverse square root time: #{normal_inverse_square_root_time} milliseconds")
      IO.puts("Fast inverse square root time: #{fast_inverse_square_root_time} milliseconds")
      IO.puts("Difference: #{normal_inverse_square_root_time - fast_inverse_square_root_time} milliseconds")
    end

    defp measure_time(fun) do
      start_time = :os.system_time(:nanosecond)
      fun.()
      end_time = :os.system_time(:nanosecond)
      (end_time - start_time)
    end

end

IO.puts(FastInverseSquareRoot.apply(0.12548));
IO.puts(FastInverseSquareRoot.benchmark());
