--[[ TOC ]]--
-- 1. Helper Functions
-- 2. Exported vim* QoL functions


--[[=======================================================================]]--
--[[ Helpers                                                               ]]--
--[[=======================================================================]]--
function tableMerge(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

local function default_to(table, defaults)
  for k, v in pairs(defaults) do
    if table[k] == nil then
      table[k] = v
    end
  end
end

--[[=======================================================================]]--
--[[ QoL Fns                                                               ]]--
--[[=======================================================================]]--

-- Termcode string
function t(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

-- Merge all opts from t2 into the `vim` table.
function addVimOpts(t2) tableMerge(vim, t2) end

function addVimBinds(bindList)
  for i, binds in pairs(bindList) do
    if binds[4] == nil then
      binds[4] = {}
    end
    binds[1] = t(binds[1])
    default_to(binds[4], { noremap = true, silent = true, })
    vim.api.nvim_set_keymap(unpack(binds))
  end
end
