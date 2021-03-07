exports [ "scoreboard" ]:scoreboardAddColumn ( "Ocupacion", getRootElement(), 150, name, 10 )

createTeam ( "Trabajadores", 229, 236, 17 )
createTeam ( "Criminales", 255, 0, 0 )
createTeam ( "Policias",0, 92, 198)

addEventHandler("onPlayerLogin", root, 
function ()
	setElementData (source, "Cuenta", getAccountName(getPlayerAccount(source)))
	setTimer (function (source)
		local Lv = getElementData(source, "Ocupacion")
		local Rs = getElementData(source, "SkinF")
		local Vt = getElementData(source, "VehiTrabajo")
		if Lv and tonumber(Lv) ~= nil then else
			setElementData  (source, "Ocupacion", "Civil")
		end
		if Rs and tonumber(Rs) ~= nil then else
			setElementData  (source, "SkinF", 0)
		end
		if Vt and tonumber(Vt) ~= nil then else
			setElementData  (source, "VehiTrabajo", 0)
		end
	end, 1000, 1, source)
end)

function cambioCivil(source)
local cambio = getElementData (source,"SkinF")
local Veh = getElementData(source ,"VehId")
local team = getTeamFromName("Trabajadores")
if(isPedInVehicle (source)) then
			outputChatBox("[Trabajo]#ffffffNo puedes usar este comando en un vehiculo",source, 255,0,0,true)
else
	if isElement(Veh)then
		outputChatBox("[Trabajo]#ffffffEspera a que se destruya tu vehiculo",source, 255,0,0,true)
	else
		setElementData (source, "Ocupacion", "Civil")
		setElementModel(source,cambio)
		setPlayerTeam( source, team)
		setPlayerNametagColor (source, 229, 236, 17 )
	end
end
end

addCommandHandler("civil", cambioCivil)


function arnz(source)
local g,z,y = getElementPosition(source)
createVehicle(541,g,z+1,y+2)
end

addCommandHandler("az", arnz)
