--[[
 ©2018 API Fortress

 Apache License
 Version 2.0, January 2004
]]

local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.upstream-replace.access"
local UpstreamReplaceHandler = BasePlugin:extend()

UpstreamReplaceHandler.PRIORITY = 10

function UpstreamReplaceHandler:new()
	UpstreamReplaceHandler.super.new(self, "upstream-replace")
end

function UpstreamReplaceHandler:access(conf)
  UpstreamReplaceHandler.super.access(self)
  access.execute(conf)
end

return UpstreamReplaceHandler
