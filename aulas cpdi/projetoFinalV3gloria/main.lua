-- Declarações iniciais

local physics = require ("physics")

physics.start ()
physics.setGravity ( 0, 0)
physics.setDrawMode ("normal")

display.setStatusBar (display.HiddentStatusBar)


---Audio

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

local score = 0
local lives = 3



-- Dclaração das variavéis que aparecerão --
local cascaBanana
local copoPlastico
local eco
local espinhaPeixe
local et
local finn
local folhaCaderno
local garrafaPet
local garrafaQuebrada
local jornal
local laptop
local lataAmassada
local lataAtum
local lataRefri
local latasardinha
local maca
local poteVidro
local radio
local tvVelha
local sacola
local vidroQUebrado
local lixeiraAmarela
local lixeiraAzul
local lixeiraCinza
local lixeiraLaranja
local lixeiraVerde
local lixeiraVermelha
local container
local objeto



local bg = display.newImageRect (grupoBg,"imagens/bg.png", 612*2.6, 309*2.6)
bg.x = display.contentCenterX -- localização horizontal
bg.y = display.contentCenterY -- localização vertical 

local scoreText = display.newText (grupoMain, "Pontos: ".. score, 150, 40, native.systemFont, 30 )
scoreText:setFillColor (0.9, 0.6, 0.3)


local livesText = display.newText (grupoMain, "Vidas: ".. lives, 300, 40, native.systemFont, 30)
livesText:setFillColor (0.9, 0.6, 0.3)



--- Objetos que compõe o cenário do jogo

local container = display.newImageRect (grupoMain, "imagens/container.png", 455/1.9, 455/1.9)
container.x = 140
container.y = 560


local player = display.newImageRect(grupoUi, "imagens/et.png", 142/1.2, 196/1.2)
player.x = 300
player.y = 530
player.myName = "Finn"
physics.addBody (player, "kinematic") 

-- Inserir as lixeiras coloridas individualmente -- 

local lixeiraAmarela = display.newImageRect (grupoMain, "imagens/lixeira-amarela.png", 113/1.5, 182/1.5)
lixeiraAmarela.x = 780
lixeiraAmarela.y = 500
lixeiraAmarela.myName = "lixeiraAmarela"

local lixeiraAzul = display.newImageRect (grupoMain, "imagens/lixeira-azul.png", 113/1.5, 182/1.5)
lixeiraAzul.x = 700
lixeiraAzul.y = 500
lixeiraAzul.myName = "lixeiraAzul"

local lixeiraCinza = display.newImageRect (grupoMain, "imagens/lixeira-cinza.png", 113/1.5, 182/1.5)
lixeiraCinza.x = 630
lixeiraCinza.y = 500
lixeiraCinza.myName = "lixeiraCinza"

local lixeiraLaranja = display.newImageRect (grupoMain, "imagens/lixeira-laranja.png", 113/1.5, 182/1.5)
lixeiraLaranja.x = 560
lixeiraLaranja.y = 500
lixeiraLaranja.myName = "lixeiraLaranja"

local lixeiraVerde = display.newImageRect (grupoMain, "imagens/lixeira-verde.png", 113/1.5, 182/1.5)
lixeiraVerde.x = 850
lixeiraVerde.y = 500
lixeiraVerde.myName = "lixeiraVerde"

local lixeiraVermelha = display.newImageRect(grupoMain, "imagens/lixeira-vermelha.png", 113/1.5, 182/1.5)
lixeiraVermelha.x = 920
lixeiraVermelha.y = 500
lixeiraVermelha.myName = "lixeiraVermelha"

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


--- Objetos inseridos (lixinhos)

--- Primeiro objeto: RÁDIO - 

local radio = display.newImageRect(grupoMain, "imagens/radio.png", 360/5, 360/5)
radio.x = 100
radio.y = 470
radio.myName = "radio"

physics.addBody(radio, "dynamic")
physics.addBody(lixeiraVermelha, "static")

local function increaseScore(amount)
    score = score + amount
    print("Pontuação aumentada para: " .. score)
end

local function decreaseLives(amount)
    lives = lives - amount
    print("Vidas diminuídas para: " .. lives)
end

local function moveRadio(event)
    local radio = event.target
    local phase = event.phase

    if (phase == "began" or phase == "moved") then
        radio.x = event.x
    end

    if (event.phase == "ended") then
        if (radio.x >= lixeiraVermelha.x - lixeiraVermelha.width/2 and radio.x <= lixeiraVermelha.x + lixeiraVermelha.width/2) then
            radio:removeSelf()
            radio = nil

            increaseScore(10)
        else
            decreaseLives(1)
        end
    end
end

local function onCollision(event)
    if (event.phase == "began") then
        local object1 = event.object1
        local object2 = event.object2

        if ((object1.myName == "radio" and object2.myName == "lixeiraVermelha") or (object1.myName == "lixeiraVermelha" and object2.myName == "radio")) then
            increaseScore(10)
        end
    end
end

local function playerClick()
    radio:dispatchEvent({name = "touch", phase = "began", target = radio})
    radio:dispatchEvent({name = "touch", phase = "ended", target = radio})
end

radio:addEventListener("touch", moveRadio)
Runtime:addEventListener("collision", onCollision)

playerClick()


--- Segundo objeto: MAÇÃ -

local maca = display.newImageRect (grupoMain, "imagens/maca.png", 155/1.2, 152/1.2)
maca.x = 140
maca.y = 470


--- Terceiro objeto: ESPINHA-PEIXE -

local espinhaPeixe = display.newImageRect (grupoMain, "imagens/espinha-peixe.png", 160/1.2, 158/1.2) -- imagem peixe
espinhaPeixe.x = 200
espinhaPeixe.y = 470


--- Quarto objeto: TV-VELHA -

local tvVelha = display.newImageRect (grupoMain, "imagens/tv-velha.png", 500/5, 500/5)
tvVelha.x = 170
tvVelha.y = 430

--- Quinto objeto: JORNAL - 


local jornal = display.newImageRect (grupoMain, "imagens/jornal.png", 132/1.5, 162/1.5)
jornal.x = 130
jornal.y = 420

--- Sexto objeto: LATA REFRI -

local lataRefri = display.newImageRect (grupoMain, "imagens/lata-refri.png", 81/1.5, 139/1.5)
lataRefri.x = 80
lataRefri.y = 410


--- Sétimo objeto: POTE VIDRO -

local poteVidro = display.newImageRect (grupoMain, "imagens/pote-vidro.png", 198/1.7, 185/1.7) 
poteVidro.x = 190
poteVidro.y = 370


--- Oitavo objeto: GARRAFA PET - 

local garrafaPet = display.newImageRect (grupoMain, "imagens/garrafa-pet.png", 100/1.5, 169/1.5) -- imagem garrafa pet
garrafaPet.x = 140
garrafaPet.y = 350



---função de movimentação dos objetos --

