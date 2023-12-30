//
// AMX Mod X Script
//
// Developed by The AMX Mod X DoD Community
// http://www.dodplugins.net
//
// Author: FeuerSturm (Highly refactored by Fysiks)
//
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//
//
//
// INSTALLATION (STANDARD VERSION):
// ================================
//
// you have to create a folder called "tks" in your
// /addons/amxmodx/configs/ folder.
// if you don't do this, the TK save feature will not
// work.
// 
//
//
// INSTALLATION (MYSQL VERSION):
// =============================
//
// the plugin will create a table called "tks" in your
// database, you don't have to do anything manually.
//
//
// 
// USAGE (cvars for amxx.cfg):
// ===========================
//
// dod_tkrevenge_enabled <1/0>           =   enable/disable DoD TK Revenge
//                                           by default
//
// dod_tkrevenge_obeyimmunity <1/0>      =   enable/disable Admins with flag
//                                           "a" (Immunity) being excluded
//                                           from any revenge for TA/TKs.
//
// dod_tkrevenge_options <1/2/3/4>       =   sets the menu options for the
//                                           DoD TK Revenge Menu:
//                                           1 = Forgive!, 1hp (& Glow!), Slay!
//                                           2 = Forgive!, Slay!
//                                           3 = Forgive!, Slap 50percent!, Slay!
//                                           4 = Forgive!, DON'T Forgive!
//
// dod_tkrevenge_enableglow <1/0>        =   enable/disable glowing players
//                                           (menu & bot actions)
//
// dod_tkrevenge_forgiveslap <1/0>       =   enable/disable slapping the TKer
//                                           without damage if "Forgive!" was
//                                           chosen by the victim
//
// dod_tkrevenge_respawnslay <1/0>       =   enable/disable slaying TeamKillers
//                                           after respawning who have already
//                                           been dead when "Slay" was chosen
//
// dod_tkrevenge_killfx <1/0>            =   enable/disable special effects
//                                           for killing the TeamKiller
//                                           (fire explosion with sound)
//
// dod_tkrevenge_playersaytks <1/0>      =   allow/disallow players to check their
//                                           current TK-Count by saying "/tks"
//
// dod_tkrevenge_displaytacount <1/0>    =   enable/disable displaying a hudmessage
//                                           to players with info about their TA count
//                                           when it's increased.
//
// dod_tkrevenge_displaytkcount <1/0>    =   enable/disable displaying a hudmessage
//                                           to players with info about their TK count
//                                           when it's increased or decreased.
//
// dod_tkrevenge_tasequaltk <amount>     =   number of TeamAttacks that equal
//                                           an unforgiven TeamKill
//                                           (set to 0 to disable!)
//
// dod_tkrevenge_tareset <1/0>           =   enable/disable resetting every player's
//                                           current TA-count on round start
//
// dod_tkrevenge_novictimdeath <1/0>     =   enable/disable feature that prevents
//                                           victim's deaths to be increased by TKs
//
// dod_tkrevenge_spawnprotect <1/0>      =   enable/disable automatic slaying of
//                                           team killers in defined spawn time
//
// dod_tkrevenge_spawntahandle <1/2/0>   =   sets handling for Spawn-TAs
//                                           1 = Mirror Damage
//                                           2 = Kill TeamAttacker immediately
//                                           0 = disabled
//                                           (spawnprotect feature needs to be enabled!)
//
// dod_tkrevenge_addmirrordmg <amount>   =   sets amount of HP a SpawnAttacker loses
//                                           additionally to the damage mirrored back
//                                           at him from attacking a teammate
//                                           (only applies if "spawntahandle" is "1"!)
//
// dod_tkrevenge_spawndistance <amount>  =   distance to spawnpoint within what
//                                           TKs are considered Spawn-TKs
//                                           (default: 800)
//
// dod_tkrevenge_spawntkcount <amount>   =   number of warnings to add to the
//                                           spawn killers tk-count.
//                                          
// dod_tkrevenge_warnings <amount>       =   number of unforgiven TKs until
//                                           player is kicked/banned
//                                           (1hp/Slap are not counted as unforgiven)
//
// dod_tkrevenge_ban <1/0>               =   set to 1 to ban the teamkiller after
//                                           your amount of warnings.
//                                           set to 0 to just kick him
//
// dod_tkrevenge_bantime <time>          =   time in minutes to ban a teamkiller
//                                           from the server (if you enabled ban)
//
// dod_tkrevenge_useamxbans <1/0>        =   enable/disable using AMXBans to ban
//                                           players for excessive TeamKilling
//
// dod_tkrevenge_amxbansreason <reason>  =   sets reason which is displayed in AMXBans
//                                           Webinterface (use quotes!)
//                                           (default: "Excessive TeamKilling")
//
// dod_tkrevenge_meleeslay <1/0>         =   immediatly kill player on melee
//                                           TA/TK (see description for more info!)
//
// dod_tkrevenge_meleetkcount <amount>   =   number of warnings to add to the
//                                           back stabbers tk-count.
//
// dod_tkrevenge_nadetkcount <1/0>       =   enable/disable increasing the tk-count
//                                           on unforgiven grenade tks
//
// dod_tkrevenge_karmareducetk <amount>  =   Karma points needed to reduce player's
//                                           TK-count by 1 while a TK zeroes the
//                                           karma counter again!
//                                           (set to 0 to disable)
//
// dod_tkrevenge_killkarma <amount>      =   amount of karma points a player gains
//                                           for killing an enemy
//
// dod_tkrevenge_scorekarma <amount>     =   amount of karma points a player gains
//                                           for capping a flag
//
// dod_tkrevenge_botaction <1/2/3/4/5/0> =   sets action for TKs on Bots
//                                           1 = Forgive!
//                                           2 = 1hp (& Glow!)
//                                           3 = Slay!
//                                           4 = Slap 50percent!
//                                           5 = DON'T Forgive!
//                                           0 = disabled
//
// dod_tkrevenge_savetks <1/0>           =   enable/disable saving each player's
//                                           TK-count and reload it on reconnect
//
//
//
//
// DESCRIPTION:
// ============
//
// - This plugin is a simple but effective TK Revenge provider,
//   a menu pops up for the victim of a teamkiller and he can choose
//   to "Forgive!", "Glow & 1hp!" or "Slap with 50percent!" or "Slay!" 
//   the teamkiller.
//   You can set what option will appear in the TK Revenge menu.
//   * Forgive! just slaps the TKer without damage
//   * 1hp (& Glow)! sets him to 1hp (and makes him glow in his team's color)
//     until he respawns. (Glow can be enabled/disabled)
//   * Slap with 50percent! will slap him with 50% damage of his current
//     health
//   * Slay! will added 1 to his tk count and kills him if he's alive
//     and his tk count is checked against the number of warnings you
//     set up and a yellow hudmessage saying
//     "TeamKill Warning X/X: Watch your fire!"
//     is shown. once the tk count equals the warnings the hudmessage
//     is shown in red. on the next unforgiven tk the teamkiller will
//     either be kicked or banned for X minutes. (depends on your setup)
//   * DON'T Forgive! does the same as "Slay!" but without killing the
//     attacker.
// - TeamKills don't have to be counted as deaths for Victims.
// - Melee TAs/TKs can be handled different, it's possible
//   to directly slay on a melee TA/TK without giving the victim
//   the ability to forgive or glow. if the attacker is slayed for
//   a melee attack, his tk count is not increased, but if he
//   is slayed for a melee tk, it will be increased by the set amount.
//   Knife, Spade, K43 Butt, Garand Butt & Bayonet are considered
//   melee weapons.
// - A specified amount of TAs can count as an unforgiven TK.
// - Spawn TeamKills can be handled different as well. If a TK
//   occurs in your defined distance after respawn, the team killer can be
//   slayed and his tk-count will be increased by the set amount.
// - Grenade TeamKills can be handled on a special way as well, you
//   can set up either to increase the tk-count or not if "Slay!"
//   was chosen by the victim of a friendly grenade.
// - The TK-Count of players can be decreased
//   by 1 if they gain a set amount of karma without doing any Tks.
//   (Karma can consist of FlagCaps and EnemyKills)
// - TeamKillers can be slayed after respawning if they are already dead
// - You can set your bots (if you are using Sturmbot/Shrikebot for example)
//   to react on TKs with forgiving, 1hp (& glowing) or Slapping and slaying the
//   teamkiller.
//   That way you can be sure that your bots aren't the easy shooting targets
//   for teamkillers.
// - Every player's tk-count can be saved and reloaded if he reconnects.
//   This feature is independent from time and map, his info is saved for good
//   until you either delete it, or the TKer starts to play serious and gets his
//   tk-count decreased. this prevents hardcore teamkillers from simply
//   reconnecting to the server to get their tk-count zeroed.
//   Note: if you use this feature, be sure to use banning of teamkillers,
//         otherwise it wouldn't make any sense to use this feature.
// - AMXBans can be used to ban teamkillers.
// - Admins with access level ADMIN_IMMUNITY can be excluded from any punishments
//   for a tk, the plugin just just ignores their teamkills.
//
//
//
// AMX Mod X, DoDx, DoDFun & Fun modules needed!
//
//
// To do:
//
// - nothing so far! :D
//
//
// CHANGELOG:
// =========
// Old changelog can be found in original plugin
//

#include <amxmodx>
#include <amxmisc>
#include <dodx>
#include <dodfun>
#include <fun>
#include <hamsandwich>

new tkcount[33], tacount[33], karma[33], teamkiller[33], tk_punishment[33]
new tkillglow[33], melee_attacked[33], nadetk[33], spawn_attacked[33], respawnslay[33]
new spawnorigin[33][3], killorigin[33][3], tkerorigin[33][3]
new g_iNadeTKCount[33]
new g_pExplodeModel // Pointer to the explosion model

// Cvars
new g_dod_tkrevenge_enabled
new g_dod_tkrevenge_obeyimmunity
new g_dod_tkrevenge_warnings
new g_dod_tkrevenge_playersaytks
new g_dod_tkrevenge_displaytacount
new g_dod_tkrevenge_displaytkcount
new g_dod_tkrevenge_tasequaltk
new g_dod_tkrevenge_tareset
new g_dod_tkrevenge_ban
new g_dod_tkrevenge_bantime
new g_dod_tkrevenge_useamxbans
new g_dod_tkrevenge_options
new g_dod_tkrevenge_novictimdeath
new g_dod_tkrevenge_enableglow
new g_dod_tkrevenge_forgiveslap
new g_dod_tkrevenge_respawnslay
new g_dod_tkrevenge_killfx
// new g_dod_tkrevenge_spawnprotect
new g_dod_tkrevenge_spawntahandle
new g_dod_tkrevenge_addmirrordmg
new g_dod_tkrevenge_spawndistance
new g_dod_tkrevenge_spawntkcount
new g_dod_tkrevenge_meleeslay
new g_dod_tkrevenge_meleetkcount
new g_dod_tkrevenge_nadetkcount
new g_dod_tkrevenge_karmareducetk
new g_dod_tkrevenge_scorekarma
new g_dod_tkrevenge_killkarma
new g_dod_tkrevenge_botaction
new g_dod_tkrevenge_savetks

public plugin_init()
{
	register_plugin("DoD TK Revenge","1.2.6","AMXX DoD Team/Fysiks")
	register_cvar("dod_tkrevenge_plugin", "v1.2.6 by Fysiks/FeuerSturm", FCVAR_SERVER|FCVAR_SPONLY)
	register_statsfwd(XMF_SCORE)
	register_statsfwd(XMF_DAMAGE)
	register_event("DeathMsg", "player_died", "a")
	register_clcmd("say /tks","say_tks",0,"- display current TK Count")
	register_cvar("dod_tkrevenge_amxbansreason","Excessive TeamKilling")
	g_dod_tkrevenge_enabled = register_cvar("dod_tkrevenge_enabled","1")
	g_dod_tkrevenge_obeyimmunity = register_cvar("dod_tkrevenge_obeyimmunity","1")
	g_dod_tkrevenge_warnings = register_cvar("dod_tkrevenge_warnings","5")
	g_dod_tkrevenge_playersaytks = register_cvar("dod_tkrevenge_playersaytks","1")
	g_dod_tkrevenge_displaytacount = register_cvar("dod_tkrevenge_displaytacount","1")
	g_dod_tkrevenge_displaytkcount = register_cvar("dod_tkrevenge_displaytkcount","1")
	g_dod_tkrevenge_tasequaltk = register_cvar("dod_tkrevenge_tasequaltk","10")
	g_dod_tkrevenge_tareset = register_cvar("dod_tkrevenge_tareset","1")
	g_dod_tkrevenge_ban = register_cvar("dod_tkrevenge_ban","1")
	g_dod_tkrevenge_bantime = register_cvar("dod_tkrevenge_bantime","1440")
	g_dod_tkrevenge_useamxbans = register_cvar("dod_tkrevenge_useamxbans","0")
	g_dod_tkrevenge_options = register_cvar("dod_tkrevenge_options","1")
	g_dod_tkrevenge_novictimdeath = register_cvar("dod_tkrevenge_novictimdeath","1")
	g_dod_tkrevenge_enableglow = register_cvar("dod_tkrevenge_enableglow","1")
	g_dod_tkrevenge_forgiveslap = register_cvar("dod_tkrevenge_forgiveslap","1")
	g_dod_tkrevenge_respawnslay = register_cvar("dod_tkrevenge_respawnslay","1")
	g_dod_tkrevenge_killfx = register_cvar("dod_tkrevenge_killfx","1")
	// g_dod_tkrevenge_spawnprotect = register_cvar("dod_tkrevenge_spawnprotect","1")
	g_dod_tkrevenge_spawntahandle = register_cvar("dod_tkrevenge_spawntahandle","0")
	g_dod_tkrevenge_addmirrordmg = register_cvar("dod_tkrevenge_addmirrordmg","5")
	g_dod_tkrevenge_spawndistance = register_cvar("dod_tkrevenge_spawndistance","800")
	g_dod_tkrevenge_spawntkcount = register_cvar("dod_tkrevenge_spawntkcount","1")
	g_dod_tkrevenge_meleeslay = register_cvar("dod_tkrevenge_meleeslay","1")
	g_dod_tkrevenge_meleetkcount = register_cvar("dod_tkrevenge_meleetkcount","1")
	g_dod_tkrevenge_nadetkcount = register_cvar("dod_tkrevenge_nadetkcount","0")
	g_dod_tkrevenge_karmareducetk = register_cvar("dod_tkrevenge_karmareducetk","25")
	g_dod_tkrevenge_scorekarma = register_cvar("dod_tkrevenge_scorekarma","2")
	g_dod_tkrevenge_killkarma = register_cvar("dod_tkrevenge_killkarma","1")
	g_dod_tkrevenge_botaction = register_cvar("dod_tkrevenge_botaction","0")
	g_dod_tkrevenge_savetks = register_cvar("dod_tkrevenge_savetks","0")	
	register_menucmd(register_menuid("DoD TK Revenge"),(1<<0)|(1<<1)|(1<<2)|(1<<4),"tkrevenge_options")
	register_event("RoundState","reset_teamattacks","a","1=3","1=4","1=5")
	RegisterHam(Ham_Spawn, "player", "client_spawn", 1)
	register_dictionary("dod_tkrevenge.txt")
}

public plugin_precache()
{ 
	g_pExplodeModel = precache_model("sprites/explode1.spr") 
}

public plugin_cfg()
{
	set_cvar_num("mp_tkpenalty", -1)	
}

public client_authorized(id)
{
	tkcount[id] = 0
	tkillglow[id] = 0
	teamkiller[id] = 0
	melee_attacked[id] = 0
	nadetk[id] = 0
	karma[id] = 0
	spawn_attacked[id] = 0
	tacount[id] = 0
	respawnslay[id] = 0
}

public client_putinserver(id)
{
	// Initialize Variables
	g_iNadeTKCount[id] = 0
	
	if( get_pcvar_num(g_dod_tkrevenge_savetks) )
	{
		new steamid[32]
		get_user_authid(id, steamid, 31)
		new tkfile[64]
		get_configsdir(tkfile,63)
		add(tkfile, 63, "/tks/%s.txt")
		format(tkfile, 63, tkfile, steamid)
		replace(tkfile, 63, ":", "_")
		replace(tkfile, 63, ":", "_")
		if(file_exists(tkfile)){
			new text[32]
			new a = 0
			if(read_file(tkfile, 0, text, 31, a))
			{
				tkcount[id] = str_to_num(text)
			}
		}
	}
}

public client_disconnect(id)
{
	if( get_pcvar_num(g_dod_tkrevenge_savetks) )
	{
		new steamid[32]
		get_user_authid(id, steamid, 31)
		
		new tkfile[64]
		get_configsdir(tkfile,63)
		add(tkfile, 63, "/tks/%s.txt")
		format(tkfile, 63, tkfile, steamid)
		replace(tkfile, 63, ":", "_")
		replace(tkfile, 63, ":", "_")
		if(tkcount[id] == 0 || tkcount[id] > get_pcvar_num(g_dod_tkrevenge_warnings))
		{
			if(file_exists(tkfile))
			{
				delete_file(tkfile)
			}
		}
		else if(tkcount[id] > 0 && tkcount[id] <= get_pcvar_num(g_dod_tkrevenge_warnings))
		{
			new tks[32]
			num_to_str(tkcount[id], tks, 31)
			write_file(tkfile, tks, 0)
		}
	}
	
	new plist[32],pnum
	get_players(plist,pnum)
	for(new i=0; i<pnum; i++)
	{
		if(is_user_connected(plist[i]) == 1 && teamkiller[plist[i]] == id)
		{
			teamkiller[plist[i]] = 0
		}
	}
}

public reset_teamattacks()
{
	if(get_pcvar_num(g_dod_tkrevenge_tareset) == 1)
	{
		new plist[32],pnum
		get_players(plist,pnum)
		for(new i=0; i<pnum; i++)
		{
			if(is_user_connected(plist[i]) == 1 && tacount[plist[i]] > 0)
			{
				tacount[plist[i]] = 0
			}
		}
	}
	return PLUGIN_CONTINUE
}

public client_score(index,score,total)
{
	if( !get_pcvar_num(g_dod_tkrevenge_enabled) || ((get_user_flags(index) & ADMIN_IMMUNITY) && get_pcvar_num(g_dod_tkrevenge_obeyimmunity)) )
	{
		return PLUGIN_CONTINUE
	}
	
	if( !is_user_bot(index) && get_pcvar_num(g_dod_tkrevenge_karmareducetk) )
	{
		karma[index] += get_pcvar_num(g_dod_tkrevenge_scorekarma)
		checkkarma(index)
		return PLUGIN_CONTINUE
	}
	return PLUGIN_CONTINUE
}


// Issue:  If you spawn+melee tk, there is a race condition.  If it recognizes spawn tk first, you don't get punishment (with bots set to not forgive).
public client_damage(attacker,victim,damage,wpnindex,hitplace,TA)
{
	static param[4]
	if( get_pcvar_num(g_dod_tkrevenge_enabled) )
	{
		if( !TA || attacker==victim || ((get_user_flags(attacker) & ADMIN_IMMUNITY) && get_pcvar_num(g_dod_tkrevenge_obeyimmunity)) )
		{
			return
		}
		
		switch( wpnindex )
		{
			case DODW_GARAND_BUTT, DODW_K43_BUTT, DODW_KAR_BAYONET, DODW_AMERKNIFE, DODW_BRITKNIFE, DODW_GERKNIFE, DODW_SPADE, DODW_ENFIELD_BAYONET:
			{
				melee_attacked[victim] = 1
				if( get_pcvar_num(g_dod_tkrevenge_meleeslay) )
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
		if( (spawn_attacked[victim] = (get_distance(killorigin[victim],spawnorigin[victim]) < get_pcvar_num(g_dod_tkrevenge_spawndistance))) )
		{
			switch( get_pcvar_num(g_dod_tkrevenge_spawntahandle) )
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
		
		if( get_pcvar_num(g_dod_tkrevenge_tasequaltk) > 0 )
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
	new dmgaddition = get_pcvar_num(g_dod_tkrevenge_addmirrordmg)
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
	
	if(killer==victim || (is_user_bot(victim) && is_user_bot(killer) || !is_user_connected(killer)))
	{
		return
	}
	
	if(get_pcvar_num(g_dod_tkrevenge_novictimdeath) == 1 && TK == 1)
	{
		dod_set_pl_deaths(victim,(dod_get_pl_deaths(victim) - 1))
	}

	if( get_pcvar_num(g_dod_tkrevenge_enabled) )
	{
		if( get_user_flags(killer) & ADMIN_IMMUNITY && get_pcvar_num(g_dod_tkrevenge_obeyimmunity) )
		{
			return
		}
		
		if( TK )
		{
			set_task(0.2,"handle_tk",0,param,3)
		}
		else
		{
			if(!is_user_bot(killer) && get_pcvar_num(g_dod_tkrevenge_karmareducetk) )
			{
				karma[killer] += get_pcvar_num(g_dod_tkrevenge_killkarma)
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
		tk_punishment[killer] = get_pcvar_num(g_dod_tkrevenge_spawntkcount)
	}
	else if( melee_attacked[victim] )
	{
		tk_punishment[killer] = get_pcvar_num(g_dod_tkrevenge_meleetkcount)
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
			nadetk[killer] = !get_pcvar_num(g_dod_tkrevenge_nadetkcount)  // ignore tk by nade if cvar is true
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
	new iBotAction = get_pcvar_num(g_dod_tkrevenge_botaction)
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
		if( get_pcvar_num(g_dod_tkrevenge_spawntahandle) == 1 && spawn_attacked[victimid] )
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
	
	switch( get_pcvar_num(g_dod_tkrevenge_options) )
	{
		case 1:
		{
			if( get_pcvar_num(g_dod_tkrevenge_enableglow) )
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
			if( nadetk[killer] && !get_pcvar_num(g_dod_tkrevenge_nadetkcount) )
			{
				return
			}
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
	switch( get_pcvar_num(g_dod_tkrevenge_options) )
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

	if( get_pcvar_num(g_dod_tkrevenge_forgiveslap) )
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
		if( get_pcvar_num(g_dod_tkrevenge_enableglow) )
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
			if( get_pcvar_num(g_dod_tkrevenge_respawnslay) )
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
	new zTAs = get_pcvar_num(g_dod_tkrevenge_tasequaltk)
	if(tacount[attacker] < zTAs)
	{
		if( get_pcvar_num(g_dod_tkrevenge_displaytacount) )
		{
			set_hudmessage(255, 153, 1, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(attacker,"[DoD TK Revenge]^n^n%L",attacker,"HUDTAWARNING",tacount[attacker],zTAs)
		}
	}
	else if(tacount[attacker] == zTAs)
	{
		if( get_pcvar_num(g_dod_tkrevenge_displaytacount) )
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
	new zTKs = get_pcvar_num(g_dod_tkrevenge_warnings)
	if(tkcount[id] < zTKs)
	{
		if( get_pcvar_num(g_dod_tkrevenge_displaytkcount) )
		{
			set_hudmessage(255, 153, 1, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
			show_hudmessage(id,"[DoD TK Revenge]^n^n%L",id,"HUDTKWARNING",tkcount[id],zTKs)
		}
	}
	else if(tkcount[id] == zTKs)
	{
		if( get_pcvar_num(g_dod_tkrevenge_displaytkcount) )
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
			if( get_pcvar_num(g_dod_tkrevenge_ban) )
			{
				new tker_bantimeint = get_pcvar_num(g_dod_tkrevenge_bantime)
				if( get_pcvar_num(g_dod_tkrevenge_useamxbans) )
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
	new zKarma = get_pcvar_num(g_dod_tkrevenge_karmareducetk)
	if(karma[player] >= zKarma)
	{
		if(tkcount[player] >= 1)
		{
			tkcount[player] -= 1
			karma[player] = 0
			if( get_pcvar_num(g_dod_tkrevenge_displaytkcount) )
			{
				set_hudmessage(0, 255, 0, 0.1, -1.0, 0, 6.0, 10.0, 0.1, 0.2, 4)
				show_hudmessage(player,"[DoD TK Revenge]^n^n%L",player,"HUDTKDECREASED",tkcount[player],get_pcvar_num(g_dod_tkrevenge_warnings),zKarma)
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
		if( get_pcvar_num(g_dod_tkrevenge_killfx) )
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
	if( get_pcvar_num(g_dod_tkrevenge_enabled) && get_pcvar_num(g_dod_tkrevenge_playersaytks) )
	{
		new zTKs = get_pcvar_num(g_dod_tkrevenge_warnings)
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
