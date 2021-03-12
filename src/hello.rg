import "regent"

local format = require("std/format")
 
task main()
  format.println("Hello World!")
end
--regentlib.start(main)
regentlib.saveobj(main, 'hello.out')
