    local physics = require ("physics")
    physics.start ()
    physics.setDrawMode ("hybrid")

    display.setStatusBar (display.HiddenStatusBar)

local chao = display.newRect (display.contentCenterX, 470, 500, 50)
    physics.addBody (chao, "static")


local testeParticula = physics.newParticleSystem (    

    {
     -- Nomr do arquivo de particula sempre obrigatorio
    filename = "liquidParticle.png", 
        -- radius fisico da particula
    radius = 2,
        -- radius da imagem (usa sempre o valor menor que o radius da particula para que elas se sobreponham e tragam um efeito visual mais satisfatorio)
    imageRadius = 4    
        }
    )

local function onTimer (event)
    testeParticula:createParticle (
    {
    x = 0,
    y=0,
    -- Valores iniciais de velocidade para a particula.
    velocityX= 256,
    velocityY= 480,
    -- Define a cor da particula RGBA (com 4 valores alpha)
    color= {1, 0.2, 0.4, 1},
    -- Define tempo de vida da particula, quantos segundos ela permanece na tela antes de morrer (0=infinito)
    lifeTime= 32.0,
    -- Define o comportamento da particula
    flags= {"water", "colorMixing"}
    })
    end
timer.performWithDelay (20, onTimer, 0)

testeParticula:createGroup (
    {
        x= 50,
        y= 0,
        color= {0.3, 1, 1},
        halfWidth= 64,
        halfHeight= 32,
        flags= {"water", "colorMixing"}
    }
)
testeParticula:applyForce (0, -9.8*testeParticula.particleMass)
