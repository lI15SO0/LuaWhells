
-- Tag 1 used by stfout
local Logger = {
	setupd = false,
	tags = {nostdout = 1},
	logfiles = {},
	defaulttag = 2,
}

function Logger.setup(settings)
	local tag = 2
	for i, j in pairs(settings) do
		Logger.tags[i] = tag

		if type(j) == "table" then
			Logger.logfiles[i] = {tag = tag, path = j.path}
			if j.default == true then
				Logger.defaulttag = tag
			end

		elseif type(j) == "string" then
			Logger.logfiles[i] = {tag = tag, path = j}
		end

		tag = tag * 2
	end
	Logger.setupd = true
	return Logger
end

function Logger.output(msg, mode)
	if Logger.setupd then

		for _, f in pairs(Logger.logfiles) do
			if (mode & f.tag) ~= 0 then

				local file = io.open(f.path, 'a')
				if file == nil then
					print("[Warn] Logfile " .. f.path .. " can not open.")
				else
					file:write(msg .. '\n')
					file:flush()
					file:close()
				end
			end
		end

		if (mode & 1) == 0 then
			print(msg)
		end

	else
		print("[Warn] Logger may not setup.")
	end
end

function Logger.write(mote, msg)
	if type(msg) ~= "table" then
		msg = mote .. msg
		Logger.output(msg, Logger.defaulttag)
	else
		local mode
		local mstr
		if type(msg[1]) == "number" then
			mode = msg[1]
			mstr = msg[2]
		else
			mode = msg[2]
			mstr = msg[1]
		end
		mstr = '[Info] ' .. mstr
		Logger.output(mstr, mode)
	end
end

function Logger.info(msg)
	Logger.write("[Info] ", msg)
end

function Logger.warn(msg)
	Logger.write("[Warn] ", msg)
end

function Logger.err(msg)
	Logger.write("[Err] ", msg)
end

function Logger.log(msg)
	Logger.write("", msg)
end

return Logger
