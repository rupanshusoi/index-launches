import "regent"
 
local C = regentlib.c
local pow = regentlib.pow(double)
 
local colors = 1e3
 
__demand(__inline)
task expr(i : int64) return 1 end
--task expr(i : int64) return i end
--task expr(i : int64) return i%3 end
--task expr(i : int64) return i%3 end
 
__demand(__inline)
task check()
  var bitmask : bool[colors]
  for i = 0, colors do bitmask[i] = false end
 
  var value : int64
  var conflict = false
  for i = 0, colors do
    value = expr(i)
    if value < colors then -- bounds check
      conflict = bitmask[value]
      bitmask[value] = true
      if conflict then break end
    end
  end
end
 
task main()
  var itime = C.legion_get_current_time_in_micros()
  check()
  __fence(__execution, __block)
  var ftime = C.legion_get_current_time_in_micros()
  C.printf("%lld\n", ftime - itime)
end
regentlib.start(main)
