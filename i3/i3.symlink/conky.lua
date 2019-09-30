function gradient_red(min, max, val)
  local min = tonumber(min)
  local max = tonumber(max)
  local val = tonumber(val)
  if (val > max) then val = max end
  if (val < min) then val = min end

  local v = val - min
  local d = (max - min) * 0.5
  local red, green

  if (v <= d) then
    red = math.floor((255 * v) / d + 0.5)
    green = 255
  else
    red = 255
    green = math.floor(255 - (255 * (v-d)) / (max - min - d) + 0.5)
  end

  return string.format("%02x%02x00", red, green)
end

function conky_cpu (cpun)
    local val = tonumber(conky_parse("${cpu " .. cpun .. "}"))
    if val == nil then val = 0 end
    return "\"full_text\" : \"".. val  .. "%\", \"color\": \"\\#".. gradient_red(0, 100, val)  .. "\""
end
