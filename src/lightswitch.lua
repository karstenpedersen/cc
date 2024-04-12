local input = ""
local state = false
local side = "left"

redstone.setOutput(side, state)

while true do
  term.clear()
  term.setCursorPos(1, 1)
  if state then
    print("Press L to turn off")
  else
    print("Press L to turn on")
  end
  print("Press Q to exit")

  _, input = os.pullEvent("char")
  input = string.upper(input)

  if input == "L" then
    state = not state
    redstone.setOutput(side, state)
  elseif input == "Q" then
    term.clear()
    break
  end
end
