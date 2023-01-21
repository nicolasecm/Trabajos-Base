exports [ "scoreboard" ]:scoreboardAddColumn ( "Ocupacion", getRootElement(), 200, name, 10 )

createTeam ( "Trabajadores", 229, 236, 17 )
createTeam ( "Criminales", 255, 0, 0 )
createTeam ( "Policias", 0, 92, 198)

addEventHandler("onPlayerLogin", root, function ()
	setElementData (source, "Cuenta", getAccountName(getPlayerAccount(source)))
	setTimer (function (source)
		local Vt = getElementData(source, "VehiTrabajo")
		if Vt and tonumber(Vt) ~= nil then else
			setElementData  (source, "VehiTrabajo", 0)
		end
	end, 2000, 1, source)
end)

function cambioCivil(source)
	local cambio = getElementData (source,"SkinSave") or 0
	local Veh = getElementData(source ,"VehId")
	local team = getTeamFromName("Trabajadores")
	if(isPedInVehicle (source)) then
		addNotificationS(source, "Trabajo: No puedes usar este comando en un vehiculo", "error")
	else
		if isElement(Veh)then
			addNotificationS(source, "Trabajo: Espera a que se destruya tu vehiculo", "error")
		else
			if (getElementData(source ,"VehiTrabajo") == 1)then
				setElementData(source,"VehiTrabajo", 0)
				for i , carro in ipairs(getElementsByType("vehicle")) do
					if getElementData(carro, "VehiTrabajo") == getPlayerName(source) then
						destroyElement(carro)
						cambioCivil(source)
					end
				end
			else
				setElementData (source, "Ocupacion", "Civil")
				setElementModel(source,cambio)
				setPlayerTeam( source, team)
				setPlayerNametagColor (source, 229, 236, 17)
			end
		end
	end
end
addCommandHandler("civil", cambioCivil)

function addNotificationS(player, msg, type)
	triggerClientEvent( player, "addNotificationServer", player, msg, type )
end