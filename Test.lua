local HttpService = game:GetService("HttpService");
local Dictionary = require(script.Parent.Parent);

-- Create a new dictionary
local People = Dictionary.new();

-- Watch the dictionary for changes
People:Watch():Connect(function(key, value)
    -- Print the key and value of the dictionary when it changes
	print(
        "Dictionary changed: " .. key .. " = " .. HttpService:JSONEncode(value)
    );
end);