require "System\\ScriptCore"
require "System\\ScriptDefines"

BridgeFunctionAttach("OnCharacterEntry", "BPOnCharacterEntry")

function BPOnCharacterEntry(aIndex)
    local textEng = ". Welcome to Mu XXXX, use our security system (Shift+L) and protect your account against theft."
    local textPor = ". Bem Vindo ao Mu XXXX, utilize nosso sistema de segurança (Shift+L) e proteja sua conta contra roubos"
    local textSpn = ". Bienvenido a Mu XXXX, utilice nuestro sistema de seguridad (Shift+L) y proteja su cuenta contra robos."

    local playerHasSeenAlert = false

    local playerLanguage = GetUserLanguage(aIndex)
	local playerName = GetObjectName(aIndex)
    local playerServerCode = GetGameServerCode()

        if playerLanguage == 0 and playerHasSeenAlert == false and playerServerCode ~= 19 then
            MessageSend(aIndex,0,4,playerName..textEng)
            playerHasSeenAlert = true
        elseif playerLanguage == 1 and playerHasSeenAlert == false and playerServerCode ~= 19  then
            MessageSend(aIndex,0,4,playerName..textPor)
            playerHasSeenAlert = true
        elseif playerLanguage == 2 and playerHasSeenAlert == false and playerServerCode ~= 19  then
            MessageSend(aIndex,0,4,playerName..textSpn)
            playerHasSeenAlert = true
        end
end