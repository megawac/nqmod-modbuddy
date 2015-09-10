-- HonorChanges
-- Author: Fruitstrike
-- DateCreated: 3/11/2015 10:34:52 PM
--------------------------------------------------------------

function GJS_UnitKilledInCombat_Honor(iPlayer, iKilled, iUnitType)

	local player = Players[iPlayer]

	-- early out if you don't Honor filled out
	if (player:HasPolicy(GameInfo.Policies["POLICY_WARRIOR_CODE"].ID) and
		player:HasPolicy(GameInfo.Policies["POLICY_PROFESSIONAL_ARMY"].ID) and
		player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_TRADITION"].ID) and
		player:HasPolicy(GameInfo.Policies["POLICY_DISCIPLINE"].ID) and
		player:HasPolicy(GameInfo.Policies["POLICY_MILITARY_CASTE"].ID)) then

		-- grant science (Note: science pop up on unit death performed in DLL in a very ugly way)
		local amount = GameInfo.Units[iUnitType].Combat
		Teams[player:GetTeam()]:GetTeamTechs():ChangeResearchProgress(player:GetCurrentResearch(), amount, iPlayer)

	end

end
GameEvents.UnitKilledInCombat.Add(GJS_UnitKilledInCombat_Honor)