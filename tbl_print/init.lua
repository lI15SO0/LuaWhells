function tbl_print(tbl)
	local result = ""
	local function _print(_tbl, floor)
		local indent = ""
		for i = 0, floor do
			indent = indent .. "\t"
		end
		for i, j in pairs(_tbl) do
			result = result .. indent .. i
			if type(j) == "table" then
				result = result .. " = {\n"
				_print(j, floor + 1)
				result = result .. indent .. "},\n"
			elseif type(j) == "string" then
				result = result .. ' = "' .. j .. '",\n'
			else
				result = result .. ' = ' .. j .. ',\n'
			end
		end
	end
	_print(tbl, 0)
	result = '{\n' .. result .. '}'
	print(result)
end
