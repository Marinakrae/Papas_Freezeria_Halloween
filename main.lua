--Lib PedidosArray
local pedidos      = {}

local arrayPedidos = {}

local sabor1

local sabor2

local calda

local granulado

local adicional

local chantilly

local i            = 0

function PedidosArray(sabor1, sabor2, calda, granulado, adicional, chantilly)
    if i == 0 then
        while sabor1 == sabor2 do
            sabor2 = math.random(1, 6)
        end
        if (sabor1 == 1) then
            sabor1 = "Aranha"
        elseif (sabor1 == 2) then
            sabor1 = " Olho"
        elseif (sabor1 == 3) then
            sabor1 = " Cérebro"
        elseif (sabor1 == 4) then
            sabor1 = " Ratos Mortos"
        elseif (sabor1 == 5) then
            sabor1 = " Carne podre"
        elseif (sabor1 == 6) then
            sabor1 = " Abóbora"
        end

        if (sabor2 == 1) then
            sabor2 = " Aranha"
        elseif (sabor2 == 2) then
            sabor2 = " Olho"
        elseif (sabor2 == 3) then
            sabor2 = " Cérebro"
        elseif (sabor2 == 4) then
            sabor2 = " Ratos Mortos"
        elseif (sabor2 == 5) then
            sabor2 = " Carne podre"
        elseif (sabor2 == 6) then
            sabor2 = " Abóbora"
        end

        if (calda == 1) then
            calda = " Sangue"
        elseif (calda == 2) then
            calda = " Gosma verde"
        elseif (calda == 3) then
            calda = " Veneno"
        elseif (calda == 4) then
            calda = " Agua de esgoto"
        elseif (calda == 5) then
            calda = " Baba"
        end

        if (granulado == 1) then
            granulado = " Dentes"
        elseif (granulado == 2) then
            granulado = " Pelos"
        elseif (granulado == 3) then
            granulado = " Cinzas"
        elseif (granulado == 4) then
            granulado = " Unhas"
        end

        if (adicional == 1) then
            adicional = " Ossos"
        elseif (adicional == 2) then
            adicional = " Teia de Aranha"
        elseif (adicional == 3) then
            adicional = " Dedos"
        elseif (adicional == 4) then
            adicional = " Mini abóbora"
        end

        if (chantilly == 1) then
            chantilly = " Preto"
        elseif (chantilly == 2) then
            chantilly = " Verde"
        elseif (chantilly == 3) then
            chantilly = " Vermelho"
        elseif (chantilly == 4) then
            chantilly = " Laranja"
        elseif (chantilly == 5) then
            chantilly = " Branco"
        end
        arrayPedidos = { sabor1, sabor2, calda, granulado, adicional, chantilly }
        i = 1
    end
    return arrayPedidos
end

----

local screen = "mainMenu"
local desenha = true
local tocaMusica = true
local xDummy = 100

--sound = love.audio.newSource("pling.wav", "static") -- para efeitos sonoros
--sound:play()
musicaMenu = love.audio.newSource("assets/sounds/menu.mp3", "stream") -- para musicas
musicaMenu:setVolume(0.1)                                             -- 70% do volume

love.window.setTitle("Papa's Freezeria Edição de Halloween")

-- Funções

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

--AtualizarCliente
function atualizarImagemCliente(dt)
    if xDummy >= 200 then
        local delta = 100 -- ajuste a velocidade da animação alterando este valor
        xDummy = xDummy + delta * -dt
    end
end

--Funções padrão

function love.load()
    --Dimensões da tela
    love.window.setMode(900, 700)

    --Imagens - ordenadas por ordem de aparição

    --Fundos
    fundo = love.graphics.newImage("assets/images/Tela_inicial_Fundo.png")
    fundoPlaceholder = love.graphics.newImage("assets/images/fundo_placeholder.png")
    takeOrderPlaceHolder = love.graphics.newImage("assets/images/orderTake_placeholder.png")

    --Objetos
    dummy = love.graphics.newImage("assets/images/dummy.png")

    --Itens do pedido

    --Botões
    --Transformar em função dps se possível os posicionamentos da imagem do botão para servir como botão
    btnPlay = love.graphics.newImage("assets/images/Play_button.png")
    btnPlayX = 330
    btnPlayY = 420
    btnPlayWidth = btnPlay:getWidth() * 0.5
    btnPlayHeight = btnPlay:getHeight() * 0.5

    btnVoltar = love.graphics.newImage("assets/images/Back_button.png")
    btnVoltarX = -70
    btnVoltarY = -70
    btnVoltarWidth = btnVoltar:getWidth() * 0.3
    btnVoltarHeight = btnVoltar:getHeight() * 0.3

    btnVolumeOn = love.graphics.newImage("assets/images/Volume_icon_on.png")
    btnVolumeOnX = 810
    btnVolumeOnY = 590
    btnVolumeOnWidth = btnVolumeOn:getWidth()
    btnVolumeOnHeight = btnVolumeOn:getHeight()

    btnVolumeOff = love.graphics.newImage("assets/images/Volume_icon_off.png")
    btnVolumeOffX = 750
    btnVolumeOffY = 590
    btnVolumeOffWidth = btnVolumeOff:getWidth()
    btnVolumeOffHeight = btnVolumeOff:getHeight()

    btnPedido = love.graphics.newImage("assets/images/pegar_pedido.png")
    btnPedidoX = 100
    btnPedidoY = 200
    btnPedidoWidth = btnPedido:getWidth()
    btnPedidoHeight = btnPedido:getHeight()
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
            tocaMusica = false
        end

        --Testa se clicou no botao de musica on (aí quer desligar)
        if clicou(btnVolumeOnX, btnVolumeOnY, btnVolumeOnHeight, btnVolumeOnWidth) then
            tocaMusica = true
        end

        --Testa se clicou em play
        if clicou(btnPlayX, btnPlayY, btnPlayHeight, btnPlayWidth) then
            screen = "orderStation"
            desenha = true -- mover essa linha para dentro do if
            xDummy = 1000
        end
    elseif screen == "orderStation" then
        if clicou(btnVoltarX, btnVoltarY, btnVoltarHeight, btnVoltarWidth) then
            screen = "mainMenu"
            desenha = true
        end
        --Dummy se movendo
        atualizarImagemCliente(dt)

        if clicou(btnPedidoX, btnPedidoY, btnPedidoHeight, btnPedidoWidth) then
            screen = "takeOrder"
            desenha = true
        end
    end
end

function love.draw()
    if screen == "mainMenu" then
        -- Define a cor de fundo da tela
        love.graphics.setBackgroundColor(255, 255, 255)

        -- Desenha a imagem de fundo na posição (0, 0)
        love.graphics.draw(fundo, 0, 0, 0, 1)

        if desenha then
            -- Desenha o botão play na posição desejada
            love.graphics.draw(btnPlay, 330, 420, 0, 0.5)

            love.graphics.draw(btnVolumeOn, btnVolumeOnX, btnVolumeOnY, 0, 0.9)

            love.graphics.draw(btnVolumeOff, btnVolumeOffX, btnVolumeOffY, 0, 0.9)
        end
    elseif screen == "orderStation" then
        love.graphics.draw(fundoPlaceholder, 0, 0)
        love.graphics.draw(dummy, xDummy, 300, 0, 0.3)
        love.graphics.draw(btnVoltar, -70, -70, 0, 0.5)
        love.graphics.print(PedidosArray(math.random(1, 6), math.random(1, 6), math.random(1, 5), math.random(1, 4),
            math.random(1, 4), math.random(1, 5)))
    elseif screen == "takeOrder" then
        love.graphics.draw(takeOrderPlaceHolder, 0, 0)
    end
end
