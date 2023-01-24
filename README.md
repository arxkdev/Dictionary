# Dictionary
Similar to Array [https://github.com/Kumarion/Array]
Only difference is its only for dictionaries.

Based off the array prototype in JavaScript. (Will see similar methods)

# Example
```lua
-- Init the array
local People = Dictionary.new();

People.Person1 = {Name = "Bob"; Age = 20};
People.Person2 = {Name = "Alice"; Age = 21};
People.Person3 = {Name = "John"; Age = 22};
People.Person4 = {Name = "Jane"; Age = 23};

-- Size
print(People:GetSize()); -- Result: 4

-- Each
People:Each(function(key, value)
    print(
        "[Each function]: Key: " .. key .. " Value: " .. HttpService:JSONEncode(value)
    );
end);

-- Keys
local Keys = People:Keys();
print("[Keys function] People keys: " .. HttpService:JSONEncode(Keys));

-- You get it..
```

Might not work fully as I'm still working on it.