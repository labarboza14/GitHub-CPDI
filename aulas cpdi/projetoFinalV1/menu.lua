
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local function gotoGame ()
	composer.gotoScene ("game")
end

local function gotoRecordes ()
	composer.gotoScene ("recordes")
end
-----
-- Funções de evento de cena
----------

-- create ()
function scene:create (event)

	local sceneGroup = self.view
	--Code here run the scene is first created but not yet appeared on screen
	local bg = display.newImageRect (sceneGroup,"imagens/bg.png", 800, 1400)
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY

	local titulo = display.newImageRect (sceneGroup, "imagens/title.png", 500, 80)
	titulo.x = display.contentCenterX
	titulo.y = 200

	local play = display.newText (sceneGroup, "Play", display.contentCenterX, 700, native.systemFont, 44)
	play:setFillColor (0.82, 0.86, 1)

	local recordes = display.newText (sceneGroup, "Recordes", display.contentCenterX, 810, native.systemFont, 44)
	recordes:setFillColor (0.75, 0.76, 1 )

	play:addEventListener ("tap", gotoScene)
	recordes:addEventListener ("tap", gotoRecordes)
end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
