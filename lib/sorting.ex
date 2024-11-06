defmodule Sorter do


    @doc """
        bubblesort: this will go through all elements in the list and compare them, repeat the process until all comparisons return valid.
        complexity: O(n²)
    """

    def bubble(list) do
        list
        |> Enum.reduce({[], false}, &bubble_step/2)
        |> handle_bubble_result(list)
    end

    defp bubble_step(a, {[], _swapped}) do
        {[a], false}
    end

    defp bubble_step(a, {sorted, swapped}) do
        [b | rest] = sorted

        if a <= b do
            {[a, b | rest], swapped}
        else
            {[b, a | rest], true}
        end
    end

    defp handle_bubble_result({sorted, true}, original_list) when sorted != original_list do
        bubble(sorted)
    end

    defp handle_bubble_result({sorted, _}, _original_list), do: sorted

end
