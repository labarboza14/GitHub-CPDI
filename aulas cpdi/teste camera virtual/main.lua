local scriptPlayer = require ("Player") ----- chama Scripts -----
local perspective = require ("perspective")
local physics = require ("physics") ----- physics ----


physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("normal")

-- Cria a câmera
local camera = perspective.createView ()
camera:prependLayer () -- prepara os layers da camera.

display.setStatusBar (display.HiddenStatusBar) -- remove satus bar --



local bg = display.newImageRect ("imagens/bg.png", 800*0.7, 600*0.7)
bg.x, bg.y = display.contentCenterX, display.contentCenterY
camera: add (bg,8) -- adiciona a imagem ao layer especifico.



for i = 0,4 do
    local  chaoMeio = display.newImageRect ("imagens/chao.png", 4503/5, 613/15)
    chaoMeio.x = -256 + (chaoMeio.width*i)
    chaoMeio.y = 250
    camera:add (chaoMeio, 4)
end


for i = 0,4 do
    local  chao = display.newImageRect ("imagens/chao.png", 4503/5, 613/5)
    chao.x = -256 + (chao.width*i)
    chao.y = 290
    chao.id = "chao"
    physics.addBody (chao, "static", {friction=1, box = {x=0, y=0, halfWidth=chao.width/2, halfHeight = chao.height/5}})
    camera:add (chao, 1)
end




local player = scriptPlayer.novo (240,0)
camera:add (player, 1)


local plataforma = display.newImageRect ("imagens/platform.png", 300/1.5, 50/1.5)
plataforma.x = 350
plataforma.y = 300

local plataforma1 = display.newImageRect ("imagens/platform.png", 300/1.5, 50/1.5)
plataforma1.x = 150
plataforma1.y = 200

--Efeito Parallax tras a ilusao de profundidade ao jogo.
-- As posições das virgulas representam os numeros dos layers
-- layer (1, 2, 3, 4, 5, 6, 7, 8)
camera:setParallax (1, 0.9, 0.8, 0.7, 0.5, 0.1, 0)

camera.damping = 10 -- controla a fluidez da camera ao seguir o player
camera:setFocus (player) -- Define que o player é o foco da camera
camera:track () -- Inicia a perseguição da camera 

