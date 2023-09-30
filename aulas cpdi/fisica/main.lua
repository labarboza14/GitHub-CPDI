-- fisica
-- chamar a biblioteca atribui a biblioteca interna de fisia a variavel physics.
local physics = require ("physics")
-- iniciar a fisica no projeto:
physics.start ()
-- definir a gravidade do projeto: definimos a gravidade x e y do projeto. 
physics.setGravity (0, 9.8) 
-- definir a renderização da visualização da fisica (usado somente durante o desenvolvimento para testes)
-- Modos: normal - aparece apenas as imagens, corpos fisicos invisiveis (padrao do sistema), hybrid: Mostra as imagens e os corpos físicos, debug: Mostra apenas os corpos fisicos.
physics.setDrawMode ("hybrid")

-- adicionando objetos fisicos:
local retangulo = display.newRect (150, display.contentCenterY, 150, 100)
-- Corpo dinâmic: interage com a gravidade e colide com todos os corpos.
physics.addBody (retangulo, "dynamic")

local chao = display.newRect (display.contentCenterX, 400, 450, 30)
-- Corpo estatico: não se movimenta e colide com o corpo dinâmico.
physics.addBody (chao, "static")

local circulo = display.newCircle (300, 50, 30)
-- Corpo Cinematico: nao interage com a gravidade e colide apenas com o corpo dinamico.
physics.addBody (circulo, "kinematic", {radius=30})

local quadrado = display.newRect (display.contentCenterX, 0, 50, 50)
physics.addBody (quadrado,"dynamic", {bounce=1, friction=0, density=0.5})
-- torque adiciona uma rotação em torno do próprio eixo. Valores positivos giram sentido horário. Valores negativos giram sentido anti horário.
quadrado:applyTorque (80)
