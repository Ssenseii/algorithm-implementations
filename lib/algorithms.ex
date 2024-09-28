defmodule Algorithms do
  @moduledoc """
  Documentation for `Algorithms`.
  A Plethora of Algorithm implementations ranging in complexity to better understand the elixir programming language.
  """



  @doc """
  Bubble Sorting Algorithm: The simplest and the easiest to learn (took me more than an hour it's embarassing).
  Current Song: Mourning the Dawn - NOVELISTS.
  """
  def sort(l), do: bubble_sort(l, length(l));

  defp bubble_sort(l, n) when n <= 1, do: l;

  defp bubble_sort(l, n) do
    n_l = bubble_pass(l, n);
    bubble_sort(n_l, n - 1)
  end

  defp bubble_pass([x , y | tail], n) do
    if x > y do
      [y | bubble_pass([x | tail], n - 1)];
    else
      [x | bubble_pass([y | tail], n - 1)];
    end
  end

  defp bubble_pass(l, _), do: l;


  @doc """
    Sieve of Eratosthenes: find all the prime numbers up to a given integer
  """
  def get_primes(limit) when limit <= 1 do
    []
  end

  def get_primes(limit) do
    l = Enum.to_list(2..limit)  # Convert range to list
    sieve(l, 2)
  end

  defp sieve(l, prime) do
    # Base condition: stop if prime * prime > largest element in the list
    if prime * prime > List.last(l) do
      l;

    else

      filtered_list = Enum.filter(l, fn x -> x == prime || rem(x, prime) != 0 end)
      next_prime = Enum.find(filtered_list, fn x -> x > prime end)
      sieve(filtered_list, next_prime);
    end
  end
end


# Example usage
array = [64, 34, 25, 12, 22, 11, 90]
sorted_array = Algorithms.sort(array)
IO.inspect(sorted_array) # Output: [11, 12, 22, 25, 34, 64, 90]
