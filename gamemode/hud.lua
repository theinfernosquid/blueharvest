function HUD()
	local client = LocalPlayer()
	
	if !client:Alive() then
		return
	end
	
	-- Health and Armor --
	draw.RoundedBox(0, 0, ScrH() - 100, 250, 100, Color(30, 30, 30, 230)) -- Draw HUD Health background
	
	-- Health --
	draw.SimpleText("Health: "..client:Health(), "DermaDefaultBold", 10, ScrH() - 90, Color(255, 255, 255, 255), 0, 0) -- Text
	draw.RoundedBox(0, 10, ScrH() - 75, 100 * 2.25, 15, Color(255, 0, 0, 30)) -- Ghost box showing 100%
	draw.RoundedBox(0, 10, ScrH() - 75, math.Clamp(client:Health(), 0, 100) * 2.25, 15, Color(255, 0, 0, 255)) -- Actual health 
	draw.RoundedBox(0, 10, ScrH() - 75, math.Clamp(client:Health(), 0, 100) * 2.25, 5, Color(255, 30, 30, 255)) -- Actual health highlight

	-- Armor --
	draw.SimpleText("Armor: "..client:Armor(), "DermaDefaultBold", 10, ScrH() - 45, Color(255, 255, 255, 255), 0, 0) -- Text
	draw.RoundedBox(0, 10, ScrH() - 30, 100 * 2.25, 15, Color(0, 0, 255, 30)) -- Ghost box showing 100%
	draw.RoundedBox(0, 10, ScrH() - 30, math.Clamp(client:Armor(), 0, 100) * 2.25, 15, Color(0, 0, 255, 255)) -- Actual ammo
	draw.RoundedBox(0, 10, ScrH() - 30, math.Clamp(client:Armor(), 0, 100) * 2.25, 5, Color(15, 15, 255, 255)) -- Actual ammo highlight

	-- Weapon and Ammo --
	draw.RoundedBox(0, 255, ScrH() - 70, 125, 70, Color(30, 30, 30, 230)) -- Draw HUD Wep and Armor background
	
	if (client:GetActiveWeapon():GetPrintName() != nil) then -- If the active wep has a pretty name, use it
		draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "DermaDefaultBold", 260, ScrH() - 60, Color(255, 255, 255, 255), 0, 0)
	end
	
	if (client:GetActiveWeapon():Clip1() != -1) then -- If the main clip has a weird ammo val, don't use it
		draw.SimpleText("Ammo: " .. client:GetActiveWeapon():Clip1() .. "/" .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", 260, ScrH() - 40, Color(255, 255, 255, 255), 0, 0)
	else draw.SimpleText("Ammo: " .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", 260, ScrH() - 40, Color(255, 255, 255, 255), 0, 0)
	end
	
	if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
		draw.SimpleText("Secondary: " .. client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()), "DermaDefaultBold", 260, ScrH() - 25, Color(255, 255, 255, 255), 0, 0)
	end
	
end
hook.Add("HUDPaint", "CustomHud", HUD)

function HideHud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then
			return false
		end
	end

end
hook.Add("HUDShouldDraw", "HideDefaultHud", HideHud)