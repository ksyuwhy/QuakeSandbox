/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
//
#include "g_local.h"


/*
=======================================================================

  SESSION DATA

Session data is the only data that stays persistant across level loads
and tournament restarts.
=======================================================================
*/

/*
================
G_WriteClientSessionData

Called on game shutdown
================
*/
void G_WriteClientSessionData( gclient_t *client ) {
	const char	*s;
	const char	*var;
	const char	*var2;
	const char	*var3;

	s = va("%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i", 
		client->sess.sessionTeam,
		client->sess.spectatorNum,
		client->sess.spectatorState,
		client->sess.spectatorClient,
		client->sess.wins,
		client->sess.losses,
		client->sess.teamLeader,
		client->sess.sessionHealth,
		client->sess.sessionArmor,
		client->sess.sessionWeapons,
		client->sess.sessionWeapon,
		client->sess.sessionAmmoMG,
		client->sess.sessionAmmoSG,
		client->sess.sessionAmmoGL,
		client->sess.sessionAmmoRL,
		client->sess.sessionAmmoLG,
		client->sess.sessionAmmoRG,
		client->sess.sessionAmmoPG,
		client->sess.sessionAmmoBFG,
		client->sess.sessionAmmoGH,
		client->sess.sessionAmmoNG,
		client->sess.sessionAmmoPL,
		client->sess.sessionAmmoCG,
		client->sess.sessionAmmoFT,
		client->sess.sessionHoldable,
		client->sess.carnageScore,
		client->sess.deaths,
		client->sess.secrets,
		client->sess.accuracyShots,
		client->sess.accuracyHits,
		client->sess.posX,
		client->sess.posY,
		client->sess.posZ
		);

	var = va( "session%i", (int)(client - level.clients) );
	trap_Cvar_Set( var, s );

	//set score level name
	var2 = va ( "session%i_lvl", client - level.clients );
	trap_Cvar_Set( var2, client->sess.scoreLevelName );
	
	var3 = "save_session0_lvl";
	trap_Cvar_Set( var3, client->sess.scoreLevelName );
}

void G_SaveClientSessionData( gclient_t *client ) {
	const char	*s;
	const char	*var;

	s = va("%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i", 
		client->sess.sessionTeam,
		client->sess.spectatorNum,
		client->sess.spectatorState,
		client->sess.spectatorClient,
		client->sess.wins,
		client->sess.losses,
		client->sess.teamLeader,
		client->sess.sessionHealth,
		client->sess.sessionArmor,
		client->sess.sessionWeapons,
		client->sess.sessionWeapon,
		client->sess.sessionAmmoMG,
		client->sess.sessionAmmoSG,
		client->sess.sessionAmmoGL,
		client->sess.sessionAmmoRL,
		client->sess.sessionAmmoLG,
		client->sess.sessionAmmoRG,
		client->sess.sessionAmmoPG,
		client->sess.sessionAmmoBFG,
		client->sess.sessionAmmoGH,
		client->sess.sessionAmmoNG,
		client->sess.sessionAmmoPL,
		client->sess.sessionAmmoCG,
		client->sess.sessionAmmoFT,
		client->sess.sessionHoldable,
		client->sess.carnageScore,
		client->sess.deaths,
		client->sess.secrets,
		client->sess.accuracyShots,
		client->sess.accuracyHits,
		client->sess.posX,
		client->sess.posY,
		client->sess.posZ
		);

	var = va( "save_session%i", (int)(client - level.clients) );
	trap_Cvar_Set( var, s );
}

/*
================
G_ReadSessionData

Called on a reconnect
================
*/
void G_ReadSessionData( gclient_t *client ) {
	char	s[MAX_STRING_CHARS];
	const char	*var;
	const char	*var2;

	// bk001205 - format
	int teamLeader;
	int spectatorState;
	int sessionTeam;

	var = va( "session%i", (int)(client - level.clients) );
	trap_Cvar_VariableStringBuffer( var, s, sizeof(s) );

	sscanf( s, "%i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i %i",
		&sessionTeam,                 // bk010221 - format
		&client->sess.spectatorNum,
		&spectatorState,              // bk010221 - format
		&client->sess.spectatorClient,
		&client->sess.wins,
		&client->sess.losses,
		&teamLeader,                   // bk010221 - format
		&client->sess.sessionHealth,
		&client->sess.sessionArmor,
		&client->sess.sessionWeapons,
		&client->sess.sessionWeapon,
		&client->sess.sessionAmmoMG,
		&client->sess.sessionAmmoSG,
		&client->sess.sessionAmmoGL,
		&client->sess.sessionAmmoRL,
		&client->sess.sessionAmmoLG,
		&client->sess.sessionAmmoRG,
		&client->sess.sessionAmmoPG,
		&client->sess.sessionAmmoBFG,
		&client->sess.sessionAmmoGH,
		&client->sess.sessionAmmoNG,
		&client->sess.sessionAmmoPL,
		&client->sess.sessionAmmoCG,
		&client->sess.sessionAmmoFT,
		&client->sess.sessionHoldable,
		&client->sess.carnageScore,
		&client->sess.deaths,
		&client->sess.secrets,
		&client->sess.accuracyShots,
		&client->sess.accuracyHits,
		&client->sess.posX,
		&client->sess.posY,
		&client->sess.posZ
		);

	// bk001205 - format issues
	client->sess.sessionTeam = (team_t)sessionTeam;
	client->sess.spectatorState = (spectatorState_t)spectatorState;
	client->sess.teamLeader = (qboolean)teamLeader;

	// read score level name
	var2 = va ( "session%i_lvl", client - level.clients );
	trap_Cvar_VariableStringBuffer( var2, client->sess.scoreLevelName, sizeof(client->sess.scoreLevelName) );
}


/*
================
G_InitSessionData

Called on a first-time connect
================
*/
void G_InitSessionData( gclient_t *client, char *userinfo ) {
	clientSession_t	*sess;
	const char		*value;

	sess = &client->sess;

	// initial team determination
	if ( g_gametype.integer >= GT_TEAM && g_ffa_gt!=1) {
		if ( g_teamAutoJoin.integer ) {
			sess->sessionTeam = PickTeam( -1 );
			BroadcastTeamChange( client, -1 );
		} else {
			// always spawn as spectator in team games
			sess->sessionTeam = TEAM_SPECTATOR;	
		}
	} else {
		value = Info_ValueForKey( userinfo, "team" );
		if ( value[0] == 's' ) {
			// a willing spectator, not a waiting-in-line
			sess->sessionTeam = TEAM_SPECTATOR;
		} else {
			switch ( g_gametype.integer ) {
			default:
			case GT_SANDBOX:
			case GT_FFA:
			case GT_SINGLE:
			case GT_LMS:
				if ( g_maxGameClients.integer > 0 && 
					level.numNonSpectatorClients >= g_maxGameClients.integer ) {
					sess->sessionTeam = TEAM_SPECTATOR;
				} else {
					sess->sessionTeam = TEAM_FREE;
				}
				break;
			case GT_TOURNAMENT:
				// if the game is full, go into a waiting mode
				if ( level.numNonSpectatorClients >= 2 ) {
					sess->sessionTeam = TEAM_SPECTATOR;
				} else {
					sess->sessionTeam = TEAM_FREE;
				}
				break;
			}
		}
	}

	sess->spectatorState = SPECTATOR_FREE;
	//sess->spectatorNum = level.time;
	 AddTournamentQueue(client);

	G_WriteClientSessionData( client );
}

/*
==================
G_UpdateGlobalSessionDataForMapChange

Updates session data prior to a map change that's forced by a target_mapchange entity
==================
*/
void G_UpdateGlobalSessionDataForMapChange() {
	char	buf[MAX_INFO_STRING];

	trap_GetConfigstring(CS_TARGET_VARIABLE, buf, sizeof(buf));

	if ( !buf || strlen(buf) == 0)
		strcpy(buf, "-");

	trap_Cvar_Set( "epsession", va("%s", buf) );

	trap_Cvar_Set( "save_epsession", "" );

	trap_Cvar_Set( "save_epsession", G_ArenaScriptAutoChar( "epsession" ) );
}

/*
==================
G_UpdateClientSessionDataForMapChange

Updates session data for a client prior to a map change that's forced by a target_mapchange entity
==================
*/
void G_UpdateClientSessionDataForMapChange( gclient_t *client ) {
	clientSession_t	*sess;
	char *mapname;
	int secretFound, secretCount;

	sess = &client->sess;

	sess->sessionHealth = client->ps.stats[STAT_HEALTH];
	sess->sessionArmor = client->ps.stats[STAT_ARMOR];
	if ( client->ps.stats[STAT_WEAPONS] )
		sess->sessionWeapons = client->ps.stats[STAT_WEAPONS];
	else
		sess->sessionWeapons = -1;		//-1 means no weapons
	sess->sessionWeapon = client->ps.weapon;
	if ( client->ps.ammo[WP_MACHINEGUN] )
		sess->sessionAmmoMG = client->ps.ammo[WP_MACHINEGUN];
	else
		sess->sessionAmmoMG = -1;		//-1 means no ammo for machinegun, to overrule the spawning with 100 ammo
	sess->sessionAmmoSG = client->ps.ammo[WP_SHOTGUN];
	sess->sessionAmmoGL = client->ps.ammo[WP_GRENADE_LAUNCHER];
	sess->sessionAmmoRL = client->ps.ammo[WP_ROCKET_LAUNCHER];
	sess->sessionAmmoLG = client->ps.ammo[WP_LIGHTNING];
	sess->sessionAmmoRG = client->ps.ammo[WP_RAILGUN];
	sess->sessionAmmoPG = client->ps.ammo[WP_PLASMAGUN];
	sess->sessionAmmoBFG = client->ps.ammo[WP_BFG];
	sess->sessionAmmoGH = client->ps.ammo[WP_GRAPPLING_HOOK];
	sess->sessionAmmoNG = client->ps.ammo[WP_NAILGUN];
	sess->sessionAmmoPL = client->ps.ammo[WP_PROX_LAUNCHER];
	sess->sessionAmmoCG = client->ps.ammo[WP_CHAINGUN];
	sess->sessionAmmoFT = client->ps.ammo[WP_FLAMETHROWER];
	sess->sessionHoldable = client->ps.stats[STAT_HOLDABLE_ITEM];
	sess->carnageScore = client->ps.persistant[PERS_SCORE];
	sess->deaths = client->ps.persistant[PERS_KILLED];

	secretFound = (client->ps.persistant[PERS_SECRETS] & 0x7F);
	secretCount = ((client->ps.persistant[PERS_SECRETS] >> 7) & 0x7F) + level.secretCount;
	sess->secrets = secretFound + (secretCount << 7);

	sess->accuracyShots = client->accuracy_shots;
	sess->accuracyHits = client->accuracy_hits;

	strcpy(sess->scoreLevelName, G_GetScoringMapName());
	
	G_SaveClientSessionData(client);
}

void G_SaveClientSessionDataSave( gclient_t *client ) {
	clientSession_t	*sess;

	sess = &client->sess;

	sess->posX = (int)(client->ps.origin[0]);
	sess->posY = (int)(client->ps.origin[1]);
	sess->posZ = (int)(client->ps.origin[2]);

	trap_Cvar_Set( "save_curmap", G_ArenaScriptAutoChar( "mapname" ) );
	
	G_SaveClientSessionData(client);
	
	sess->posX = 0;
	sess->posY = 0;
	sess->posZ = 0;
}

/*
==================
G_ClearSessionDataForMapChange

Clears session data for map changes so that data does not persist through a hard map change (a map change not caused by target_mapchange) 
==================
*/
void G_ClearSessionDataForMapChange( gclient_t *client ) {
	clientSession_t	*sess;

	sess = &client->sess;

	sess->sessionHealth = 0;
	sess->sessionArmor = 0;
	sess->sessionWeapons = 0;
	sess->sessionWeapon = 0;
	sess->sessionAmmoMG = 0;
	sess->sessionAmmoSG = 0;
	sess->sessionAmmoGL = 0;
	sess->sessionAmmoRL = 0;
	sess->sessionAmmoLG = 0;
	sess->sessionAmmoRG = 0;
	sess->sessionAmmoPG = 0;
	sess->sessionAmmoBFG = 0;
	sess->sessionAmmoGH = 0;
	sess->sessionAmmoNG = 0;
	sess->sessionAmmoPL = 0;
	sess->sessionAmmoCG = 0;
	sess->sessionAmmoFT = 0;
	sess->sessionHoldable = 0;
	sess->carnageScore = 0;
	sess->deaths = 0;
	sess->secrets = 0;
	sess->accuracyShots = 0;
	sess->accuracyHits = 0;
	strcpy(sess->scoreLevelName, "" );
	sess->posX = 0;
	sess->posY = 0;
	sess->posZ = 0;
}

/*
==================
G_UpdateClientWithSessionData

Updates a client entity with the data that's stored in that client's session data
==================
*/
void G_UpdateClientWithSessionData( gentity_t *ent) {

	//give weapons
	if ( ent->client->sess.sessionWeapons > 0 )
		ent->client->ps.stats[STAT_WEAPONS] = ent->client->sess.sessionWeapons;
	else if ( ent->client->sess.sessionWeapons < 0 )
	{
		ent->client->ps.stats[STAT_WEAPONS] = 0;
		ent->client->ps.weapon = 0;
	}

	//give ammo
	if ( ent->client->sess.sessionAmmoMG == -1 ) 
		ent->client->ps.ammo[WP_MACHINEGUN] = 0;
	else if ( ent->client->sess.sessionAmmoMG )	//if MG ammo is 0, do nothing because player spawns with 100 ammo
		ent->client->ps.ammo[WP_MACHINEGUN] = ent->client->sess.sessionAmmoMG;
	if ( ent->client->sess.sessionAmmoSG ) ent->client->ps.ammo[WP_SHOTGUN] = ent->client->sess.sessionAmmoSG;
	if ( ent->client->sess.sessionAmmoGL ) ent->client->ps.ammo[WP_GRENADE_LAUNCHER] = ent->client->sess.sessionAmmoGL;
	if ( ent->client->sess.sessionAmmoRL ) ent->client->ps.ammo[WP_ROCKET_LAUNCHER] = ent->client->sess.sessionAmmoRL;
	if ( ent->client->sess.sessionAmmoLG ) ent->client->ps.ammo[WP_LIGHTNING] = ent->client->sess.sessionAmmoLG;
	if ( ent->client->sess.sessionAmmoRG ) ent->client->ps.ammo[WP_RAILGUN] = ent->client->sess.sessionAmmoRG;
	if ( ent->client->sess.sessionAmmoPG ) ent->client->ps.ammo[WP_PLASMAGUN] = ent->client->sess.sessionAmmoPG;
	if ( ent->client->sess.sessionAmmoBFG ) ent->client->ps.ammo[WP_BFG] = ent->client->sess.sessionAmmoBFG;
	if ( ent->client->sess.sessionAmmoGH ) ent->client->ps.ammo[WP_GRAPPLING_HOOK] = ent->client->sess.sessionAmmoGH;
	if ( ent->client->sess.sessionAmmoNG ) ent->client->ps.ammo[WP_NAILGUN] = ent->client->sess.sessionAmmoNG;
	if ( ent->client->sess.sessionAmmoPL ) ent->client->ps.ammo[WP_PROX_LAUNCHER] = ent->client->sess.sessionAmmoPL;
	if ( ent->client->sess.sessionAmmoCG ) ent->client->ps.ammo[WP_CHAINGUN] = ent->client->sess.sessionAmmoCG;
	if ( ent->client->sess.sessionAmmoFT ) ent->client->ps.ammo[WP_FLAMETHROWER] = ent->client->sess.sessionAmmoFT;
	if ( ent->client->sess.posX ) ent->client->ps.origin[0] = ent->client->sess.posX;
	if ( ent->client->sess.posY ) ent->client->ps.origin[1] = ent->client->sess.posY;
	if ( ent->client->sess.posZ ) ent->client->ps.origin[2] = ent->client->sess.posZ;

	//select weapon
	if ( ent->client->sess.sessionWeapon )
		ent->client->ps.weapon = ent->client->sess.sessionWeapon;

	//give holdables
	if ( ent->client->sess.sessionHoldable ) 
		ent->client->ps.stats[STAT_HOLDABLE_ITEM] = ent->client->sess.sessionHoldable;

	//give health
	if ( ent->client->sess.sessionHealth ) 
		ent->health = ent->client->ps.stats[STAT_HEALTH] = ent->client->sess.sessionHealth;

	//give armor
	if ( ent->client->sess.sessionArmor )
		ent->client->ps.stats[STAT_ARMOR] = ent->client->sess.sessionArmor;

	//set carnage score info
	if ( ent->client->sess.carnageScore )
		ent->client->ps.persistant[PERS_SCORE] = ent->client->sess.carnageScore;

	//set number of deaths
	if ( ent->client->sess.deaths )
		ent->client->ps.persistant[PERS_KILLED] = ent->client->sess.deaths;

	//set name of level to which scores should be attributed
	if ( strcmp( va("%s", ent->client->sess.scoreLevelName ), "0" ) ) {
		strcpy(level.scoreLevelName, ent->client->sess.scoreLevelName);
	}

	//set secrets
	if ( ent->client->sess.secrets )
		ent->client->ps.persistant[PERS_SECRETS] = ent->client->sess.secrets;

	//set accuracy
	if ( ent->client->sess.accuracyShots )
		ent->client->accuracy_shots = ent->client->sess.accuracyShots;
	
	if ( ent->client->sess.accuracyHits )
		ent->client->accuracy_hits = ent->client->sess.accuracyHits;

	
	// clear map change session data
	G_ClearSessionDataForMapChange( ent->client );
}

/*
==================
G_InitWorldSession

==================
*/
void G_InitWorldSession( void ) {
	char	s[MAX_STRING_CHARS];
	int			gt;
	char	buf[MAX_INFO_STRING];

	//restore session from vQ3 session data
	trap_Cvar_VariableStringBuffer( "session", s, sizeof(s) );
	gt = atoi( s );

	// if the gametype changed since the last session, don't use any client sessions
	if ( g_gametype.integer != gt ) {
		level.newSession = qtrue;
                G_Printf( "Gametype changed, clearing session data.\n" );
	}

	//restore session from additional ep session data
	trap_Cvar_VariableStringBuffer( "epsession", s, sizeof(s) );
	sscanf( s, "%s", &buf );

	//G_Printf("epsession: %s\n", s);

	trap_SetConfigstring( CS_TARGET_VARIABLE, buf );

	//clear epsession data so it only persists when it's set by target_mapchange
	trap_Cvar_Set( "epsession", "" );
}

/*
==================
G_WriteSessionData

==================
*/
void G_WriteSessionData( void ) {
	int		i;

	trap_Cvar_Set( "session", va("%i", g_gametype.integer) );

	for ( i = 0 ; i < level.maxclients ; i++ ) {
		if ( level.clients[i].pers.connected == CON_CONNECTED ) {
			G_WriteClientSessionData( &level.clients[i] );
		}
	}
	
	G_SaveClientSessionData( &level.clients[0] );
}
