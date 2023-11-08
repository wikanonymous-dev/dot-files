local has = function (x)
	return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_windows = has "win32"

if is_mac then
	require('weecode.os.macos')
end

if is_windows then
	require('weecode.os.windows')
end

require("weecode.core.base")
require("weecode.core.map")
require("weecode.lazy")
