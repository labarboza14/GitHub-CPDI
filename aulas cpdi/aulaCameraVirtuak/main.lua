    local scriptPlayer = require ("player")
    local perspective = require ("perspective")
    local physics = require ("physics")

    physics.start ()
    physics.setGravity ( 0, 9.8)
    physics.setDrawMode ("hybrid")

    display.setStatusBar (display.HiddentStatusBar)

    local bg = display.newImageRect ("imagens/bg.jpg", 509*5, 360*5)
    bg.x, bg.y = display.contentCenterX, display.ContentCenterY

    local sol = display.newImageRect ("imagens/sun.png", 96, 96)
    sol.x = 400
    sol.y = 20

    for i = 0, 4 do 
    local nuvens = display.newImageRect ("imagens/cloud.png", 920*0.2, 384*0.2)
    nuvens.x = 128*i 
    nuvens.y = math.random (-60, 60)
    nuvens.alpha = 0.8
end

for i = 0, 3 do 
    local nuvem = display.newImageRect ("imagens/cloud.png", 920*0.2, 384*0.2)
    nuvem.x = 128*i 
    nuvem.y = math.random (-160, 160)
    nuvem.alpha = 0.7  
end

for i = 0, 4 do 
    local chaoFundo = display.newImageRect ("imagens/chao.png", 4503*0.15, 613*0.15)
    chaoFundo.x = -256 + (chaoFundo.width*i)
    chaoFundo.y = 210
end

for i = 0, 6 do 
    local arvoreFundo = display.newImageRect ("imagens/tree.png", 96, 96)
    arvoreFundo.x = -256 + (128*i)
    arvoreFundo.y = 140
end


