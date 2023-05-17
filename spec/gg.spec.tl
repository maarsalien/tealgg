
local v = gg.getValues({{address = 0x100,flags = 4,type = 4,count = 1}})
if v is string then error("Failed to read value") end
