function updateDashboard()
	jugadores = getElementsByType("player",root,true)
	for num, jugador in ipairs(jugadores) do
		ocupacionActualizar = getElementData(jugador, "Ocupacion") or "Civil"
		if ocupacionActualizar:find "Minero" ~= nil then
            nivelMinero = getElementData(jugador, "nivelMinero") or 0
            setElementData(jugador,"Ocupacion", "Minero (Nivel "..nivelMinero..")", true)
        end
		if ocupacionActualizar:find "Repartidor de Pizza" ~= nil then
            nivelPizzero = getElementData(jugador, "nivelPizzero") or 0
            setElementData(jugador,"Ocupacion", "Repartidor de Pizza (Nivel "..nivelPizzero..")", true)
        end
		if ocupacionActualizar:find "Repartidor de Pollo" ~= nil then
            nivelPollo = getElementData(jugador, "nivelPollo") or 0
            setElementData(jugador,"Ocupacion", "Repartidor de Pollo (Nivel "..nivelPollo..")", true)
        end
        if ocupacionActualizar:find "Piloto" ~= nil then
            nivelPiloto = getElementData(jugador, "nivelPiloto") or 0
            setElementData(jugador,"Ocupacion", "Piloto (Nivel "..nivelPiloto..")", true)
        end
        if ocupacionActualizar:find "Cargador de Cajas" ~= nil then
            nivelCargador = getElementData(jugador, "nivelCargador") or 0
            setElementData(jugador,"Ocupacion", "Cargador de Cajas (Nivel "..nivelCargador..")", true)
        end
        if ocupacionActualizar:find "Electricista" ~= nil then
            nivelElectricista = getElementData(jugador, "nivelElectricista") or 0
            setElementData(jugador,"Ocupacion", "Electricista (Nivel "..nivelElectricista..")", true)
        end
        if ocupacionActualizar:find "Leñador" ~= nil then
            nivelLenador = getElementData(jugador, "nivelLenador") or 0
            setElementData(jugador,"Ocupacion", "Leñador (Nivel "..nivelLenador..")", true)
        end
	end	
end
addEventHandler("onClientRender",getRootElement(),updateDashboard)

function addNotificationServer(texto,tipo)
    exports.Notificaciones:addNotification(texto,tipo, true)
end
addEvent( "addNotificationServer", true )
addEventHandler( "addNotificationServer", root, addNotificationServer )