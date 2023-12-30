/*
AMX Mod X Plugin

Author: Fysiks (Originally by FeuerSturm)

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.



INSTALLATION:
===============================
	you have to create a folder called "tks" in your
	/addons/amxmodx/configs/ folder.
	if you don't do this, the TK save feature will not
	work.


USAGE (cvars for amxx.cfg):
==========================

dod_tkrevenge_enabled <1/0>					// enable/disable DoD TK Revenge by default

dod_tkrevenge_obeyimmunity <1/0>			// enable/disable Admins with flag
											// "a" (Immunity) being excluded
											// from any revenge for TA/TKs.

dod_tkrevenge_options <1/2/3/4>				// sets the menu options for the
											// DoD TK Revenge Menu:
											// 1 = Forgive!, 1hp (& Glow!), Slay!
											// 2 = Forgive!, Slay!
											// 3 = Forgive!, Slap 50percent!, Slay!
											// 4 = Forgive!, Don't Forgive!
											// 5 = Forgive!, Don't forgive! (slayed if tkcount > 2)

dod_tkrevenge_enableglow <1/0>				// enable/disable glowing players (menu & bot actions)

dod_tkrevenge_forgiveslap <1/0>				// enable/disable slapping the TKer
											// without damage if "Forgive!" was
											// chosen by the victim

dod_tkrevenge_respawnslay <1/0>				// enable/disable slaying TeamKillers
											// after respawning who have already
											// been dead when "Slay" was chosen

dod_tkrevenge_killfx <1/0>					// enable/disable special effects
											// for killing the TeamKiller
											// (fire explosion with sound)

dod_tkrevenge_playersaytks <1/0>			// allow/disallow players to check their
											// current TK-Count by saying "/tks"

dod_tkrevenge_displaytacount <1/0>			// enable/disable displaying a hudmessage
											// to players with info about their TA count
											// when it's increased.

dod_tkrevenge_displaytkcount <1/0>			// enable/disable displaying a hudmessage
											// to players with info about their TK count
											// when it's increased or decreased.

dod_tkrevenge_tasequaltk <amount>			// number of TeamAttacks that equal
											// an unforgiven TeamKill
											// (set to 0 to disable!)

dod_tkrevenge_tareset <1/0>					// enable/disable resetting every player's
											// current TA-count on round start

dod_tkrevenge_novictimdeath <1/0>			// enable/disable feature that prevents
											// victim's deaths to be increased by TKs

dod_tkrevenge_spawnprotect <1/0>			// enable/disable automatic slaying of
											// team killers in defined spawn time

dod_tkrevenge_spawntahandle <1/2/0>			// sets handling for Spawn-TAs
											// 1 = Mirror Damage
											// 2 = Kill TeamAttacker immediately
											// 0 = disabled
											// (spawnprotect feature needs to be enabled!)

dod_tkrevenge_addmirrordmg <amount>			// sets amount of HP a SpawnAttacker loses
											// additionally to the damage mirrored back
											// at him from attacking a teammate
											// (only applies if "spawntahandle" is "1"!)

dod_tkrevenge_spawndistance <amount>		// distance to spawnpoint within what
											// TKs are considered Spawn-TKs
											// (default: 800)

dod_tkrevenge_spawntkcount <amount>			// number of warnings to add to the
											// spawn killers tk-count.
											
dod_tkrevenge_warnings <amount>				// number of unforgiven TKs until
											// player is kicked/banned
											// (1hp/Slap are not counted as unforgiven)

dod_tkrevenge_ban <1/0>						// set to 1 to ban the teamkiller after
											// your amount of warnings.
											// set to 0 to just kick him

dod_tkrevenge_bantime <time>				// time in minutes to ban a teamkiller
											// from the server (if you enabled ban)

dod_tkrevenge_useamxbans <1/0>				// enable/disable using AMXBans to ban
											// players for excessive TeamKilling

dod_tkrevenge_amxbansreason <reason>		// sets reason which is displayed in AMXBans
											// Webinterface (use quotes!)
											// (default: "Excessive TeamKilling")

dod_tkrevenge_meleeslay <1/0>				// immediatly kill player on melee
											// TA/TK (see description for more info!)

dod_tkrevenge_meleetkcount <amount>			// number of warnings to add to the
											// back stabbers tk-count.

dod_tkrevenge_nadetkcount <1/0>				// enable/disable increasing the tk-count
											// on unforgiven grenade tks

dod_tkrevenge_karmareducetk <amount>		// Karma points needed to reduce player's
											// TK-count by 1 while a TK zeroes the
											// karma counter again!
											// (set to 0 to disable)

dod_tkrevenge_killkarma <amount>			// amount of karma points a player gains
											// for killing an enemy

dod_tkrevenge_scorekarma <amount>			// amount of karma points a player gains
											// for capping a flag

dod_tkrevenge_botaction <1/2/3/4/5/0>		// sets action for TKs on Bots
											// 1 = Forgive!
											// 2 = 1hp (& Glow!)
											// 3 = Slay!
											// 4 = Slap 50percent!
											// 5 = DON'T Forgive!
											// 0 = disabled

dod_tkrevenge_savetks <1/0>					// enable/disable saving each player's
											// TK-count and reload it on reconnect


DESCRIPTION:
===========
	- This plugin is a simple but effective TK Revenge provider,
	  a menu pops up for the victim of a teamkiller and he can choose
	  to "Forgive!", "Glow & 1hp!" or "Slap with 50percent!" or "Slay!" 
	  the teamkiller.
	  You can set what option will appear in the TK Revenge menu.
	  * Forgive! just slaps the TKer without damage
	  * 1hp (& Glow)! sets him to 1hp (and makes him glow in his team's color)
		until he respawns. (Glow can be enabled/disabled)
	  * Slap with 50percent! will slap him with 50% damage of his current
		health
	  * Slay! will added 1 to his tk count and kills him if he's alive
		and his tk count is checked against the number of warnings you
		set up and a yellow hudmessage saying
		"TeamKill Warning X/X: Watch your fire!"
		is shown. once the tk count equals the warnings the hudmessage
		is shown in red. on the next unforgiven tk the teamkiller will
		either be kicked or banned for X minutes. (depends on your setup)
	  * DON'T Forgive! does the same as "Slay!" but without killing the
		attacker.
	- TeamKills don't have to be counted as deaths for Victims.
	- Melee TAs/TKs can be handled different, it's possible
	  to directly slay on a melee TA/TK without giving the victim
	  the ability to forgive or glow. if the attacker is slayed for
	  a melee attack, his tk count is not increased, but if he
	  is slayed for a melee tk, it will be increased by the set amount.
	  Knife, Spade, K43 Butt, Garand Butt & Bayonet are considered
	  melee weapons.
	- A specified amount of TAs can count as an unforgiven TK.
	- Spawn TeamKills can be handled different as well. If a TK
	  occurs in your defined distance after respawn, the team killer can be
	  slayed and his tk-count will be increased by the set amount.
	- Grenade TeamKills can be handled on a special way as well, you
	  can set up either to increase the tk-count or not if "Slay!"
	  was chosen by the victim of a friendly grenade.
	- The TK-Count of players can be decreased
	  by 1 if they gain a set amount of karma without doing any Tks.
	  (Karma can consist of FlagCaps and EnemyKills)
	- TeamKillers can be slayed after respawning if they are already dead
	- You can set your bots (if you are using Sturmbot/Shrikebot for example)
	  to react on TKs with forgiving, 1hp (& glowing) or Slapping and slaying the
	  teamkiller.
	  That way you can be sure that your bots aren't the easy shooting targets
	  for teamkillers.
	- Every player's tk-count can be saved and reloaded if he reconnects.
	  This feature is independent from time and map, his info is saved for good
	  until you either delete it, or the TKer starts to play serious and gets his
	  tk-count decreased. this prevents hardcore teamkillers from simply
	  reconnecting to the server to get their tk-count zeroed.
	  Note: if you use this feature, be sure to use banning of teamkillers,
			otherwise it wouldn't make any sense to use this feature.
	- AMXBans can be used to ban teamkillers.
	- Admins with access level ADMIN_IMMUNITY can be excluded from any punishments
	  for a tk, the plugin just just ignores their teamkills.

TO DO:
=========
	- Possibly remove name from slay when mode 5 is being used.
	- Add in ability to make judgement on players that have already left to prevent "reconnecters"

CHANGELOG:
=========
	Old changelog can be found in original plugin
*/

#include <amxmodx>
#include <amxmisc>
#include <dodx>
#include <dodfun>
#include <fun>
#include <hamsandwich>
#include <nvault>

new tkcount[33], tacount[33], karma[33], teamkiller[33], tk_punishment[33]
new tkillglow[33], melee_attacked[33], nadetk[33], spawn_attacked[33], respawnslay[33]
new spawnorigin[33][3], killorigin[33][3], tkerorigin[33][3]
new g_iNadeTKCount[33]
new g_pExplodeModel // Pointer to the explosion model

// Cvars
new g_pEnabled
new g_pObeyImmunity
new g_pMaxWarnings
new g_pPlayerSayTKs
new g_pDisplayTACount
new g_pDisplayTKCount
new g_pTAsEqualTK
new g_pTAReset
new g_pBan
new g_pBanTime
new g_pAMXBans
new g_pRevengeOptions
new g_pNoVictimDeath
new g_pEnableGlow
new g_pForgiveSlap
new g_pRespawnSlay
new g_pKillEffects
// new g_pSpawnProtect
new g_pSpawnTAHandle
new g_pAddMirrorDamage
new g_pSpawnDistance
new g_pSpawnTKCount
new g_pMeleeSlay
new g_pMeleeTKCount
new g_pNadeTKCount
new g_pKarmaReduceTK
new g_pScoreKarma
new g_pKillKarma
new g_pBotAction
new g_pSaveTKs

new Array:g_aSteamIDs, Trie:g_tTKCount
new g_pVault
new bool:g_bSaveTKs = false

public plugin_init()
{
	register_plugin("DoD TK Revenge", "1.2.8", "Fysiks/FeuerSturm")
	register_cvar("dod_tkrevenge_plugin", "v1.2.8 by Fysiks/FeuerSturm", FCVAR_SERVER|FCVAR_SPONLY)

	register_clcmd("say /tks", "say_tks", 0, "- display current TK Count")

	register_cvar("dod_tkrevenge_amxbansreason", "Excessive TeamKilling")
	g_pEnabled = register_cvar("dod_tkrevenge_enabled", "1")
	g_pObeyImmunity = register_cvar("dod_tkrevenge_obeyimmunity", "1")
	g_pMaxWarnings = register_cvar("dod_tkrevenge_warnings", "5")
	g_pPlayerSayTKs = register_cvar("dod_tkrevenge_playersaytks", "1")
	g_pDisplayTACount = register_cvar("dod_tkrevenge_displaytacount", "1")
	g_pDisplayTKCount = register_cvar("dod_tkrevenge_displaytkcount", "1")
	g_pTAsEqualTK = register_cvar("dod_tkrevenge_tasequaltk", "10")
	g_pTAReset = register_cvar("dod_tkrevenge_tareset", "1")
	g_pBan = register_cvar("dod_tkrevenge_ban", "1")
	g_pBanTime = register_cvar("dod_tkrevenge_bantime", "1440")
	g_pAMXBans = register_cvar("dod_tkrevenge_useamxbans", "0")
	g_pRevengeOptions = register_cvar("dod_tkrevenge_options", "5")
	g_pNoVictimDeath = register_cvar("dod_tkrevenge_novictimdeath", "1")
	g_pEnableGlow = register_cvar("dod_tkrevenge_enableglow", "1")
	g_pForgiveSlap = register_cvar("dod_tkrevenge_forgiveslap", "1")
	g_pRespawnSlay = register_cvar("dod_tkrevenge_respawnslay", "1")
	g_pKillEffects = register_cvar("dod_tkrevenge_killfx", "1")
	// g_pSpawnProtect = register_cvar("dod_tkrevenge_spawnprotect", "1")
	g_pSpawnTAHandle = register_cvar("dod_tkrevenge_spawntahandle", "0")
	g_pAddMirrorDamage = register_cvar("dod_tkrevenge_addmirrordmg", "5")
	g_pSpawnDistance = register_cvar("dod_tkrevenge_spawndistance", "800")
	g_pSpawnTKCount = register_cvar("dod_tkrevenge_spawntkcount", "1")
	g_pMeleeSlay = register_cvar("dod_tkrevenge_meleeslay", "1")
	g_pMeleeTKCount = register_cvar("dod_tkrevenge_meleetkcount", "1")
	g_pNadeTKCount = register_cvar("dod_tkrevenge_nadetkcount", "0")
	g_pKarmaReduceTK = register_cvar("dod_tkrevenge_karmareducetk", "25")
	g_pScoreKarma = register_cvar("dod_tkrevenge_scorekarma", "2")
	g_pKillKarma = register_cvar("dod_tkrevenge_killkarma", "1")
	g_pBotAction = register_cvar("dod_tkrevenge_botaction", "0")
	g_pSaveTKs = register_cvar("dod_tkrevenge_savetks", "0")	
	
	register_menucmd(register_menuid("DoD TK Revenge"), (1<<0)|(1<<1)|(1<<2)|(1<<4), "tkrevenge_options")
	register_event("RoundState", "reset_teamattacks", "a", "1=3", "1=4", "1=5")
	RegisterHam(Ham_Spawn, "player", "client_spawn", 1)
	register_statsfwd(XMF_SCORE)
	register_statsfwd(XMF_DAMAGE)
	register_event("DeathMsg", "player_died", "a")

	register_dictionary("dod_tkrevenge.txt")
}

public plugin_precache()
{ 
	g_pExplodeModel = precache_model("sprites/explode1.spr") 
}

public plugin_cfg()
{
	set_cvar_num("mp_tkpenalty", -1)

	if( (g_bSaveTKs = bool:get_pcvar_num(g_pSaveTKs)) ) // If this cvar is in amxx.cfg, it won't work on the first map.
	{
		g_aSteamIDs = ArrayCreate(32) // Only for people that were active on this map
		g_tTKCount = TrieCreate()
		g_pVault = nvault_open("tkvault")
		if( g_pVault == INVALID_HANDLE )
		{
			g_bSaveTKs = false
			log_amx("DOD TK Revenge Vault Failed to open")
		}
	}
}	

public plugin_end()
{
	if( g_bSaveTKs )
	{
		// Loop through steamid array and store TK count in nVault (which updates timestamp)
		new szSteamID[32], iTKs, szTKs[3]
		new iCount = ArraySize(g_aSteamIDs)
		for( new i = 0; i < iCount; i++ )
		{
			ArrayGetString(g_aSteamIDs, i, szSteamID, charsmax(szSteamID))
			TrieGetCell(g_tTKCount, szSteamID, iTKs)
			num_to_str(iTKs, szTKs, charsmax(szTKs))
			nvault_set(g_pVault, szSteamID, szTKs)
		}
		// Prune Vault (remove entries older than 1 week (604800 seconds)
		nvault_prune(g_pVault, 0, get_systime() - 604800)
		
		// All done, let's clean up
		ArrayDestroy(g_aSteamIDs)
		TrieDestroy(g_tTKCount)
		nvault_close(g_pVault)
	}
}

public client_authorized(id)
{
	if( g_bSaveTKs )
	{
		new szSteamID[32]
		get_user_authid(id, szSteamID, charsmax(szSteamID))
		if( !TrieGetCell(g_tTKCount, szSteamID, tkcount[id]) )
		{
			tkcount[id] = nvault_get(g_pVault, szSteamID)
		}
	}
	else
	{
		tkcount[id] = 0
	}

	tkillglow[id] = 0
	teamkiller[id] = 0
	melee_attacked[id] = 0
	nadetk[id] = 0
	karma[id] = 0
	spawn_attacked[id] = 0
	tacount[id] = 0
	respawnslay[id] = 0
	g_iNadeTKCount[id] = 0
}

public client_disconnect(id)
{
	if( g_bSaveTKs )
	{
		// Need to save tks to trie but need to remember to set TKs to zero if kicked/banned for TKs first
		new szSteamID[32]
		get_user_authid(id, szSteamID, charsmax(szSteamID))
		TrieSetCell(g_tTKCount, szSteamID, tkcount[id])
		ArrayPushString(g_aSteamIDs, szSteamID) // Keep track of all people who played 'this' map
	}
	
	new plist[32], pnum
	get_players(plist, pnum)
	for( new i = 0; i < pnum; i++ )
	{
		if( teamkiller[plist[i]] == id)
		{
			teamkiller[plist[i]] = 0
		}
	}
}

public reset_teamattacks()
{
	if( get_pcvar_num(g_pTAReset) )
	{
		new plist[32], pnum
		get_players(plist, pnum)
		for( new i=0; i < pnum; i++ )
		{
			if( tacount[plist[i]] > 0 )
			{
				tacount[plist[i]] = 0
			}
		}
	}
}

public client_score(index,score,total)
{
	if( !get_pcvar_num(g_pEnabled) || ((get_user_flags(index) & ADMIN_IMMUNITY) && get_pcvar_num(g_pObeyImmunity)) )
	{
		return PLUGIN_CONTINUE
	}
	
	if( !is_user_bot(index) && get_pcvar_num(g_pKarmaReduceTK) )
	{
		karma[index] += get_pcvar_num(g_pScoreKarma)
		checkkarma(index)
		return PLUGIN_CONTINUE
	}
	return PLUGIN_CONTINUE
}


// Issue:  If you spawn+melee tk, there is a race condition.  If it recognizes spawn tk first, you don't get punishment (with bots set to not forgive).
public client_damage(attacker,victim,damage,wpnindex,hitplace,TA)
{
	static param[4]
	if( get_pcvar_num(g_pEnabled) )
	{
		if( !TA || attacker==victim || ((get_user_flags(attacker) & ADMIN_IMMUNITY) && get_pcvar_num(g_pObeyImmunity)) )
		{
			return
		}
		
		switch( wpnindex )
		{
			case DODW_GARAND_BUTT, DODW_K43_BUTT, DODW_KAR_BAYONET, DODW_AMERKNIFE, DODW_BRITKNIFE, DODW_GERKNIFE, DODW_SPADE, DODW_ENFIELD_BAYONET:
			{
				melee_attacked[victim] = 1
				if( get_pcvar_num(g_pMeleeSlay) )
				{
					param[0] = victim
					param[1] = attacker
					param[2] = wpnindex
					param[3] = damage
					set_task(0.1,"melee_slay_attacker",0,param,4)
				}
			}
		}
		
		get_user_origin(victim,killorigin[victim])
		if( (spawn_attacked[victim] = (get_distance(killorigin[victim],spawnorigin[victim]) < get_pcvar_num(g_pSpawnDistance))) )
		{
			switch( get_pcvar_num(g_pSpawnTAHandle) )
			{
				case 1:
				{
					param[0] = victim
					param[1] = attacker
					param[2] = wpnindex
					param[3] = damage
					if( !is_user_alive(victim) )
					{
						param[3] = 300
						new victimname[32], attackername[32]
						get_user_name(victim,victimname,31)
						get_user_name(attacker,attackername,31)
						client_print(0, print_chat, "[DoD TK Revenge] %L",LANG_PLAYER,"SLAYSPAWNKILL",attackername,victimname)
					}
					set_task(0.0,"change_health",0,param,4)
				}
				case 2:
				{
					new victimname[32], attackername[32]
					get_user_name(victim,victimname,31)
					get_user_name(attacker,attackername,31)
					client_print(0, print_chat, "[DoD TK Revenge] %L",LANG_PLAYER,"SLAYSPAWNATTACK",attackername,victimname)
					set_task(0.1,"kill_teamkiller",attacker)
				}
			}
		}
		
		if( get_pcvar_num(g_pTAsEqualTK) > 0 )
		{
			if(wpnindex != DODW_HANDGRENADE && wpnindex != DODW_STICKGRENADE && wpnindex != DODW_MILLS_BOMB)
			{
				tacount[attacker]++
				checktaer(attacker)
			}
		}
	}
}

public change_health(param[])
{
	// Restore Victim Health
	if( is_user_alive(param[0]) ) // Victim
	{
		set_user_health(param[0],get_user_health(param[0]) + param[3])
	}
	
	// Mirror Damage
	new dmgaddition = get_pcvar_num(g_pAddMirrorDamage)
	if( is_user_alive(param[1]) )  // Attacker
	{
		if( get_user_health(param[1]) > (param[3] + dmgaddition) )
		{
			set_user_health(param[1],get_user_health(param[1]) - (param[3] + dmgaddition))
		}
		else
		{
			kill_teamkiller(param[1])
		}
	}
}

public player_died()
{
	static param[4]
	param[1] = read_data(1)
	param[0] = read_data(2)
	param[2] = read_data(3)
	param[3] = 0
	if (param[1] > 0 && param[0] > 0)
	{
		if( param[1] != param[0] )
		{
			if( get_user_team(param[1]) == get_user_team(param[0]) )
			{
				param[3] = 1
			}
			else
			{
				g_iNadeTKCount[param[1]] = 0
			}
		}
		set_task(0.1,"player_died2",0,param,4)
	}
}

public player_died2(param[])
{
	static killer, victim, TK
	killer = param[1]
	victim = param[0]
	TK = param[3]
	
	if( killer==victim || (is_user_bot(victim) && is_user_bot(killer) || !is_user_connected(killer)) )
	{
		return
	}
	
	if( get_pcvar_num(g_pNoVictimDeath) && TK == 1 )
	{
		dod_set_pl_deaths(victim,(dod_get_pl_deaths(victim) - 1))
	}

	if( get_pcvar_num(g_pEnabled) )
	{
		if( get_user_flags(killer) & ADMIN_IMMUNITY && get_pcvar_num(g_pObeyImmunity) )
		{
			return
		}
		
		if( TK )
		{
			set_task(0.2,"handle_tk",0,param,3)
		}
		else
		{
			if( !is_user_bot(killer) && get_pcvar_num(g_pKarmaReduceTK) )
			{
				karma[killer] += get_pcvar_num(g_pKillKarma)
				checkkarma(killer)
			}
		}
	}
	return
}

public handle_tk(param[])
{
	new victim = param[0]
	new killer = param[1]
	new wpnindex = param[2]
	// new victimname[32], killername[32]

	teamkiller[victim] = killer
	karma[killer] = 0
	
	// Determine punishment if not forgiven
	if( spawn_attacked[victim] )
	{
		tk_punishment[killer] = get_pcvar_num(g_pSpawnTKCount)
	}
	else if( melee_attacked[victim] )
	{
		tk_punishment[killer] = get_pcvar_num(g_pMeleeTKCount)
	}
	else
	{
		tk_punishment[killer] = 1
	}
	
	// Check for nade kill
	switch( wpnindex )
	{
		case DODW_HANDGRENADE, DODW_STICKGRENADE, DODW_MILLS_BOMB:
		{
			nadetk[killer] = !get_pcvar_num(g_pNadeTKCount)  // ignore tk by nade if cvar is true
			if( (g_iNadeTKCount[killer] += 1) >= 3 )
			{
				new szName[32]; get_user_name(killer, szName, charsmax(szName))
				server_cmd("kick #%d", get_user_userid(killer))
				client_print(0, print_console, "%s has team killed too many times.  Now being kicked!", szName)
			}
		}
	}

	if( is_user_bot(victim) )
	{
		set_task(5.0, "execBotAction", victim + 12121)  // Emulate bot selecting an action from the revenge menu
	}
	else
	{
		set_task(0.3,"tkrevenge_menu",0,param,2)  // Show revenge menu
	}
}

public execBotAction(id)
{
	new iBotAction = get_pcvar_num(g_pBotAction)
	if( iBotAction )
	{
		tkrevenge_options(id - 12121, -iBotAction)
	}
}

public melee_slay_attacker(param[])
{
	static meleeattacker[32]
	static meleevictim[32]
	static meleelogname[32]
	static meleewpnname[32]
	static victimid, killerid
	victimid = param[0]
	killerid = param[1]
	
	get_user_name(killerid,meleeattacker,31)
	get_user_name(victimid,meleevictim,31)
	xmod_get_wpnlogname(param[2],meleelogname,31)
	dod_wpnlog_to_name(meleelogname,meleewpnname,31)

	kill_teamkiller(killerid)
	karma[killerid] = 0

	if( is_user_alive(victimid) )
	{
		client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"MELEETASLAY",meleeattacker,meleevictim,meleewpnname)
		if( get_pcvar_num(g_pSpawnTAHandle) == 1 && spawn_attacked[victimid] )
		{
			set_task(0.0,"change_health",0,param,4)
		}
	}
	else
	{
		client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"MELEETKSLAY",meleeattacker,meleevictim,meleewpnname)
	}
}

public tkrevenge_menu(param[])
{
	static revenge_menu[1024]
	static key
	static tkername[32]
	static victim, killer
	victim = param[0]
	killer = param[1]
	
	get_user_name(killer,tkername,31)
	
	switch( get_pcvar_num(g_pRevengeOptions) )
	{
		case 1:
		{
			if( get_pcvar_num(g_pEnableGlow) )
			{
				format(revenge_menu,1023,"\rDoD TK Revenge\R^n^n\y1.\w %L^n\y2.\w %L^n\y3.\w %L^n^nKiller: %s",victim,"MENUFORGIVE",victim,"MENUGLOWANDONEHP",victim,"MENUSLAY",tkername)
			}
			else
			{
				format(revenge_menu,1023,"\rDoD TK Revenge\R^n^n\y1.\w %L^n\y2.\w %L^n\y3.\w %L^n^nKiller: %s",victim,"MENUFORGIVE",victim,"MENUJUSTONEHP",victim,"MENUSLAY",tkername)
			}
			key = (1<<0)|(1<<1)|(1<<2)
		}
		case 2:
		{
			format(revenge_menu,1023,"\rDoD TK Revenge\R^n^n\y1.\w %L^n\y2.\w %L^n^nKiller: %s",victim,"MENUFORGIVE",victim,"MENUSLAY",tkername)
			key = (1<<0)|(1<<1)
		}
		case 3:
		{
			format(revenge_menu,1023,"\rDoD TK Revenge\R^n^n\y1.\w %L^n\y2.\w %L^n\y3.\w %L^n^nKiller: %s",victim,"MENUFORGIVE",victim,"MENUSLAP",victim,"MENUSLAY",tkername)
			key = (1<<0)|(1<<1)|(1<<2)
		}
		case 4:
		{
			if( nadetk[killer] && !get_pcvar_num(g_pNadeTKCount) )
			{
				return
			}
			format(revenge_menu,1023,"\rDoD TK Revenge\R^n^n\y1.\w %L^n\y2.\w %L^n^nKiller: %s",victim,"MENUFORGIVE",victim,"MENUDONTFORGIVE",tkername)
			key = (1<<0)|(1<<1)
		}
		case 5:
		{
			format(revenge_menu,1023,"\rDoD TK Revenge\R^n^n\y1.\w %L^n\y2.\w %L^n^nKiller: %s",victim,"MENUFORGIVE",victim,"MENUDONTFORGIVE",tkername)
			key = (1<<0)|(1<<1)
		}
	}

	// Add option to not forgive but without slay
	key |= (1<<4)
	
	show_menu(victim,key,revenge_menu)

	switch( get_user_team(victim) )
	{
		case ALLIES: client_cmd(victim,"spk Gman/Gman_Choose1")
		case AXIS: client_cmd(victim,"spk Gman/Gman_Choose2")
	}
}

public tkrevenge_options(id,key)
{
	if( !teamkiller[id] )
	{
		client_print(id,print_chat,"[DoD TK Revenge] %L",id,"TEAMKILLERGONE")
		return PLUGIN_HANDLED
	}

	// Player Options
	switch( get_pcvar_num(g_pRevengeOptions) )
	{
		case 1:
		{
			switch(key)
			{
				case 0: revenge_forgive(teamkiller[id], id)
				case 1: revenge_1HP_Glow(teamkiller[id], id)
				case 2: revenge_slay(teamkiller[id], id, tk_punishment[teamkiller[id]])
			}
		}
		case 2:
		{
			switch(key)
			{
				case 0: revenge_forgive(teamkiller[id], id)
				case 1: revenge_slay(teamkiller[id], id, tk_punishment[teamkiller[id]])
			}
		}
		case 3:
		{
			switch(key)
			{
				case 0: revenge_forgive(teamkiller[id], id)
				case 1: revenge_slap50(teamkiller[id], id)
				case 2: revenge_slay(teamkiller[id], id, tk_punishment[teamkiller[id]])
			}
		}
		case 4:
		{
			switch(key)
			{
				case 0: revenge_forgive(teamkiller[id], id)
				case 1: revenge_dontforgive(teamkiller[id], id, tk_punishment[teamkiller[id]])
			}
		}
		case 5:
		{
			if( tkcount[teamkiller[id]] > 2 )
			{
				switch(key)
				{
					case 0: revenge_forgive(teamkiller[id], id)
					case 1: revenge_slay(teamkiller[id], id, tk_punishment[teamkiller[id]])
				}
			}
			else
			{
				switch(key)
				{
					case 0: revenge_forgive(teamkiller[id], id)
					case 1: revenge_dontforgive(teamkiller[id], id, tk_punishment[teamkiller[id]])
				}
			}
		}
	}

	if( key == 4 )
	{
		revenge_dontforgive(teamkiller[id], id, tk_punishment[teamkiller[id]], 0)
	}
	
	// Bot Options
	switch(key)
	{
		case -1: revenge_forgive(teamkiller[id], id)
		case -2: revenge_1HP_Glow(teamkiller[id], id)
		case -3: revenge_slay(teamkiller[id], id, tk_punishment[teamkiller[id]])
		case -4: revenge_slap50(teamkiller[id], id)
		case -5: revenge_dontforgive(teamkiller[id], id, tk_punishment[teamkiller[id]])
	}
	return PLUGIN_HANDLED
}

revenge_forgive(killerid, victimid)
{
	new victimname[32], killername[32]
	get_user_name(victimid, victimname, charsmax(victimname))
	get_user_name(killerid, killername, charsmax(killername))

	if( get_pcvar_num(g_pForgiveSlap) )
	{
		client_print(0, print_chat, "[DoD TK Revenge] %L",LANG_PLAYER,"SLAPANDFORGIVE",victimname,killername)
		user_slap(killerid,0)
	}
	else
	{
		client_print(0, print_chat, "[DoD TK Revenge] %L",LANG_PLAYER,"HUGANDFORGIVE",victimname,killername)
	}
}

revenge_dontforgive(killerid, victimid, punish=1, msg=1)
{
	new victimname[32], killername[32]
	get_user_name(victimid, victimname, charsmax(victimname))
	get_user_name(killerid, killername, charsmax(killername))

	if( msg )
	{
		client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"NOTFORGIVENTK",victimname,killername)
	}
	if( !nadetk[killerid] && !is_user_bot(killerid) )
	{
		tkcount[killerid] += punish
		checktker(killerid)
	}
}

revenge_1HP_Glow(killerid, victimid)
{
	new victimname[32], killername[32]
	get_user_name(victimid, victimname, charsmax(victimname))
	get_user_name(killerid, killername, charsmax(killername))

	if( is_user_alive(killerid) )
	{
		if( get_pcvar_num(g_pEnableGlow) )
		{
			client_print(0, print_chat, "[DoD TK Revenge] %L",LANG_PLAYER,"GLOWANDONEHP",victimname,killername)
			switch( get_user_team(killerid) )
			{
				case ALLIES: set_user_rendering(killerid,kRenderFxGlowShell,0,255,0,kRenderNormal,25)
				case AXIS: set_user_rendering(killerid,kRenderFxGlowShell,255,0,0,kRenderNormal,25)
			}
			tkillglow[killerid] = 1
		}
		else
		{
			client_print(0, print_chat, "[DoD TK Revenge] %L",LANG_PLAYER,"JUSTONEHP",victimname,killername)
		}
		set_user_health(killerid,1)
	}
	else
	{
		client_print(victimid,print_chat,"[DoD TK Revenge] %L",victimid,"TEAMKILLERDEAD",victimname,killername)
	}
}

revenge_slap50(killerid, victimid)
{
	new victimname[32], killername[32]
	get_user_name(victimid, victimname, charsmax(victimname))
	get_user_name(killerid, killername, charsmax(killername))

	if( is_user_alive(killerid) )
	{
		client_print(0, print_chat, "[DoD TK Revenge] %L",LANG_PLAYER,"SLAPPEDFORTK",victimname,killername)
		user_slap(killerid, get_user_health(killerid)/2)
	}
	else
	{
		client_print(victimid,print_chat,"[DoD TK Revenge] %L",victimid,"TEAMKILLERDEAD",victimname,killername)
	}
}

revenge_slay(killerid, victimid, punish=1)
{
	new victimname[32], killername[32]
	get_user_name(victimid, victimname, charsmax(victimname))
	get_user_name(killerid, killername, charsmax(killername))

	if( is_user_alive(killerid) )
	{
		client_print(0, print_chat, "[DoD TK Revenge] %L",LANG_PLAYER,"SLAYEDFORTK",victimname,killername)
		kill_teamkiller(killerid)
		if( !nadetk[killerid] && !is_user_bot(killerid))
		{
			tkcount[killerid] += punish
			checktker(killerid)
		}
	}
	else
	{
		if( is_user_bot(killerid) )
		{
			client_print(victimid,print_chat,"[DoD TK Revenge] %L",victimid,"TEAMKILLERDEAD",victimname,killername)
		}
		else
		{
			if( get_pcvar_num(g_pRespawnSlay) )
			{
				respawnslay[killerid] = 1
				tkcount[killerid] += punish
				checktker(killerid)
				client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"SLAYAFTERRESPAWN",killername,victimname)
			}
			else
			{
				if( nadetk[killerid] )
				{
					client_print(victimid,print_chat,"[DoD TK Revenge] %L",victimid,"TEAMKILLERDEAD",victimname,killername)
				}
				else
				{
					tkcount[killerid] += punish
					checktker(killerid)
					client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"TKCOUNTINCREASED",killername,victimname)
				}
			}
		}
	}
}

public client_spawn(id)
{
	if( is_user_alive(id) )
	{
		if( tkillglow[id] )
		{
			set_user_rendering(id,kRenderFxGlowShell,0,0,0,kRenderNormal,25)
			tkillglow[id] = 0
		}
		if( respawnslay[id] )
		{
			new respawnname[32]
			get_user_name(id,respawnname,31)
			client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"SLAYEDFORPREVIOUSTK",respawnname)
			set_task(0.1,"kill_teamkiller",id)
		}

		get_user_origin(id,spawnorigin[id])
		spawn_attacked[id] = 0
		melee_attacked[id] = 0
		respawnslay[id] = 0
	}
}

public checktaer(attacker)
{
	new zTAs = get_pcvar_num(g_pTAsEqualTK)
	if(tacount[attacker] < zTAs)
	{
		if( get_pcvar_num(g_pDisplayTACount) )
		{
			set_hudmessage(255, 153, 1, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(attacker,"[DoD TK Revenge]^n^n%L",attacker,"HUDTAWARNING",tacount[attacker],zTAs)
		}
	}
	else if(tacount[attacker] == zTAs)
	{
		if( get_pcvar_num(g_pDisplayTACount) )
		{
			set_hudmessage(255, 0, 0, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(attacker,"[DoD TK Revenge]^n^n%L",attacker,"HUDTAWARNING",tacount[attacker],zTAs)
		}
	}
	else if(tacount[attacker] > zTAs)
	{
		tacount[attacker] = 0
		// set_task(0.1, "kill_teamkiller", attacker)  // Calling the kill function directly seems to crash the server for some reason.
		
		tkcount[attacker]++
		checktker(attacker)
	}
}

public checktker(id)
{
	new zTKs = get_pcvar_num(g_pMaxWarnings)
	if(tkcount[id] < zTKs)
	{
		if( get_pcvar_num(g_pDisplayTKCount) )
		{
			set_hudmessage(255, 153, 1, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(id,"[DoD TK Revenge]^n^n%L",id,"HUDTKWARNING",tkcount[id],zTKs)
		}
	}
	else if(tkcount[id] == zTKs)
	{
		if( get_pcvar_num(g_pDisplayTKCount) )
		{
			set_hudmessage(255, 0, 0, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(id,"[DoD TK Revenge]^n^n%L",id,"HUDTKWARNING",tkcount[id],zTKs)
		}
	}
	else if(tkcount[id] > zTKs)
	{
		new tkername[32]
		get_user_name(id,tkername,31)

		if( is_user_connected(id) )
		{
			tkcount[id] = 0  // Since they get to be punished, set tk count back to zero so they can join next time with clean slate.
			if( get_pcvar_num(g_pBan) )
			{
				new tker_bantimeint = get_pcvar_num(g_pBanTime)
				if( get_pcvar_num(g_pAMXBans) )
				{
					new tker_authid[32]
					get_user_authid(id,tker_authid,31)
					new banreason[128]
					get_cvar_string("dod_tkrevenge_amxbansreason",banreason,127)
					server_cmd("amx_ban %d %s %s",tker_bantimeint,tker_authid,banreason)
				}
				else
				{
					new tker_userid = get_user_userid(id)
					server_cmd("banid %f #%d kick;writeid",float(tker_bantimeint),tker_userid)
				}
				
				if(tker_bantimeint == 0)
				{
					client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"TKBANPERM",tkername)
					log_amx("[DoD TK Revenge] %L",LANG_SERVER,"TKBANPERM",tkername)
				}
				else if(tker_bantimeint < 60 && tker_bantimeint != 0)
				{
					client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"TKBANMINS",tkername,tker_bantimeint)
					log_amx("[DoD TK Revenge] %L",LANG_SERVER,"TKBANMINS",tkername,tker_bantimeint)
				}
				else if(tker_bantimeint > 60 && tker_bantimeint < 1440)
				{
					new tker_banhours = tker_bantimeint/60
					client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"TKBANHOURS",tkername,tker_banhours)
					log_amx("[DoD TK Revenge] %L",LANG_SERVER,"TKBANHOURS",tkername,tker_banhours)
				}
				else if(tker_bantimeint > 1440 && tker_bantimeint < 10080)
				{
					new tker_bandays = tker_bantimeint/1440
					client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"TKBANDAYS",tkername,tker_bandays)
					log_amx("[DoD TK Revenge] %L",LANG_SERVER,"TKBANDAYS",tkername,tker_bandays)
				}
				else if(tker_bantimeint > 10080 && tker_bantimeint < 40320)
				{
					new tker_banweeks = tker_bantimeint/10080
					client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"TKBANWEEKS",tkername,tker_banweeks)
					log_amx("[DoD TK Revenge] %L",LANG_SERVER,"TKBANWEEKS",tkername,tker_banweeks)
				}
				else if(tker_bantimeint > 40320)
				{
					new tker_banmonths = tker_bantimeint/40320
					client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"TKBANMONTHS",tkername,tker_banmonths)
					log_amx("[DoD TK Revenge] %L",LANG_SERVER,"TKBANMONTHS",tkername,tker_banmonths)
				}
			}
			else
			{
				client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"KICKEDFORTK",tkername)
				new tker_userid = get_user_userid(id)
				server_cmd("kick #%d Excessive TeamKilling",tker_userid)
			}
		}
	}
}

public checkkarma(player)
{
	new zKarma = get_pcvar_num(g_pKarmaReduceTK)
	if(karma[player] >= zKarma)
	{
		if(tkcount[player] >= 1)
		{
			tkcount[player] -= 1
			karma[player] = 0
			if( get_pcvar_num(g_pDisplayTKCount) )
			{
				set_hudmessage(0, 255, 0, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
				show_hudmessage(player,"[DoD TK Revenge]^n^n%L",player,"HUDTKDECREASED",tkcount[player],get_pcvar_num(g_pMaxWarnings),zKarma)
			}
			new playername[32]
			get_user_name(player,playername,31)
			client_print(0,print_chat,"[DoD TK Revenge] %L",LANG_PLAYER,"KARMADECREASEDTK",playername,zKarma)
		}
	}
}

public kill_teamkiller(killerid)
{
	if( is_user_alive(killerid) )
	{
		if( get_pcvar_num(g_pKillEffects) )
		{
			get_user_origin(killerid,tkerorigin[killerid])
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY,tkerorigin[killerid])   
			write_byte(3)   
			write_coord(tkerorigin[killerid][0])   
			write_coord(tkerorigin[killerid][1])   
			write_coord(tkerorigin[killerid][2]) 
			write_short(g_pExplodeModel)   
			write_byte(60)
			write_byte(10)
			write_byte(0)
			message_end()
		}
		user_kill(killerid)
	}
}

public say_tks(id)
{
	if( get_pcvar_num(g_pEnabled) && get_pcvar_num(g_pPlayerSayTKs) )
	{
		new zTKs = get_pcvar_num(g_pMaxWarnings)
		if(tkcount[id] == 0)
		{
			set_hudmessage(0, 255, 0, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(id,"[DoD TK Revenge]^n^n%L",id,"HUDTKWARNNOTK",tkcount[id],zTKs)
		}
		else if(tkcount[id] < zTKs && tkcount[id] > 0)
		{
			set_hudmessage(255, 153, 1, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(id,"[DoD TK Revenge]^n^n%L",id,"TKWARNING",tkcount[id],zTKs)
		}
		else if(tkcount[id] == zTKs)
		{
			set_hudmessage(255, 0, 0, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(id,"[DoD TK Revenge]^n^n%L",id,"TKWARNING",tkcount[id],zTKs)
		}
	}
}


// Requires a dynamic array (for logging at end of map; basically for traversing the trie) and a trie (keeping track of tk count)


stock load_all_clients_from_file()
{
	// Load all logged clients into array and trie
	// Maybe use nVault so we can prune based on timestamp
	// Prune nVault (if haven't connected in 1 week or so, clear entry)
	// in plugin_init()
	// Alternative:  Load on client_authorized() pulling from nVault directly (this requires file acces, array pushing, and trie insertion mid-game :( )
}

stock update_log_data(id)
{
	// Update trie with TK count
	// client_disconnect()?
}

stock write_data_to_disk()
{
	// Log TK data using Array and Trie
	// Loop through Array, Get TK count from Trie, Set nVault value
	// plugin_end()
}

