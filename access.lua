--[[
 ©2018 API Fortress

 Apache License
 Version 2.0, January 2004
]]

local url = require "socket.url"
local zlib = require 'zlib'
local _M = {}

local function buildHostHeader(host,port)
  local hostHeader = host
  if port then
    hostHeader = hostHeader .. ":" .. port
  end
  return hostHeader
end

local function replaceHost(url_string, newHost)
  local pathIndex = url_string:find('[^/]/[^/]')
  if not pathIndex then
    if newHost:find('[^/]/[^/]') == nil and newHost:sub(#newHost) ~= "/" then
      return newHost .. "/"
    end
    return newHost
  end
  if newHost:sub(#newHost) == "/" then
    newHost = newHost:sub(1, -2)
  end
  local path = url_string:sub(pathIndex + 1)
  return newHost .. path
end

local function detectPort(explicitPort,scheme)
  if port then
    return port
  else
    if scheme=="https" then
      return 443
    end
  end
  return 80
end

function _M.execute(conf)
  local mock = ngx.req.get_headers()["x-mock"]
  if mock~=nil and mock=="true" then
    local u = url.parse(conf.replacement_url)
    local host = u.host
    local scheme = u.scheme
    local port = u.port
    port = detectPort(port,scheme)

    local hostHeader = buildHostHeader(host,u.port)
    ngx.req.set_header("Host", hostHeader)
    ngx.var.upstream_host = host
    ngx.ctx.balancer_address.host = host
    ngx.ctx.balancer_address.port = port
    ngx.var.upstream_uri = u.path
    ngx.var.upstream_scheme = scheme
  end
end

return _M
