# find triplets in input whose sum is 2020, then calculate their product
text = File.read("day1prob1input.txt")
text = elem(text, 1)
list = String.split(text, ["\n", "\r", "\r\n"])
list = list |> Enum.map(&String.to_integer/1)
Enum.each list, fn elemA ->
	Enum.each tl(list), fn elemB ->
		Enum.each tl(tl(list)), fn elemC ->
			if elemA + elemB + elemC == 2020 do 
				IO.inspect elemA
				IO.inspect elemB
				IO.inspect elemC
				IO.inspect elemA * elemB * elemC
			end
		end
	end
end