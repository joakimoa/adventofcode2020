defmodule Passport do
  def valid(entry) do
    m = Enum.filter ["byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:"], fn(field) ->
      # IO.inspect entry
      # IO.inspect field
      entry =~ field
    end
    # if (7 == length m) do
    #   IO.inspect entry
    # end
    7 == length m
  end
end

text = File.read("day4prob1input.txt")
text = elem(text, 1)
list = String.split(text, ["\n\n", "\r\r"]) |> Enum.map(& String.replace(&1, "\n", " "))
# IO.inspect list
# trees_pos_acc = Enum.reduce list, {0, 0}, fn(line, acc) ->
# fields = ["byr:", "iyr:"]
# list = Enum.filter list, & Passport.valid(&1)

valid = Enum.reduce list, 0, fn(entry, acc) ->
  if (Passport.valid entry) do
    acc + 1
  else
    acc
  end
end
IO.inspect valid
