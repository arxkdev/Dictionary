local HttpService = game:GetService("HttpService");
local Dictionary = require(script.Parent.Parent);

-- Create a new dictionary
local People = Dictionary.new();

-- Watch the dictionary for changes
People:Watch():Connect(function(key, value)
    -- Print the key and value of the dictionary when it changes
    print(
        "[Watch function] Dictionary changed: " .. key .. " = " .. HttpService:JSONEncode(value)
    );
end);

-- Add some values to the dictionary
People.Person1 = {Name = "Bob"; Age = 20};
People.Person2 = {Name = "Alice"; Age = 21};
People.Person3 = {Name = "John"; Age = 22};
People.Person4 = {Name = "Jane"; Age = 23};
print("People: " .. HttpService:JSONEncode(People));

-- Remove a value from the dictionary
People.Person2 = nil;
print("People: " .. HttpService:JSONEncode(People));

-- Get the size of the dictionary
print("People size: " .. People:GetSize());

-- Iterate over the dictionary
People:Each(function(key, value)
    print(
        "[Each function]: Key: " .. key .. " Value: " .. HttpService:JSONEncode(value)
    );
end);

-- Get the keys of the dictionary
local Keys = People:Keys();
print("[Keys function] People keys: " .. HttpService:JSONEncode(Keys));

-- Get a random key from the dictionary
local RandomKey, RandomValue = People:Random();
print(
    "[Random function] Random key: " .. RandomKey .. " Random value: " .. HttpService:JSONEncode(RandomValue)
);

-- Encode the dictionary to JSON
local JSON = People:Encode();
print(
    "[Encode function] JSON: " .. JSON
);

-- Decode the dictionary from JSON
local Decoded = People:Decode(JSON);
print(
    "[Decode function] Decoded: " .. HttpService:JSONEncode(Decoded)
);

-- Map the dictionary
local Mapped = NewTable:Map(function(index, value)
	return (index .. " cool");
end)
print(Mapped.join("-"));

-- Filter the dictionary
local Filtered = NewTable:Filter(function(index, value)
    return (index == "Person1");
end)

-- Slice the dictionary
local Sliced = NewTable:Slice(0, 2);
print(Sliced);

-- Clear the dictionary
People:Clear();