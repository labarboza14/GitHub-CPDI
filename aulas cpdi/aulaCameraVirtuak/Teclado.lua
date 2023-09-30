local Teclado = {} --armazena todos os dados do scrip que serão chamados no main

function Teclado.novo (player)

    local function verificarTecla (event)
    -- se a fase de evento for down (tecla pressionada) entao 
        if event.phase == "down" then
        -- se a tecla pressionada for o d entao
            if event.keyName == "d" then
                player.direcao = "direita"
                player:setSequence ("correndo")
                player:play()
                player.xScale = 1       
            elseif event.keyName == "a" then
                player.direcao = "esquerda"
                player:setSequence ("correndo")
                player:play()
                player.xScale = -1
            elseif event.keyName == "space" then
                player.numeroPulo = player.numeroPulo + 1
            -- se o numeroPulo for igual a 1 entao                
                    if player.numeroPulo == 1 then
            -- se o numeroPulo for igual a 2 então          
                       player:applyLinearImpulse (0, -0.4, player.x, player.y)
                    elseif player.numeroPulo == 2 then
            -- transição para o player gire 360 graus em torno do proprio eixo           
                        transition.to (player, {rotation=player.rotation+360, time=750})
                        player:applyLinearImpulse (0, -0.4, player.x, player.y)
                    end
            end
        -- quando a fase do evento fot up (soltarmos a tecla) entao
        elseif event.phase == "up" then
            if event.keyName == "d" then
                player.direcao = "parado"
                player:setSequence("parado")
                player:play()
            elseif event.keyName == "a" then
                player.direcao = "parado"
                player:setSequence("parado")
                player:play()
            end
        end 
    end
    -- "key": relacionado ao teclado 
    Runtime:addEventListener ("key", verificarTecla)
    -- Função de movimentação
    local function verificarDirecao ()
    --Retoma os valores de velocidade linear x e y e armazena nas variáveis velocidadeX, velocidadeY respectivamente.
        local velocidadeX, velocidadeY = player:getLinearVelocity()

        if player.direcao == "direita" and velocidadeX <= 200 then
            player:applyLinearImpulse (0.2, 0, player.x, player.y)
        elseif player.direcao == "esquerda" and velocidadeX >= -200 then
            player:applyLinearImpulse (-0.2, 0, player.x, player.y)
        end 
    end 
    Runtime:addEventListener ("enterFrame", verificarDirecao)
end

return Teclado