-- The Löve 2D framework https://love2d.org/
_G.love = require("love")

-- github.com/Ulydev/push (for scaling the window and fullscreen mode)
_G.push = require("lib.push")

function love.load()
    math.randomseed(os.time())

    _G.debug = false

    _G.background = love.graphics.newImage("assets/forest.png")

    -- Graphics options
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setLineWidth(2)

    love.graphics.setFont(love.graphics.newFont("assets/font.ttf", 16))

    -- Hide the mouse cursor
    love.mouse.setVisible(false)

    -- set up push for window scaling
    local window_width, window_height = love.graphics.getDimensions()

    push:setupScreen(240, 135, window_width, window_height, {
        fullscreen = false,
        resizable = true,
        highdpi = false,
        canvas = true,
        pixelperfect = false,
    })
end

-- pass keyboard events to the editor
function love.keypressed(key)
    if key == "d" then
        debug = not debug
    elseif key == "escape" then
        love.event.quit()
    end
end

-- when the window is resized we pass the new dimensions to push so it knows how to scale
-- called by Löve on window resized event
function love.resize(w, h)
    push:resize(w, h)
end

function love.update(dt)

end

local function draw_debug()
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", 0, 0, 100, 50)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 2, 2)
    love.graphics.print("Memory: " .. tostring(string.format("%.2f", collectgarbage("count") / 1024)) .. "MB", 2, 18)
end

function love.draw()
    -- clear the screen
    love.graphics.clear(0.1, 0.1, 0.1, 1)

    -- start the auto-scaler
    push:apply("start")

    -- draw the background
    love.graphics.draw(background, 0, 0)

    -- draw the debug info
    if debug then
        draw_debug()
    end

    -- stop the auto-scaler
    push:apply("end")
end
