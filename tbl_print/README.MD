# Table print
Written by lI15SO0 2023-08-10

---

# About

Table struct printer.

---

# Feature

- can print table struce and datas.

---

## example

``` lua
require("tbl_print")

local table = {
	test1 = {
		"asdfg",
		name1 = "qwe"
	},
	1,
	2,
	"ff",
	{
		{},
		{"qwert"}
	}
}

tbl_print(table)
```

```
> lua test.lua
{
	1 = 1,
	2 = 2,
	3 = "ff",
	4 = {
		1 = {
		},
		2 = {
			1 = "qwert",
		},
	},
	test1 = {
		1 = "asdfg",
		name1 = "qwe",
	},
}
```
---
