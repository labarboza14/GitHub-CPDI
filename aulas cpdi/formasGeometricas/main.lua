local retangulo = display.newRect (120,80, 200, 140)

local circulo = display.newCircle (340, 80, 80)

local quadrado = display.newRect (530, 80, 140, 140)

-- Adicionar retângulo arredondado:
-- Comandos: local nome da variavel = display.newRoundedRect (x, y, largura, altura, raio das bordas)
local retanguloArredondado = display.newRoundedRect (730, 80, 200, 140, 30)

-- Adicionar uma linha:
-- comandos: local nome da variável = display.newLine (xInicial, yInicial, xFinal, yFinal)
local linha = display.newLine (0, 250, 1200, 250)

-- criar um polignono:
-- comandos: local nome da variavel = display.newPolygon (x, y, vertices)

local localizacaoX = 200
local localizacaoY = 350

local vertices = {0, -110, 27, -35, 105, -35, 43, 16, 65, 90, 0, 45, -65, 90, -43, 15, -105, -35, -27, -35}

local estrela = display.newPolygon (localizacaoX, localizacaoY, vertices)

-- criar um novo texto:
-- comandos: local variavel = display.newText ("texto que será inserido", x, y, fonte, fontsize)
local helloWorld = display.newText ("Hello World", 500, 350, native.systemFont, 50)

local parametros = {
    text = "Olá Mundo!",
    x = 500,
    y = 450,
    font = "Arial",
    fontSize = 50,
    align = "right"
}
local olaMundo = display.newText ( parametros)

-- Adicionar o texto em relevo
-- comandos: local variavel = display.newEmbossedText (("Hello World", 500, 350, native.systemFont, 50)

local opcoes = {
    text = "Gloria Barboza",
    x = 730,
    y = 550,
    font = "Times",
    fontSize = 40,

}
local textoRelevo = display.newEmbossedText (opcoes)

-- Adicionar com ao objeto texto
-- comandos: variarvel:setFillColor (cinza, vermelho, verde, azul, alfa (transparencia))

helloWorld:setFillColor (0.9, 0.4, 0.5)
helloWorld.alpha = 0.5

local color = {
    -- destaque
    hightlight = {r=1, g=1, b=1},
    --sombra
    shadow = { r=0.3, g=0.9, b=0.2},
}

textoRelevo:setEmbossColor (color)

-- gradiente
-- comandos: variavel = { type=, color1 =  ,   ,  }, color2= {  ,  }, direction= ""}

local gradiente = {
    type = "gradient",
    color1 = { 1, 0.6, 0.9},
    color2 = { 0.2, 0.4, 0.7},
    direction = "down"
}

estrela:setFillColor (gradiente)

retangulo:setFillColor (0.7, 0.2, 0.6, 0.4)
circulo:setFillColor (0.2, 0.8, 0.3, 0.4)
retanguloArredondado: setFillColor (gradiente)
quadrado: setFillColor (0.2, 0.5, 0.9, 0.6)
