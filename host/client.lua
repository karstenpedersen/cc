-- pastebin get 5YqgMWrX localhost
local vars = {...}

local function usage(command)
  local start = "[USAGE]: "
  local last = ''
  if command == 'get' then last = 'localhost get [PORT] [FILENAME]'
  elseif command == 'run' then last = 'localhost run [PORT] [ARGS]'
  else last = '\n localhost get [PORT] [FILENAME] \n localhost run [PORT] [ARGS]' end
  print(start .. last)
end

local function getFile(port)
  print("Connecting to " .. "localhost:" .. port .. "...")
  local req = http.get("http://127.0.0.1:" .. port)
  if req == nil then
    print("Cannot connect to port " .. port .. "!")
    return nil
  end

  local content = req.readAll()
  req.close()
  return content
end

local function runFile(file, port, fVars)
  local func, err = load(file, port, "t", _ENV)
  if not func then
    printError(err)
    return
  end
  local succ, msg = pcall(func, select(3,unpack(fVars)))
  if not succ then printError(msg) end
end

local function saveFile(file, filename)
  local f = fs.open(filename, "w")
  f.write(file)
  f.close()
end

--Startup
if #vars < 2 then
  usage(nil)
  return
end
local port = vars[2]
local command = vars[1]
local file = getFile(port)
if file == nil then
  return
end
if command == 'get' then
  if #vars ~= 3 then
    usage(command)
  else
    saveFile(file, vars[3])
  end
end
if command == 'run' then
 if #vars < 2 then
   usage(command)
 else
   runFile(file, port, vars)
 end
end
