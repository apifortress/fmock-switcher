--[[
 ©2018 API Fortress

 Apache License
 Version 2.0, January 2004
]]

local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.fmock-switcher.access"
local FMockSwitcherHandler = BasePlugin:extend()

FMockSwitcherHandler.PRIORITY = 10

function FMockSwitcherHandler:new()
	FMockSwitcherHandler.super.new(self, "fmock-switcher")
end

function FMockSwitcherHandler:access(conf)
  FMockSwitcherHandler.super.access(self)
  access.execute(conf)
end

return FMockSwitcherHandler
