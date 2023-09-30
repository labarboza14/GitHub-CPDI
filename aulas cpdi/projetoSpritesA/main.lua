display.setStatusBar (display.HiddenStatusBar)
local bg = display.newImageRect ("imagem/bg.jpg", 1920/2, 1344/2)
bg.x = display.contentCenterX -- localização horizontal
bg.y = display.contentCenterY -- localização vertical 

-- INCLUSÃO DE SPRITE ANIMAÇÃO
-- ("pasta/arquivo.formato", {larguraFrame= , alturaFrame= })
local sprite1 = graphics.newImageSheet ("imagem/playerFem2.png", {width=192, height=256, numFrames=45})

local sprite1Animacao = {
-- {nome="estagio de animação", frameInicial= , continuação }
    {name="parado", start=23, count=3, time=1000, loopCount=0},
    {name="andando", start=27, count=6, time=1000, loopCount=4},
    {name="pulo", start=31, count=3, time=1000, loopCount=1}
}

--newSprite é utilizado apenas para as sprites de animação

local player = display.newSprite (sprite1, sprite1Animacao)
player.x = 200
player.y = 250
--player.width = player.width*0.5
--player.height = player.height*0.5
player.xScale = 0.5
player.xScale = 0.5
--Definir sequencia de animação inicial
player:setSequence ("parado")
player:play ()


-- Sprites de elementos estaticos

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
local sprite2 = graphics.newImageSheet ("imagem/button.png", spriteOpcoes)

local botaoEsquerda = display.newImageRect (sprite2, 2, 125/1.5, 100/1.5)
botaoEsquerda.x = 30
botaoEsquerda.y = 440

local botaoDireita = display.newImageRect (sprite2, 7, 125/1.5, 100/1.5)
botaoDireita.x = 200
botaoDireita.y = 440

local botaoAcima = display.newImageRect (sprite2, 12, 125/1.5, 100/1.5)
botaoAcima.x = 150
botaoAcima.y = 440

local botaoAbaixo = display.newImageRect (sprite2, 17, 125/1.5, 100/1.5)
botaoAbaixo.x = 100
botaoAbaixo.y = 440

local function moverEsquerda (event)
    if (event.phase == "began") then
        player.x = player.x -1
        player:setSequence ("andando")
        player: play ()
        player.xScale = - 0.5
    elseif (event.phase == "moved") then
        player.x = player.x -1
elseif (event.phase == "ended") then
    player:setSequence ("parado")
    player: play ()
    player.xScale = 0.5
    end
end



botaoEsquerda: addEventListener ("touch", moverEsquerda)

local function moverDireita (event)
    if (event.phase == "began") then
        player.x = player.x + 1
        player:setSequence ("andando")
        player:play ()
    elseif (event.phase == "moved") then
        player.x = player.x + 1
    elseif (event.phase == "ended") then
         player:setSequence ("parado")
         player:play ()
    end
end
botaoDireita:addEventListener ("touch", moverDireita)


local function moverAcima(event)
    if (event.phase == "began") then
        player.y = player.y + 1
        player:setSequence ("pulo")
        player:play ()
    elseif (event.phase == "moved") then
        player.y = player.y + 1

    transition.to (player, {time=900, y=100, iterations=1, transition=easing.inBounce} )    elseif (event.phase == "ended") then
         player:setSequence ("parado")
         player:play ()
    end
end

botaoAcima:addEventListener ("touch", moverAcima)

local function moverAbaixo (event)
    if (event.phase == "began") then
        player.y = player.y - 1
        player:setSequence ("andando")
        player:play ()
    elseif (event.phase == "moved") then
        player.y = player.y - 1
    elseif (event.phase == "ended") then
         player:setSequence ("parado")
         player:play ()
    end
end
botaoAbaixo:addEventListener ("touch", moverAbaixo)