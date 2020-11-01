import "regent"

local format = require("std/format")
local C = regentlib.c
 
local size = 1e3
 
task foo(r : region(ispace(int1d), int)) where reads writes(r) do 
end
 
task main()
  var r = region(ispace(int1d, size), int)
  fill(r, 1)
  var p = partition(equal, r, ispace(int1d, size))
 
  var itime : uint64
  var ftime : uint64
 
  for i = 0, 11 do
    if i == 1 then
      __fence(__execution, __block)
      itime = C.legion_get_current_time_in_micros()
    end
    __demand(__index_launch)
    for i in p.colors do
      foo(p[i/1])
    end
  end
  __fence(__execution, __block)
  ftime = C.legion_get_current_time_in_micros()
 
  format.println("Experiment took {} us", ftime - itime)
end
--regentlib.start(main)
regentlib.saveobj(main, 'empty.out')
