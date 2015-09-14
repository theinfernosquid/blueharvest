AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("hud.lua")

include("shared.lua")

function GM:PlayerSpawn(ply)
	ply:SetGravity(.80)
	ply:SetMaxHealth(99)
	ply:SetRunSpeed(500)
	ply:SetWalkSpeed(500)
	ply:Give("weapon_physcannon")
	ply:Give("weapon_physgun")
end