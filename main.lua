local screen = "mainMenu"

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
    --btnPlay = love.graphics.newImage("assets/btnPlay.png")
end

function love.update(dt)
    if screen == "mainMenu" then
        musicaMenu:play()
        -- if btnPlayIsPressed() then
        --     screen = "orderStation"
        -- end
    elseif screen == "orderStation" then
        -- Update in-game stuff.
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

        -- Desenha o botão na posição desejada
        --love.graphics.draw(btnPlay, 100, 100)
    elseif screen == "ingame" then
        -- Draw in-game stuff.
    end
end
