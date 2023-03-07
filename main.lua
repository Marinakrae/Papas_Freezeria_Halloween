-- Variáveis locais de controle

local screen = "mainMenu"
local desenha = true
local tocaMusica = true
--local libPedidos = require "libPedidos"


--sound = love.audio.newSource("pling.wav", "static") -- para efeitos sonoros
--sound:play()
musicaMenu = love.audio.newSource("assets/sounds/menu.mp3", "stream") -- para musicas
musicaMenu:setVolume(0.1) -- 70% do volume

love.window.setTitle("Papa's Freezeria Edição de Halloween")


-- Funções

function love.conf(t)
    t.screen.width = 900
    t.screen.height = 700
end

--Debug
-- function love.keypressed(key, u)
--     --Debug
--     if key == "rctrl" then --set to whatever key you want to use
--         debug.debug()
--     end
-- end

-- Verifica se o mouse está sobre o botão
--Passar como parametro as variaveis com os valores do botão em questão
function clicou(btnX, btnY, btnHeight, btnWidth)
    local mouseX, mouseY = love.mouse.getPosition()

    if mouseX >= btnX and mouseX <= btnX + btnWidth and
        mouseY >= btnY and mouseY <= btnY + btnHeight then
        -- O mouse está sobre o botão
        if love.mouse.isDown(1) then
            -- O usuário clicou no botão
            return true
        end
    else
        return false
    end
end

--Funções padrão

function love.load()
    --Imagens - ordenadas por ordem de aparição

    --Fundos
    fundo = love.graphics.newImage("assets/images/Tela_inicial_Fundo.png")
    fundoPlaceholder = love.graphics.newImage("assets/images/fundo_placeholder.png")

    --Objetos
    dummy = love.graphics.newImage("assets/images/dummy.png")


    --Botões
    --Transformar em função dps se possível os posicionamentos da imagem do botão para servir como botão
    btnPlay = love.graphics.newImage("assets/images/Play_button.png")
    btnPlayX = 100
    btnPlayY = 100
    btnPlayWidth = btnPlay:getWidth()
    btnPlayHeight = btnPlay:getHeight()

    btnVolumeOn = love.graphics.newImage("assets/images/Volume_icon_on.png")
    btnVolumeOnX = 700
    btnVolumeOnY = 500

    btnVolumeOnWidth = btnVolumeOn:getWidth()
    btnVolumeOnHeight = btnVolumeOn:getHeight()

    btnVolumeOff = love.graphics.newImage("assets/images/Volume_icon_off.png")
    btnVolumeOffX = 700
    btnVolumeOffY = 500
    btnVolumeOffWidth = btnVolumeOff:getWidth()
    btnVolumeOffHeight = btnVolumeOff:getHeight()
end

function love.update(dt)
    if screen == "mainMenu" then
        --Controle da música
        if tocaMusica then
            musicaMenu:play()
        else
            musicaMenu:stop()
        end

        --Testa se clicou no botão de volume
        --Testa se clicou no botao de musica off (aí quer ligar)
        if clicou(btnVolumeOffX, btnVolumeOffY, btnVolumeOffHeight, btnVolumeOffWidth) then
            tocaMusica = true
            love.graphics.draw(btnVolumeOn, btnVolumeOnX, btnVolumeOnY, 0, 0.9)
        end

        --Testa se clicou no botao de musica on (aí quer desligar)
        if clicou(btnVolumeOnX, btnVolumeOnY, btnVolumeOnHeight, btnVolumeOnWidth) then
            tocaMusica = false
            love.graphics.draw(btnVolumeOff, btnVolumeOffX, btnVolumeOffY, 0, 0.9)
        end

        --Testa se clicou em play
        if clicou(btnPlayX, btnPlayY, btnPlayHeight, btnPlayWidth) then
            desenha = false
            screen = "orderStation"
        end
    elseif screen == "orderStation" then
        -- if playerIsDead() then
        --     screen = "mainmenu"
        -- end
    end
end

function love.draw()
    if screen == "mainMenu" then
        -- Define a cor de fundo da tela
        love.graphics.setBackgroundColor(255, 255, 255)

        -- Desenha a imagem de fundo na posição (0, 0)
        love.graphics.draw(fundo, 0, 0, 0, 1)

        --print(libPedidos.PedidosExibe)

        if desenha then
            -- Desenha o botão play na posição desejada
            love.graphics.draw(btnPlay, 270, 300, 0, 0.5)
            love.graphics.draw(btnVolumeOff, btnVolumeOffX, btnVolumeOffY, 0, 0.9)
            love.graphics.draw(btnVolumeOn, btnVolumeOnX, btnVolumeOnY, 0, 0.9)
        end
    elseif screen == "orderStation" then
        love.graphics.draw(fundoPlaceholder, 0, 0)
        love.graphics.draw(dummy, 270, 300, 0, 0.5)
    end
end
