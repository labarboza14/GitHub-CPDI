local physics = require ("physics")

physics.start ()

physics.setGravity (0, 0)

physics.setDrawMode ("normal")
display.setStatusBar (display.HiddenStatusBar)

local grupoBg = display.newGroup() 
local grupoMain = display.newGroup() 
local grupoUI = display.newGroup()

local pontos = 0
local vidas = 5

local bg = display.newImageRect (grupoBg, "image/bg.jpg", 728*1.2, 410*1.2)
bg.x = display.contentCenterX 
bg.y = display.contentCenterY 

local pontosText = display.newText (grupoUI, "Pontos: " .. pontos, 100, 30, native.systemFont, 20)
pontosText:setFillColor (1, 1, 1)
local vidasText = display.newText (grupoUI, "Vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (1, 1, 1)

local player = display.newImageRect (grupoMain, "image/nave.png", 479/4, 521/4)
player.x = 100
player.y = 340
player.myName = "Nave"

physics.addBody (player, "kinematic")

local botaoEsquerda = display.newImageRect (grupoMain,"image/button.png", 360/5, 360/5)
botaoEsquerda.x = 20
botaoEsquerda.y = 440
botaoEsquerda.rotation = -180

local botaoDireita = display.newImageRect (grupoMain,"image/button.png", 360/5, 360/5)
botaoDireita.x = 300
botaoDireita.y = 440
botaoDireita.rotation = 360

local function esquerda ()
    player.x = player.x - 2
end

local function direita ()
    player.x = player.x + 2
end 

botaoEsquerda:addEventListener ("tap", esquerda)
botaoDireita:addEventListener ("tap", direita)

local botaoPlay = display.newImageRect (grupoMain, "image/play.png", 360/5, 360/5)
botaoPlay.x = display.contentCenterX 
botaoPlay.y = 440

local function atirar ()
    
    local fogoPlayer = display.newImageRect (grupoMain, "image/fogo.png", 353/6, 707/6)
        fogoPlayer.x = player.x 
        fogoPlayer.y = player.y 
 physics.addBody (fogoPlayer, "dynamic", {isSensor=true})
                    transition.to (fogoPlayer, {y=300, time=600, 

                    onComplete = function () 
 
                display.remove (fogoPlayer) 
                end})
fogoPlayer.myName = "Tiro"
fogoPlayer:toBack () 
end 
            
botaoPlay:addEventListener ("tap", atirar)

local inimigo = display.newImageRect (grupoMain, "image/asteroide.png", 895*0.3, 279*0.3)
inimigo.x = 152
inimigo.y = 100
inimigo.myName = "Asteroide"
physics.addBody (inimigo, "kinematic")
local direcaoInimigo = "baixo"

local function movimentarInimigo ()

        if not (inimigo.x == nil ) then 
    
            if (direcaoInimigo == "cima" ) then 
                inimigo.y = inimigo.y - 1
     
                if (inimigo.y <= 50 ) then
              
                    direcaoInimigo = "baixo"
                end        
            elseif (direcaoInimigo == "baixo" ) then
                inimigo.y = inimigo.y + 1  
                if (inimigo.y >= 300 ) then 
                    direcaoInimigo = "cima"
                end 
            end 
    
        else 
            print ("Inimigo morreu!")
    
            Runtime:removeEventListener ("enterFrame", movimentarInimigo)
        end 
    end 
    
    Runtime:addEventListener ("enterFrame", movimentarInimigo)


local function onCollision (event)

    if (event.phase == "began" ) then

        local obj1 = event.object1
        local obj2 = event.object2
        if ((obj1.myName == "Nave" and obj2.myName == "Asteroide") 
        or (obj1.myName == "Asteroide" and obj2.myName == "Nave")) then 
            if (obj1.myName == "Nave") then

                display.remove (obj1)
            else 
                display.remove (obj2)
            end 
            pontos = pontos + 10
            pontosText.text = "Pontos: " .. pontos

            vidas = vidas - 1
            vidasText.text = "Vidas: " .. vidas
        end
    end
end
Runtime:addEventListener ("collision", onCollision)
