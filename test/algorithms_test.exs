defmodule AlgorithmsTest do
  use ExUnit.Case

  test "sorts an unsorted list" do
    assert Algorithms.sort([64, 34, 25, 12, 22, 11, 90]) == [11, 12, 22, 25, 34, 64, 90]
  end

  test "sorts an already sorted list" do
    assert Algorithms.sort([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
  end

  test "sorts an empty list" do
    assert Algorithms.sort([]) == []
  end

  test "sorts a single-element list" do
    assert Algorithms.sort([42]) == [42]
  end


  @doc """
    Tests for the Sieve of Eratosthenes
  """

  test "prime numbers up to 10" do
    assert Algorithms.get_primes(10) == [2, 3, 5, 7]
  end

  test "prime numbers up to 30" do
    assert Algorithms.get_primes(30) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  test "prime numbers up to 2" do
    assert Algorithms.get_primes(2) == [2]
  end

  test "prime numbers up to 1 should return empty list" do
    assert Algorithms.get_primes(1) == []
  end

  test "prime numbers up to 50" do
    assert Algorithms.get_primes(50) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
  end

  test "prime numbers up to a larger number like 100" do
    assert Algorithms.get_primes(100) == [
      2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97
    ]
  end


end
