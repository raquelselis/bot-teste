function validar_cpf(cpf)
    -- Remove caracteres não numéricos
    cpf = string.gsub(cpf, "%D", "")

    -- Verifica se o CPF tem 11 dígitos
    if #cpf ~= 11 then
        return false
    end

    -- Verifica se todos os dígitos são iguais (CPFs inválidos conhecidos)
    if cpf:match("^%d%d%d%d%d%d%d%d%d%d%d$") and cpf:match("^([0-9])%1+$") then
        return false
    end

    -- Calcula o primeiro dígito verificador
    local soma = 0
    for i = 1, 9 do
        soma = soma + tonumber(cpf:sub(i, i)) * (11 - i)
    end
    local resto = soma % 11
    local digito1 = resto < 2 and 0 or 11 - resto

    -- Calcula o segundo dígito verificador
    soma = 0
    for i = 1, 10 do
        soma = soma + tonumber(cpf:sub(i, i)) * (12 - i)
    end
    resto = soma % 11
    local digito2 = resto < 2 and 0 or 11 - resto

    -- Verifica se os dígitos calculados são iguais aos dígitos verificadores fornecidos
    return digito1 == tonumber(cpf:sub(10, 10)) and digito2 == tonumber(cpf:sub(11, 11))
end

function pedir_cpf()
    io.write("Por favor, digite o seu CPF: ")
    local cpf_teste = io.read()

    if cpf_teste == nil then
        print("Entrada inválida. Tente novamente.")
        return tentar_novamente()
    end

    if validar_cpf(cpf_teste) then
        print("CPF correto!")
    else
        print("Desculpe! CPF inválido.")
    end

    return tentar_novamente()
end

function tentar_novamente()
    io.write("Quer tentar novamente?\n1. Sim\n2. Não\n")
    local escolha = io.read()

    if escolha == "1" then
        return pedir_cpf()
    else
        print("Até logo!")
        return
    end
end

-- Início do programa
print("Isso foi desenvolvido pelo Leandro Alvarenga")
pedir_cpf()