

local function gameOver ()
composer.gotoScene ("menu", {time=800, effect= "crossFade"})
end 
local function onCollision (event)
    if (event.phase == "began") then 
        local obj1 = event.object1
        local obj2 = event.object2

        if ((obj1.myName == "Laser" and obj2.myName == "Asteroide") or
            (obj1.myName == "Asteroide" and obj2.myName == "Laser")) then 
                display.remove (obj1)
                display.remove (obj2)

                for i = #asteroidesTable, 1, -1 do
                    if (asteroidesTable[i] == obj1 or asteroidesTable[i] == obj2) then
                        table.remove (asteroidesTable, i)
                        break 
                    end -- if asteroidestable
                end -- for
            pontos = pontos + 100
            pontosText.text = "Pontos: " .. pontos

        elseif ((obj1.myName == "Nave" and obj2.myName == "Asteroide") or
                (obj1.myName == "Asteroide" and obj2.myName == "Nave")) then
                if (morto == false) then
                    morto = true

                        vidas = vidas -1
                        vidasText.text = "Vidas: " .. vidas

                        if (vidas == 0) then
                            display.remove (nave)
                            timer.performWithDelay (2000, gameOver)
                        else 
                            nave.alpha = 0

                timer.performWithDelay (1000, restauraNave)
                        end -- if vidas
                end -- if morto 
        end -- if myName
    end -- if event.phase
end -- function

--
-- Scene event function
--
--
-- create ()
function scene:create (event)

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    physics.pause ()

    backGroup = display.newGroup ()
    sceneGroup = Insert (backGroup)
    mainGroup = display.newGroup ()
    sceneGroup: insert (mainGroup)
    UIGroup = display.newGroup ()
    sceneGroup: insert (UIGroup)
    
    local bg = display.newImageRect (backGroup, "imagens/bg.png", 800, 1400)
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY
    
    nave = display.newImageRect (mainGroup, sprite, 4, 98, 79)
    nave.x = display.contentCenterX
    nave.y = display.contentHeight - 100
    physics.addBody (nave, "dynamic", {radius=30, isSensor=true})
    nave.myName = "Nave"

    vidasText = display.newText (UIGroup, "Vidas: " .. vidas, display.contentCenterX-150, display.contentHeight/2*0.1, native.systemFont, 36)
    pontosText = display.newText (UIGroup, "Pontos: " .. pontos, display.contentCenterX+30, display.contentHeight/2*0.1, native.systemFont, 36)

    nave:addEventListener ("tap", atirar)
    nave:addEventListener ("touch", moverNave)
end


-- show ()
function scene:show (event)

    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then
    -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif (phase == "did") then
        -- Code here runs when the scene entirely on screen.
        physics.start ()
        gameLoopTimer = timer.performWithDeLAY (700, gameLoop, 0)
        Runtime:addEventListener ("collision", onCollision)
    end
end 
    

-- hide ()
function scene:hide (event)

    local sceneGroup = self.view
    local phase = event.phase

    if (phase == "will") then 
        -- Code here runs when the scene is on screen (but is about to go off screeen)
        timer.cancel (gameLoopTimer)
    
    elseif (phase == "did") then
    -- Code here runs imediately after the scene goes entirely off screen
   Runtime:removeEventListener ("collision", onCollision) 
   physics.pause ()
   composer.removeScene ("game")
   end
end




--  show ()
function scene:show (event)



-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

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
end