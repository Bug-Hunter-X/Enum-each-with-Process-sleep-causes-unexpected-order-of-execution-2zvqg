```elixir
list = [1, 2, 3, 4, 5]

tasks = Enum.map(list, fn x ->
  Task.async(fn ->
    if x == 3 do
      Process.sleep(1000) # Simulate a long-running operation
    end
    {x, x} # Return the value
  end)
end)

results = Task.await_many(tasks)

Enum.each(results, fn {x, _} ->  IO.puts(x) end)
```