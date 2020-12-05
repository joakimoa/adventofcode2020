# FBFBBFFRLR = row 44, column 5
# FBFBBFF = row 44 (0-127)
# RLR = column 5 (0-7)
# 44 * 8 + 5 = ID 357

defmodule Boarding do
  def row(s) do
    s = s |> String.graphemes()
    s = Enum.reduce s, {0, 127}, fn(c, {lower, upper}) ->
      if c == "F" do
        {lower, upper - Integer.floor_div((upper - lower), 2) - 1}
      else
        {lower + Integer.floor_div(upper - lower, 2) + 1, upper}
      end
    end
    elem(s, 1)
  end

  def col(s) do
    s = s |> String.graphemes()
    s = Enum.reduce s, {0, 7}, fn(c, {lower, upper}) ->
      if c == "L" do
        {lower, upper - Integer.floor_div((upper - lower), 2) - 1}
      else
        {lower + Integer.floor_div(upper - lower, 2) + 1, upper}
      end
    end
    elem(s, 1)
  end

  def id(s) do
    (row(String.slice(s, 0..6)) * 8) + col(String.slice(s, 7..9))
  end

end

text = File.read("day5input.txt")
text = elem(text, 1)
list = String.split(text, ["\n", "\r"])

# IO.inspect String.slice(hd(list), 0..6)
# IO.inspect String.slice(hd(list), 7..9)

# IO.inspect Boarding.row(hd(list))
# # IO.inspect Boarding.row("FBFBBFF")
# IO.inspect Boarding.row("FBFBBFF")
# IO.inspect Boarding.col("RLR")
# IO.inspect Boarding.id("FBFBBFFRLR")

ids = Enum.map list, &{Boarding.id(&1)}
# IO.inspect ids

highest = Enum.reduce ids, 0, fn elem, acc -> max elem, acc end
IO.inspect highest
