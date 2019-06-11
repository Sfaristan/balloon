local tapCount = 0
local levelUp = 22

--Adding background
local background = display.newImageRect( "background.png", display.contentWidth, display.contentHeight )
background.x = display.contentCenterX
background.y = display.contentCenterY

--Adding platform
local platform = display.newImageRect( "platform.png", display.contentWidth, 300 )
platform.x = display.contentCenterX
platform.y = display.contentHeight-80

--Adding balloon
local balloon = display.newImageRect( "balloon.png", 300, 300 )
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY-350
balloon.alpha = 0.7

--кружок під лвли
local levelCircle = display.newCircle(display.contentCenterX-340, 50, 120):setFillColor( 244/255, 131/255, 66/255 )

--положення значень тапів і лвлів
local tapText = display.newText( tapCount, display.contentCenterX, 150, native.systemFont, 128 )
local levelValue = display.newText( levelUp, display.contentCenterX-300, 80, native.systemFont, 100 )

--Physics
local physics = require("physics")
physics.start()

physics.addBody( platform, "static", {radius = 80} )
physics.addBody( balloon, "static", {radius = 50, bounce = 0.5} )

--тапання по шарику і лвли
local function pushBalloon()
    balloon:applyLinearImpulse(0, -0.7, balloon.x, balloon.y)
    tapCount = tapCount + 1
    tapText.text = tapCount
    if tapCount == 5 then
      levelUp = levelUp + 1
      levelValue.text = levelUp
      tapCount = 0
    end
end

balloon:addEventListener("tap", pushBalloon)
