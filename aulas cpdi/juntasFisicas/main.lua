local physics = require ("physics")
physics.start ()
physics.setGravity (0, 9.8)
physics.setDrawMode ("hybrid") -- normal, hybrid, debug

display.setStatusBar (display.HiddenStatusBar)

local joint

-- local staticBox = display.newRect (0, 0, 60, 60)
-- staticBox: setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static", {isSensor=true})
-- staticBox.x, staticBox.y = display.contentCenterX, 80

-- local shape = display.newRect (0,0,40,100)
-- shape:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape, "dymanic")
-- shape.x, shape.y, shape.rotation = 100, staticBox.y-40, 0

-- -- --Criação da junta pivô ("tipo de junta", objA, objB, ancoraX, ancoraY)
-- -- local jointPivot = physics.newJoint ("pivot",staticBox, shape, staticBox.x, staticBox.y)
-- -- jointPivot.isMotorEnabled = true -- Ativa o motor da junta de pivÔ
-- -- jointPivot.motorSpeed = 40 -- Define a velocidade do torque do motor
-- -- jointPivot.maxMotorTorque = 1000 -- Define o valor máximo da velocidade do torque do motor, utilizado para melhor visualização do efeito.
-- -- jointPivot.isLimitEnabled = true -- Deermina como arivado os limites de rotação.
-- -- jointPivot:setRotationLimits (-60, 125)
-- ---------------------
-- -- --Junta de distancia 
-- -- local staticBox = display.newRect (0, 0, 60, 60)
-- -- staticBox: setFillColor (0.2, 0.2, 1)
-- -- physics.addBody (staticBox, "static", {isSensor=true})
-- -- staticBox.x, staticBox.y = 200,  180

-- -- local shape = display.newRect (0, 0, 40, 100)
-- -- shape: setFillColor (1, 0.2, 0.2, 0.4)
-- -- physics.addBody (shape, "dynamic")
-- -- shape.x, shape.y = 200, 80
-- -- -- "tipo de junta", objA, objB, ancoraObjA.x, ancoraObja.x, ancoraObjB.x, ancoraObjb.y
-- -- local jointDistance = physics.newJoint ("distance", staticBox, shape, staticBox.x, staticBox.y - 10, shape.x, shape.y)

-- -- jointDistance.frequency = 0.8 -- Degine a frequencia de amortecimento em Hz. Quanto menor o valor mais macio.
-- -- jointDistance.dampingRatio = 0.8 -- nível de amortecimento, onde 1 é amortecimento critico (os valores bão de 0 a 1, usa as casas decimais para definir)
-- -- jointDistance.lenght = staticBox.y - shape.y --Define a distancia entre os pontos de ancoragem.

-- -- shape:applyLinearImpulse (0.3, 0, shape.x, shape.y -5)
-- -- -- Junta de pistão

-- -- local staticBox = display.newRect (0, 0, 60, 60)
-- -- staticBox:setFillColor (0.2, 0.2, 1)
-- -- physics.addBody (staticBox, "static", {isSensor=true})
-- -- staticBox.x, staticBox.y = display.ContentCenterX, 360

-- -- local shape = display.newRect (0, 0, 140, 30)
-- -- shape: setFillColor (1, 0.2, 0.4)
-- -- physics.addBody (shape, "dynamic", {bounce=1})
-- -- shape.x, shape.y = display.contentCenterX, 310

-- -- -- Criação da junta de pistão ("tipo de junta", objA, objB,  ancoraX, ancoraY, limite de movimentação no eixo X, limite de movimentação no eixo Y)
-- -- local jointPiston = physics.newJoint ("piston", staticBox, shape, shape.x, shape.y, 0, 1)

-- -- jointPiston.isMotorEnabled = true -- Habilita o motor da junta

-- -- jointPiston.motorSpeed = -30 -- define a velocidade do motor (valor negativo faz a movimentação inversa)
-- -- jointPiston.maxMotorForce = 1000 -- Define o valor maximo da força motor
-- -- jointPiston.isLimitEnabled = true -- Define que a junta possui limites de movimentação.
-- -- jointPiston: setLimits (-140, 0)

-- --Junta de fricção
-- local  bodies = {} -- String/tabela para armazenamento dos corpos
-- local bodiesGroup = display.newGroup () -- são os grupos normais
-- local joints = {} -- String/tabela para armazenametno das juntas

-- bodiesGroup.alpha = 0 
-- transition.to (bodiesGroup, {time=600, alpha=1, transition=easing.outQuad}) --Transição do grupo para o alfa 1 em 600 milisegundos com efeito outQuad.

-- local shape1 = display.newRect (bodiesGroup, 0, 0, 40, 40)
-- shape1:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape1, "dynamic")
-- shape1.x, shape1.y, shape1.rotation = display.contentCenterX-60, 170, 0
-- shape1.angularVelocity = 200 --Adiciona um impulso angular ao shape (rotação ao redor do próprio eixo)
-- bodies [#bodies+1] = shape1  -- adiciona o shape a tabela/strin bodies
-- bodies[#bodies+1] = shape1

-- local shape2= display.newRect (bodiesGroup, 0, 0, 40, 40)
-- shape2:setFillColor (1, 0.2, 0.4)
-- physics.addBody (shape2, "dynamic")
-- shape2.x, shape2.y, shape2.rotation = display.contentCenterX+60, 170,0
-- shape2.angularVelocity = 200 

-- local dirtField = display.newRect (bodiesGroup, 0, 0, 120, 190)
-- dirtField.type = "dirt"
-- dirtField:setFillColor (0.4, 0.25, 0.2)
-- physics.addBody (dirtField, "static", {isSensor=true})
-- dirtField.x, dirtField.y = display.contentCenterX-60, 335
-- bodies [#bodies+1] = dirtField

-- local grassField = display.newRect (bodiesGroup, 0, 0, 120, 190)
-- grassField.type = "grass"
-- grassField:setFillColor (0.1, 0.4, 0.3)
-- physics.addBody (grassField, "static", {isSensor=true})
-- grassField.x, grassField.y = display.contentCenterX+60, 335
-- bodies [#bodies+1] = grassField

-- local function handleCollision (self, event)
-- 	if (event.phase == "began") then
-- --Cria dias variaveis para armazenar limite de forma e torque
-- 		local forceLimit = 0
-- 		local torqueLimit = 0
-- -- Se o tipo do outro objeto colidido for .. entao
-- --
--         if (event.other.type == "dirt") then
-- 			forceLimit = 0.22
-- 			torqueLimit = 0.022
-- -- se nao
--         else 
-- -- Altera para outros valores
--             forceLimit = 0.28
--             torqueLimit = 0.028
-- 		end 
-- -- Cria um timer com função temporária para a criação das juntas 10 milisegundos após a colisão
-- 		timer.performWithDelay (10, 
-- 				function ()
-- -- Cria-se a junta ja dentro da string joints, onde o objA é o colidido e o B é o ouvinte da função. e as ancoras são criadas de acordo com a localização do objB.				
-- 					joints[#joints+1]= physics.newJoint ("friction", event.other, self, self.x, self.y)
-- -- Altera os valores máximos de força e torqude de acordo com o obtido no if acima.				
-- 					joints[#joints].maxForce = forceLimit
-- 					joints[#joints].maxTorque = torqueLimit
-- 				end -- fecha o function timer
-- 				) -- fecha o timer
-- 	end  -- fecha o if began
-- end -- fecha a function

-- shape1.collision = handleCollision
-- shape1:addEventListener ("collision", shape1)

-- shape2.collision = handleCollision
-- shape2:addEventListener ("collision", shape2)
-- --------------------


-- --junta de solda
-- local shape = display.newRect (0,0, 60,60)
-- shape: setFillColor (1,0.2, 0.4)
-- physics.addBody (shape, "dynamic", {bounce=1})
-- shape.x, shape.y = display.contentCenterX-10, 230

-- local welded = display.newRect (0, 0, 60, 60)
-- welded:setFillColor (0.6, 0.1, 0.7)
-- physics.addBody (welded, "dynamic", {bounce=1})
-- welded.x, welded.y = display.contentCenterX+40, 180
-- welded.rotation = -25

-- local staticBox = display.newRect (0, 0, display.contentWidth-40, 50)
-- staticBox: setFillColor (0.2, 0.2, 1)
-- physics.addBody (staticBox, "static")
-- staticBox.x, staticBox.y = display.contentCenterX, 420

-- local jointWeld = physics.newJoint ("weld", welded, shape, shape.x, shape.y)
-- --jointWeld.dampingRatio = 0.1
-- --jointWeld.frequency = 0.1

--Junta de roda

local vehicleBody = display.newRect (bodiesGroup, 0, 0, 110, 20)
vehicleBody:setFillColor (0.6, 0.1, 0.7)
physics.addBody (vehicleBody, "dynamic")
vehicleBody.x, vehicleBody.y = display.contentCenterX-50, 330
vehicleBody.isFixedRotation = true 
bodies [#bodies+1] = vehicleBody

local wheelA = display.newCircle (bodiesGroup, 0, 0, 15)
wheelA:setFillColor (1, 0.2, 0.4)
physics.addBody (wheelA, "dynamic", {bounce=0.5, friction=0.8, radius=15})
wheelA.x, wheelA.y = vehicleBody.x-35, vehicleBody.y+30
bodies[#bodies+1] = wheelA

local wheelB = display.newCircle (bodiesGroup, 0, 0, 15)
wheelB:setFillColor (1, 0.2, 0.4)
physics.addBody (wheelB, "dynamic", {bounce=0.5, friction=0.8, radius=15})
wheelB.x, wheelB.y = vehicleBody.x, vehicleBody.y+30
bodies[#bodies+1] = wheelB

local wheelC = display.newCircle (bodiesGroup, 0, 0, 15)
wheelC:setFillColor (1, 0.2, 0.4)
physics.addBody (wheelC, "dynamic", {bounce=0.5, friction=0.8, radius=15})
wheelC.x, wheelC.y = vehicleBody.x+35, vehicleBody.y+30
bodies[#bodies+1] = wheelC

local staticBox = display.newRect (bodiesGroup, 0, 0, display.contentWidth-40, 50)
staticBox:setFillColor (0.2, 0.2, 1)
physics.addBody (staticBox, "static", {bounce=0, friction=1})
staticBox.x, staticBox.y = display.contentCenterX, 420
bodies[#bodies+1]=staticBox
