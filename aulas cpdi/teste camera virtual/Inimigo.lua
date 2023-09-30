local Inimigo = {}

function Inimigo

    local Inimigo = display.newImageRect ("imagens/platform.png", 300/1.25, 50/1.25)

    local inimigoAnimacao = 
        {
            {name="parado", start=1, count=3, time=300, loopCount=0},
            {name="correndo", start=5, count=9, time=1000, loopCount=0}
        }
    local inimigo = display.newSprite (InimigoSprite, inimigoAnimacao)
    inimigo.x = x
    inimigo.y = y
    inimigo.id = "inimigo"
    inimigo.direcao = "esquerda"
    inimigo:setSequence ("correndo")
    inimigo:play()
    inimigo.numeroPulo = 0
    physics.addBody (inimigo, "dynamic", {friction=1, box= {x=0, y=0, halfWidth=30, halfHeight=40, angle=0}})
    inimigo.isFixedRotation = true

    local function verificarDirecao ()
        if not (inimigo.x == nil) then
        if (inimigo.direcao == "esquerda") then
            inimigo.x = inimigo.x -2
            if (inimigo.x <= 0) then
                inimigo.direcao = "direita"
                inimigo.xScale = 1
            end
        elseif (inimigo.direcao == "direita") then
            inimigo.x = inimigo.x + 2
            if (inimigo.x >= 480) then
                inimigo.direcao = "esquerda"
                inimigo.xScale = -1
            end
        end
    end

    Runtime:addEventListener ("enterFrame", verificarDirecao)

    return inimigo
end

end 
return Inimigo