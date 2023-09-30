-- Variavel global. (deve ser evitada)
vidas = 2
vidas = 8
print (vidas)
print ("O valor de vidas: " .. vidas)
--------------------
-- Variaveis locais (só são lidas dentro do script)
-- (local) é utilizado somente na criação da variável.
local pontos = 10
print (pontos)
print ("o valor de pontos: " .. pontos)

-- Operações aritméticas
-- Soma
local laranjas = 10
laranjas = laranjas -5
print (laranjas)

local bananas = 5
bananas = 5
print (bananas)

local cesta = 0
local frutas
cesta = laranjas + bananas
print ("A soma entre as variáveis laranjas e bananas é: ")

print ("Na sua cesta possuem " .. cesta .. "frutas")

-- Subtração

cesta = laranjas - bananas
bananas = bananas - 1

-- Maultiplicação

local carro = 8
carro = carro * 2
print ("Quantidade de carros: " .. carro)

-- Dividindo pela Multiplicação
carro = carro * 0.5
print (carro)