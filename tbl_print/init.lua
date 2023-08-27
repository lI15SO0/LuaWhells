local M = {}

function M.tbl_to_string(tbl)
	local result = ""
	local function _get(_tbl, floor)
		local indent = ""
		for _ = 0, floor do
			indent = indent .. "\t"
		end
		for i, j in pairs(_tbl) do
			result = result .. indent .. i
			if type(j) == "table" then
				result = result .. " = {\n"
				_get(j, floor + 1)
				result = result .. indent .. "},\n"
			elseif type(j) == "string" then
				result = result .. ' = "' .. j .. '",\n'
			else
				result = result .. ' = ' .. j .. ',\n'
			end
		end
	end
	_get(tbl, 0)
	result = '{\n' .. result .. '}'
	return result
end

function M.tbl_print(tbl)
	print(M.tbl_to_string(tbl))
end

function tbl_print(tbl)
	print("This function will be removed in a few times, Pls use Module.tbl_print instade.")
	print(M.tbl_to_string(tbl))
end

return M
