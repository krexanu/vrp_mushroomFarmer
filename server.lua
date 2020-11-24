local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_ciupercar")
vRPCciupercar = Tunnel.getInterface("vRP_ciupercar","vRP_ciupercar")

vRPciupercar = {}
Tunnel.bindInterface("vRP_ciupercar",vRPciupercar)
Proxy.addInterface("vRP_ciupercar",vRPciupercar)

function vRPciupercar.verificaciuperci(ciuperci)
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local bani = math.random(50,150)
    if ciuperci == 6 then
        vRP.giveMoney({user_id,bani})
        vRPclient.notify(player,{"Reward "..bani})
    else
        vRPclient.notify(player,{"You don't have enough mushrooms"})
    end
end

local function build_confisca(source)
	local user_id = vRP.getUserId({source})
  if user_id ~= nil then
		vRPclient.setNamedBlip(source, {"vRP:badfgdafgadfgadfgdfgdgdfdgdfgdfgfdglip:quest", 1725.1472167969,4642.4184570313,43.875480651855, 384, 83, "~w~Mushroom Farmer"})
	end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
  if first_spawn then
    build_confisca(source)
  end
end)