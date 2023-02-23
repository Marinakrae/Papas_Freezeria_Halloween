local screen = "mainMenu"
local desenha = true

love.window.setTitle("Papa's Freezeria Edição de Halloween")

function love.conf(t)
    t.screen.width = 900
    t.screen.height = 700
end

--sound = love.audio.newSource("pling.wav", "static") -- para efeitos sonoros
--sound:play()
musicaMenu = love.audio.newSource("assets/sounds/menu.mp3", "stream") -- para musicas
musicaMenu:setVolume(0.1) -- 70% do volume

function love.load()
    fundo = love.graphics.newImage("assets/images/fundo_menu_rascunho.png")
    fundoPlaceholder = love.graphics.newImage("assets/images/fundo_placeholder.png")
    btnPlay = love.graphics.newImage("assets/images/Play_button.png")
    --Posicionamento da imagem do botão para servir como botão. Transformar em função dps se possível
    btnPlayX = 100
    btnPlayY = 100
    btnPlayWidth = btnPlay:getWidth()
    btnPlayHeight = btnPlay:getHeight()
end

function love.update(dt)
    if screen == "mainMenu" then
        musicaMenu:play()
        -- Verifica se o mouse está sobre o botão
        local mouseX, mouseY = love.mouse.getPosition()
        if mouseX >= btnPlayX and mouseX <= btnPlayX + btnPlayWidth and
            mouseY >= btnPlayY and mouseY <= btnPlayY + btnPlayHeight then
            -- O mouse está sobre o botão
            if love.mouse.isDown(1) then
                -- O usuário clicou no botão
                screen = "orderStation"
                desenha = false
            end
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
        love.graphics.draw(fundo, 0, 0)

        if desenha then
            -- Desenha o botão play na posição desejada
            love.graphics.draw(btnPlay, 270, 300, 0, 0.5)
        end
    elseif screen == "orderStation" then
        love.graphics.draw(fundoPlaceholder, 0, 0)
    end
end
