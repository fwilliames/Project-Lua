local function sayHello(name)
    name  = name or "Usuario" --forma de tratamento de valores nulos

    print("Ola " .. name .. " Bem vindo!!!")
    
end

sayHello()
sayHello("Frank")