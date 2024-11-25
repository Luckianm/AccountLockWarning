-- Importa módulos essenciais do servidor
require "System\\ScriptCore"
require "System\\ScriptDefines"

-- Anexa a função "BPOnCharacterEntry" ao evento de entrada de personagem
BridgeFunctionAttach("OnCharacterEntry", "BPOnCharacterEntry")

-- Função principal executada ao jogador entrar no jogo
function BPOnCharacterEntry(aIndex)
    -- Mensagens de boas-vindas em diferentes idiomas
    local messages = {
        [0] = ". Welcome to Mu XXXX, use our security system (Shift+L) and protect your account against theft.", -- Inglês
        [1] = ". Bem Vindo ao Mu XXXX, utilize nosso sistema de segurança (Shift+L) e proteja sua conta contra roubos.", -- Português
        [2] = ". Bienvenido a Mu XXXX, utilice nuestro sistema de seguridad (Shift+L) y proteja su cuenta contra robos." -- Espanhol
    }

    -- Obtém informações do jogador
    local playerLanguage = GetUserLanguage(aIndex) -- Idioma do jogador (0 = Inglês, 1 = Português, 2 = Espanhol)
    local playerName = GetObjectName(aIndex)       -- Nome do jogador
    local playerServerCode = GetGameServerCode()   -- Código do servidor atual

    -- Garante que o servidor não seja o código restrito 19 e que o idioma seja suportado
    if playerServerCode ~= 19 and messages[playerLanguage] then
        -- Constrói a mensagem personalizada e envia para o jogador
        local message = playerName .. messages[playerLanguage]
        MessageSend(aIndex, 0, 4, message)
    else
        -- Mensagem padrão de fallback (caso o idioma não seja reconhecido)
        print("Aviso não enviado: Idioma ou servidor inválido.")
    end
end
