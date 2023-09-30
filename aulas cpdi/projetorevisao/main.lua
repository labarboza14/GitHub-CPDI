-- Chamar a biblioteca de física 
local physics = require ("physics")
-- Iniciar o motor de física
physics.start ()
-- Definir a gravidade.
physics.setGravity (0, 0)
-- Definir o modo de renderização 
physics.setDrawMode ("normal") -- normal, hybrid, debug

-- Remover a barra de notificações.
display.setStatusBar (display.HiddenStatusBar)

-- criar os grupos de exibição.
local grupoBg = display.newGroup() -- Objetos decorativos, cenário (não tem interação)
local grupoMain = display.newGroup() -- Bloco principal (tudo que precisar interagir com o player fica nesse grupo)
local grupoUI = display.newGroup() -- Interface do usuário (placares, botões...)

-- Criar variáveis de pontos e vidas para atribuição de valor.
local pontos = 0
local vidas = 5

-- Adicionar background
--           (grupo, "pasta/nome do arquivo.formato", largura, altura)
local bg = display.newImageRect (grupoBg, "imagem/bg.jpg", 612*1.15, 433*1.15)
-- localização da imagem
bg.x = display.contentCenterX -- localização horizontal
bg.y = display.contentCenterY -- localização vertical 

-- Adicionar placar na tela. 
-- (grupo, "Escreve o que irá aparecer na tela", localizaçãoX, localizaçãoY, fonte, tamanho da fonte)
local pontosText = display.newText (grupoUI, "Pontos: " .. pontos, 100, 30, native.systemFont, 20)
-- Altera a cor da variável.
pontosText:setFillColor (0, 0, 0)

local vidasText = display.newText (grupoUI, "Vidas: " .. vidas, 200, 30, native.systemFont, 20)
vidasText:setFillColor (0, 0, 0)

-- Adicionar herói 
local player = display.newImageRect (grupoMain, "imagem/bruxa.png", 500*0.5, 500*0.5)
player.x = 30
player.y = 370
player.myName = "Bruxa"
-- Adicionar corpo físico a imagem.
physics.addBody (player, "kinematic") -- colide apenas com dinâmico e não tem interferência da gravidade.

-- Criar botões: 
local botaoCima = display.newImageRect (grupoMain,"imagem/button.png", 1280/30, 1279/30)
botaoCima.x = 240
botaoCima.y = 440
botaoCima.rotation = -90 -- faz a rotação da imagem em x graus.

local botaoBaixo = display.newImageRect (grupoMain, "imagem/button.png", 1280/30, 1279/30)
botaoBaixo.x = 80
botaoBaixo.y = 440
botaoBaixo.rotation = 90

-- Adicionar funções de movimentação
local function cima ()
    player.y = player.y - 10
end 

local function baixo  ()
    player.y = player.y + 10
end 

-- Adicionar o ouvinte e a função ao botão.
botaoCima:addEventListener ("tap", cima)
botaoBaixo:addEventListener ("tap", baixo)

-- Adicionar botão de tiro:
local botaoTiro = display.newImageRect (grupoMain, "imagem/botao.png", 360/5, 360/5)
botaoTiro.x = display.contentCenterX 
botaoTiro.y = 440

-- Função para atirar: 
local function atirar ()
    -- Toda vez que a função for executada cria-se um novo "tiro"
    local feiticoPlayer = display.newImageRect (grupoMain, "imagem/ball.png", 360/11, 358/11)
    -- a localização é a mesma do player
    feiticoPlayer.x = 90
    feiticoPlayer.y = 340
    physics.addBody (feiticoPlayer, "dynamic", {isSensor=true}) -- determinamos que o projétil é um sensor, o que ativa a detecção contínua de colisão.
    -- Transição do projétil para linha x=500 em 900 milisegundos.
    transition.to (feiticoPlayer, {x=500, time=900, 
    -- Quando a transição for completa
                    onComplete = function () 
    -- Removemos o projétil do display.                    
                     display.remove (feiticoPlayer) 
                    end})
    feiticoPlayer.myName = "Ball"
    feiticoPlayer:toBack () -- Joga o elemento pra trás dentro do grupo de exibição dele.
end 

botaoTiro:addEventListener ("tap", atirar)

-- Adicionando inimigo
local inimigo = display.newImageRect (grupoMain, "imagem/feiticeira.png", 384*0.3, 651*0.3)
inimigo.x = 270
inimigo.y = 370
inimigo.myName = "Feiticeira"
physics.addBody (inimigo, "kinematic")
local direcaoInimigo = "cima"

-- Função para inimigo atirar: 
local function inimigoAtirar ()
    local tiroInimigo = display.newImageRect (grupoMain, "imagem/bol.png", 500/12, 500/12)
    tiroInimigo.x = inimigo.x - 50
    tiroInimigo.y = inimigo.y 
    tiroInimigo.rotation = 180
    physics.addBody (tiroInimigo, "dynamic", {isSensor=true})
    transition.to (tiroInimigo, {x=-200, time=900,
                    onComplete = function () 
                        display.remove (tiroInimigo) 
                    end})
    tiroInimigo.myName = "Bol"
end

-- Criando o timer de disparo do inimigo:
-- Comandos timer: (tempo repetição, função, quantidade de repetições)
inimigo.timer = timer.performWithDelay (math.random (1000, 1500), inimigoAtirar, 0)

-- Movimentação do inimigo: 
local function movimentarInimigo ()
-- se a localização x não for igual a nulo então
    if not (inimigo.x == nil ) then 
-- Quando a direção do inimigo for cima então
        if (direcaoInimigo == "cima" ) then 
            inimigo.y = inimigo.y - 1
--  Se a localização y do inimigo for menor ou igual a 50 então 
            if (inimigo.y <= 50 ) then
            -- altera a variável para "baixo"
                direcaoInimigo = "baixo"
            end -- if (inimigo.y.....)
-- se a direção do inimigo for igual a baixo então        
        elseif (direcaoInimigo == "baixo" ) then
            inimigo.y = inimigo.y + 1 
-- Se a localização y do inimigo for maior ou igual a 400 então 
            if (inimigo.y >= 400 ) then 
                direcaoInimigo = "cima"
            end --if (inimigo.y ....)
        end -- if (direcaoInimigo....)
-- Se não 
    else 
        print ("Feiticeira morreu!")
-- Runtime: representa todo o jogo (evento é executado para todos), enterframe: está ligado ao valor de FPS do jogo (frames por segundo), no caso, a função vai ser executada 60 vezes por segundo.
        Runtime:removeEventListener ("enterFrame", movimentarInimigo)
    end 
end 

Runtime:addEventListener ("enterFrame", movimentarInimigo)

-- Função de colisão: 
local function onCollision (event)

    if (event.phase == "began" ) then

        local obj1 = event.object1
        local obj2 = event.object2

        if ((obj1.myName == "Ball" and obj2.myName == "Feiticeira") or (obj1.myName == "Feiticeira" and obj2.myName == "Ball")) then 
            
            if (obj1.myName == "Ball") then

                display.remove (obj1)
            else 
                display.remove (obj2)
            end 

            pontos = pontos + 10
            pontosText.text = "Pontos: " .. pontos
        
        elseif ((obj1.myName == "Bruxa" and obj2.myName == "Bol") or (obj1.myName == "Bol" and obj2.myName == "Bruxa")) then 
            if (obj1.myName == "Bol") then
                display.remove (obj1)
            else 
                display.remove (obj2)
            end 
        
        vidas = vidas - 1
        vidasText.text = "Vidas: " .. vidas
        end
    end 
end 

Runtime:addEventListener ("collision", onCollision)