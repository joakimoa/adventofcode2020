# ....#............#.###...#.#.#.
text = File.read("day3prob1input.txt")
text = elem(text, 1)
list = String.split(text, ["\n", "\r", "\r\n"])
trees_pos_acc = Enum.reduce list, {0, 0}, fn(line, acc) ->
	#IO.inspect line
	#IO.inspect acc
	#new_pos = elem(acc, 1) + 3
	new_pos = if (elem(acc, 1) + 3 >= String.length(line)) do
		elem(acc, 1) + 3 - String.length(line)
	else
		elem(acc, 1) + 3
	end
	if (String.at(line, elem(acc, 1)) == "#") do
		{elem(acc, 0)+1, new_pos}
	else
		{elem(acc, 0), new_pos}
	end
end
IO.inspect trees_pos_acc
#v = Enum.reduce [1, 2, 3], {100, 1}, fn(num, acc) ->
#	if (elem(acc, 1) > 2) do
#		{num + elem(acc, 0), elem(acc, 1) - 100}
#	else
#		{num + elem(acc, 0), elem(acc, 1) + 1}
#	end
#end
#IO.inspect v