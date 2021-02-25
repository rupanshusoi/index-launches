import "regent"
local C = regentlib.c

task foo(r: region(ispace(int1d), int))
  where reads writes(r) do
  for pt in r do
    r[pt] += 1
  end
end

task main()
  var r = region(ispace(int1d, 1000), int)
  fill(r, 1)
  foo(r)
end
regentlib.start(main)
--regentlib.saveobj(main, 'main.out')
