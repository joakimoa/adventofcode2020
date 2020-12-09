defmodule Gameboy do
  # return acc when recursion is found
  def acc_when_recursion(instructions) do
    execute(instructions, 0, 0, MapSet.new())
  end

  # return acc with a single swapped jmp or nop and program exits
  def acc_when_correcting(instructions) do
    execute_correcting(instructions, 0, 0, MapSet.new(), 4) # hard-coded first swp...
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
      execute(ins, pos, acc, vis)
    end
  end

  defp execute_correcting(ins, pos, acc, vis, swp) do
    # IO.inspect {elem(ins, pos), pos, acc, vis, swp}
    # IO.inspect {pos, tuple_size(ins)}
    if (pos >= tuple_size(ins)) do
      acc #1245
    else
      if (MapSet.member?(vis, pos)) do
        # branch, new jmp to nop or nop to jmp
        {_, swp} = Enum.with_index(Tuple.to_list(ins))
          |> Enum.find(&( elem(&1, 1) > swp && String.contains?(elem(elem(&1, 0),0), ["jmp", "nop"]) ))
        execute_correcting(ins, 0, 0, MapSet.new(), swp)
      else
        vis = MapSet.put(vis, pos)
        # {pos, acc} = case elem(ins, pos) do
        {pos, acc} = case {elem(ins, pos), pos == swp} do
          {{"jmp", new_pos}, false} -> {pos + String.to_integer(new_pos), acc}
          {{"acc", acc_amount}, false} -> {pos + 1, acc + String.to_integer(acc_amount)}
          {{"nop", _}, false} -> {pos + 1, acc}
          {{"jmp", _}, true} -> {pos + 1, acc}
          {{"nop", new_pos}, true} -> {pos + String.to_integer(new_pos), acc}
        end
        execute_correcting(ins, pos, acc, vis, swp)
      end
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

IO.inspect Gameboy.acc_when_recursion(instructions)
IO.inspect Gameboy.acc_when_correcting(instructions)
