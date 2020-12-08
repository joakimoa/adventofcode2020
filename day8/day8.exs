defmodule Gameboy do
  # return: Immediately before any instruction is executed a second time, what value is in the accumulator?
  def recursion_debug(instructions) do
    execute(instructions, 0, 0, MapSet.new())
  end

  defp execute(ins, pos, acc, vis) do
    # IO.inspect {elem(ins, pos), pos, acc, vis}
    if (MapSet.member?(vis, pos)) do
      acc
    else
      vis = MapSet.put(vis, pos)
      {pos, acc} = case elem(ins, pos) do
        {"jmp", new_pos} -> {pos + String.to_integer(new_pos), acc}
        {"acc", acc_amount} -> {pos + 1, acc + String.to_integer(acc_amount)}
        {"nop", _} -> {pos + 1, acc}
      end
      # IO.inspect {pos, acc, vis}
      execute(ins, pos, acc, vis)
    end
  end
end

text = File.read("day8input.txt")
text = elem(text, 1)
list = String.split(text, ["\r\n", "\n"])

instructions = Enum.map list, fn(elem) ->
  List.to_tuple(String.split(elem, " "))
end

instructions = List.to_tuple(instructions)

IO.inspect Gameboy.recursion_debug(instructions)
