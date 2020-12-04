text = File.read("day4prob1input.txt")
text = elem(text, 1)
list = String.split(text, ["\n\n", "\r\r"]) |> Enum.map(& String.replace(&1, "\n", " "))

list = Enum.filter list, fn(entry) ->
  7 == length Enum.filter ["byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:"], fn(field) ->
    entry =~ field
  end
end
IO.inspect length list
