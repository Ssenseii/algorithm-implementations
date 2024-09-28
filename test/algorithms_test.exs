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
end
