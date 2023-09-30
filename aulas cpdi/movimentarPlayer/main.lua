local bg = display.newImageRect ("imagem/sky.png", 960*3, 240*3)  
bg.x = display.contentCenterX
bg.y = display.contentCenterY

local chao = display.newImageRect ("imagem/ground.png", 1028, 256)
chao.x = display.contentCenterX
chao.y = 490

local player = display.newImageRect ("imagem/player.png", 532/3, 469/3)
player.x = 50
player.y = 300

-- Andar para a direita 
local function direita ()
    player.x = player.x + 2
end 

local botaoDireita = display.newImageRect ("imagem/button.png", 1280/20, 1279/20)
botaoDireita.x = 300
botaoDireita.y = 400
botaoDireita:addEventListener ("tap", direita)

--Andar esquerda
local function esquerda ()
    player.x = player.x - 2
end

local botaoEsquerda = display.newImageRect ("imagem/button.png", 1280/20, 1279/20)
botaoEsquerda.x = 220
botaoEsquerda.y = 400
botaoEsquerda.rotation = 180
botaoEsquerda:addEventListener ("tap", esquerda)

--Andar pra cima
local function cima ()
    player.y = player.y - 4
end 

local moverCima = display.newImageRect ("imagem/button.png", 1280/20, 1279/20)
moverCima.x = 260
moverCima.y = 335
moverCima.rotation = -90
moverCima:addEventListener ("tap", cima)

--Andar pra baixo 
local function baixo ()
    player.y = player.y + 4
end 

local botaoBaixo = display.newImageRect ("imagem/button.png", 1280/20, 1279/20)
botaoBaixo.x = 260
botaoBaixo.y = 450
botaoBaixo.rotation = 90
botaoBaixo:addEventListener ("tap", baixo)

--Andar na diagonal pra cima
local function diagonalDiCm ()
    player.x = player.x + 5
    player.y = player.y - 5
end 

local botaoDiagonalCm = display.newImageRect ("imagem/button.png", 1280/20, 1279/20)
botaoDiagonalCm.x = 320
botaoDiagonalCm.y = 330
botaoDiagonalCm.rotation = 315
botaoDiagonalCm:addEventListener ("tap", diagonalDiCm) 

--Andar na diagonal pra baixo
local function diagonalDireitaBaixo ()
    player.y = player.y + 30
    player.x = player.x + 30
end 

local botaoDiagonalBx = display.newImageRect ("imagem/button.png", 1280/20, 1279/20)
botaoDiagonalBx.x = 320
botaoDiagonalBx.y = 475
botaoDiagonalBx.rotation = 45
botaoDiagonalBx:addEventListener ("tap", diagonalDireitaBaixo) 

--Andar na diagonal pra cima e esquerda
local function diagonal1 ()
    player.y = player.y - 2
    player.x = player.x - 2
end 

local botaoCimaEsquerda = display.newImageRect ("imagem/button.png", 1280/20, 1279/20)
botaoCimaEsquerda.x = 200
botaoCimaEsquerda.y = 330
botaoCimaEsquerda.rotation = 225
botaoCimaEsquerda:addEventListener ("tap", diagonal1)

--Andar na diagonal pra baixo a esquerda
local function diagInfEsq ()
    player.y = player.y + 2
    player.x = player.x - 2
end 

local botaoDiagBE = display.newImageRect ("imagem/button.png", 1280/20, 1279/20)
botaoDiagBE.x = 200
botaoDiagBE.y = 470
botaoDiagBE.rotation = 140
botaoDiagBE:addEventListener ("tap", diagInfEsq)