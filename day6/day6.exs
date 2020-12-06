# abc = 3
#
# a
# b
# c = 3
#
# abc
# abx
# aby = 5

text = File.read("day6input.txt")
text = elem(text, 1)
list = String.split(text, ["\n\n", "\r\r"])

list = list |> Enum.map(& String.replace(&1, "\n", ""))

uniques = list |> Enum.map(& String.graphemes(&1)) |> Enum.map(& MapSet.new(&1))

uniques_length = uniques |> Enum.map(& MapSet.size(&1))

# sum = Enum.reduce uniques_length, 0, fn elem, acc -> acc + elem end
sum = uniques_length |> Enum.reduce(& &1 + &2)

IO.inspect sum

# IO.inspect hd uniques
# IO.inspect hd uniques_length
# IO.inspect hd list
