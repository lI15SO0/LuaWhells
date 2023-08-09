# Multi File Logger
Writen by lI15SO0 2023-08-10

---

# About

This is a utils for easily write log in multi file.

---

# Feature

- can write log in stdout and log files.
- use output tag to control the file(s) you want write.
- can make a file default.

---

# example

```lua
local loger = require("mflog")
loger.setup {
	info = "info.log",
	warn = "warn.log",
	err = "error.log",
	whatevername = { path = "justdoit.log", default = true }
}

local tags = loger.tags

loger.info("Test1")

loger.err {
	tags.info | tags.warn | tags.err | tags.whatevername,
	"Test all output"
}

loger.warn {
	tags.info | tags.warn | tags.whatevername,
	"Test for warn and not output to err"
}

loger.info {
	tags.nostdout | tags.info,
	"Test just output to info file."
}
```

```lua
local loger = require("mflog").setup {
	status = "status.log",
	logs = "logs.log",
	err = "error.log"
	v = {path = "verbose.log", default = true}
}

local tags = loger.tags

function somefunc(someargs ...) 
... somecode ...
end

status, result = pcall(somefunc, someargs...)
if status then
	loger.info {
		tags.logs,
		result
	}
else
	loger.warn {
		tags.err,
		result
	}
end

```
