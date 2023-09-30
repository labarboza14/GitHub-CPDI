-- Declarações iniciais


local physics = require ("physics")


physics.start ()
physics.setGravity ( 0, 0)
physics.setDrawMode ("normal")


display.setStatusBar (display.HiddentStatusBar)


local bgAudio = audio.loadStream ("audio/sabota_bg.mp3") -- ("pasta/arquivo.formato")
-- Reserva do canal de audio
audio.reserveChannels (1)
-- volume desse canal 
audio.setVolume (0.1, {channel=1})
-- Reproduzindo o audio
--          (audio a reproduzir/a variavel, {canal, loopins (-1 infinito)})
audio.play (bgAudio, {channel=1, loops=2}) 

-- Grupos - camadas de objetos


local grupoBg = display.newGroup ()
local grupoMain = display.newGroup ()
local grupoUi = display.newGroup ()


local pontos = 0
local vidas = 5


local bg = display.newImageRect (grupoBg,"imagens/bg.png", 612*2.6, 309*2.6)
bg.x = display.contentCenterX -- localização horizontal
bg.y = display.contentCenterY -- localização vertical


local pontosText = display.newText (grupoMain, "Pontos: ".. pontos, 150, 40, native.systemFont, 30 )
pontosText:setFillColor (0.9, 0.6, 0.3)


local vidasText = display.newText (grupoMain, "Vidas: ".. vidas, 300, 40, native.systemFont, 30)
vidasText:setFillColor (0.9, 0.6, 0.3)




--- Objetos que compõe o cenário do jogo


local lixeira = display.newImageRect (grupoBg, "imagens/lixeira.png", 779/1.5, 182/1.5)
lixeira.x = 780
lixeira.y = 500


local lixos = display.newImageRect (grupoMain, "imagens/lixos.png", 455/1.9, 455/1.9)
lixos.x = 140
lixos.y = 560


local player = display.newImageRect(grupoUi, "imagens/finn.png", 231/1.7, 327/1.7)
player.x = 300
player.y = 530
player.myName = "Finn"
physics.addBody (player, "kinematic")


local spriteOpcoes =


{


    frames=
    {
        { -- 1) menu
            x= 0,
            y= 0,
            width= 125,
            height= 100
        },
        { -- 2) botao esquerda
            x= 0,
            y= 100,
            width= 125,
            height= 100
        },
        {-- 3) on/off
            x= 0,
            y= 200,
            width= 125,
            height= 100
        },
        { -- 4) configurações
            x= 0,
            y= 300,
            width= 125,
            height= 100
        },
        { -- 5) mensagens
            x= 0,
            y= 400,
            width= 125,
            height= 100
        },
        { -- 6) pause
            x= 125,
            y= 0,
            width= 125,
            height= 100
        },
        { -- 7) botao direita
            x= 125,
            y= 100,
            width= 125,
            height= 100
        },
        {-- 8) return
            x= 125,
            y= 200,
            width= 125,
            height= 100
        },
        { -- 9) volume
            x= 125,
            y= 300,
            width= 125,
            height= 100
        },
        { -- 10) compras
            x= 125,
            y= 400,
            width= 125,
            height= 100
            },
        { -- 11) play
            x= 250,
            y= 0,
            width= 125,
            height= 100
        },
        { -- 12) cima
            x= 250,
            y= 100,
            width= 125,
            height= 100
        },
        {-- 13) x/não
            x= 250,
            y= 200,
            width= 125,
            height= 100
        },
        { -- 14) ajuda
            x= 250,
            y= 300,
            width= 125,
            height= 100
        },
        { -- 15) recordes
            x= 250,
            y= 400,
            width= 125,
            height= 100
        },
        { -- 16) home
            x= 375,
            y= 0,
            width= 125,
            height= 100
        },
        { -- 17) botao baixo
            x= 375,
            y= 100,
            width= 125,
            height= 100
        },
        {-- 18) yes
            x= 375,
            y= 200,
            width= 125,
            height= 100
        },
        { -- 19) segurança
            x= 375,
            y= 300,
            width= 125,
            height= 100
        },
        { -- 20) música
            x= 375,
            y= 400,
            width= 125,
            height= 100
            }  
    }
   
}
local sprite2 = graphics.newImageSheet ("imagens/button.png", spriteOpcoes)


--- Movimentação do player Finn pelas setas de movimentação (direita, baixo, esquerda, cima)--
local function moverPlayer(event)
    local velocidade = 400 -- Ajuste a velocidade de movimentação aqui
   
    if event.phase == "down" then
        if event.keyName == "up" then
            player:setLinearVelocity(0, -velocidade)
        elseif event.keyName == "down" then
            player:setLinearVelocity(0, velocidade)
        elseif event.keyName == "left" then
            player:setLinearVelocity(-velocidade, 0)
        elseif event.keyName == "right" then
            player:setLinearVelocity(velocidade, 0)
        end
    elseif event.phase == "up" then
        if event.keyName == "up" or event.keyName == "down" then
            player:setLinearVelocity(0, 0)
        elseif event.keyName == "left" or event.keyName == "right" then
            player:setLinearVelocity(0, 0)
        end
    end
end


Runtime:addEventListener("key", moverPlayer)


--- Objetos e Movimentação
--- Primeiro objeto: RÁDIO - Movimentação até a lixeira Vermelha


local a = display.newImageRect(grupoMain, "imagens/a.png", 360/5, 360/5)
a.x = 90
a.y = 470


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


--- Objeto rádio, a sua movimentação até a lixeira correta e a sua remoção ---


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                    removerObjeto(objeto)
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


local velocidade = 1 -- Velocidade de movimento (quanto tempo demora até a lixeira)
local destino = { x = 430, y = 3 } -- Ponto final (onde o rádio some)


moverObjeto(a, velocidade, destino)


---  função de colisão ---
local function onCollision(event)
    local obj1 = event.object1
    local obj2 = event.object2


    if (event.phase == "began") then
        if (obj1 == a or obj2 == a) then
            -- Colisão do objeto "a" com o objeto lixeira (manualmente determinado até a vermelha)
            removerObjeto(a) -- o rádio some
        end
    end
end


Runtime:addEventListener("collision", onCollision)


-----


--- Segundo objeto: MAÇÃ - Movimentação até a lixeira Cinza


local b = display.newImageRect (grupoMain, "imagens/ab.png", 155/1.2, 152/1.2)
b.x = 140
b.y = 470


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


--- Objeto maçã, a sua movimentação até a lixeira correta e a sua remoção ---


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                    removerObjeto(objeto)
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


local velocidade = 0.5 -- Velocidade de movimento (quanto tempo demora até a lixeira)
local destino = { x = 850, y = 4 } -- Ponto final (onde a maçã mordida some)


moverObjeto(b, velocidade, destino)


---  função de colisão ---
local function onCollision(event)
    local obj1 = event.object1
    local obj2 = event.object2


    if (event.phase == "began") then
        if (obj1 == a or obj2 == a) then
            -- Colisão do objeto "a" com o objeto lixeira (manualmente determinado até a cinza)
            removerObjeto(a) -- a maçã some
        end
    end
end


Runtime:addEventListener("collision", onCollision)


--- Terceiro objeto: PEIXE - Movimentação até a lixeira CINZA


local c = display.newImageRect (grupoMain, "imagens/ac.png", 160/1.2, 158/1.2) -- imagem peixe
c.x = 200
c.y = 470


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                    -- Aqui você pode adicionar qualquer ação adicional quando o objeto terminar de se mover
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


--- Objeto PEIXE, a sua movimentação até a lixeira correta e a sua remoção ---


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                    removerObjeto(objeto)
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


local velocidade = 1 -- Velocidade de movimento (quanto tempo demora até a lixeira)
local destino = { x = 800, y = 6 } -- Ponto final (onde o peixe some)


moverObjeto(c, velocidade, destino)


---  função de colisão ---
local function onCollision(event)
    local obj1 = event.object1
    local obj2 = event.object2


    if (event.phase == "began") then
        if (obj1 == c or obj2 == c) then
            -- Colisão do objeto "a" com o objeto lixeira (manualmente determinado até a cinza)
            removerObjeto(c) -- o peixe some
        end
    end
end


Runtime:addEventListener("collision", onCollision)


--- Objetos e Movimentação
--- Quarto objeto: TV - Movimentação até a lixeira Vermelha


local d = display.newImageRect (grupoMain, "imagens/aj.png", 500/5, 500/5) -- imagem tv
d.x = 170
d.y = 430


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


--- Objeto TV, a sua movimentação até a lixeira correta e a sua remoção ---


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                    removerObjeto(objeto)
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


local velocidade = 1 -- Velocidade de movimento (quanto tempo demora até a lixeira)
local destino = { x = 350, y = 3 } -- Ponto final (onde a TV some)


moverObjeto(d, velocidade, destino)


---  função de colisão ---
local function onCollision(event)
    local obj1 = event.object1
    local obj2 = event.object2


    if (event.phase == "began") then
        if (obj1 == d or obj2 == d) then
            -- Colisão do objeto "a" com o objeto lixeira (manualmente determinado até a vermelha)
            removerObjeto(d) -- a tv some
        end
    end
end


Runtime:addEventListener("collision", onCollision)


--- Quinto objeto: Jornal - Movimentação até a lixeira azul


local e = display.newImageRect (grupoMain, "imagens/i.png", 132/1.5, 162/1.5) -- imagem jornal
e.x = 130
e.y = 420


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


--- Objeto jornal, a sua movimentação até a lixeira correta e a sua remoção ---


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                    removerObjeto(objeto)
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


local velocidade = 0.6 -- Velocidade de movimento (quanto tempo demora até a lixeira)
local destino = { x = 800, y = 4 } -- Ponto final (onde o rádio some)


moverObjeto(e, velocidade, destino)


---  função de colisão ---
local function onCollision(event)
    local obj1 = event.object1
    local obj2 = event.object2


    if (event.phase == "began") then
        if (obj1 == e or obj2 == e) then
            -- Colisão do objeto "a" com o objeto lixeira (manualmente determinado até a vermelha)
            removerObjeto(e) -- o rádio some
        end
    end
end


Runtime:addEventListener("collision", onCollision)


-----


--- Sextou objeto: RÁDIO - Movimentação até a lixeira amarela


local f = display.newImageRect (grupoMain, "imagens/ah.png", 81/1.5, 139/1.5) -- imagem lata vermelha
f.x = 80
f.y = 410


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


--- Objeto rádio, a sua movimentação até a lixeira correta e a sua remoção ---


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                    removerObjeto(objeto)
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


local velocidade = 0.6 -- Velocidade de movimento (quanto tempo demora até a lixeira)
local destino = { x = 650, y = 3 } -- Ponto final (onde a lata some)


moverObjeto(f, velocidade, destino)


---  função de colisão ---
local function onCollision(event)
    local obj1 = event.object1
    local obj2 = event.object2


    if (event.phase == "began") then
        if (obj1 == f or obj2 == f) then
            -- Colisão do objeto "a" com o objeto lixeira (manualmente determinado até a vermelha)
            removerObjeto(a) -- o rádio some
        end
    end
end


Runtime:addEventListener("collision", onCollision)


----


--- Sextou objeto: JArra quebrada - Movimentação até a lixeira verde


local g = display.newImageRect (grupoMain, "imagens/an.png", 198/1.7, 185/1.7) -- imagem jarra
g.x = 190
g.y = 370


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


--- Objeto Jarra quebrada, a sua movimentação até a lixeira correta e a sua remoção ---


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                    removerObjeto(objeto)
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


local velocidade = 0.6 -- Velocidade de movimento (quanto tempo demora até a lixeira)
local destino = { x = 630, y = 34 } -- Ponto final (onde a jarra some)


moverObjeto(g, velocidade, destino)


---  função de colisão ---
local function onCollision(event)
    local obj1 = event.object1
    local obj2 = event.object2


    if (event.phase == "began") then
        if (obj1 == g or obj2 == g) then
            -- Colisão do objeto "g" com o objeto lixeira (manualmente determinado até a verde )
            removerObjeto(a) -- a jarra quebrada some
        end
    end
end


Runtime:addEventListener("collision", onCollision)


--- Setimo objeto: garrafa pet - Movimentação até a lixeira laranja


local h = display.newImageRect (grupoMain, "imagens/j.png", 100/1.5, 169/1.5) -- imagem garrafa pet
h.x = 140
h.y = 350


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


--- Objeto Jarra quebrada, a sua movimentação até a lixeira correta e a sua remoção ---


local function moverObjeto(objeto, velocidade, direcao)
    local function mover(event)
        if event.phase == "began" then
            transition.to(objeto, {
                time = 1000 / velocidade,
                x = objeto.x + direcao.x,
                y = objeto.y + direcao.y,
                onComplete = function()
                   
                    removerObjeto(objeto)
                end
            })
        end
    end


    objeto:addEventListener("touch", mover)
end


local function removerObjeto(objeto)
    display.remove(objeto)
end


local velocidade = 0.6 -- Velocidade de movimento (quanto tempo demora até a lixeira)
local destino = { x = 500, y = 70} -- Ponto final (onde a garrafa pet some)


moverObjeto(h, velocidade, destino)


---  função de colisão ---
local function onCollision(event)
    local obj1 = event.object1
    local obj2 = event.object2


    if (event.phase == "began") then
        if (obj1 == h or obj2 == h) then
            -- Colisão do objeto "h" com o objeto lixeira (manualmente determinado até laranja)
            removerObjeto(a) -- a garrafa pet some
        end
    end
end


Runtime:addEventListener("collision", onCollision)


---Pontuação ---




------------------
--- Até aqui todos os objetos se movem individualmente.
-- Ajustar as posições para que os cliques não se confundam
-- Revisar os grupos onde estão os objetos (lixinhos) o Finn deve estar a frente de todos
-- Padronizar a velocidade do mov até a respectiva lixeira


-- 09/08/23 ---
--- O player se move pelas setas de movimentação (direita, esquerda, cima e baixo)


--- 17/08/23
--- Criar a logica da pontuação e da diminuição da vida --
-- o player pega um objeto móvel
-- Leva até a lixeira correta (objeto some) ganha 1 ponto
-- Quando completa 4 acertos ganha 5 pontos
-- Quando erra (coloca na lixeira errada) perde 1 vida (são 5 vidas.
-- Aúdio ambiente funcionando bem






