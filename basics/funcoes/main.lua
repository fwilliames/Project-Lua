local function sayHello(name)
    name  = name or "Usuario" --forma de tratamento de valores nulos
    print("Ola " .. name .. " Bem vindo!!!")
    
end

local function tiposParametros(param)
    if type(param) == "string" then
        print("Ola " .. param .. " Bem vindo!!!")
    else
        print("Ola " .. param .. "x")  
    end
    
end

sayHello()
sayHello("Frank")
tiposParametros("frank")
tiposParametros(5)