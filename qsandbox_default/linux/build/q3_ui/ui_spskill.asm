code
proc SetSkillColor 4 0
file "../../../code/q3_ui/ui_spskill.c"
line 59
;1://Copyright (C) 1999-2005 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SINGLE PLAYER SKILL MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:
;14:#define ART_FRAME					"menu/art/cut_frame"
;15:#define ART_BACK					"menu/art/back_0.tga"
;16:#define ART_BACK_FOCUS				"menu/art/back_1.tga"
;17:#define ART_FIGHT					"menu/art/fight_0"
;18:#define ART_FIGHT_FOCUS				"menu/art/fight_1"
;19:#define ART_MAP_COMPLETE1			"menu/art/level_complete1"
;20:#define ART_MAP_COMPLETE2			"menu/art/level_complete2"
;21:#define ART_MAP_COMPLETE3			"menu/art/level_complete3"
;22:#define ART_MAP_COMPLETE4			"menu/art/level_complete4"
;23:#define ART_MAP_COMPLETE5			"menu/art/level_complete5"
;24:
;25:#define ID_BABY						10
;26:#define ID_EASY						11
;27:#define ID_MEDIUM					12
;28:#define ID_HARD						13
;29:#define ID_NIGHTMARE				14
;30:#define ID_BACK						15
;31:#define ID_FIGHT					16
;32:
;33:
;34:typedef struct {
;35:	menuframework_s	menu;
;36:
;37:	menubitmap_s	art_frame;
;38:	menutext_s		art_banner;
;39:
;40:	menutext_s		item_baby;
;41:	menutext_s		item_easy;
;42:	menutext_s		item_medium;
;43:	menutext_s		item_hard;
;44:	menutext_s		item_nightmare;
;45:
;46:	menubitmap_s	art_skillPic;
;47:	menubitmap_s	item_back;
;48:	menubitmap_s	item_fight;
;49:
;50:	const char		*arenaInfo;
;51:	qhandle_t		skillpics[5];
;52:	sfxHandle_t		nightmareSound;
;53:	sfxHandle_t		silenceSound;
;54:} skillMenuInfo_t;
;55:
;56:static skillMenuInfo_t	skillMenuInfo;
;57:
;58:
;59:static void SetSkillColor( int skill, vec4_t color ) {
line 60
;60:	switch( skill ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $83
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $83
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $99-4
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $99
address $84
address $87
address $90
address $93
address $96
code
LABELV $84
line 62
;61:	case 1:
;62:		skillMenuInfo.item_baby.color = color;
ADDRGP4 skillMenuInfo+1296+100
ADDRFP4 4
INDIRP4
ASGNP4
line 63
;63:		break;
ADDRGP4 $83
JUMPV
LABELV $87
line 65
;64:	case 2:
;65:		skillMenuInfo.item_easy.color = color;
ADDRGP4 skillMenuInfo+1400+100
ADDRFP4 4
INDIRP4
ASGNP4
line 66
;66:		break;
ADDRGP4 $83
JUMPV
LABELV $90
line 68
;67:	case 3:
;68:		skillMenuInfo.item_medium.color = color;
ADDRGP4 skillMenuInfo+1504+100
ADDRFP4 4
INDIRP4
ASGNP4
line 69
;69:		break;
ADDRGP4 $83
JUMPV
LABELV $93
line 71
;70:	case 4:
;71:		skillMenuInfo.item_hard.color = color;
ADDRGP4 skillMenuInfo+1608+100
ADDRFP4 4
INDIRP4
ASGNP4
line 72
;72:		break;
ADDRGP4 $83
JUMPV
LABELV $96
line 74
;73:	case 5:
;74:		skillMenuInfo.item_nightmare.color = color;
ADDRGP4 skillMenuInfo+1712+100
ADDRFP4 4
INDIRP4
ASGNP4
line 75
;75:		break;
line 77
;76:	default:
;77:		break;
LABELV $83
line 79
;78:	}
;79:}
LABELV $81
endproc SetSkillColor 4 0
proc UI_SPSkillMenu_SkillEvent 12 8
line 87
;80:
;81:
;82:/*
;83:=================
;84:UI_SPSkillMenu_SkillEvent
;85:=================
;86:*/
;87:static void UI_SPSkillMenu_SkillEvent( void *ptr, int notification ) {
line 91
;88:	int		id;
;89:	int		skill;
;90:
;91:	if (notification != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $102
line 92
;92:		return;
ADDRGP4 $101
JUMPV
LABELV $102
line 94
;93:
;94:	SetSkillColor( (int)trap_Cvar_VariableValue( "g_spSkill" ), color_red );
ADDRGP4 $104
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 SetSkillColor
CALLV
pop
line 96
;95:
;96:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 97
;97:	skill = id - ID_BABY + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 10
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 98
;98:	trap_Cvar_SetValue( "g_spSkill", skill );
ADDRGP4 $104
ARGP4
ADDRLP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 100
;99:
;100:	SetSkillColor( skill, color_white );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 SetSkillColor
CALLV
pop
line 101
;101:	skillMenuInfo.art_skillPic.shader = skillMenuInfo.skillpics[skill - 1];
ADDRGP4 skillMenuInfo+1816+96
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillMenuInfo+2168-4
ADDP4
INDIRI4
ASGNI4
line 103
;102:
;103:	if( id == ID_NIGHTMARE ) {
ADDRLP4 4
INDIRI4
CNSTI4 14
NEI4 $109
line 104
;104:		trap_S_StartLocalSound( skillMenuInfo.nightmareSound, CHAN_ANNOUNCER );
ADDRGP4 skillMenuInfo+2188
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 105
;105:	}
ADDRGP4 $110
JUMPV
LABELV $109
line 106
;106:	else {
line 107
;107:		trap_S_StartLocalSound( skillMenuInfo.silenceSound, CHAN_ANNOUNCER );
ADDRGP4 skillMenuInfo+2192
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 108
;108:	}
LABELV $110
line 109
;109:}
LABELV $101
endproc UI_SPSkillMenu_SkillEvent 12 8
proc UI_SPSkillMenu_FightEvent 0 4
line 117
;110:
;111:
;112:/*
;113:=================
;114:UI_SPSkillMenu_FightEvent
;115:=================
;116:*/
;117:static void UI_SPSkillMenu_FightEvent( void *ptr, int notification ) {
line 118
;118:	if (notification != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $114
line 119
;119:		return;
ADDRGP4 $113
JUMPV
LABELV $114
line 121
;120:
;121:	UI_SPArena_Start( skillMenuInfo.arenaInfo );
ADDRGP4 skillMenuInfo+2164
INDIRP4
ARGP4
ADDRGP4 UI_SPArena_Start
CALLV
pop
line 122
;122:}
LABELV $113
endproc UI_SPSkillMenu_FightEvent 0 4
proc UI_SPSkillMenu_BackEvent 0 8
line 130
;123:
;124:
;125:/*
;126:=================
;127:UI_SPSkillMenu_BackEvent
;128:=================
;129:*/
;130:static void UI_SPSkillMenu_BackEvent( void* ptr, int notification ) {
line 131
;131:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $118
line 132
;132:		return;
ADDRGP4 $117
JUMPV
LABELV $118
line 135
;133:	}
;134:
;135:	trap_S_StartLocalSound( skillMenuInfo.silenceSound, CHAN_ANNOUNCER );
ADDRGP4 skillMenuInfo+2192
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 136
;136:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 137
;137:}
LABELV $117
endproc UI_SPSkillMenu_BackEvent 0 8
proc UI_SPSkillMenu_Key 8 8
line 145
;138:
;139:
;140:/*
;141:=================
;142:UI_SPSkillMenu_Key
;143:=================
;144:*/
;145:static sfxHandle_t UI_SPSkillMenu_Key( int key ) {
line 146
;146:	if( key == K_MOUSE2 || key == K_ESCAPE ) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $124
ADDRLP4 0
INDIRI4
CNSTI4 27
NEI4 $122
LABELV $124
line 147
;147:		trap_S_StartLocalSound( skillMenuInfo.silenceSound, CHAN_ANNOUNCER );
ADDRGP4 skillMenuInfo+2192
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 148
;148:	}
LABELV $122
line 149
;149:	return Menu_DefaultKey( &skillMenuInfo.menu, key );
ADDRGP4 skillMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $121
endproc UI_SPSkillMenu_Key 8 8
export UI_SPSkillMenu_Cache
proc UI_SPSkillMenu_Cache 28 8
line 158
;150:}
;151:
;152:
;153:/*
;154:=================
;155:UI_SPSkillMenu_Cache
;156:=================
;157:*/
;158:void UI_SPSkillMenu_Cache( void ) {
line 159
;159:	trap_R_RegisterShaderNoMip( ART_FRAME );
ADDRGP4 $127
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 160
;160:	trap_R_RegisterShaderNoMip( ART_BACK );
ADDRGP4 $128
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 161
;161:	trap_R_RegisterShaderNoMip( ART_BACK_FOCUS );
ADDRGP4 $129
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 162
;162:	trap_R_RegisterShaderNoMip( ART_FIGHT );
ADDRGP4 $130
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 163
;163:	trap_R_RegisterShaderNoMip( ART_FIGHT_FOCUS );
ADDRGP4 $131
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 164
;164:	skillMenuInfo.skillpics[0] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE1 );
ADDRGP4 $133
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 skillMenuInfo+2168
ADDRLP4 0
INDIRI4
ASGNI4
line 165
;165:	skillMenuInfo.skillpics[1] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE2 );
ADDRGP4 $136
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 skillMenuInfo+2168+4
ADDRLP4 4
INDIRI4
ASGNI4
line 166
;166:	skillMenuInfo.skillpics[2] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE3 );
ADDRGP4 $139
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 skillMenuInfo+2168+8
ADDRLP4 8
INDIRI4
ASGNI4
line 167
;167:	skillMenuInfo.skillpics[3] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE4 );
ADDRGP4 $142
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 skillMenuInfo+2168+12
ADDRLP4 12
INDIRI4
ASGNI4
line 168
;168:	skillMenuInfo.skillpics[4] = trap_R_RegisterShaderNoMip( ART_MAP_COMPLETE5 );
ADDRGP4 $145
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 skillMenuInfo+2168+16
ADDRLP4 16
INDIRI4
ASGNI4
line 170
;169:
;170:	skillMenuInfo.nightmareSound = trap_S_RegisterSound( "sound/misc/nightmare.wav", qfalse );
ADDRGP4 $147
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 skillMenuInfo+2188
ADDRLP4 20
INDIRI4
ASGNI4
line 171
;171:	skillMenuInfo.silenceSound = trap_S_RegisterSound( "sound/misc/silence.wav", qfalse );
ADDRGP4 $149
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 24
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 skillMenuInfo+2192
ADDRLP4 24
INDIRI4
ASGNI4
line 172
;172:}
LABELV $126
endproc UI_SPSkillMenu_Cache 28 8
proc UI_SPSkillMenu_Init 12 12
line 180
;173:
;174:
;175:/*
;176:=================
;177:UI_SPSkillMenu_Init
;178:=================
;179:*/
;180:static void UI_SPSkillMenu_Init( void ) {
line 183
;181:	int		skill;
;182:
;183:	memset( &skillMenuInfo, 0, sizeof(skillMenuInfo) );
ADDRGP4 skillMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2196
ARGI4
ADDRGP4 memset
CALLP4
pop
line 184
;184:	skillMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 skillMenuInfo+1052
CNSTI4 1
ASGNI4
line 185
;185:	skillMenuInfo.menu.key = UI_SPSkillMenu_Key;
ADDRGP4 skillMenuInfo+1040
ADDRGP4 UI_SPSkillMenu_Key
ASGNP4
line 187
;186:
;187:	UI_SPSkillMenu_Cache();
ADDRGP4 UI_SPSkillMenu_Cache
CALLV
pop
line 189
;188:
;189:	skillMenuInfo.art_frame.generic.type		= MTYPE_BITMAP;
ADDRGP4 skillMenuInfo+1076
CNSTI4 6
ASGNI4
line 190
;190:	skillMenuInfo.art_frame.generic.name		= ART_FRAME;
ADDRGP4 skillMenuInfo+1076+4
ADDRGP4 $127
ASGNP4
line 191
;191:	skillMenuInfo.art_frame.generic.flags		= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 skillMenuInfo+1076+72
CNSTU4 16388
ASGNU4
line 192
;192:	skillMenuInfo.art_frame.generic.x			= 142;
ADDRGP4 skillMenuInfo+1076+28
CNSTI4 142
ASGNI4
line 193
;193:	skillMenuInfo.art_frame.generic.y			= 118;
ADDRGP4 skillMenuInfo+1076+32
CNSTI4 118
ASGNI4
line 194
;194:	skillMenuInfo.art_frame.width				= 359;
ADDRGP4 skillMenuInfo+1076+104
CNSTI4 359
ASGNI4
line 195
;195:	skillMenuInfo.art_frame.height				= 256;
ADDRGP4 skillMenuInfo+1076+108
CNSTI4 256
ASGNI4
line 197
;196:
;197:	skillMenuInfo.art_banner.generic.type		= MTYPE_BTEXT;
ADDRGP4 skillMenuInfo+1192
CNSTI4 10
ASGNI4
line 198
;198:	skillMenuInfo.art_banner.generic.flags		= QMF_CENTER_JUSTIFY;
ADDRGP4 skillMenuInfo+1192+72
CNSTU4 8
ASGNU4
line 199
;199:	skillMenuInfo.art_banner.generic.x			= 320;
ADDRGP4 skillMenuInfo+1192+28
CNSTI4 320
ASGNI4
line 200
;200:	skillMenuInfo.art_banner.generic.y			= 16;
ADDRGP4 skillMenuInfo+1192+32
CNSTI4 16
ASGNI4
line 201
;201:	skillMenuInfo.art_banner.string				= "DIFFICULTY";
ADDRGP4 skillMenuInfo+1192+88
ADDRGP4 $175
ASGNP4
line 202
;202:	skillMenuInfo.art_banner.color				= color_white;
ADDRGP4 skillMenuInfo+1192+100
ADDRGP4 color_white
ASGNP4
line 203
;203:	skillMenuInfo.art_banner.style				= UI_CENTER;
ADDRGP4 skillMenuInfo+1192+92
CNSTI4 1
ASGNI4
line 205
;204:
;205:	skillMenuInfo.item_baby.generic.type		= MTYPE_PTEXT;
ADDRGP4 skillMenuInfo+1296
CNSTI4 9
ASGNI4
line 206
;206:	skillMenuInfo.item_baby.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 skillMenuInfo+1296+72
CNSTU4 264
ASGNU4
line 207
;207:	skillMenuInfo.item_baby.generic.x			= 320;
ADDRGP4 skillMenuInfo+1296+28
CNSTI4 320
ASGNI4
line 208
;208:	skillMenuInfo.item_baby.generic.y			= 170;
ADDRGP4 skillMenuInfo+1296+32
CNSTI4 170
ASGNI4
line 209
;209:	skillMenuInfo.item_baby.generic.callback	= UI_SPSkillMenu_SkillEvent;
ADDRGP4 skillMenuInfo+1296+76
ADDRGP4 UI_SPSkillMenu_SkillEvent
ASGNP4
line 210
;210:	skillMenuInfo.item_baby.generic.id			= ID_BABY;
ADDRGP4 skillMenuInfo+1296+24
CNSTI4 10
ASGNI4
line 211
;211:	skillMenuInfo.item_baby.string				= "I Can Win";
ADDRGP4 skillMenuInfo+1296+88
ADDRGP4 $193
ASGNP4
line 212
;212:	skillMenuInfo.item_baby.color				= color_red;
ADDRGP4 skillMenuInfo+1296+100
ADDRGP4 color_red
ASGNP4
line 213
;213:	skillMenuInfo.item_baby.style				= UI_CENTER;
ADDRGP4 skillMenuInfo+1296+92
CNSTI4 1
ASGNI4
line 215
;214:
;215:	skillMenuInfo.item_easy.generic.type		= MTYPE_PTEXT;
ADDRGP4 skillMenuInfo+1400
CNSTI4 9
ASGNI4
line 216
;216:	skillMenuInfo.item_easy.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 skillMenuInfo+1400+72
CNSTU4 264
ASGNU4
line 217
;217:	skillMenuInfo.item_easy.generic.x			= 320;
ADDRGP4 skillMenuInfo+1400+28
CNSTI4 320
ASGNI4
line 218
;218:	skillMenuInfo.item_easy.generic.y			= 198;
ADDRGP4 skillMenuInfo+1400+32
CNSTI4 198
ASGNI4
line 219
;219:	skillMenuInfo.item_easy.generic.callback	= UI_SPSkillMenu_SkillEvent;
ADDRGP4 skillMenuInfo+1400+76
ADDRGP4 UI_SPSkillMenu_SkillEvent
ASGNP4
line 220
;220:	skillMenuInfo.item_easy.generic.id			= ID_EASY;
ADDRGP4 skillMenuInfo+1400+24
CNSTI4 11
ASGNI4
line 221
;221:	skillMenuInfo.item_easy.string				= "Bring It On";
ADDRGP4 skillMenuInfo+1400+88
ADDRGP4 $211
ASGNP4
line 222
;222:	skillMenuInfo.item_easy.color				= color_red;
ADDRGP4 skillMenuInfo+1400+100
ADDRGP4 color_red
ASGNP4
line 223
;223:	skillMenuInfo.item_easy.style				= UI_CENTER;
ADDRGP4 skillMenuInfo+1400+92
CNSTI4 1
ASGNI4
line 225
;224:
;225:	skillMenuInfo.item_medium.generic.type		= MTYPE_PTEXT;
ADDRGP4 skillMenuInfo+1504
CNSTI4 9
ASGNI4
line 226
;226:	skillMenuInfo.item_medium.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 skillMenuInfo+1504+72
CNSTU4 264
ASGNU4
line 227
;227:	skillMenuInfo.item_medium.generic.x			= 320;
ADDRGP4 skillMenuInfo+1504+28
CNSTI4 320
ASGNI4
line 228
;228:	skillMenuInfo.item_medium.generic.y			= 227;
ADDRGP4 skillMenuInfo+1504+32
CNSTI4 227
ASGNI4
line 229
;229:	skillMenuInfo.item_medium.generic.callback	= UI_SPSkillMenu_SkillEvent;
ADDRGP4 skillMenuInfo+1504+76
ADDRGP4 UI_SPSkillMenu_SkillEvent
ASGNP4
line 230
;230:	skillMenuInfo.item_medium.generic.id		= ID_MEDIUM;
ADDRGP4 skillMenuInfo+1504+24
CNSTI4 12
ASGNI4
line 231
;231:	skillMenuInfo.item_medium.string			= "Hurt Me Plenty";
ADDRGP4 skillMenuInfo+1504+88
ADDRGP4 $229
ASGNP4
line 232
;232:	skillMenuInfo.item_medium.color				= color_red;
ADDRGP4 skillMenuInfo+1504+100
ADDRGP4 color_red
ASGNP4
line 233
;233:	skillMenuInfo.item_medium.style				= UI_CENTER;
ADDRGP4 skillMenuInfo+1504+92
CNSTI4 1
ASGNI4
line 235
;234:
;235:	skillMenuInfo.item_hard.generic.type		= MTYPE_PTEXT;
ADDRGP4 skillMenuInfo+1608
CNSTI4 9
ASGNI4
line 236
;236:	skillMenuInfo.item_hard.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 skillMenuInfo+1608+72
CNSTU4 264
ASGNU4
line 237
;237:	skillMenuInfo.item_hard.generic.x			= 320;
ADDRGP4 skillMenuInfo+1608+28
CNSTI4 320
ASGNI4
line 238
;238:	skillMenuInfo.item_hard.generic.y			= 255;
ADDRGP4 skillMenuInfo+1608+32
CNSTI4 255
ASGNI4
line 239
;239:	skillMenuInfo.item_hard.generic.callback	= UI_SPSkillMenu_SkillEvent;
ADDRGP4 skillMenuInfo+1608+76
ADDRGP4 UI_SPSkillMenu_SkillEvent
ASGNP4
line 240
;240:	skillMenuInfo.item_hard.generic.id			= ID_HARD;
ADDRGP4 skillMenuInfo+1608+24
CNSTI4 13
ASGNI4
line 241
;241:	skillMenuInfo.item_hard.string				= "Hardcore";
ADDRGP4 skillMenuInfo+1608+88
ADDRGP4 $247
ASGNP4
line 242
;242:	skillMenuInfo.item_hard.color				= color_red;
ADDRGP4 skillMenuInfo+1608+100
ADDRGP4 color_red
ASGNP4
line 243
;243:	skillMenuInfo.item_hard.style				= UI_CENTER;
ADDRGP4 skillMenuInfo+1608+92
CNSTI4 1
ASGNI4
line 245
;244:
;245:	skillMenuInfo.item_nightmare.generic.type		= MTYPE_PTEXT;
ADDRGP4 skillMenuInfo+1712
CNSTI4 9
ASGNI4
line 246
;246:	skillMenuInfo.item_nightmare.generic.flags		= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 skillMenuInfo+1712+72
CNSTU4 264
ASGNU4
line 247
;247:	skillMenuInfo.item_nightmare.generic.x			= 320;
ADDRGP4 skillMenuInfo+1712+28
CNSTI4 320
ASGNI4
line 248
;248:	skillMenuInfo.item_nightmare.generic.y			= 283;
ADDRGP4 skillMenuInfo+1712+32
CNSTI4 283
ASGNI4
line 249
;249:	skillMenuInfo.item_nightmare.generic.callback	= UI_SPSkillMenu_SkillEvent;
ADDRGP4 skillMenuInfo+1712+76
ADDRGP4 UI_SPSkillMenu_SkillEvent
ASGNP4
line 250
;250:	skillMenuInfo.item_nightmare.generic.id			= ID_NIGHTMARE;
ADDRGP4 skillMenuInfo+1712+24
CNSTI4 14
ASGNI4
line 251
;251:	skillMenuInfo.item_nightmare.string				= "NIGHTMARE!";
ADDRGP4 skillMenuInfo+1712+88
ADDRGP4 $265
ASGNP4
line 252
;252:	skillMenuInfo.item_nightmare.color				= color_red;
ADDRGP4 skillMenuInfo+1712+100
ADDRGP4 color_red
ASGNP4
line 253
;253:	skillMenuInfo.item_nightmare.style				= UI_CENTER;
ADDRGP4 skillMenuInfo+1712+92
CNSTI4 1
ASGNI4
line 255
;254:
;255:	skillMenuInfo.item_back.generic.type		= MTYPE_BITMAP;
ADDRGP4 skillMenuInfo+1932
CNSTI4 6
ASGNI4
line 256
;256:	skillMenuInfo.item_back.generic.name		= ART_BACK;
ADDRGP4 skillMenuInfo+1932+4
ADDRGP4 $128
ASGNP4
line 257
;257:	skillMenuInfo.item_back.generic.flags		= QMF_LEFT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 skillMenuInfo+1932+72
CNSTU4 260
ASGNU4
line 258
;258:	skillMenuInfo.item_back.generic.x			= 0 - uis.wideoffset;
ADDRGP4 skillMenuInfo+1932+28
CNSTI4 0
ADDRGP4 uis+11476
INDIRI4
SUBI4
ASGNI4
line 259
;259:	skillMenuInfo.item_back.generic.y			= 480-64;
ADDRGP4 skillMenuInfo+1932+32
CNSTI4 416
ASGNI4
line 260
;260:	skillMenuInfo.item_back.generic.callback	= UI_SPSkillMenu_BackEvent;
ADDRGP4 skillMenuInfo+1932+76
ADDRGP4 UI_SPSkillMenu_BackEvent
ASGNP4
line 261
;261:	skillMenuInfo.item_back.generic.id			= ID_BACK;
ADDRGP4 skillMenuInfo+1932+24
CNSTI4 15
ASGNI4
line 262
;262:	skillMenuInfo.item_back.width				= 128;
ADDRGP4 skillMenuInfo+1932+104
CNSTI4 128
ASGNI4
line 263
;263:	skillMenuInfo.item_back.height				= 64;
ADDRGP4 skillMenuInfo+1932+108
CNSTI4 64
ASGNI4
line 264
;264:	skillMenuInfo.item_back.focuspic			= ART_BACK_FOCUS;
ADDRGP4 skillMenuInfo+1932+88
ADDRGP4 $129
ASGNP4
line 266
;265:
;266:	skillMenuInfo.art_skillPic.generic.type		= MTYPE_BITMAP;
ADDRGP4 skillMenuInfo+1816
CNSTI4 6
ASGNI4
line 267
;267:	skillMenuInfo.art_skillPic.generic.flags	= QMF_LEFT_JUSTIFY|QMF_INACTIVE;
ADDRGP4 skillMenuInfo+1816+72
CNSTU4 16388
ASGNU4
line 268
;268:	skillMenuInfo.art_skillPic.generic.x		= 320-64;
ADDRGP4 skillMenuInfo+1816+28
CNSTI4 256
ASGNI4
line 269
;269:	skillMenuInfo.art_skillPic.generic.y		= 368;
ADDRGP4 skillMenuInfo+1816+32
CNSTI4 368
ASGNI4
line 270
;270:	skillMenuInfo.art_skillPic.width			= 128;
ADDRGP4 skillMenuInfo+1816+104
CNSTI4 128
ASGNI4
line 271
;271:	skillMenuInfo.art_skillPic.height			= 96;
ADDRGP4 skillMenuInfo+1816+108
CNSTI4 96
ASGNI4
line 273
;272:
;273:	skillMenuInfo.item_fight.generic.type		= MTYPE_BITMAP;
ADDRGP4 skillMenuInfo+2048
CNSTI4 6
ASGNI4
line 274
;274:	skillMenuInfo.item_fight.generic.name		= ART_FIGHT;
ADDRGP4 skillMenuInfo+2048+4
ADDRGP4 $130
ASGNP4
line 275
;275:	skillMenuInfo.item_fight.generic.flags		= QMF_RIGHT_JUSTIFY|QMF_PULSEIFFOCUS;
ADDRGP4 skillMenuInfo+2048+72
CNSTU4 272
ASGNU4
line 276
;276:	skillMenuInfo.item_fight.generic.callback	= UI_SPSkillMenu_FightEvent;
ADDRGP4 skillMenuInfo+2048+76
ADDRGP4 UI_SPSkillMenu_FightEvent
ASGNP4
line 277
;277:	skillMenuInfo.item_fight.generic.id			= ID_FIGHT;
ADDRGP4 skillMenuInfo+2048+24
CNSTI4 16
ASGNI4
line 278
;278:	skillMenuInfo.item_fight.generic.x			= 640 + uis.wideoffset;
ADDRGP4 skillMenuInfo+2048+28
ADDRGP4 uis+11476
INDIRI4
CNSTI4 640
ADDI4
ASGNI4
line 279
;279:	skillMenuInfo.item_fight.generic.y			= 480-64;
ADDRGP4 skillMenuInfo+2048+32
CNSTI4 416
ASGNI4
line 280
;280:	skillMenuInfo.item_fight.width				= 128;
ADDRGP4 skillMenuInfo+2048+104
CNSTI4 128
ASGNI4
line 281
;281:	skillMenuInfo.item_fight.height				= 64;
ADDRGP4 skillMenuInfo+2048+108
CNSTI4 64
ASGNI4
line 282
;282:	skillMenuInfo.item_fight.focuspic			= ART_FIGHT_FOCUS;
ADDRGP4 skillMenuInfo+2048+88
ADDRGP4 $131
ASGNP4
line 284
;283:
;284:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.art_frame );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1076
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 285
;285:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.art_banner );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1192
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 286
;286:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.item_baby );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1296
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 287
;287:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.item_easy );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1400
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 288
;288:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.item_medium );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1504
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 289
;289:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.item_hard );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 290
;290:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.item_nightmare );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1712
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 291
;291:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.art_skillPic );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1816
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 292
;292:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.item_back );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+1932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 293
;293:	Menu_AddItem( &skillMenuInfo.menu, ( void * )&skillMenuInfo.item_fight );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+2048
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 295
;294:
;295:	skill = (int)Com_Clamp( 1, 5, trap_Cvar_VariableValue( "g_spSkill" ) );
ADDRGP4 $104
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1065353216
ARGF4
CNSTF4 1084227584
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 296
;296:	SetSkillColor( skill, color_white );
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 SetSkillColor
CALLV
pop
line 297
;297:	skillMenuInfo.art_skillPic.shader = skillMenuInfo.skillpics[skill - 1];
ADDRGP4 skillMenuInfo+1816+96
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 skillMenuInfo+2168-4
ADDP4
INDIRI4
ASGNI4
line 298
;298:	if( skill == 5 ) {
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $335
line 299
;299:		trap_S_StartLocalSound( skillMenuInfo.nightmareSound, CHAN_ANNOUNCER );
ADDRGP4 skillMenuInfo+2188
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 300
;300:	}
LABELV $335
line 301
;301:}
LABELV $150
endproc UI_SPSkillMenu_Init 12 12
export UI_SPSkillMenu
proc UI_SPSkillMenu 0 8
line 304
;302:
;303:
;304:void UI_SPSkillMenu( const char *arenaInfo ) {
line 305
;305:	UI_SPSkillMenu_Init();
ADDRGP4 UI_SPSkillMenu_Init
CALLV
pop
line 306
;306:	skillMenuInfo.arenaInfo = arenaInfo;
ADDRGP4 skillMenuInfo+2164
ADDRFP4 0
INDIRP4
ASGNP4
line 307
;307:	UI_PushMenu( &skillMenuInfo.menu );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 308
;308:	Menu_SetCursorToItem( &skillMenuInfo.menu, &skillMenuInfo.item_fight );
ADDRGP4 skillMenuInfo
ARGP4
ADDRGP4 skillMenuInfo+2048
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 309
;309:}
LABELV $338
endproc UI_SPSkillMenu 0 8
bss
align 4
LABELV skillMenuInfo
skip 2196
import UI_MapCallVote
import UI_saveMapEdMenu
import UI_saveMapEdMenu_Cache
import UI_loadMapEdMenu
import UI_loadMapEd_Cache
import UI_SPKickDupe_f
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotNumByName
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_SetDefaultCvar
import UI_UpdateCvars
import UI_RegisterCvars
import MainMenu_ReloadGame
import UI_MainMenu
import MainMenu_Cache
import color_translucent
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_ConfigMenu
import UI_SaveConfigMenu
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import LoadConfig_SetStatusText
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_RealTime
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import UIE_AwardIcons_DrawValues
import UIE_AwardIcons_PlaySound
import UIE_AwardIcons_InitControls
import UIE_AwardIcons_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawCharCustom
import UI_DrawChar
import UI_DrawStringCustom
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_DrawScaledProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawRoundedRect
import vycalc
import vxcalc
import vy
import vx
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UIE_PlayerInfo_InitRotateModel
import PlayerInfo_ModelSpinEvent
import UIE_PlayerInfo_IsTeamModel
import UIE_PlayerInfo_DrawTeamModel
import UIE_ModelSkin
import UIE_ModelName
import UIE_PlayerInfo_AnimateModel
import UIE_PlayerInfo_InitModel
import UIE_PlayerInfo_ChangeAnimation
import UIE_PlayerInfo_ChangeTimedAnimation
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UIE_DefaultIconFromGameType
import UIE_StartServer_RegisterDisableCvars
import UIE_InGame_EnabledItems
import UI_ServerPlayerIcon
import Clamp_Random
import UI_BotSelect_Cache
import UI_BotSelect
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_WorkshopMenu_Cache
import UI_WorkshopMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_SandboxMainMenu
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_BotCommandMenu_f
import UI_DynamicMenuCache
import UI_InGameMenu
import InGame_Cache
import UI_CurrentPlayerTeam
import UI_CreditMenu
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_DrawCustom
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import UI_AdvancedMenu_Cache
import UI_AdvancedMenu
import MGUI_Load
import UI_ArenaScriptAutoFloat
import UI_ArenaScriptAutoChar
import UI_ArenaScriptAutoInt
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import SpinControl_Init
import RadioButton_Init
import ScrollList_Init
import PText_Init
import text_color_highlighty
import text_color_highlight
import text_color_normal
import text_color_disabled
import pulse_color
import listbar_color
import list_color
import name_color
import s_sandboxmain_color1
import color_green
import color_dim
import color_realred
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import UIObject_Draw
import UIObject_Init
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import UI_IsValidCvar
import uie_olditemmenu
import uie_ingame_dynamicmenu
import uie_autoclosebotmenu
import uie_mapicons
import uie_animsfx
import ui_cdkeychecked
import ui_cdkey
import ui_server32
import ui_server31
import ui_server30
import ui_server29
import ui_server28
import ui_server27
import ui_server26
import ui_server25
import ui_server24
import ui_server23
import ui_server22
import ui_server21
import ui_server20
import ui_server19
import ui_server18
import ui_server17
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
import ui_backcolors
import cl_screenoffset
import ui_loaded
import cl_language
import cl_selectedmod
import team_legsskin
import sensitivitymenu
import legsskin
import ui_singlemode
import ui_3dmap
import ui_scrollbtnsize
import sbt_wallpaper
import sbt_color3_3
import sbt_color3_2
import sbt_color3_1
import sbt_color3_0
import sbt_color2_3
import sbt_color2_2
import sbt_color2_1
import sbt_color2_0
import sbt_color1_3
import sbt_color1_2
import sbt_color1_1
import sbt_color1_0
import sbt_color0_3
import sbt_color0_2
import sbt_color0_1
import sbt_color0_0
import mgui_none
import mgui_api_active
import cl_sprun
import toolgun_disabledarg4
import toolgun_disabledarg3
import toolgun_disabledarg2
import toolgun_disabledarg1
import toolgun_toolset18
import toolgun_toolset17
import toolgun_toolset16
import toolgun_toolset15
import toolgun_toolset14
import toolgun_toolset13
import toolgun_toolset12
import toolgun_toolset11
import toolgun_toolset10
import toolgun_toolset9
import toolgun_toolset8
import toolgun_toolset7
import toolgun_toolset6
import toolgun_toolset5
import toolgun_toolset4
import toolgun_toolset3
import toolgun_toolset2
import toolgun_toolset1
import tool_modifypreset4
import tool_modifypreset3
import tool_modifypreset2
import tool_modifypreset
import tool_spawnpreset
import spawn_preset
import sb_tab
import sb_texturenum
import sb_classnum
import sb_modelnum
import sb_grid
import sb_texturename
import sb_texture
import sb_private
import test9
import test8
import test7
import test6
import test5
import test4
import test3
import test2
import test1
import cl_giantcharheight
import cl_giantcharwidth
import cl_bigcharheight
import cl_bigcharwidth
import cl_smallcharheight
import cl_smallcharwidth
import cl_propgapwidth
import cl_propspacewidth
import cl_propheight
import cl_propsmallsizescale
import BG_TeamName
import BG_GetVehicleSettings
import BG_VehicleCheckClass
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_DefragmentMemory
import BG_Free
import BG_InitMemory
import BG_Alloc
import BG_CanAlloc
import BG_CanItemBeGrabbed
import BG_FindItemForBackpack
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindSwepAmmo
import BG_FindSwep
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import COM_LoadLevelScores
import COM_CalculatePlayerScore
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import vectoyaw
import AngleDifference
import Com_TruncateLongString
import va
import Q_CountChar
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_stristr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_RandomBytes
import Com_SkipCharset
import Com_SkipTokens
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_GetExtension
import COM_SkipPath
import Com_Clamp
import Q_isnan
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoundsIntersectPoint
import BoundsIntersectSphere
import BoundsIntersect
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import Lerp
import VelocityToAxis
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import Q_snprintf
import Q_vsnprintf
import strtol
import _atoi
import atoi
import strtod
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strrchr
import strchr
import strcmp
import strcpy
import strcat
import ifstrlenru
import strlenru
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $265
byte 1 78
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 77
byte 1 65
byte 1 82
byte 1 69
byte 1 33
byte 1 0
align 1
LABELV $247
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $229
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $211
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $193
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $175
byte 1 68
byte 1 73
byte 1 70
byte 1 70
byte 1 73
byte 1 67
byte 1 85
byte 1 76
byte 1 84
byte 1 89
byte 1 0
align 1
LABELV $149
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 115
byte 1 105
byte 1 108
byte 1 101
byte 1 110
byte 1 99
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $147
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 110
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $145
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 53
byte 1 0
align 1
LABELV $142
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $139
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $136
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $133
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $131
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $130
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $129
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $128
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $127
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $104
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
