local foreach = table.foreach
local insert = table.insert

local newindexableKey = {
    clear = true;
    clone = true;
    concat = true;
    create = true;
    find = true;
    foreach = true;
    foreachi = true;
    freeze = true;
    getn = true;
    insert = true;
    isfrozen = true;
    maxn = true;
    move = true;
    pack = true;
    remove = true;
    sort = true;
    unpack = true;

    assemble = true;
    sorts = true;
}

local tablePlus = setmetatable({}, {
    __metatable = "locked";
    __newindex = function(self, k, v)
        if not newindexableKey[k] then
            -- error
            return
        end
        if rawget(self, k) then
            -- error
            return
        end
        rawset(self, k, v)
    end
})

for k, v in table do
    tablePlus[k] = v
end

function tablePlus.assemble(...: table?)
    local result = {}
    local i = 1
    for k, v in { ... } do
        if type(v) == "table" then
            for K, V in v do
                result[K] = V
            end
        else
            result[i] = v
            i += 1
        end
    end
    return result
end
function tablePlus.sorts(t: table)
    -- TODO: do this.
end