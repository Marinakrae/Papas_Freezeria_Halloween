local pedidos      = {}

local arrayPedidos = {}

local sabor1       = math.random(1, 6)

local sabor2       = math.random(1, 6)

local calda        = math.random(1, 5)

local granulado    = math.random(1, 4)

local adicional    = math.random(1, 4)

local chantilly    = math.random(1, 5)

function pedidos.array()
    while sabor1 == sabor2 do
        sabor2 = math.random(1, 6)
    end
    arrayPedidos[1] = sabor1
    arrayPedidos[2] = sabor2
    arrayPedidos[3] = calda
    arrayPedidos[4] = granulado
    arrayPedidos[5] = adicional
    arrayPedidos[6] = chantilly
end

function pedidos.exibe(arrayPedidos)
    i = 1
    for i in values(arrayPedidos) do
        return arrayPedidos[i];
    end
end
