local HttpService = game:GetService("HttpService");
local RandomNew = Random.new();

local DictionaryHelper = { };
DictionaryHelper.__index = DictionaryHelper;
local Changed = Instance.new("BindableEvent");

function DictionaryHelper.new()
	local t = {};
	setmetatable(t, DictionaryHelper);
	
	local mt = getmetatable(t);
	
	mt.__newindex = function(self, key, value)
		rawset(self, key, value);
		Changed:Fire(key, value);
	end;
	
	mt.__index = function(self, key)		
		-- impossible to detect changes on already made variables unfortunately
		-- for table helper functions
		if (rawget(DictionaryHelper, key)) then
			return DictionaryHelper[key];
		end;

		local value = rawget(self, key)
		Changed:Fire(key, value);
		return value;
	end;
	
	return t;
end

function DictionaryHelper:Watch(callback)
	-- this feature is limited atm
	-- Luau doesnt support the __index for our data that has already been indexed
	-- apparently said it will never be supported for performance issues
	-- oh well
	-- only limited to listening for new changes within the table created
	return Changed.Event;
end

return DictionaryHelper;