# 1-3 a: abcde
text = File.read("day2prob1input.txt")
text = elem(text, 1)
list = String.split(text, ["\n", "\r", "\r\n"])
pass = Enum.filter list, fn line ->
	line_items = String.split(line, " ")
	minmax = hd(line_items)
	line_items = tl(line_items)
	minmax = String.split(minmax, "-")
	min = String.to_integer(hd(minmax))
	max = String.to_integer(hd(tl(minmax)))
	letter = hd(line_items)
	line_items = tl(line_items)
	letter = String.trim(letter, ":")
	password = hd(line_items)
	#count = password |> String.graphemes() |> Enum.count(& &1 == letter)
	#count = password |> String.graphemes() |> Enum.count(&(fn &1 -> &1 == letter end))
	c = 0
	c = if String.at(password, min-1) == letter do
			c + 1
		else
			c
		end
	c = if String.at(password, max-1) == letter do
			c + 1
		else
			c
		end
	c == 1
	#IO.inspect min
	#IO.inspect max
	#IO.inspect letter
	#IO.inspect count
	#IO.inspect password
end
#IO.inspect pass
IO.inspect length pass