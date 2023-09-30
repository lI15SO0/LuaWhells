local M = {}

function M.tbl_to_string(tbl)
	local result = ""
	local function _get(_tbl, floor)
		local indent = ""
		for _ = 0, floor do
			indent = indent .. "\t"
		end
		if _tbl == nil then
			return "nil"
		end
		for i, j in pairs(_tbl) do
			result = result .. indent .. i
			if type(j) == "table" then
				result = result .. " = {\n"
				_get(j, floor + 1)
				result = result .. indent .. "},\n"
			else
				result = result .. ' = ' .. tostring(j) .. ',\n'
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

return M
