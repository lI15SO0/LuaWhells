local M = {}

function M.tbl_flatten(tbl)
	local result = {}
	local function _tbl_flatten(_tbl)
		for i, j in pairs(_tbl) do
			if type(j) == "table" then
				_tbl_flatten(j)
			else
				result[i] = j
			end
		end
	end
	_tbl_flatten(tbl)
	return result
end

function tbl_flatten(tbl)
	print("This function will be removed in a few times, Pls use Module.tbl_flatten instade.")
	local result = {}
	local function _tbl_flatten(_tbl)
		for i, j in pairs(_tbl) do
			if type(j) == "table" then
				_tbl_flatten(j)
			else
				result[i] = j
			end
		end
	end
	_tbl_flatten(tbl)
	return result
end


return M
