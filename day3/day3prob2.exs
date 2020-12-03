# ....#............#.###...#.#.#.
text = File.read("day3prob1input.txt")
text = elem(text, 1)
list = String.split(text, ["\n", "\r", "\r\n"])

defmodule Slope do
	def ski(list, x, y) do
		trees_pos_acc = Enum.reduce list, {0, 0, 0}, fn(line, acc) ->
			#IO.inspect line
			#IO.inspect acc
			#new_pos = elem(acc, 1) + x
			if (rem(elem(acc, y), y) != 0) do
				{elem(acc, 0), elem(acc, 1), elem(acc, 2)+1}
			end
			new_pos = if (elem(acc, 1) + x >= String.length(line)) do
				elem(acc, 1) + x - String.length(line)
			else
				elem(acc, 1) + x
			end
			if (String.at(line, elem(acc, 1)) == "#") do
				{elem(acc, 0)+1, new_pos, elem(acc, 2)+1}
			else
				{elem(acc, 0), new_pos, elem(acc, 2)+1}
			end
		end
		IO.inspect elem(trees_pos_acc, 0)
		elem(trees_pos_acc, 0)
	end
end

IO.inspect Slope.ski(list, 1, 1) * Slope.ski(list, 3, 1) * Slope.ski(list, 5, 1) * Slope.ski(list, 7, 1) * Slope.ski(list, 1, 2)

#v = Enum.reduce [1, 2, 3], {100, 1}, fn(num, acc) ->
#	if (elem(acc, 1) > 2) do
#		{num + elem(acc, 0), elem(acc, 1) - 100}
#	else
#		{num + elem(acc, 0), elem(acc, 1) + 1}
#	end
#end
#IO.inspect v