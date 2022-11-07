-- minimal hammerspoon config
-- created at 2022-05-01

local obj = {}
obj._metadata = {
    name = 'My Minimal Hammerspoon Config',
    version = '1.2.3-0503',
    author = 'anonymous',
    homepage = '',
    license = 'MIT - https://opensource.org/licenses/MIT',
}

obj.cfg = {
    autoReloadConfig = true,
    showClock = true,
    appmap = {
        a = 'App Store',
        b = 'Safari',
        c = 'Visual Studio Code',
        --d = 'TickTick',
        d = 'Eudic',
        e = 'Emacs',
        f = 'Finder',
        g = 'Google Chrome',
        h = 'Hammerspoon',
        --i = 'iTerm',
        --j = 'Activity Monitor',
        --k = 'Shortcuts',
        --l = 'Launchpad',
        m = 'QQMusic',
        n = 'Notion',
        --o = 'Microsoft Outlook',
        o = 'Obsidian',
        p = 'Photos',
        q = 'QQ',
        r = 'Reminders',
        s = 'System Preferences',
        t = 'iTerm',
        --u = 'Eudic',
        v = 'MacVim',
        w = 'WeChat',
        x = 'XMind',
        y = 'Mail',
        --z = 'System Preferences'
    },
    keymap = {
        appLauncher = {'alt', 'a'},
        help = {'alt', '/'}
    },
    spoons = {
        -- 'SPoonInstall',
        -- 'KSheet',
        -- 'Calendar',
        -- 'HCalendar',
        -- 'ClipboardTool',
        -- 'WinWin',
        -- 'CountDown',
        -- 'FnMate',
    }
}


--========== methods ==========--
function obj:init()
    obj.daemons = {}
    obj.canvases = {}

    for k,v in pairs(obj._metadata) do obj[k] = v end
    for _,v in ipairs(obj.cfg.spoons) do hs.loadSpoon(v) end
    return self
end

function obj:start()
    if obj.cfg['autoReloadConfig'] then obj:_setupReloadConfig() end
    if obj.cfg['showClock'] then obj:_toggleClock() end
    obj:_setupAppLauncher()
    return self
end

function obj:stop()
    return self
end

function obj:bindHotkeys(mapping)
    local def = {
        help = function () obj:_toggleHelp() end
    }
    for k, v in pairs(mapping) do
        if k == 'help' then hs.hotkey.bind(v[1], v[2], def[k]) end
    end
    return self
end

function obj:_setupReloadConfig()
    local function notifyAndReload()
        hs.notify.new({title="Hammerspoon", informativeText="Config reloaded."}):send()
        hs.reload() 
    end

    obj.daemons['cfgWatcher'] = hs.pathwatcher.new(hs.configdir, notifyAndReload):start()
end

function obj:_toggleClock(bool)
    local ctimer = obj.daemons['ctimer']
    if ctimer and ctimer:running() then
        if not bool then
            ctimer:stop()
            ctimer = nil
            obj.canvases['ccanvas']:hide()
        end
    elseif bool ~= false then
        local mainRes = hs.screen.primaryScreen():fullFrame()
        local ccanvas = hs.canvas.new({x=0, y=mainRes.h - 60*2, w=200, h=60*2}):appendElements(
            {
                type = 'rectangle',
                action = 'fill',
                fillColor = {red=0, blue=0, green=0, alpha=0}
            },
            {
                type = 'text',
                text = os.date('%a %b %e'),
                textSize = 20,
                textColor = {hex='#1891C3'},
                textAlignment = 'left',
                frame = {x=10, y=30, w=200, h=60}
            },
            {
                type = 'text',
                text = os.date('%H:%M'),
                textSize = 40,
                textColor = {hex='#1891C3'},
                textAlignment = 'left',
                frame = {x=10, y=60, w=120, h=60}
            }
        )
        ccanvas:bringToFront(true)
        ccanvas:behavior(hs.canvas.windowBehaviors.canJoinAllSpaces)
        ccanvas:show()
        obj.canvases['ccanvas'] = ccanvas
        ctimer = hs.timer.doEvery(20, function()
            ccanvas[2].text = os.date('%a %b %e')
            ccanvas[3].text = os.date('%H:%M')
        end)
        obj.daemons['ctimer'] = ctimer
    end
end

function obj:_setupAppLauncher()
    local id = 'appLauncher'
    local keys = obj.cfg.keymap[id]
    local cmodal = hs.hotkey.modal.new(keys[1], keys[2], string.format('Entered %s mode', id))
    -- function cmodal:entered() hs.alert(string.format('Entered %s mode', id)) end
    -- function cmodal:exited()  hs.alert(string.format('Exited %s mode', id))  end
    cmodal:bind('', 'escape', string.format('Exited %s mode', id), function() cmodal:exit() end)

    cmodal:bind('alt', '/', function ()
        obj:_toggleHelp(obj.cfg['appmap'])
    end)

    for k, v in pairs(obj.cfg['appmap']) do
        cmodal:bind('', k, function()
            hs.application.launchOrFocus(v)
        end)
    end
end

function obj:_toggleHelp(data)
    local hcanvas = obj.canvases['hcanvas']
    if hcanvas and hcanvas:isShowing() then
        hcanvas:hide()
    else
        local mainRes = hs.screen.primaryScreen():fullFrame()
        local hcanvas = hs.canvas.new({x=(mainRes.w-600)/2, y=(mainRes.h-700)/2, w=600, h=700}):appendElements(
            {
                type = "rectangle",
                action = "fill",
                fillColor = {hex = "#EEEEEE", alpha = 0.95},
                roundedRectRadii = {xRadius = 10, yRadius = 10},
            },
            {
                type = 'text',
                text = hs.inspect(data or obj.cfg.keymap) .. '\n\n 😄',
                textSize = 20,
                textColor = {hex = "#2390FF", alpha = 1},
                textAlignment = 'left',
            }
        )
        hcanvas:show()
        obj.canvases['hcanvas'] = hcanvas
    end
end


--========== main ==========--
obj:init():bindHotkeys(obj.cfg.keymap):start()
return obj
