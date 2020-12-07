defmodule Deps do
  # list, set, set
  def find_dependents(source, processed, targets) do
    if (MapSet.size(targets) == 0) do
      processed
    else
      targets_list = MapSet.to_list(targets)
      h = hd targets_list
      t = tl targets_list

      # filter out the target from the source list
      source = Enum.filter source, fn(e) ->
        left = hd String.split(e, [" bags contain"])
        !(left =~ h)
      end

      new_targets = Enum.filter(source, fn(e) ->
        e =~ h
      end)

      new_targets = Enum.map new_targets, fn(e) ->
        hd String.split(e, [" bags contain"])
      end
      # IO.puts "\nh : "
      # IO.inspect h
      # IO.puts "t : "
      # IO.inspect t
      # IO.puts "new_targets : "
      # IO.inspect new_targets
      find_dependents(source, MapSet.put(processed, h), MapSet.new(t ++ new_targets))
    end
  end
end

text = File.read("day7input.txt")
text = elem(text, 1)
list = String.split(text, ["\n", "\r"])

# IO.inspect hd list
IO.inspect (MapSet.size Deps.find_dependents(list, MapSet.new(), MapSet.new(["shiny gold"]))) - 1
