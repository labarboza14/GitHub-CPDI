-- CARREGANDO O AUDIO DE FUNDO (STREAM INDICADO PARA AUDIOS LONGOS - MUSICA DE FUNDO/AMBIENTE)

local bgAudio = audio.loadStream ("Audio/audio_bg.mp3") -- ("pasta/arquivo.formato")
-- Reservando um canal de audio o som de fundo estara (são 32)
audio.reserveChannels (1)
-- Especificar o volume desse canal 
audio.setVolume (0.6, {channel=1})
-- Reproduzindo o audio
--          (audio a reproduzir/a variavel, {canal, loopins (-1 infinito)})
audio.play (bgAudio, {channel=1, loops=-1}) 

-- loadSound é melhor utilizado com sons curtos, exe tiro
local audioTiro = audio.loadSound ("Audio/tiro.wav")
-- Informações de como o audio deve ser reproduzido
local parametros = {time = 2000, fadein = 200}

local botaoTiro = display.newCircle (60, 300, 32)
botaoTiro:setFillColor (1, 0, 0)

local function tocarTiro ()
    audio.play (audioTiro, parametros)
end

botaoTiro:addEventListener ("tap", tocarTiro)



local audioMoeda = audio.loadSound ("Audio/moeda.wav")

local parametros = {time = 1000, fadeout = 300}
local botaoMoeda = display.newCircle (50, 200, 22)
botaoTiro:setFillColor (0, 1, 1)

local function tocarMoeda ()
    audio.play (audioMoeda, parametros)
end

botaoMoeda:addEventListener ("tap", tocarMoeda)
