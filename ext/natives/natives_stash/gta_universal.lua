--- NOTE: WHEN UPDATING THIS FILE, TAKE THE FOLLOWING MODIFICATIONS INTO ACCOUNT:
-- - _SET_NOTIFICATION_MESSAGE_2
-- - _GET_GAMEPLAY_CAM_ROT -> _GET_GAMEPLAY_CAM_ROT_2
-- - _IS_LOADING_PROMPT_BEING_DISPLAYED return type -> BOOL
-- - SET_SUPER_JUMP_THIS_FRAME return type -> int

type "Entity"
	nativeType "int"
	doc [[!
<summary>
	Represents an entity in the game.
</summary>
<example>
	// Just some example code here...
</example>
<remarks>blahblah</remarks>
]]

type "Vehicle"
	extends "Entity"
	doc [[!
<summary>
	Represents a vehicle.
</summary>
]]

type "Player"
	nativeType 'int'
	property "position" { "GET_ENTITY_COORDS" }
	method "getPosition" { "GET_ENTITY_COORDS" }

	doc [[!
<summary>
	Represents a player.
</summary>
]]

-- Native definitions

native "GET_PLAYER_PED"
	hash "0x43A66C31C68491C0"
	jhash (0x6E31E993)
	arguments {
		Player "playerId",
	}
	ns "PLAYER"
	returns	"Ped"
	doc [[!
<summary>
		returns the players ped used in many functions
</summary>
	]]

native "GET_PLAYER_PED_SCRIPT_INDEX"
	hash "0x50FAC3A3E030A6E1"
	jhash (0x6AC64990)
	arguments {
		Player "Player",
	}
	ns "PLAYER"
	returns	"Ped"
	doc [[!
<summary>
		Does the same like PLAYER::GET_PLAYER_PED<br/>
</summary>
	]]

native "SET_PLAYER_MODEL"
	hash "0x00A1CADD00108836"
	jhash (0x774A4C54)
	arguments {
		Player "player",

		Hash "model",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Make sure to request the model first and wait until it has loaded.
</summary>
	]]

native "CHANGE_PLAYER_PED"
	hash "0x048189FAC643DEEE"
	jhash (0xBE515485)
	arguments {
		Player "Player",

		Ped "ped",

		BOOL "b2",

		BOOL "b3",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		b2 and/or b3 maybe got something to do with keeping values from the last ped. Both of them set to 1 works great. <br/><br/>Examples from the decompiled scripts:<br/><br/>PLAYER::CHANGE_PLAYER_PED(PLAYER::PLAYER_ID(), l_5C0[4/*14*/], 0, 1);<br/>PLAYER::CHANGE_PLAYER_PED(PLAYER::PLAYER_ID(), a_0[a_0._f7/*1*/], a_2, 0);<br/><br/><br/>===========================================================<br/>The only way I ever got this to work in GTA Online once is by setting both to 0, 0. However, when you switch from your online character to whomever, your character will start walking away 'as if you left the game.' If from there you attempt to call this native once more to switch back to you online ped. You will freeze or if you try changing to another ped. I've tried all posibilities so far.<br/>1, 1 (Freeze), 0, 0(Works Once), 1, 0 &amp; 0, 1 (Freeze). Note of course trying to call this on another online player will crash. Anyone have any idea if implementing a blr within the xex itself on a possible check if it would prevent this freezing?<br/>===========================================================
</summary>
	]]

native "GET_PLAYER_RGB_COLOUR"
	hash "0xE902EF951DCE178F"
	jhash (0x6EF43BBB)
	arguments {
		Player "Player",

		intPtr "r",

		intPtr "g",

		intPtr "b",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Returns RGB color of the player
</summary>
	]]

native "GET_NUMBER_OF_PLAYERS"
	hash "0x407C7F91DDB46C16"
	jhash (0x4C1B8867)
	ns "PLAYER"
	returns	"int"

native "GET_PLAYER_TEAM"
	hash "0x37039302F4E0A008"
	jhash (0x9873E404)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		Gets the player's team.
		Does nothing in singleplayer.
</summary>
	]]

native "SET_PLAYER_TEAM"
	hash "0x0299FA38396A4940"
	jhash (0x725ADCF2)
	arguments {
		Player "player",

		int "team",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Set player team on deathmatch and last team standing..
</summary>
	]]

native "GET_PLAYER_NAME"
	hash "0x6D0DE6A7B5DA71F8"
	jhash (0x406B4B20)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"charPtr"
	doc [[!
<summary>
		Returns the players name
</summary>
	]]

native "GET_WANTED_LEVEL_RADIUS"
	hash "0x085DEB493BE80812"
	jhash (0x1CF7D7DA)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"Any"
	doc [[!
<summary>
		Remnant from GTA IV. Does nothing in GTA V.
</summary>
	]]

native "GET_PLAYER_WANTED_CENTRE_POSITION"
	hash "0x0C92BA89F1AF26F8"
	jhash (0x821F2D2C)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"Vector3"

native "SET_PLAYER_WANTED_CENTRE_POSITION"
	hash "0x520E541A97A13354"
	jhash (0xF261633A)
	arguments {
		Player "player",

		float "x",

		float "y",

		float "z",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		# Predominant call signatures
		PLAYER::SET_PLAYER_WANTED_CENTRE_POSITION(PLAYER::PLAYER_ID(), ENTITY::GET_ENTITY_COORDS(PLAYER::PLAYER_PED_ID(), 1));

		# Parameter value ranges
		P0: PLAYER::PLAYER_ID()
		P1: ENTITY::GET_ENTITY_COORDS(PLAYER::PLAYER_PED_ID(), 1)
		P2: Not set by any call
</summary>
	]]

native "GET_WANTED_LEVEL_THRESHOLD"
	hash "0xFDD179EAF45B556C"
	jhash (0xD9783F6B)
	arguments {
		int "wantedLevel",
	}
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		Drft
</summary>
	]]

native "SET_PLAYER_WANTED_LEVEL"
	hash "0x39FF19C64EF7DA5B"
	jhash (0xB7A0914B)
	arguments {
		Player "player",

		int "wantedLevel",

		BOOL "disableNoMission",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Call SET_PLAYER_WANTED_LEVEL_NOW for immediate effect

		wantedLevel is an integer value representing 0 to 5 stars even though the game supports the 6th wanted level but no police will appear since no definitions are present for it in the game files

		disableNoMission-  Disables When Off Mission- appears to always be false

</summary>
	]]

native "SET_PLAYER_WANTED_LEVEL_NO_DROP"
	hash "0x340E61DE7F471565"
	jhash (0xED6F44F5)
	arguments {
		Player "player",

		int "wantedLevel",

		BOOL "p2",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		p2 is always false in R* scripts
</summary>
	]]

native "SET_PLAYER_WANTED_LEVEL_NOW"
	hash "0xE0A7D1E497FFCD6F"
	jhash (0xAF3AFD83)
	arguments {
		Player "player",

		BOOL "p1",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Forces any pending wanted level to be applied to the specified player immediately.

		Call SET_PLAYER_WANTED_LEVEL with the desired wanted level, followed by SET_PLAYER_WANTED_LEVEL_NOW.

		Second parameter is unknown (always false).
</summary>
	]]

native "ARE_PLAYER_FLASHING_STARS_ABOUT_TO_DROP"
	hash "0xAFAF86043E5874E9"
	jhash (0xE13A71C7)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "ARE_PLAYER_STARS_GREYED_OUT"
	hash "0x0A6EB355EE14A2DB"
	jhash (0x5E72AB72)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "SET_DISPATCH_COPS_FOR_PLAYER"
	hash "0xDB172424876553F4"
	jhash (0x48A18913)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "IS_PLAYER_WANTED_LEVEL_GREATER"
	hash "0x238DB2A2C23EE9EF"
	jhash (0x589A2661)
	arguments {
		Player "player",

		int "wantedLevel",
	}
	ns "PLAYER"
	returns	"BOOL"

native "CLEAR_PLAYER_WANTED_LEVEL"
	hash "0xB302540597885499"
	jhash (0x54EA5BCC)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		This executes at the same as speed as PLAYER::SET_PLAYER_WANTED_LEVEL(player, 0, false);

		PLAYER::GET_PLAYER_WANTED_LEVEL(player); executes in less than half the time. Which means that it's worth first checking if the wanted level needs to be cleared before clearing. However, this is mostly about good code practice and can important in other situations. The difference in time in this example is negligible. 
</summary>
	]]

native "IS_PLAYER_DEAD"
	hash "0x424D4687FA1E5652"
	jhash (0x140CA5A8)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "IS_PLAYER_PRESSING_HORN"
	hash "0xFA1E2BF8B10598F9"
	jhash (0xED1D1662)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "SET_PLAYER_CONTROL"
	hash "0x8D32347D6D4C40A2"
	jhash (0xD17AFCD8)
	arguments {
		Player "player",

		BOOL "toggle",

		int "flags",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Flags used in the scripts: 0,4,16,24,32,56,60,64,128,134,256,260,384,512,640,768,896,900,952,1024,1280,2048,2560

		Note to people who needs this with camera mods, etc.: 
		Flags(0, 4, 16, 24, 32, 56, 60, 64, 128, 134, 512, 640, 1024, 2048, 2560)
		- Disables camera rotation as well.
		Flags(256, 260, 384, 768, 896, 900, 952, 1280)

		[ translation: cameraRotation = flags &amp; (1 &lt;&lt; 8) - sfink]
</summary>
	]]

native "GET_PLAYER_WANTED_LEVEL"
	hash "0xE28E54788CE8F12D"
	jhash (0xBDCDD163)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"int"

native "SET_MAX_WANTED_LEVEL"
	hash "0xAA5F02DB48D704B9"
	jhash (0x665A06F5)
	arguments {
		int "maxWantedLevel",
	}
	ns "PLAYER"
	returns	"void"

native "SET_POLICE_RADAR_BLIPS"
	hash "0x43286D561B72B8BF"
	jhash (0x8E114B10)
	arguments {
		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		If toggle is set to false:
		 The police won't be shown on the (mini)map

		If toggle is set to true:
		 The police will be shown on the (mini)map
</summary>
	]]

native "SET_POLICE_IGNORE_PLAYER"
	hash "0x32C62AA929C2DA6A"
	jhash (0xE6DE71B7)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		The player will be ignored by the police if toggle is set to true
</summary>
	]]

native "IS_PLAYER_PLAYING"
	hash "0x5E9564D8246B909A"
	jhash (0xE15D777F)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Checks whether the specified player has a Ped, the Ped is not dead, is not injured and is not arrested.
</summary>
	]]

native "SET_EVERYONE_IGNORE_PLAYER"
	hash "0x8EEDA153AD141BA4"
	jhash (0xC915285E)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_ALL_RANDOM_PEDS_FLEE"
	hash "0x056E0FE8534C2949"
	jhash (0x49EAE968)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_ALL_RANDOM_PEDS_FLEE_THIS_FRAME"
	hash "0x471D2FF42A94B4F2"
	jhash (0xBF974891)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "0xDE45D1A1EF45EE61"
	hash "0xDE45D1A1EF45EE61"
	jhash (0x274631FE)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	alias "SET_HUD_ANIM_STOP_LEVEL"
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>


</summary>
	]]

native "0xC3376F42B1FACCC6"
	hash "0xC3376F42B1FACCC6"
	jhash (0x02DF7AF4)
	arguments {
		Player "player",
	}
	alias "SET_AREAS_GENERATOR_ORIENTATION"
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		- This is called after SET_ALL_RANDOM_PEDS_FLEE_THIS_FRAME
		hash collision
		0xc3376f42b1faccc6, 0xd5d0d2853191399c, // set_areas_generator_orientation
</summary>
	]]

native "SET_IGNORE_LOW_PRIORITY_SHOCKING_EVENTS"
	hash "0x596976B02B6B5700"
	jhash (0xA3D675ED)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_WANTED_LEVEL_MULTIPLIER"
	hash "0x020E5F00CDA207BA"
	jhash (0x1359292F)
	arguments {
		float "multiplier",
	}
	ns "PLAYER"
	returns	"void"

native "SET_WANTED_LEVEL_DIFFICULTY"
	hash "0x9B0BB33B04405E7A"
	jhash (0xB552626C)
	arguments {
		Player "player",

		float "difficulty",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Max value is 1.0
</summary>
	]]

native "RESET_WANTED_LEVEL_DIFFICULTY"
	hash "0xB9D0DD990DC141DD"
	jhash (0xA64C378D)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "START_FIRING_AMNESTY"
	hash "0xBF9BD71691857E48"
	jhash (0x5F8A22A6)
	arguments {
		int "duration",
	}
	ns "PLAYER"
	returns	"void"

native "REPORT_CRIME"
	hash "0xE9B09589827545E7"
	jhash (0xD8EB3A44)
	arguments {
		Player "player",

		int "crimeType",

		int "wantedLvlThresh",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		PLAYER::REPORT_CRIME(PLAYER::PLAYER_ID(), 37, PLAYER::GET_WANTED_LEVEL_THRESHOLD(1));

		From am_armybase.ysc.c4:

		PLAYER::REPORT_CRIME(PLAYER::PLAYER_ID(4), 36, PLAYER::GET_WANTED_LEVEL_THRESHOLD(4));

		-----

		This was taken from the GTAV.exe v1.334. The function is called sub_140592CE8. For a full decompilation of the function, see here: pastebin.com/09qSMsN7 

		-----
		crimeType:
		1: Firearms possession
		2: Person running a red light ("5-0-5")
		3: Reckless driver
		4: Speeding vehicle (a "5-10")
		5: Traffic violation (a "5-0-5")
		6: Motorcycle rider without a helmet
		7: Vehicle theft (a "5-0-3")
		8: Grand Theft Auto
		9: ???
		10: ???
		11: Assault on a civilian (a "2-40")
		12: Assault on an officer
		13: Assault with a deadly weapon (a "2-45")
		14: Officer shot (a "2-45")
		15: Pedestrian struck by a vehicle
		16: Officer struck by a vehicle
		17: Helicopter down (an "AC"?)
		18: Civilian on fire (a "2-40")
		19: Officer set on fire (a "10-99")
		20: Car on fire
		21: Air unit down (an "AC"?)
		22: An explosion (a "9-96")
		23: A stabbing (a "2-45") (also something else I couldn't understand)
		24: Officer stabbed (also something else I couldn't understand)
		25: Attack on a vehicle ("MDV"?)
		26: Damage to property
		27: Suspect threatening officer with a firearm
		28: Shots fired
		29: ???
		30: ???
		31: ???
		32: ???
		33: ???
		34: A "2-45"
		35: ???
		36: A "9-25"
		37: ???
		38: ???
		39: ???
		40: ???
		41: ???
		42: ???
		43: Possible disturbance
		44: Civilian in need of assistance
		45: ???
		46: ???
</summary>
	]]

native "_SWITCH_CRIME_TYPE"
	hash "0x9A987297ED8BD838"
	jhash (0x59B5C2A2)
	arguments {
		Player "player",

		int "p1",
	}
	alias "0x9A987297ED8BD838"
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		This was previously named as "RESERVE_ENTITY_EXPLODES_ON_HIGH_EXPLOSION_COMBO"
		which is obviously incorrect.

		Seems to only appear in scripts used in Singleplayer. p1 ranges from 2 - 46.


		I assume this switches the crime type
</summary>
	]]

native "0xBC9490CA15AEA8FB"
	hash "0xBC9490CA15AEA8FB"
	jhash (0x6B34A160)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Seems to only appear in scripts used in Singleplayer.

		AI_PHONE_ARGS is a hash collision!!!

		Always used like this in scripts
		PLAYER::_BC9490CA15AEA8FB(PLAYER::PLAYER_ID());
</summary>
	]]

native "0x4669B3ED80F24B4E"
	hash "0x4669B3ED80F24B4E"
	jhash (0xB9FB142F)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"Any"
	doc [[!
<summary>
		This has been found in use in the decompiled files.
</summary>
	]]

native "0xAD73CE5A09E42D12"
	hash "0xAD73CE5A09E42D12"
	jhash (0x85725848)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"Any"
	doc [[!
<summary>
		This has been found in use in the decompiled files.
</summary>
	]]

native "0x36F1B38855F2A8DF"
	hash "0x36F1B38855F2A8DF"
	jhash (0x3A7E5FB6)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "0xDC64D2C53493ED12"
	hash "0xDC64D2C53493ED12"
	jhash (0xD15C4B1C)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Has something to do with police.
</summary>
	]]

native "0xB45EFF719D8427A6"
	hash "0xB45EFF719D8427A6"
	jhash (0xBF6993C7)
	arguments {
		float "p0",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		PLAYER::0xBF6993C7(rPtr((&amp;l_122) + 71)); // Found in decompilation

		***

		In "am_hold_up.ysc" used once:

		l_8d._f47 = GAMEPLAY::GET_RANDOM_FLOAT_IN_RANGE(18.0, 28.0);
		PLAYER::_B45EFF719D8427A6((l_8d._f47));
</summary>
	]]

native "0x0032A6DBA562C518"
	hash "0x0032A6DBA562C518"
	jhash (0x47CAB814)
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		2 matches in 1 script 

		Used in multiplayer scripts?
</summary>
	]]

native "CAN_PLAYER_START_MISSION"
	hash "0xDE7465A27D403C06"
	jhash (0x39E3CB3F)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "IS_PLAYER_READY_FOR_CUTSCENE"
	hash "0x908CBECC2CAA3690"
	jhash (0xBB77E9CD)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "IS_PLAYER_TARGETTING_ENTITY"
	hash "0x7912F7FC4F6264B6"
	jhash (0xF3240B77)
	arguments {
		Player "player",

		Entity "entity",
	}
	ns "PLAYER"
	returns	"BOOL"

native "GET_PLAYER_TARGET_ENTITY"
	hash "0x13EDE1A5DBF797C9"
	jhash (0xF6AAA2D7)
	arguments {
		Player "player",

		EntityPtr "entity",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Assigns the handle of locked-on melee target to *entity that you pass it.
		Returns false if no entity found.
</summary>
	]]

native "IS_PLAYER_FREE_AIMING"
	hash "0x2E397FD2ECD37C87"
	jhash (0x1DEC67B7)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Gets a value indicating whether the specified player is currently aiming freely.
</summary>
	]]

native "IS_PLAYER_FREE_AIMING_AT_ENTITY"
	hash "0x3C06B5C839B38F7B"
	jhash (0x7D80EEAA)
	arguments {
		Player "player",

		Entity "entity",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Gets a value indicating whether the specified player is currently aiming freely at the specified entity.
</summary>
	]]

native "GET_ENTITY_PLAYER_IS_FREE_AIMING_AT"
	hash "0x2975C866E6713290"
	jhash (0x8866D9D0)
	arguments {
		Player "player",

		EntityPtr "entity",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Returns TRUE if it found an entity in your crosshair within range of your weapon. Assigns the handle of the target to the *entity that you pass it.
		Returns false if no entity found.
</summary>
	]]

native "SET_PLAYER_LOCKON_RANGE_OVERRIDE"
	hash "0x29961D490E5814FD"
	jhash (0x74D42C03)
	arguments {
		Player "player",

		float "range",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Affects the range of auto aim target.
</summary>
	]]

native "SET_PLAYER_CAN_DO_DRIVE_BY"
	hash "0x6E8834B52EC20C77"
	jhash (0xF4D99685)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Set whether this player should be able to do drive-bys.

		"A drive-by is when a ped is aiming/shooting from vehicle. This includes middle finger taunts. By setting this value to false I confirm the player is unable to do all that. Tested on tick."

</summary>
	]]

native "SET_PLAYER_CAN_BE_HASSLED_BY_GANGS"
	hash "0xD5E460AD7020A246"
	jhash (0x71B305BB)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Sets whether this player can be hassled by gangs.
</summary>
	]]

native "SET_PLAYER_CAN_USE_COVER"
	hash "0xD465A8599DFF6814"
	jhash (0x13CAFAFA)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"Any"
	doc [[!
<summary>
		Sets whether this player can take cover.
</summary>
	]]

native "GET_MAX_WANTED_LEVEL"
	hash "0x462E0DB9B137DC5F"
	jhash (0x457F1E44)
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		Gets the maximum wanted level the player can get.
		Ranges from 0 to 5.
</summary>
	]]

native "IS_PLAYER_TARGETTING_ANYTHING"
	hash "0x78CFE51896B6B8A4"
	jhash (0x456DB50D)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "SET_PLAYER_SPRINT"
	hash "0xA01B8075D8B92DF4"
	jhash (0x7DD7900C)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		77
</summary>
	]]

native "RESET_PLAYER_STAMINA"
	hash "0xA6F312FCCE9C1DFE"
	jhash (0xC0445A9C)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "RESTORE_PLAYER_STAMINA"
	hash "0xA352C1B864CAFD33"
	jhash (0x62A93608)
	arguments {
		Player "player",

		float "p1",
	}
	ns "PLAYER"
	returns	"void"

native "GET_PLAYER_SPRINT_STAMINA_REMAINING"
	hash "0x3F9F16F8E65A7ED7"
	jhash (0x47017C90)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"float"

native "GET_PLAYER_SPRINT_TIME_REMAINING"
	hash "0x1885BC9B108B4C99"
	jhash (0x40E80543)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"float"

native "GET_PLAYER_UNDERWATER_TIME_REMAINING"
	hash "0xA1FCF8E6AF40B731"
	jhash (0x1317125A)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"float"

native "GET_PLAYER_GROUP"
	hash "0x0D127585F77030AF"
	jhash (0xA5EDCDE8)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		Returns the group ID the player is member of.
</summary>
	]]

native "GET_PLAYER_MAX_ARMOUR"
	hash "0x92659B4CE1863CB3"
	jhash (0x02A50657)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"int"

native "IS_PLAYER_CONTROL_ON"
	hash "0x49C32D60007AFA47"
	jhash (0x618857F2)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Can the player control himself, used to disable controls for player for things like a cutscene.

		---

		You can't disable controls with this, use SET_PLAYER_CONTROL(...) for this. 
</summary>
	]]

native "_IS_PLAYER_CAM_CONTROL_DISABLED"
	hash "0x7C814D2FB49F40C0"
	alias "0x7C814D2FB49F40C0"
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true when the player is not able to control the cam i.e. when running a benchmark test, switching the player or viewing a cutscene.

		Note: I am not 100% sure if the native actually checks if the cam control is disabled but it seems promising.
</summary>
	]]

native "IS_PLAYER_SCRIPT_CONTROL_ON"
	hash "0x8A876A65283DD7D7"
	jhash (0x61B00A84)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "IS_PLAYER_CLIMBING"
	hash "0x95E8F73DC65EFB9C"
	jhash (0x4A9E9AE0)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Returns TRUE if the player ('s ped) is climbing at the moment.
</summary>
	]]

native "IS_PLAYER_BEING_ARRESTED"
	hash "0x388A47C51ABDAC8E"
	jhash (0x7F6A60D3)
	arguments {
		Player "player",

		BOOL "atArresting",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Return true while player is being arrested / busted.

		If atArresting is set to 1, this function will return 1 when player is being arrested (while player is putting his hand up, but still have control)

		If atArresting is set to 0, this function will return 1 only when the busted screen is shown.
</summary>
	]]

native "RESET_PLAYER_ARREST_STATE"
	hash "0x2D03E13C460760D6"
	jhash (0x453C7CAB)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "GET_PLAYERS_LAST_VEHICLE"
	hash "0xB6997A7EB3F5C8C0"
	jhash (0xE2757AC1)
	ns "PLAYER"
	returns	"Vehicle"
	doc [[!
<summary>
		Alternative: GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID(), 1);
</summary>
	]]

native "GET_PLAYER_INDEX"
	hash "0xA5EDC40EF369B48D"
	jhash (0x309BBDC1)
	ns "PLAYER"
	returns	"Player"
	doc [[!
<summary>
		Returns the same as PLAYER_ID and NETWORK_PLAYER_ID_TO_INT
</summary>
	]]

native "INT_TO_PLAYERINDEX"
	hash "0x41BD2A6B006AF756"
	jhash (0x98DD98F1)
	arguments {
		int "value",
	}
	ns "PLAYER"
	returns	"Player"
	doc [[!
<summary>
		Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
</summary>
	]]

native "INT_TO_PARTICIPANTINDEX"
	hash "0x9EC6603812C24710"
	jhash (0x98F3B274)
	arguments {
		int "value",
	}
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
		--------------------------------------------------------
		if (NETWORK::NETWORK_IS_PARTICIPANT_ACTIVE(PLAYER::INT_TO_PARTICIPANTINDEX(i)))

</summary>
	]]

native "GET_TIME_SINCE_PLAYER_HIT_VEHICLE"
	hash "0x5D35ECF3A81A0EE0"
	jhash (0x6E9B8B9E)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"int"

native "GET_TIME_SINCE_PLAYER_HIT_PED"
	hash "0xE36A25322DC35F42"
	jhash (0xB6209195)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"int"

native "GET_TIME_SINCE_PLAYER_DROVE_ON_PAVEMENT"
	hash "0xD559D2BE9E37853B"
	jhash (0x8836E732)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"int"

native "GET_TIME_SINCE_PLAYER_DROVE_AGAINST_TRAFFIC"
	hash "0xDB89591E290D9182"
	jhash (0x9F27D00E)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"int"

native "IS_PLAYER_FREE_FOR_AMBIENT_TASK"
	hash "0xDCCFD3F106C36AB4"
	jhash (0x85C7E232)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "PLAYER_ID"
	hash "0x4F8644AF03D0E0D6"
	jhash (0x8AEA886C)
	ns "PLAYER"
	returns	"Player"
	doc [[!
<summary>
		This returns YOUR 'identity' as a Player type.

		Always returns 0 in story mode.
</summary>
	]]

native "PLAYER_PED_ID"
	hash "0xD80958FC74E988A6"
	jhash (0xFA92E226)
	ns "PLAYER"
	returns	"Ped"
	doc [[!
<summary>
		Returns current player ped
</summary>
	]]

native "NETWORK_PLAYER_ID_TO_INT"
	hash "0xEE68096F9F37341E"
	jhash (0x8DD5B838)
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		Does exactly the same thing as PLAYER_ID()
</summary>
	]]

native "HAS_FORCE_CLEANUP_OCCURRED"
	hash "0xC968670BFACE42D9"
	jhash (0x4B37333C)
	arguments {
		int "cleanupFlags",
	}
	ns "PLAYER"
	returns	"BOOL"

native "FORCE_CLEANUP"
	hash "0xBC8983F38F78ED51"
	jhash (0xFDAAEA2B)
	arguments {
		int "cleanupFlags",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		used with 1,2,8,64,128 in the scripts
</summary>
	]]

native "FORCE_CLEANUP_FOR_ALL_THREADS_WITH_THIS_NAME"
	hash "0x4C68DDDDF0097317"
	jhash (0x04256C73)
	arguments {
		charPtr "name",

		int "cleanupFlags",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		PLAYER::FORCE_CLEANUP_FOR_ALL_THREADS_WITH_THIS_NAME("pb_prostitute", 1); // Found in decompilation
</summary>
	]]

native "FORCE_CLEANUP_FOR_THREAD_WITH_THIS_ID"
	hash "0xF745B37630DF176B"
	jhash (0x882D3EB3)
	arguments {
		int "id",

		int "cleanupFlags",
	}
	ns "PLAYER"
	returns	"void"

native "GET_CAUSE_OF_MOST_RECENT_FORCE_CLEANUP"
	hash "0x9A41CF4674A12272"
	jhash (0x39AA9FC8)
	ns "PLAYER"
	returns	"int"

native "SET_PLAYER_MAY_ONLY_ENTER_THIS_VEHICLE"
	hash "0x8026FF78F208978A"
	jhash (0xA454DD29)
	arguments {
		Player "player",

		Vehicle "vehicle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_MAY_NOT_ENTER_ANY_VEHICLE"
	hash "0x1DE37BBF9E9CC14A"
	jhash (0xAF7AFCC4)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "GIVE_ACHIEVEMENT_TO_PLAYER"
	hash "0xBEC7076D64130195"
	jhash (0x822BC992)
	arguments {
		int "achId",
	}
	ns "PLAYER"
	returns	"Any"
	doc [[!
<summary>
		Achievements from 0-57


		more achievements came with update 1.29 (freemode events update), I'd say that they now go to 60, but I'll need to check.
</summary>
	]]

native "_SET_ACHIEVEMENT_PROGRESSION"
	hash "0xC2AFFFDABBDC2C5C"
	arguments {
		int "achId",

		int "progression",
	}
	alias "0xC2AFFFDABBDC2C5C"
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		This seems to be related to Steam achievements.

		p0 and p1 are int (?)

		------

		Can't say anything about the Steam version but it is hardcoded to always return false in the retail version.

		Dr. Underscore (1/6/18):
		This has to do with achievement progression. If this achievement has progression, it will set the progression of it to this value.
		Only tested on un-achieved achievements, Steamworks probably just rejects it if it has already been achieved.
		Steamworks also seems to not like reversing achievement progression.
</summary>
	]]

native "_GET_ACHIEVEMENT_PROGRESSION"
	hash "0x1C186837D0619335"
	arguments {
		int "achId",
	}
	alias "0x1C186837D0619335"
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		p0 = int (?)

		Dr. Underscore (1/6/18):
		This gets the progression of an achievement. Returns 0 if the achievement cannot be progressed.

</summary>
	]]

native "HAS_ACHIEVEMENT_BEEN_PASSED"
	hash "0x867365E111A3B6EB"
	jhash (0x136A5BE9)
	arguments {
		int "achievement",
	}
	ns "PLAYER"
	returns	"BOOL"

native "IS_PLAYER_ONLINE"
	hash "0xF25D331DC2627BBC"
	jhash (0x9FAB6729)
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Returns TRUE if the game is in online mode and FALSE if in offline mode.

		This is an alias for NETWORK_IS_SIGNED_ONLINE.
</summary>
	]]

native "IS_PLAYER_LOGGING_IN_NP"
	hash "0x74556E1420867ECA"
	jhash (0x8F72FAD0)
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		this function is hard-coded to always return 0.
</summary>
	]]

native "DISPLAY_SYSTEM_SIGNIN_UI"
	hash "0x94DD7888C10A979E"
	jhash (0x4264CED2)
	arguments {
		BOOL "unk",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Purpose of the BOOL currently unknown.
		Both, true and false, work
</summary>
	]]

native "IS_SYSTEM_UI_BEING_DISPLAYED"
	hash "0x5D511E3867C87139"
	jhash (0xE495B6DA)
	ns "PLAYER"
	returns	"BOOL"

native "SET_PLAYER_INVINCIBLE"
	hash "0x239528EACDC3E7DE"
	jhash (0xDFB9A2A2)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Simply sets you as invincible (Health will not deplete).

		Use 0x733A643B5B0C53C1 instead if you want Ragdoll enabled, which is equal to:
		*(DWORD *)(playerPedAddress + 0x188) |= (1 &lt;&lt; 9);
</summary>
	]]

native "GET_PLAYER_INVINCIBLE"
	hash "0xB721981B2B939E07"
	jhash (0x680C90EE)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Returns the Player's Invincible status.

		This function will always return false if 0x733A643B5B0C53C1 is used to set the invincibility status. To always get the correct result, use this:

			bool IsPlayerInvincible(Player player)
			{
				auto addr = getScriptHandleBaseAddress(GET_PLAYER_PED(player));	

				if (addr)
				{
					DWORD flag = *(DWORD *)(addr + 0x188);
					return ((flag &amp; (1 &lt;&lt; 8)) != 0) || ((flag &amp; (1 &lt;&lt; 9)) != 0);
				}

				return false;
			}

		============================================================
		This has bothered me for too long, whoever may come across this, where did anyone ever come up with this made up hash? 0x733A643B5B0C53C1 I've looked all over old hash list, and this nativedb I can not find that PC hash anywhere. What native name is it now or was it?
</summary>
	]]

native "0xCAC57395B151135F"
	hash "0xCAC57395B151135F"
	jhash (0x00563E0D)
	arguments {
		Player "player",

		BOOL "p1",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Found in "director_mode", "fm_bj_race_controler", "fm_deathmatch_controler", "fm_impromptu_dm_controler", "fm_race_controler", "gb_deathmatch".
</summary>
	]]

native "REMOVE_PLAYER_HELMET"
	hash "0xF3AC26D3CC576528"
	jhash (0x6255F3B4)
	arguments {
		Player "player",

		BOOL "p2",
	}
	ns "PLAYER"
	returns	"Any"

native "GIVE_PLAYER_RAGDOLL_CONTROL"
	hash "0x3C49C870E66F0A28"
	jhash (0xC7B4D7AC)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_LOCKON"
	hash "0x5C8B2F450EE4328E"
	jhash (0x0B270E0F)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Example from fm_mission_controler.ysc.c4:

		PLAYER::SET_PLAYER_LOCKON(PLAYER::PLAYER_ID(), 1);

		All other decompiled scripts using this seem to be using the player id as the first parameter, so I feel the need to confirm it as so.

		No need to confirm it says PLAYER_ID() so it uses PLAYER_ID() lol.
</summary>
	]]

native "SET_PLAYER_TARGETING_MODE"
	hash "0xB1906895227793F3"
	jhash (0x61CAE253)
	arguments {
		int "targetMode",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Sets your targeting mode.
		0 = Traditional GTA
		1 = Assisted Aiming
		2 = Free Aim

		Even tho gtaforums nor Alexander B supports this, if you're online in freemode already it's nice to have this since retail or otherwise you have to go to SP to change it.
</summary>
	]]

native "0x5702B917B99DB1CD"
	hash "0x5702B917B99DB1CD"
	arguments {
		int "p0",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Jenkins hash: 0x772DA539

		p0 looks like Player or int (found in "am_pi_menu")

		Dr. Underscore (1/6/18):
		It isn't Player, it is an int.
		Only two references anywhere, both in am_pi_menu.
		One uses globals, the other one uses a helper function that is passing in the outValue of "STATS::STAT_GET_INT"; I have no clue what is being passed in for the stat hash.
</summary>
	]]

native "0xB9CF1F793A9F1BF1"
	hash "0xB9CF1F793A9F1BF1"
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Seem to return bool

		Dr. Underscore (1/6/18):
		It does return bool.
</summary>
	]]

native "CLEAR_PLAYER_HAS_DAMAGED_AT_LEAST_ONE_PED"
	hash "0xF0B67A4DE6AB5F98"
	jhash (0x1D31CBBD)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "HAS_PLAYER_DAMAGED_AT_LEAST_ONE_PED"
	hash "0x20CE80B0C2BF4ACC"
	jhash (0x14F52453)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "CLEAR_PLAYER_HAS_DAMAGED_AT_LEAST_ONE_NON_ANIMAL_PED"
	hash "0x4AACB96203D11A31"
	jhash (0x7E3BFBC5)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "HAS_PLAYER_DAMAGED_AT_LEAST_ONE_NON_ANIMAL_PED"
	hash "0xE4B90F367BD81752"
	jhash (0xA3707DFC)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "SET_AIR_DRAG_MULTIPLIER_FOR_PLAYERS_VEHICLE"
	hash "0xCA7DC8329F0A1E9E"
	jhash (0xF20F72E5)
	arguments {
		Player "player",

		float "multiplier",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		This can be between 1.0f - 14.9f 

		You can change the max in IDA from 15.0. I say 15.0 as the function blrs if what you input is greater than or equal to 15.0 hence why it's 14.9 max default.

		On PC the multiplier can be between 0.0f and 50.0f (inclusive).


</summary>
	]]

native "SET_SWIM_MULTIPLIER_FOR_PLAYER"
	hash "0xA91C6F0FF7D16A13"
	jhash (0xB986FF47)
	arguments {
		Player "player",

		float "multiplier",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Swim speed multiplier.
		Multiplier goes up to 1.49

		Just call it one time, it is not required to be called once every tick. - Note copied from below native.

		Note: At least the IDA method if you change the max float multiplier from 1.5 it will change it for both this and RUN_SPRINT below. I say 1.5 as the function blrs if what you input is greater than or equal to 1.5 hence why it's 1.49 max default.
</summary>
	]]

native "SET_RUN_SPRINT_MULTIPLIER_FOR_PLAYER"
	hash "0x6DB47AA77FD94E09"
	jhash (0x825423C2)
	arguments {
		Player "player",

		float "multiplier",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Multiplier goes up to 1.49 any value above will be completely overruled by the game and the multiplier will not take effect, this can be edited in memory however.

		Just call it one time, it is not required to be called once every tick.

		Note: At least the IDA method if you change the max float multiplier from 1.5 it will change it for both this and SWIM above. I say 1.5 as the function blrs if what you input is greater than or equal to 1.5 hence why it's 1.49 max default.

		It is not possible to "decrease" speed. Anything below 1 will be ignored.
</summary>
	]]

native "GET_TIME_SINCE_LAST_ARREST"
	hash "0x5063F92F07C2A316"
	jhash (0x62824EF4)
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		Returns the time since the character was arrested in (ms) milliseconds.

		example

		var time = Function.call&lt;int&gt;(Hash.GET_TIME_SINCE_LAST_ARREST();

		UI.DrawSubtitle(time.ToString());

		if player has not been arrested, the int returned will be -1.
</summary>
	]]

native "GET_TIME_SINCE_LAST_DEATH"
	hash "0xC7034807558DDFCA"
	jhash (0x24BC5AC0)
	ns "PLAYER"
	returns	"int"
	doc [[!
<summary>
		Returns the time since the character died in (ms) milliseconds.

		example

		var time = Function.call&lt;int&gt;(Hash.GET_TIME_SINCE_LAST_DEATH();

		UI.DrawSubtitle(time.ToString());

		if player has not died, the int returned will be -1.
</summary>
	]]

native "ASSISTED_MOVEMENT_CLOSE_ROUTE"
	hash "0xAEBF081FFC0A0E5E"
	jhash (0xF23277F3)
	ns "PLAYER"
	returns	"void"

native "ASSISTED_MOVEMENT_FLUSH_ROUTE"
	hash "0x8621390F0CDCFE1F"
	jhash (0xD04568B9)
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_FORCED_AIM"
	hash "0x0FEE4F80AC44A726"
	jhash (0x94E42E2E)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_FORCED_ZOOM"
	hash "0x75E7D505F2B15902"
	jhash (0xB0C576CB)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_FORCE_SKIP_AIM_INTRO"
	hash "0x7651BC64AE59E128"
	jhash (0x374F42F0)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "DISABLE_PLAYER_FIRING"
	hash "0x5E6CC07646BBEAB8"
	jhash (0x30CB28CB)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Inhibits the player from using any method of combat including melee and firearms.

		NOTE: Only disables the firing for one frame
</summary>
	]]

native "0xB885852C39CC265D"
	hash "0xB885852C39CC265D"
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Old Gen: 0x47D6004E

		Disables something. Used only once in R* scripts (freemode.ysc).
</summary>
	]]

native "SET_DISABLE_AMBIENT_MELEE_MOVE"
	hash "0x2E8AABFA40A84F8C"
	jhash (0xCCD937E7)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_MAX_ARMOUR"
	hash "0x77DFCCF5948B8C71"
	jhash (0xC6C3C53B)
	arguments {
		Player "player",

		int "value",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Default is 100. Use player id and not ped id. For instance: PLAYER::SET_PLAYER_MAX_ARMOUR(PLAYER::PLAYER_ID(), 100); // main_persistent.ct4
</summary>
	]]

native "SPECIAL_ABILITY_DEACTIVATE"
	hash "0xD6A953C6D1492057"
	jhash (0x80C2AB09)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "SPECIAL_ABILITY_DEACTIVATE_FAST"
	hash "0x9CB5CE07A3968D5A"
	jhash (0x0751908A)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "SPECIAL_ABILITY_RESET"
	hash "0x375F0E738F861A94"
	jhash (0xA7D8BCD3)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "0xC9A763D8FE87436A"
	hash "0xC9A763D8FE87436A"
	jhash (0x4136829A)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "SPECIAL_ABILITY_CHARGE_SMALL"
	hash "0x2E7B9B683481687D"
	jhash (0x6F463F56)
	arguments {
		Player "player",

		BOOL "p1",

		BOOL "p2",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Every occurrence of p1 &amp; p2 were both true.
</summary>
	]]

native "SPECIAL_ABILITY_CHARGE_MEDIUM"
	hash "0xF113E3AA9BC54613"
	jhash (0xAB55D8F3)
	arguments {
		Player "player",

		BOOL "p1",

		BOOL "p2",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Only 1 match. Both p1 &amp; p2 were true.
</summary>
	]]

native "SPECIAL_ABILITY_CHARGE_LARGE"
	hash "0xF733F45FA4497D93"
	jhash (0xF440C04D)
	arguments {
		Player "player",

		BOOL "p1",

		BOOL "p2",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		2 matches. p1 was always true.
</summary>
	]]

native "SPECIAL_ABILITY_CHARGE_CONTINUOUS"
	hash "0xED481732DFF7E997"
	jhash (0x5FEE98A2)
	arguments {
		Player "player",

		Ped "p2",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		p1 appears to always be 1 (only comes up twice)
</summary>
	]]

native "SPECIAL_ABILITY_CHARGE_ABSOLUTE"
	hash "0xB7B0870EB531D08D"
	jhash (0x72429998)
	arguments {
		Player "player",

		int "p1",

		BOOL "p2",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		p1 appears as 5, 10, 15, 25, or 30. p2 is always true.
</summary>
	]]

native "SPECIAL_ABILITY_CHARGE_NORMALIZED"
	hash "0xA0696A65F009EE18"
	jhash (0x8C7E68C1)
	arguments {
		Player "player",

		float "normalizedValue",

		BOOL "p2",
	}
	alias "RESET_SPECIAL_ABILITY_CONTROLS_CINEMATIC"
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>

		normalizedValue is from 0.0 - 1.0
		p2 is always 1
</summary>
	]]

native "SPECIAL_ABILITY_FILL_METER"
	hash "0x3DACA8DDC6FD4980"
	jhash (0xB71589DA)
	arguments {
		Player "player",

		BOOL "p1",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Also known as _RECHARGE_SPECIAL_ABILITY
</summary>
	]]

native "SPECIAL_ABILITY_DEPLETE_METER"
	hash "0x1D506DBBBC51E64B"
	jhash (0x9F80F6DF)
	arguments {
		Player "player",

		BOOL "p1",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		p1 was always true.
</summary>
	]]

native "SPECIAL_ABILITY_LOCK"
	hash "0x6A09D0D590A47D13"
	jhash (0x1B7BB388)
	arguments {
		Hash "playerModel",
	}
	ns "PLAYER"
	returns	"void"

native "SPECIAL_ABILITY_UNLOCK"
	hash "0xF145F3BE2EFA9A3B"
	jhash (0x1FDB2919)
	arguments {
		Hash "playerModel",
	}
	ns "PLAYER"
	returns	"void"

native "IS_SPECIAL_ABILITY_UNLOCKED"
	hash "0xC6017F6A6CDFA694"
	jhash (0xC9C75E82)
	arguments {
		Hash "playerModel",
	}
	ns "PLAYER"
	returns	"BOOL"

native "IS_SPECIAL_ABILITY_ACTIVE"
	hash "0x3E5F7FC85D854E15"
	jhash (0x1B17E334)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "IS_SPECIAL_ABILITY_METER_FULL"
	hash "0x05A1FE504B7F2587"
	jhash (0x2E19D7F6)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "ENABLE_SPECIAL_ABILITY"
	hash "0x181EC197DAEFE121"
	jhash (0xC86C1B4E)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "IS_SPECIAL_ABILITY_ENABLED"
	hash "0xB1D200FE26AEF3CB"
	jhash (0xC01238CC)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "SET_SPECIAL_ABILITY_MULTIPLIER"
	hash "0xA49C426ED0CA4AB7"
	jhash (0xFF1BC556)
	arguments {
		float "multiplier",
	}
	ns "PLAYER"
	returns	"void"

native "0xFFEE8FA29AB9A18E"
	hash "0xFFEE8FA29AB9A18E"
	jhash (0x5D0FE25B)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "0x5FC472C501CCADB3"
	hash "0x5FC472C501CCADB3"
	jhash (0x46E7E31D)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Appears once in "re_dealgonewrong"
</summary>
	]]

native "0xF10B44FD479D69F3"
	hash "0xF10B44FD479D69F3"
	jhash (0x1E359CC8)
	arguments {
		Player "player",

		int "p1",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Only 1 occurrence. p1 was 2.
</summary>
	]]

native "0xDD2620B7B9D16FF1"
	hash "0xDD2620B7B9D16FF1"
	jhash (0x8CB53C9F)
	arguments {
		Player "player",

		float "p1",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		2 occurrences in agency_heist3a. p1 was 0.7f then 0.4f.
</summary>
	]]

native "START_PLAYER_TELEPORT"
	hash "0xAD15F075A4DA0FDE"
	jhash (0xC552E06C)
	arguments {
		Player "player",

		float "x",

		float "y",

		float "z",

		float "heading",

		BOOL "p5",

		BOOL "p6",

		BOOL "p7",
	}
	ns "PLAYER"
	returns	"void"

native "_HAS_PLAYER_TELEPORT_FINISHED"
	hash "0xE23D5873C2394C61"
	arguments {
		Player "player",
	}
	alias "0xE23D5873C2394C61"
	ns "PLAYER"
	returns	"BOOL"

native "STOP_PLAYER_TELEPORT"
	hash "0xC449EDED9D73009C"
	jhash (0x86AB8DBB)
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Disables the player's teleportation
</summary>
	]]

native "IS_PLAYER_TELEPORT_ACTIVE"
	hash "0x02B15662D7F8886F"
	jhash (0x3A11D118)
	ns "PLAYER"
	returns	"BOOL"

native "GET_PLAYER_CURRENT_STEALTH_NOISE"
	hash "0x2F395D61F3A1F877"
	jhash (0xC3B02362)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"float"

native "SET_PLAYER_HEALTH_RECHARGE_MULTIPLIER"
	hash "0x5DB660B38DD98A31"
	jhash (0x45514731)
	arguments {
		Player "player",

		float "regenRate",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_WEAPON_DAMAGE_MODIFIER"
	hash "0xCE07B9F7817AADA3"
	jhash (0xB02C2F39)
	arguments {
		Player "player",

		float "damageAmount",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		This modifies the damage value of your weapon. Whether it is a multiplier or base damage is unknown. 

		Based on tests, it is unlikely to be a multiplier.
</summary>
	]]

native "SET_PLAYER_WEAPON_DEFENSE_MODIFIER"
	hash "0x2D83BC011CA14A3C"
	jhash (0xAE446344)
	arguments {
		Player "player",

		ScrHandle "modifier",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_MELEE_WEAPON_DAMAGE_MODIFIER"
	hash "0x4A3DC7ECCC321032"
	jhash (0x362E69AD)
	arguments {
		Player "player",

		float "modifier",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_MELEE_WEAPON_DEFENSE_MODIFIER"
	hash "0xAE540335B4ABC4E2"
	jhash (0x9F3D577F)
	arguments {
		Player "player",

		float "modifier",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_VEHICLE_DAMAGE_MODIFIER"
	hash "0xA50E117CDDF82F0C"
	jhash (0x823ECA63)
	arguments {
		Player "player",

		float "damageAmount",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_VEHICLE_DEFENSE_MODIFIER"
	hash "0x4C60E6EFDAFF2462"
	jhash (0xA16626C7)
	arguments {
		Player "player",

		float "modifier",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_PARACHUTE_TINT_INDEX"
	hash "0xA3D0E54541D9A5E5"
	jhash (0x8EA12EDB)
	arguments {
		Player "player",

		int "tintIndex",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Tints:
			None = -1,
			Rainbow = 0,
			Red = 1,
			SeasideStripes = 2,
			WidowMaker = 3,
			Patriot = 4,
			Blue = 5,
			Black = 6,
			Hornet = 7,
			AirFocce = 8,
			Desert = 9,
			Shadow = 10,
			HighAltitude = 11,
			Airbone = 12,
			Sunrise = 13,

</summary>
	]]

native "GET_PLAYER_PARACHUTE_TINT_INDEX"
	hash "0x75D3F7A1B0D9B145"
	jhash (0x432B0509)
	arguments {
		Player "player",

		intPtr "tintIndex",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Tints:
			None = -1,
			Rainbow = 0,
			Red = 1,
			SeasideStripes = 2,
			WidowMaker = 3,
			Patriot = 4,
			Blue = 5,
			Black = 6,
			Hornet = 7,
			AirFocce = 8,
			Desert = 9,
			Shadow = 10,
			HighAltitude = 11,
			Airbone = 12,
			Sunrise = 13,
</summary>
	]]

native "SET_PLAYER_RESERVE_PARACHUTE_TINT_INDEX"
	hash "0xAF04C87F5DC1DF38"
	jhash (0x70689638)
	arguments {
		Player "player",

		int "index",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Tints:
			None = -1,
			Rainbow = 0,
			Red = 1,
			SeasideStripes = 2,
			WidowMaker = 3,
			Patriot = 4,
			Blue = 5,
			Black = 6,
			Hornet = 7,
			AirFocce = 8,
			Desert = 9,
			Shadow = 10,
			HighAltitude = 11,
			Airbone = 12,
			Sunrise = 13,
</summary>
	]]

native "GET_PLAYER_RESERVE_PARACHUTE_TINT_INDEX"
	hash "0xD5A016BC3C09CF40"
	jhash (0x77B8EF01)
	arguments {
		Player "player",

		intPtr "index",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Tints:
			None = -1,
			Rainbow = 0,
			Red = 1,
			SeasideStripes = 2,
			WidowMaker = 3,
			Patriot = 4,
			Blue = 5,
			Black = 6,
			Hornet = 7,
			AirFocce = 8,
			Desert = 9,
			Shadow = 10,
			HighAltitude = 11,
			Airbone = 12,
			Sunrise = 13,
</summary>
	]]

native "SET_PLAYER_PARACHUTE_PACK_TINT_INDEX"
	hash "0x93B0FB27C9A04060"
	jhash (0xD79D5D1B)
	arguments {
		Player "player",

		int "tintIndex",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		tints 0

		1 
		2 
		3 
		4 
</summary>
	]]

native "GET_PLAYER_PARACHUTE_PACK_TINT_INDEX"
	hash "0x6E9C742F340CE5A2"
	jhash (0x4E418E13)
	arguments {
		Player "player",

		intPtr "tintIndex",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_HAS_RESERVE_PARACHUTE"
	hash "0x7DDAB28D31FAC363"
	jhash (0xA3E4798E)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "GET_PLAYER_HAS_RESERVE_PARACHUTE"
	hash "0x5DDFE2FF727F3CA3"
	jhash (0x30DA1DA1)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "SET_PLAYER_CAN_LEAVE_PARACHUTE_SMOKE_TRAIL"
	hash "0xF401B182DBA8AF53"
	jhash (0x832DEB7A)
	arguments {
		Player "player",

		BOOL "enabled",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_PARACHUTE_SMOKE_TRAIL_COLOR"
	hash "0x8217FD371A4625CF"
	jhash (0x14FE9264)
	arguments {
		Player "player",

		int "r",

		int "g",

		int "b",
	}
	ns "PLAYER"
	returns	"void"

native "GET_PLAYER_PARACHUTE_SMOKE_TRAIL_COLOR"
	hash "0xEF56DBABD3CD4887"
	jhash (0xF66E5CDD)
	arguments {
		Player "player",

		intPtr "r",

		intPtr "g",

		intPtr "b",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_RESET_FLAG_PREFER_REAR_SEATS"
	hash "0x11D5F725F0E780E0"
	jhash (0x725C6174)
	arguments {
		Player "player",

		int "flags",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		example:

		flags: 0-6

		PLAYER::SET_PLAYER_RESET_FLAG_PREFER_REAR_SEATS(PLAYER::PLAYER_ID(), 6);

		wouldnt the flag be the seatIndex?
</summary>
	]]

native "SET_PLAYER_NOISE_MULTIPLIER"
	hash "0xDB89EF50FF25FCE9"
	jhash (0x15786DD1)
	arguments {
		Player "player",

		float "multiplier",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_SNEAKING_NOISE_MULTIPLIER"
	hash "0xB2C1A29588A9F47C"
	jhash (0x8D2D89C4)
	arguments {
		Player "player",

		float "multiplier",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Values around 1.0f to 2.0f used in game scripts.
</summary>
	]]

native "CAN_PED_HEAR_PLAYER"
	hash "0xF297383AA91DCA29"
	jhash (0x1C70B2EB)
	arguments {
		Player "player",

		Ped "ped",
	}
	ns "PLAYER"
	returns	"BOOL"

native "SIMULATE_PLAYER_INPUT_GAIT"
	hash "0x477D5D63E63ECA5D"
	jhash (0x0D77CC34)
	arguments {
		Player "control",

		float "amount",

		int "gaitType",

		float "speed",

		BOOL "p4",

		BOOL "p5",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		This is to make the player walk without accepting input from INPUT.

		gaitType is in increments of 100s. 2000, 500, 300, 200, etc.

		p4 is always 1 and p5 is always 0.

		C# Example :

		Function.Call(Hash.SIMULATE_PLAYER_INPUT_GAIT, Game.Player, 1.0f, 100, 1.0f, 1, 0); //Player will go forward for 100ms
</summary>
	]]

native "RESET_PLAYER_INPUT_GAIT"
	hash "0x19531C47A2ABD691"
	jhash (0x4A701EE1)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "SET_AUTO_GIVE_PARACHUTE_WHEN_ENTER_PLANE"
	hash "0x9F343285A00B4BB6"
	jhash (0xA97C2059)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "0xD2B315B6689D537D"
	hash "0xD2B315B6689D537D"
	jhash (0xA25D767E)
	arguments {
		Player "player",

		BOOL "p1",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		1.0.335.2, 1.0.350.1/2, 1.0.372.2, 1.0.393.2, 1.0.393.4, 1.0.463.1;
</summary>
	]]

native "SET_PLAYER_STEALTH_PERCEPTION_MODIFIER"
	hash "0x4E9021C1FCDD507A"
	jhash (0x3D26105F)
	arguments {
		Player "player",

		float "value",
	}
	ns "PLAYER"
	returns	"void"

native "0x690A61A6D13583F6"
	hash "0x690A61A6D13583F6"
	jhash (0x1D371529)
	arguments {
		Ped "p0",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		p0 seems to be Ped

		Dr. Underscore (1/6/18):
		Has to do something with vehicles and teams. (same teams don't jack each other out of vehicles?)
</summary>
	]]

native "0x9EDD76E87D5D51BA"
	hash "0x9EDD76E87D5D51BA"
	jhash (0xE30A64DC)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_SIMULATE_AIMING"
	hash "0xC54C95DA968EC5B5"
	jhash (0xF1E0CAFC)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_CLOTH_PIN_FRAMES"
	hash "0x749FADDF97DFE930"
	jhash (0xF7A0F00F)
	arguments {
		Player "player",

		BOOL "toggle",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Every occurrence of p1 I found was true.1.0.335.2, 1.0.350.1/2, 1.0.372.2, 1.0.393.2, 1.0.393.4, 1.0.463.1;
</summary>
	]]

native "SET_PLAYER_CLOTH_PACKAGE_INDEX"
	hash "0x9F7BBA2EA6372500"
	jhash (0xB8209F16)
	arguments {
		int "index",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Every occurrence was either 0 or 2.
</summary>
	]]

native "SET_PLAYER_CLOTH_LOCK_COUNTER"
	hash "0x14D913B777DFF5DA"
	jhash (0x8D9FD4D1)
	arguments {
		int "value",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		6 matches across 4 scripts. 5 occurrences were 240. The other was 255.
</summary>
	]]

native "PLAYER_ATTACH_VIRTUAL_BOUND"
	hash "0xED51733DC73AED51"
	jhash (0xECD12E60)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Only 1 match. ob_sofa_michael.

		PLAYER::PLAYER_ATTACH_VIRTUAL_BOUND(-804.5928f, 173.1801f, 71.68436f, 0f, 0f, 0.590625f, 1f, 0.7f);1.0.335.2, 1.0.350.1/2, 1.0.372.2, 1.0.393.2, 1.0.393.4, 1.0.463.1;
</summary>
	]]

native "PLAYER_DETACH_VIRTUAL_BOUND"
	hash "0x1DD5897E2FA6E7C9"
	jhash (0x96100EA4)
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		1.0.335.2, 1.0.350.1/2, 1.0.372.2, 1.0.393.2, 1.0.393.4, 1.0.463.1;
</summary>
	]]

native "HAS_PLAYER_BEEN_SPOTTED_IN_STOLEN_VEHICLE"
	hash "0xD705740BB0A1CF4C"
	jhash (0x4A01B76A)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"

native "0x38D28DA81E4E9BF9"
	hash "0x38D28DA81E4E9BF9"
	jhash (0x013B4F72)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if an unk value is greater than 0.0f
</summary>
	]]

native "0xBC0753C9CA14B506"
	hash "0xBC0753C9CA14B506"
	jhash (0x9DF75B2A)
	arguments {
		Player "player",

		int "p1",

		BOOL "p2",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		var num3 = PLAYER::GET_PLAYER_PED(l_2171); // proof l_2171 is a player

		var num17 = PLAYER::0x9DF75B2A(l_2171, 100, 0); // l_2171

		.ysc:
		    if (PLAYER::GET_PLAYER_WANTED_LEVEL(l_6EF) &lt; v_4) { // l_6EF is a player
		        PLAYER::SET_PLAYER_WANTED_LEVEL(l_6EF, v_4, 0); // l_6EF
		        PLAYER::SET_PLAYER_WANTED_LEVEL_NOW(l_6EF, 0); // l_6EF
		    } else { 
		        PLAYER::_4669B3ED80F24B4E(l_6EF); // l_6EF
		        UI::_BA8D65C1C65702E5(1);
		        a_0 = 1;
		    }

		        if (l_4B24[l_6F2/*156*/]._f8C != PLAYER::_BC0753C9CA14B506(l_6EF, 100, 0)) { // l_6EF
		            l_4B24[l_6F2/*156*/]._f8C = PLAYER::_BC0753C9CA14B506(l_6EF, 100, 0); // l_6EF
		        }

		Both was taken from fm_mission_controller

		GET_PLAYER_*
</summary>
	]]

native "_EXPAND_WORLD_LIMITS"
	hash "0x5006D96C995A5827"
	arguments {
		float "x",

		float "y",

		float "z",
	}
	alias "0x5006D96C995A5827"
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Will change world AABB so that given point will be inside of the world limits.

		Example:
		You want world limits to be -9000&lt;X&lt;10000 -11000&lt;Y&lt;12000 and leave Z limits as is.
		You should call this function two times:
		_EXPAND_WORLD_LIMITS(-9000.0,-11000.0,30.0)
		_EXPAND_WORLD_LIMITS(10000.0,12000.0,30.0)

		Appears only 3 times in the scripts, more specifically in michael1.ysc

		Console hash: 0x64ddb07d

		-
		This can be used to prevent dying if you are "out of the world"
</summary>
	]]

native "IS_PLAYER_RIDING_TRAIN"
	hash "0x4EC12697209F2196"
	jhash (0x9765E71D)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the player is riding a train.
</summary>
	]]

native "HAS_PLAYER_LEFT_THE_WORLD"
	hash "0xD55DDFB47991A294"
	jhash (0xFEA40B6C)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		Gets the player's info and calls a function that checks the player's ped position.

		Here's the decompiled function that checks the position: pastebin.com/ZdHG2E7n
</summary>
	]]

native "0xFF300C7649724A0B"
	hash "0xFF300C7649724A0B"
	jhash (0xAD8383FA)
	arguments {
		Player "player",

		BOOL "p1",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		gets byte at offset 0x862 in the specified players data (ped data + 0xbd0) and stores the bool p1 in it.
		lwz       r3, 0xBD0(r3) ;r3 is player data
		lbz       r4, 0x862(r3) ;r4 is now the byte
		insrwi    r4, r31, 1,28 ;stores p1 as a bit in place 28 idk
		stb       r4, 0x862(r3) ; puts the newly modified one back in

		SET_PLAYER_*
</summary>
	]]

native "SET_PLAYER_PARACHUTE_VARIATION_OVERRIDE"
	hash "0xD9284A8C0D48352C"
	jhash (0x9254249D)
	arguments {
		Player "player",

		int "p1",

		Any "p2",

		Any "p3",

		BOOL "p4",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		p1 was always 5.
		p4 was always false.
</summary>
	]]

native "CLEAR_PLAYER_PARACHUTE_VARIATION_OVERRIDE"
	hash "0x0F4CC924CF8C7B21"
	jhash (0xFD60F5AB)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_PARACHUTE_MODEL_OVERRIDE"
	hash "0x977DB4641F6FC3DB"
	jhash (0x5D382498)
	arguments {
		Player "player",

		Hash "model",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		example:

		PLAYER::SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER::PLAYER_ID(), 0x73268708);
</summary>
	]]

native "CLEAR_PLAYER_PARACHUTE_MODEL_OVERRIDE"
	hash "0x8753997EB5F6EE3F"
	jhash (0x6FF034BB)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "SET_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE"
	hash "0xDC80A4C2F18A2B64"
	jhash (0xA877FF5E)
	arguments {
		Player "player",

		Hash "model",
	}
	ns "PLAYER"
	returns	"void"

native "CLEAR_PLAYER_PARACHUTE_PACK_MODEL_OVERRIDE"
	hash "0x10C54E4389C12B42"
	jhash (0xBB62AAC5)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "DISABLE_PLAYER_VEHICLE_REWARDS"
	hash "0xC142BE3BB9CE125F"
	jhash (0x8C6E611D)
	arguments {
		Player "player",
	}
	ns "PLAYER"
	returns	"void"

native "0x2F7CEB6520288061"
	hash "0x2F7CEB6520288061"
	jhash (0x2849D4B2)
	arguments {
		BOOL "p0",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		Used with radios:

		void sub_cf383(auto _a0) {
		    if ((a_0)==1) {
		        if (GAMEPLAY::IS_BIT_SET((g_240005._f1), 3)) {
		            PLAYER::_2F7CEB6520288061(0);
		            AUDIO::SET_AUDIO_FLAG("AllowRadioDuringSwitch", 0);
		            AUDIO::SET_MOBILE_PHONE_RADIO_STATE(0);
		            AUDIO::SET_AUDIO_FLAG("MobileRadioInGame", 0);
		        }
		        sub_cf3f6(1);
		    } else { 
		        if (GAMEPLAY::IS_BIT_SET((g_240005._f1), 3)) {
		            PLAYER::_2F7CEB6520288061(1);
		            AUDIO::SET_AUDIO_FLAG("AllowRadioDuringSwitch", 1);
		            AUDIO::SET_MOBILE_PHONE_RADIO_STATE(1);
		            AUDIO::SET_AUDIO_FLAG("MobileRadioInGame", 1);
		        }
		        sub_cf3f6(0);
		    }
		}

		SET_PLAYER_S*
</summary>
	]]

native "0x5DC40A8869C22141"
	hash "0x5DC40A8869C22141"
	arguments {
		BOOL "p0",

		ScrHandle "p1",
	}
	ns "PLAYER"
	returns	"void"

native "0x65FAEE425DE637B0"
	hash "0x65FAEE425DE637B0"
	arguments {
		Player "p0",
	}
	ns "PLAYER"
	returns	"BOOL"
	doc [[!
<summary>
		IS_PLAYER_*
</summary>
	]]

native "0x5501B7A5CDB79D37"
	hash "0x5501B7A5CDB79D37"
	arguments {
		Player "p0",
	}
	ns "PLAYER"
	returns	"void"
	doc [[!
<summary>
		DISABLE_*

		p0 seems to be Player or int

		Dr. Underscore (1/6/18):
		p0 is Player.
		Called after/near _DISABLE_FIRST_PERSON_CAMERA_THIS_FRAME quite often, but not always.
		Also called near DISABLE_CONTROL_ACTION.
</summary>
	]]

native "0x56105E599CAB0EFA"
	hash "0x56105E599CAB0EFA"
	arguments {
		intPtr "p0",
	}
	ns "PLAYER"
	returns	"Player"
	doc [[!
<summary>
		GET_PLAYER_*

		Seems to do something with network (?)
		PLAYER::_56105E599CAB0EFA(NETWORK::NETWORK_GET_PLAYER_INDEX_FROM_PED(ped))
</summary>
	]]

native "DOES_ENTITY_EXIST"
	hash "0x7239B21A38F536BA"
	jhash (0x3AC90869)
	arguments {
		Object "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "DOES_ENTITY_BELONG_TO_THIS_SCRIPT"
	hash "0xDDE6DF5AE89981D2"
	jhash (0xACFEB3F9)
	arguments {
		Entity "entity",

		BOOL "p2",
	}
	ns "ENTITY"
	returns	"BOOL"

native "DOES_ENTITY_HAVE_DRAWABLE"
	hash "0x060D6E96F8B8E48D"
	jhash (0xA5B33300)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "DOES_ENTITY_HAVE_PHYSICS"
	hash "0xDA95EA3317CC5064"
	jhash (0x9BCD2979)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "HAS_ENTITY_ANIM_FINISHED"
	hash "0x20B711662962B472"
	jhash (0x1D9CAB92)
	arguments {
		Entity "entity",

		charPtr "animDict",

		charPtr "animName",

		int "p3",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		P3 is always 3 as far as i cant tell

		Animations List : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "HAS_ENTITY_BEEN_DAMAGED_BY_ANY_OBJECT"
	hash "0x95EB9964FF5C5C65"
	jhash (0x6B74582E)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "HAS_ENTITY_BEEN_DAMAGED_BY_ANY_PED"
	hash "0x605F5A140F202491"
	jhash (0x53FD4A25)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "HAS_ENTITY_BEEN_DAMAGED_BY_ANY_VEHICLE"
	hash "0xDFD5033FDBA0A9C8"
	jhash (0x878C2CE0)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "HAS_ENTITY_BEEN_DAMAGED_BY_ENTITY"
	hash "0xC86D67D52A707CF8"
	jhash (0x07FC77E0)
	arguments {
		Entity "entity1",

		Entity "entity2",

		BOOL "p2",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		Entity 1 = Victim
		Entity 2 = Attacker

		p2 seems to always be 1
</summary>
	]]

native "HAS_ENTITY_CLEAR_LOS_TO_ENTITY"
	hash "0xFCDFF7B72D23A1AC"
	jhash (0x53576FA7)
	arguments {
		Entity "entity1",

		Entity "entity2",

		int "traceType",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		traceType is always 17 in the scripts.

		There is other codes used for traceType:
		19 - in jewelry_prep1a
		126 - in am_hunt_the_beast
		256 &amp; 287 - in fm_mission_controller
</summary>
	]]

native "HAS_ENTITY_CLEAR_LOS_TO_ENTITY_IN_FRONT"
	hash "0x0267D00AF114F17A"
	jhash (0x210D87C8)
	arguments {
		Entity "entity1",

		Entity "entity2",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		Has the entity1 got a clear line of sight to the other entity2 from the direction entity1 is facing.
		This is one of the most CPU demanding BOOL natives in the game; avoid calling this in things like nested for-loops
</summary>
	]]

native "HAS_ENTITY_COLLIDED_WITH_ANYTHING"
	hash "0x8BAD02F0368D9E14"
	jhash (0x662A2F41)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		Called on tick.
		Tested with vehicles, returns true whenever the vehicle is touching any entity.

		Note: for vehicles, the wheels can touch the ground and it will still return false, but if the body of the vehicle touches the ground, it will return true.
</summary>
	]]

native "GET_LAST_MATERIAL_HIT_BY_ENTITY"
	hash "0x5C3D0A935F535C4C"
	jhash (0xC0E3AA47)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Hash"

native "GET_COLLISION_NORMAL_OF_LAST_HIT_FOR_ENTITY"
	hash "0xE465D4AB7CA6AE72"
	jhash (0xAB415C07)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Vector3"

native "FORCE_ENTITY_AI_AND_ANIMATION_UPDATE"
	hash "0x40FDEDB72F8293B2"
	jhash (0x58D9775F)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Based on carmod_shop script decompile this takes a vehicle parameter. It is called when repair is done on initial enter.
</summary>
	]]

native "GET_ENTITY_ANIM_CURRENT_TIME"
	hash "0x346D81500D088F42"
	jhash (0x83943F41)
	arguments {
		Entity "entity",

		charPtr "animDict",

		charPtr "animName",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Returns a float value representing animation's current playtime with respect to its total playtime. This value increasing in a range from [0 to 1] and wrap back to 0 when it reach 1.

		Example:
		0.000000 - mark the starting of animation.
		0.500000 - mark the midpoint of the animation.
		1.000000 - mark the end of animation.

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "GET_ENTITY_ANIM_TOTAL_TIME"
	hash "0x50BD2730B191E360"
	jhash (0x433A9D18)
	arguments {
		Entity "entity",

		charPtr "animDict",

		charPtr "animName",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Returns a float value representing animation's total playtime in milliseconds.

		Example:
		GET_ENTITY_ANIM_TOTAL_TIME(PLAYER_ID(),"amb@world_human_yoga@female@base","base_b") 
		return 20800.000000

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "_GET_ANIM_DURATION"
	hash "0xFEDDF04D62B8D790"
	arguments {
		charPtr "animDict",

		charPtr "animName",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Console Hash: 0x8B5E3E3D = GET_ANIM_DURATION

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "GET_ENTITY_ATTACHED_TO"
	hash "0x48C2BED9180FE123"
	jhash (0xFE1589F9)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Entity"

native "GET_ENTITY_COORDS"
	hash "0x3FEF770D40960D5A"
	jhash (0x1647F1CB)
	arguments {
		Entity "entity",

		BOOL "alive",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		p1 = !IS_ENTITY_DEAD

</summary>
	]]

native "GET_ENTITY_FORWARD_VECTOR"
	hash "0x0A794A5A57F8DF91"
	jhash (0x84DCECBF)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		Gets the entity's forward vector.
</summary>
	]]

native "GET_ENTITY_FORWARD_X"
	hash "0x8BB4EF4214E0E6D5"
	jhash (0x49FAE914)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Gets the X-component of the entity's forward vector.
</summary>
	]]

native "GET_ENTITY_FORWARD_Y"
	hash "0x866A4A5FAE349510"
	jhash (0x9E2F917C)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Gets the Y-component of the entity's forward vector.
</summary>
	]]

native "GET_ENTITY_HEADING"
	hash "0xE83D4F9BA2A38914"
	jhash (0x972CC383)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Returns the heading of the entity in degrees. Also know as the "Yaw" of an entity.
</summary>
	]]

native "_GET_ENTITY_PHYSICS_HEADING"
	hash "0x846BF6291198A71E"
	arguments {
		Entity "entity",
	}
	alias "0x846BF6291198A71E"
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Gets the heading of the entity physics in degrees, which tends to be more accurate than just "GET_ENTITY_HEADING". This can be clearly seen while, for example, ragdolling a ped/player.

		NOTE: The name and description of this native are based on independent research. If you find this native to be more suitable under a different name and/or described differently, please feel free to do so.

</summary>
	]]

native "GET_ENTITY_HEALTH"
	hash "0xEEF059FAD016D209"
	jhash (0x8E3222B7)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"int"
	doc [[!
<summary>
		Returns an integer value of entity's current health.

		Example of range for ped:
		- Player [0 to 200]
		- Ped [100 to 200]
		- Vehicle [0 to 1000]
		- Object [0 to 1000]

		Health is actually a float value but this native casts it to int.
		In order to get the actual value, do:
		float health = *(float *)(entityAddress + 0x280);
</summary>
	]]

native "GET_ENTITY_MAX_HEALTH"
	hash "0x15D757606D170C3C"
	jhash (0xC7AE6AA1)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"int"
	doc [[!
<summary>
		Return an integer value of entity's maximum health.

		Example:
		- Player = 200
</summary>
	]]

native "SET_ENTITY_MAX_HEALTH"
	hash "0x166E7CF68597D8B5"
	jhash (0x96F84DF8)
	arguments {
		Entity "entity",

		int "value",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		For instance: ENTITY::SET_ENTITY_MAX_HEALTH(PLAYER::PLAYER_PED_ID(), 200); // director_mode.c4: 67849
</summary>
	]]

native "GET_ENTITY_HEIGHT"
	hash "0x5A504562485944DD"
	jhash (0xEE443481)
	arguments {
		Entity "entity",

		float "X",

		float "Y",

		float "Z",

		BOOL "atTop",

		BOOL "inWorldCoords",
	}
	ns "ENTITY"
	returns	"float"

native "GET_ENTITY_HEIGHT_ABOVE_GROUND"
	hash "0x1DD55701034110E5"
	jhash (0x57F56A4D)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Return height (z-dimension) above ground. 
		Example: The pilot in a titan plane is 1.844176 above ground.

		How can i convert it to meters?
		Everything seems to be in meters, probably this too.
</summary>
	]]

native "GET_ENTITY_MATRIX"
	hash "0xECB2FC7235A7D137"
	jhash (0xEB9EB001)
	arguments {
		Entity "entity",

		Vector3Ptr "rightVector",

		Vector3Ptr "forwardVector",

		Vector3Ptr "upVector",

		Vector3Ptr "position",
	}
	ns "ENTITY"
	returns	"void"

native "GET_ENTITY_MODEL"
	hash "0x9F47B058362C84B5"
	jhash (0xDAFCB3EC)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Hash"
	doc [[!
<summary>
		Returns the model hash from the entity

		Sometimes throws an exception, idk what causes it though.
</summary>
	]]

native "GET_OFFSET_FROM_ENTITY_GIVEN_WORLD_COORDS"
	hash "0x2274BC1C4885E333"
	jhash (0x6477EC9E)
	arguments {
		Entity "entity",

		float "posX",

		float "posY",

		float "posZ",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		Converts world coords (posX - Z) to coords relative to the entity

		Example:
		posX = 50
		posY = 1000
		posZ = 60
		Entity's coords are: x=30, y=1000, z=60.
		All three returned coords will then be in range of [-20,20] depending on rotation of the entity.
</summary>
	]]

native "GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS"
	hash "0x1899F328B0E12848"
	jhash (0xABCF043A)
	arguments {
		Entity "entity",

		float "offsetX",

		float "offsetY",

		float "offsetZ",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		Offset values are relative to the entity.

		x = left/right
		y = forward/backward
		z = up/down
</summary>
	]]

native "GET_ENTITY_PITCH"
	hash "0xD45DC2893621E1FE"
	jhash (0xFCE6ECE5)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"

native "GET_ENTITY_QUATERNION"
	hash "0x7B3703D2D32DFA18"
	jhash (0x5154EC90)
	arguments {
		Entity "entity",

		floatPtr "x",

		floatPtr "y",

		floatPtr "z",

		floatPtr "w",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		w is the correct parameter name!
</summary>
	]]

native "GET_ENTITY_ROLL"
	hash "0x831E0242595560DF"
	jhash (0x36610842)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Displays the current ROLL axis of the entity [-180.0000/180.0000+]
		(Sideways Roll) such as a vehicle tipped on its side
</summary>
	]]

native "GET_ENTITY_ROTATION"
	hash "0xAFBD61CC738D9EB9"
	jhash (0x8FF45B04)
	arguments {
		Entity "entity",

		int "rotationOrder",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		rotationOrder refers to the order yaw pitch roll is applied
		value ranges from 0 to 5. What you use for rotationOrder when getting must be the same as rotationOrder when setting the rotation. 
		Unsure what value corresponds to what rotation order, more testing will be needed for that.
		------
		rotationOrder is usually 2 in scripts
		------
		ENTITY::GET_ENTITY_ROTATION(Any p0, false or true);
		if false than return from -180 to 180
		if true than return from -90 to 90

		---

		As said above, the value of p1 affects the outcome. R* uses 1 and 2 instead of 0 and 1, so I marked it as an int.

		What it returns is the yaw on the z part of the vector, which makes sense considering R* considers z as vertical. Here's a picture for those of you who don't understand pitch, yaw, and roll:

		www.allstar.fiu.edu/aero/images/pic5-1.gif

		I don't know why it returns a Vec3, but sometimes the values x and y go negative, yet they're always zero. Just use GET_ENTITY_PITCH and GET_ENTITY_ROLL for pitch and roll.
</summary>
	]]

native "GET_ENTITY_ROTATION_VELOCITY"
	hash "0x213B91045D09B983"
	jhash (0x9BF8A73F)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		ANGULAR_VELOCITY*
</summary>
	]]

native "GET_ENTITY_SCRIPT"
	hash "0xA6E9C38DB51D7748"
	jhash (0xB7F70784)
	arguments {
		Entity "entity",

		ScrHandlePtr "script",
	}
	ns "ENTITY"
	returns	"charPtr"
	doc [[!
<summary>
		All ambient entities in-world seem to have the same value for the second argument (Any *script), depending on when the scripthook was activated/re-activated. I've seen numbers from ~5 to almost 70 when the value was translated with to_string. The function return value seems to always be 0.
</summary>
	]]

native "GET_ENTITY_SPEED"
	hash "0xD5037BA82E12416F"
	jhash (0x9E1E4798)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		result is in meters per second

		------------------------------------------------------------
		So would the conversion to mph and km/h, be along the lines of this.

		float speed = GET_ENTITY_SPEED(veh);
		float kmh = (speed * 3.6);
		float mph = (speed * 2.236936);
</summary>
	]]

native "GET_ENTITY_SPEED_VECTOR"
	hash "0x9A8D700A51CB7B0D"
	jhash (0x3ED2B997)
	arguments {
		Entity "entity",

		BOOL "relative",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		Relative can be used for getting speed relative to the frame of the vehicle, to determine for example, if you are going in reverse (-y speed) or not (+y speed). 
</summary>
	]]

native "GET_ENTITY_UPRIGHT_VALUE"
	hash "0x95EED5A694951F9F"
	jhash (0xF4268190)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"

native "GET_ENTITY_VELOCITY"
	hash "0x4805D2B1D8CF94A9"
	jhash (0xC14C9B6B)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		the unit is m/s along each axis
		GET_ENTITY_VELOCITY(aEntity) is the same as GET_ENTITY_SPEED_VECTOR(aEntity,false) 
</summary>
	]]

native "GET_OBJECT_INDEX_FROM_ENTITY_INDEX"
	hash "0xD7E3B9735C0F89D6"
	jhash (0xBC5A9C58)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Object"
	doc [[!
<summary>
		Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
</summary>
	]]

native "GET_PED_INDEX_FROM_ENTITY_INDEX"
	hash "0x04A2A40C73395041"
	jhash (0xC46F74AC)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Ped"
	doc [[!
<summary>
		Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
</summary>
	]]

native "GET_VEHICLE_INDEX_FROM_ENTITY_INDEX"
	hash "0x4B53F92932ADFAC0"
	jhash (0xC69CF43D)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Vehicle"
	doc [[!
<summary>
		Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
</summary>
	]]

native "GET_WORLD_POSITION_OF_ENTITY_BONE"
	hash "0x44A8FCB8ED227738"
	jhash (0x7C6339DF)
	arguments {
		Entity "entity",

		int "boneIndex",
	}
	ns "ENTITY"
	returns	"Vector3"
	doc [[!
<summary>
		Returns the coordinates of an entity-bone.
</summary>
	]]

native "GET_NEAREST_PLAYER_TO_ENTITY"
	hash "0x7196842CB375CDB3"
	jhash (0xCE17FDEC)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Player"

native "GET_NEAREST_PLAYER_TO_ENTITY_ON_TEAM"
	hash "0x4DC9A62F844D9337"
	jhash (0xB1808F56)
	arguments {
		Entity "entity",

		int "team",
	}
	ns "ENTITY"
	returns	"Player"

native "GET_ENTITY_TYPE"
	hash "0x8ACD366038D14505"
	jhash (0x0B1BD08D)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"int"
	doc [[!
<summary>
		Returns:
		0 = no entity
		1 = ped
		2 = vehicle
		3 = object

		This is weird, because in memory atleast on xbox360 it stores it from testing with a variety of (ped, vehicle, and objects).
		03 
		04 
		05 
		The above is more then likely true for the native's return, but if you were to skip using the native it's a bit weird it returns different results.
</summary>
	]]

native "_GET_ENTITY_POPULATION_TYPE"
	hash "0xF6F5161F4534EDFF"
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"int"
	doc [[!
<summary>
		Console Hash: 0xFC30DDFF

		Returns range from 0-10

		--------------------------------------------------------------

		The type name can be retrieved by using this:

		typedef LPSTR(__fastcall *GetEntityPopulationTypeName_t)(unsigned __int16 entityPopulationType, bool scriptName);
			GetEntityPopulationTypeName_t GetEntityPopulationTypeName = (GetEntityPopulationTypeName_t)FindPattern("44 0F B7 C1 4C 8D 0D ?? ?? ?? ?? 41 83 F8 07");
</summary>
	]]

native "IS_AN_ENTITY"
	hash "0x731EC8A916BD11A1"
	jhash (0xD4B9715A)
	arguments {
		int "handle",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_A_PED"
	hash "0x524AC5ECEA15343E"
	jhash (0x55D33EAB)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_A_MISSION_ENTITY"
	hash "0x0A7B270912999B3C"
	jhash (0x2632E124)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_A_VEHICLE"
	hash "0x6AC7003FA6E5575E"
	jhash (0xBE800B01)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_AN_OBJECT"
	hash "0x8D68C8FD0FACA94E"
	jhash (0x3F52E561)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_AT_COORD"
	hash "0x20B60995556D004F"
	jhash (0xD749B606)
	arguments {
		Entity "entity",

		float "xPos",

		float "yPos",

		float "zPos",

		float "xSize",

		float "ySize",

		float "zSize",

		BOOL "p7",

		BOOL "p8",

		int "p9",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if entity is within x/y/zSize distance of x/y/z. 

		Last three are unknown ints, almost always p7 = 0, p8 = 1, p9 = 0
</summary>
	]]

native "IS_ENTITY_AT_ENTITY"
	hash "0x751B70C3D034E187"
	jhash (0xDABDCB52)
	arguments {
		Entity "entity1",

		Entity "entity2",

		float "xSize",

		float "ySize",

		float "zSize",

		BOOL "p5",

		BOOL "p6",

		int "p7",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if entity1 is within the box defined by x/y/zSize of entity2.

		Last three parameters are almost alwasy p5 = 0, p6 = 1, p7 = 0
</summary>
	]]

native "IS_ENTITY_ATTACHED"
	hash "0xB346476EF1A64897"
	jhash (0xEC1479D5)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_ATTACHED_TO_ANY_OBJECT"
	hash "0xCF511840CEEDE0CC"
	jhash (0x0B5DE340)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_ATTACHED_TO_ANY_PED"
	hash "0xB1632E9A5F988D11"
	jhash (0x9D7A609C)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_ATTACHED_TO_ANY_VEHICLE"
	hash "0x26AA915AD89BFB4B"
	jhash (0xDE5C995E)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_ATTACHED_TO_ENTITY"
	hash "0xEFBE71898A993728"
	jhash (0xB0ABFEA8)
	arguments {
		Entity "from",

		Entity "to",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_DEAD"
	hash "0x5F9532F3B5CC2551"
	jhash (0xB6F7CBAC)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_IN_AIR"
	hash "0x886E37EC497200B6"
	jhash (0xA4157987)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_IN_ANGLED_AREA"
	hash "0x51210CED3DA1C78A"
	jhash (0x883622FA)
	arguments {
		Entity "entity",

		float "originX",

		float "originY",

		float "originZ",

		float "edgeX",

		float "edgeY",

		float "edgeZ",

		float "angle",

		BOOL "p8",

		BOOL "p9",

		Any "p10",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		Creates a spherical cone at origin that extends to surface with the angle specified. Then returns true if the entity is inside the spherical cone

		Angle is measured in degrees.
		These values are constant, most likely bogus:
		p8 = 0, p9 = 1, p10 = 0

		This method can also take two float&lt;3&gt; instead of 6 floats.
</summary>
	]]

native "IS_ENTITY_IN_AREA"
	hash "0x54736AA40E271165"
	jhash (0x8C2DFA9D)
	arguments {
		Entity "entity",

		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		BOOL "p7",

		BOOL "p8",

		Any "p9",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_IN_ZONE"
	hash "0xB6463CF6AF527071"
	jhash (0x45C82B21)
	arguments {
		Entity "entity",

		charPtr "zone",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_IN_WATER"
	hash "0xCFB0A0D8EDD145A3"
	jhash (0x4C3C2508)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "GET_ENTITY_SUBMERGED_LEVEL"
	hash "0xE81AFC1BC4CC41CE"
	jhash (0x0170F68C)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"float"
	doc [[!
<summary>
		Get how much of the entity is submerged.  1.0f is whole entity.
</summary>
	]]

native "0x694E00132F2823ED"
	hash "0x694E00132F2823ED"
	jhash (0x40C84A74)
	arguments {
		Entity "entity",

		BOOL "p1",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		what does it do?
</summary>
	]]

native "IS_ENTITY_ON_SCREEN"
	hash "0xE659E47AF827484B"
	jhash (0xC1FEC5ED)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the entity is in between the minimum and maximum values for the 2d screen coords. 
		This means that it will return true even if the entity is behind a wall for example, as long as you're looking at their location. 
		Chipping
</summary>
	]]

native "IS_ENTITY_PLAYING_ANIM"
	hash "0x1F0B79228E461EC9"
	jhash (0x0D130D34)
	arguments {
		Entity "entity",

		charPtr "animDict",

		charPtr "animName",

		int "taskFlag",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		See also PED::IS_SCRIPTED_SCENARIO_PED_USING_CONDITIONAL_ANIM 0x6EC47A344923E1ED 0x3C30B447

		Taken from ENTITY::IS_ENTITY_PLAYING_ANIM(PLAYER::PLAYER_PED_ID(), "creatures@shark@move", "attack_player", 3)

		p4 is always 3 in the scripts.

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim

		taskFlag:

		2 - Check synchronized scene
</summary>
	]]

native "IS_ENTITY_STATIC"
	hash "0x1218E6886D3D8327"
	jhash (0x928E12E9)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		A static ped will not react to natives like "APPLY_FORCE_TO_ENTITY" or "SET_ENTITY_VELOCITY" and oftentimes will not react to task-natives like "AI::TASK_COMBAT_PED". The only way I know of to make one of these peds react is to ragdoll them (or sometimes to use CLEAR_PED_TASKS_IMMEDIATELY(). Static peds include almost all far-away peds, beach-combers, peds in certain scenarios, peds crossing a crosswalk, peds walking to get back into their cars, and others. If anyone knows how to make a ped non-static without ragdolling them, please edit this with the solution.

		^ Attach a phCollider to the ped.
</summary>
	]]

native "IS_ENTITY_TOUCHING_ENTITY"
	hash "0x17FFC1B2BA35A494"
	jhash (0x6B931477)
	arguments {
		Entity "entity",

		Entity "targetEntity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_TOUCHING_MODEL"
	hash "0x0F42323798A58C8C"
	jhash (0x307E7611)
	arguments {
		Entity "entity",

		Hash "modelHash",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_UPRIGHT"
	hash "0x5333F526F6AB19AA"
	jhash (0x3BCDF4E1)
	arguments {
		Entity "entity",

		float "angle",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		// add this to your CSS to view code with formatting intact.
		// pre + hr + p { white-space: pre; } // -

		bool isEntityUpright(Entity e, float angle) {
		    bool bIsUpright; // bl@1
		    CDynamicEntity* pEntity; // rdi@1

		    bIsUpright = 0;
		    pEntity = getEntityAddressIfPhysical(e);
		    if (pEntity) {
		        bIsUpright = 0;
		        if (pEntity-&gt;Matrix.up.z &gt;= cosf(angle * 0.017453292)) // radians(angle)
		            bIsUpright = 1;
		    }
		    return bIsUpright;
		}
</summary>
	]]

native "IS_ENTITY_UPSIDEDOWN"
	hash "0x1DBD58820FA61D71"
	jhash (0x5ACAA48F)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_VISIBLE"
	hash "0x47D6F43D77935C75"
	jhash (0x120B4ED5)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_VISIBLE_TO_SCRIPT"
	hash "0xD796CB5BA8F20E32"
	jhash (0x5D240E9D)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "IS_ENTITY_OCCLUDED"
	hash "0xE31C2C72B8692B64"
	jhash (0x46BC5B40)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "WOULD_ENTITY_BE_OCCLUDED"
	hash "0xEE5D2A122E09EC42"
	jhash (0xEA127CBC)
	arguments {
		Hash "entityModelHash",

		float "x",

		float "y",

		float "z",

		BOOL "p4",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		First parameter was previously an Entity but after further research it is definitely a hash.
</summary>
	]]

native "IS_ENTITY_WAITING_FOR_WORLD_COLLISION"
	hash "0xD05BFF0C0A12C68F"
	jhash (0x00AB7A4A)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS"
	hash "0x18FF00FC7EFF559E"
	jhash (0x28924E98)
	arguments {
		Entity "entity",

		int "forceType",

		float "x",

		float "y",

		float "z",

		BOOL "p5",

		BOOL "isDirectionRel",

		BOOL "isForceRel",

		BOOL "p8",
	}
	ns "ENTITY"
	returns	"void"

native "APPLY_FORCE_TO_ENTITY"
	hash "0xC5F68BE9613E2D18"
	jhash (0xC1C0855A)
	arguments {
		Entity "entity",

		int "forceFlags",

		float "x",

		float "y",

		float "z",

		float "offX",

		float "offY",

		float "offZ",

		int "boneIndex",

		BOOL "isDirectionRel",

		BOOL "ignoreUpVec",

		BOOL "isForceRel",

		BOOL "p12",

		BOOL "p13",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Documented here:
		gtaforums.com/topic/885669-precisely-define-object-physics/
		gtaforums.com/topic/887362-apply-forces-and-momentums-to-entityobject/

		forceFlags:
		First bit (lowest): Strong force flag, factor 100
		Second bit: Unkown flag
		Third bit: Momentum flag=1 (vector (x,y,z) is a momentum, more research needed)
		If higher bits are unequal 0 the function doesn't applay any forces at all.
		(As integer possible values are 0-7)

		0: weak force
		1: strong force
		2: same as 0 (2nd bit?)
		3: same as 1
		4: weak momentum
		5: strong momentum
		6: same as 4
		7: same as 5

		isDirectionRel: vector defined in local (body-fixed) coordinate frame
		isForceRel: if true the force gets multiplied with the objects mass (this is why it was known as highForce) and different objects will have the same acceleration.
</summary>
	]]

native "ATTACH_ENTITY_TO_ENTITY"
	hash "0x6B9BBD38AB0796DF"
	jhash (0xEC024237)
	arguments {
		Entity "entity1",

		Entity "entity2",

		int "boneIndex",

		float "xPos",

		float "yPos",

		float "zPos",

		float "xRot",

		float "yRot",

		float "zRot",

		BOOL "p9",

		BOOL "useSoftPinning",

		BOOL "collision",

		BOOL "isPed",

		int "vertexIndex",

		BOOL "fixedRot",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Attaches entity1 to bone (boneIndex) of entity2.

		boneIndex - this is different to boneID, use GET_PED_BONE_INDEX to get the index from the ID. use the index for attaching to specific bones. entity1 will be attached to entity2's centre if bone index given doesn't correspond to bone indexes for that entity type.

		useSoftPinning - when 2 entities with collision collide and form into a ball they will break the attachment of the entity that they were attached to. Or when an entity is attached far away and then the resets.
		collision - controls collision between the two entities (FALSE disables collision).
		isPed - pitch doesnt work when false and roll will only work on negative numbers (only peds)
		vertexIndex - position of vertex
		fixedRot - if false it ignores entity vector 

</summary>
	]]

native "ATTACH_ENTITY_TO_ENTITY_PHYSICALLY"
	hash "0xC3675780C92F90F9"
	jhash (0x0547417F)
	arguments {
		Entity "entity1",

		Entity "entity2",

		int "boneIndex1",

		int "boneIndex2",

		float "xPos1",

		float "yPos1",

		float "zPos1",

		float "xPos2",

		float "yPos2",

		float "zPos2",

		float "xRot",

		float "yRot",

		float "zRot",

		float "breakForce",

		BOOL "fixedRot",

		BOOL "p15",

		BOOL "collision",

		BOOL "teleport",

		int "p18",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		breakForce is the amount of force required to break the bond.
		fixedRot - if false it ignores entity vector
		p15 - is 1 or 0 in scripts - unknoun what it does
		collision - controls collision between the two entities (FALSE disables collision).
		teleport - do not teleport entity to be attached to the position of the bone Index of the target entity (if 1, entity will not be teleported to target bone)
		p18 - is always 2 in scripts.

		-------------------------
		teleport is not exactly "doNotTeleport". What it actually does is the following:
		if true, entities will be attached as if loosely tethered, up to the maximum offset position specified. Almost as if attached by an invisible rope.
		if false, entities will be attached in a fixed position as specified in the offset position.

		When p15 = true, it seems to force teleport to false.
		It also lets the Rotation params actually work.
</summary>
	]]

native "PROCESS_ENTITY_ATTACHMENTS"
	hash "0xF4080490ADC51C6F"
	jhash (0x6909BA59)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Called to update entity attachments.

		When using ATTACH_ENTITY_TO_ENTITY and using bone '0' then you set the first entity invisible. The attachments will mess up, use bone '-1' to fix that issue
</summary>
	]]

native "GET_ENTITY_BONE_INDEX_BY_NAME"
	hash "0xFB71170B7E76ACBA"
	jhash (0xE4ECAC22)
	arguments {
		Entity "entity",

		charPtr "boneName",
	}
	ns "ENTITY"
	returns	"int"
	doc [[!
<summary>
		Returns the index of the bone. If the bone was not found, -1 will be returned. 

		list:
		pastebin.com/D7JMnX1g

		BoneNames:
			chassis,
			windscreen,
			seat_pside_r,
			seat_dside_r,
			bodyshell,
			suspension_lm,
			suspension_lr,
			platelight,
			attach_female,
			attach_male,
			bonnet,
			boot,
			chassis_dummy,	//Center of the dummy
			chassis_Control,	//Not found yet
			door_dside_f,	//Door left, front
			door_dside_r,	//Door left, back
			door_pside_f,	//Door right, front
			door_pside_r,	//Door right, back
			Gun_GripR,
			windscreen_f,
			platelight,	//Position where the light above the numberplate is located
			VFX_Emitter,
			window_lf,	//Window left, front
			window_lr,	//Window left, back
			window_rf,	//Window right, front
			window_rr,	//Window right, back
			engine,	//Position of the engine
			gun_ammo,
			ROPE_ATTATCH,	//Not misspelled. In script "finale_heist2b.c4".
			wheel_lf,	//Wheel left, front
			wheel_lr,	//Wheel left, back
			wheel_rf,	//Wheel right, front
			wheel_rr,	//Wheel right, back
			exhaust,	//Exhaust. shows only the position of the stock-exhaust
			overheat,	//A position on the engine(not exactly sure, how to name it)
			misc_e,	//Not a car-bone.
			seat_dside_f,	//Driver-seat
			seat_pside_f,	//Seat next to driver
			Gun_Nuzzle,
			seat_r

		I doubt that the function is case-sensitive, since I found a "Chassis" and a "chassis". - Just tested: Definitely not case-sensitive.


</summary>
	]]

native "CLEAR_ENTITY_LAST_DAMAGE_ENTITY"
	hash "0xA72CD9CA74A5ECBA"
	jhash (0x2B83F43B)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Any"

native "DELETE_ENTITY"
	hash "0xAE3CBE5BF394C9C9"
	jhash (0xFAA3D236)
	arguments {
		EntityPtr "entity",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Deletes the specified entity, then sets the handle pointed to by the pointer to NULL.
</summary>
	]]

native "DETACH_ENTITY"
	hash "0x961AC54BF0613F5D"
	jhash (0xC8EFCB41)
	arguments {
		Entity "entity",

		BOOL "p1",

		BOOL "collision",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		p1 and p2 have no effect 
		maybe a quick disassembly will tell us what they do


		the statement below seems to be false. when I tried it with 2 vehicles:

		if p2 is set to true, the both entities won't collide with the other until the distance between them is above 4 meters.
</summary>
	]]

native "FREEZE_ENTITY_POSITION"
	hash "0x428CA6DBD1094446"
	jhash (0x65C16D57)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		No, this should be called SET_ENTITY_KINEMATIC. It does more than just "freeze" it's position.

		^Rockstar Devs named it like that, Now cry about it.
</summary>
	]]

native "_SET_ENTITY_SOMETHING"
	hash "0x3910051CCECDB00C"
	jhash (0xD3850671)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	alias "0x3910051CCECDB00C"
	alias "_SET_ENTITY_REGISTER"
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		what does this native do?

		bool IsEntitySomething(Entity entity)
		{
			auto addr = getScriptHandleBaseAddress(entity);
			printf("addr: 0x%X \n", addr);

			if (addr)
			{
				DWORD flag = *(DWORD *)(addr + 0x48D);
				printf("flag: 0x%X \n", flag);

				return ((flag &amp; (1 &lt;&lt; 3)) != 0) || ((flag &amp; (1 &lt;&lt; 30)) != 0);
			}

			return false;
		}

		wot ?
</summary>
	]]

native "PLAY_ENTITY_ANIM"
	hash "0x7FB218262B810701"
	jhash (0x878753D5)
	arguments {
		Entity "entity",

		charPtr "animName",

		charPtr "animDict",

		float "p3",

		BOOL "loop",

		BOOL "stayInAnim",

		BOOL "p6",

		float "delta",

		Any "bitset",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		delta and bitset are guessed fields. They are based on the fact that most of the calls have 0 or nil field types passed in.

		The only time bitset has a value is 0x4000 and the only time delta has a value is during stealth with usually &lt;1.0f values.

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "PLAY_SYNCHRONIZED_ENTITY_ANIM"
	hash "0xC77720A12FE14A86"
	jhash (0x012760AA)
	arguments {
		Entity "entity",

		int "syncedScene",

		charPtr "animation",

		charPtr "propName",

		float "p4",

		float "p5",

		Any "p6",

		float "p7",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		p4 and p7 are usually 1000.0f.

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "PLAY_SYNCHRONIZED_MAP_ENTITY_ANIM"
	hash "0xB9C54555ED30FBC4"
	jhash (0xEB4CBA74)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		Any "p4",

		Any "p5",

		AnyPtr "p6",

		AnyPtr "p7",

		float "p8",

		float "p9",

		Any "p10",

		float "p11",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "STOP_SYNCHRONIZED_MAP_ENTITY_ANIM"
	hash "0x11E79CAB7183B6F5"
	jhash (0x7253D5B2)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		Any "p4",

		float "p5",
	}
	ns "ENTITY"
	returns	"BOOL"

native "STOP_ENTITY_ANIM"
	hash "0x28004F88151E03E0"
	jhash (0xC4769830)
	arguments {
		Entity "entity",

		charPtr "animation",

		charPtr "animGroup",

		float "p3",
	}
	ns "ENTITY"
	returns	"Any"
	doc [[!
<summary>
		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim

		RAGEPluginHook list: docs.ragepluginhook.net/html/62951c37-a440-478c-b389-c471230ddfc5.htm
</summary>
	]]

native "STOP_SYNCHRONIZED_ENTITY_ANIM"
	hash "0x43D3807C077261E3"
	jhash (0xE27D2FC1)
	arguments {
		Entity "entity",

		float "p1",

		BOOL "p2",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		p1 sync task id?
</summary>
	]]

native "HAS_ANIM_EVENT_FIRED"
	hash "0xEAF4CD9EA3E7E922"
	jhash (0x66571CA0)
	arguments {
		Entity "entity",

		Hash "actionHash",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		if (ENTITY::HAS_ANIM_EVENT_FIRED(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("CreateObject")))
</summary>
	]]

native "FIND_ANIM_EVENT_PHASE"
	hash "0x07F1BE2BCCAA27A7"
	jhash (0xC41DDA62)
	arguments {
		charPtr "animDictionary",

		charPtr "animName",

		charPtr "p2",

		AnyPtr "p3",

		AnyPtr "p4",
	}
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		In the script "player_scene_t_bbfight.c4":
		"if (ENTITY::FIND_ANIM_EVENT_PHASE(&amp;l_16E, &amp;l_19F[v_4/*16*/], v_9, &amp;v_A, &amp;v_B))"
		-- &amp;l_16E (p0) is requested as an anim dictionary earlier in the script.
		-- &amp;l_19F[v_4/*16*/] (p1) is used in other natives in the script as the "animation" param.
		-- v_9 (p2) is instantiated as "victim_fall"; I'm guessing that's another anim
		--v_A and v_B (p3 &amp; p4) are both set as -1.0, but v_A is used immediately after this native for: 
		"if (v_A &lt; ENTITY::GET_ENTITY_ANIM_CURRENT_TIME(...))"
		Both v_A and v_B are seemingly used to contain both Vector3's and floats, so I can't say what either really is other than that they are both output parameters. p4 looks more like a *Vector3 though
		-alphazolam

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "SET_ENTITY_ANIM_CURRENT_TIME"
	hash "0x4487C259F0F70977"
	jhash (0x99D90735)
	arguments {
		Entity "entity",

		charPtr "animDictionary",

		charPtr "animName",

		float "time",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "SET_ENTITY_ANIM_SPEED"
	hash "0x28D1A16553C51776"
	jhash (0x3990C90A)
	arguments {
		Entity "entity",

		charPtr "animDictionary",

		charPtr "animName",

		float "speedMultiplier",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "SET_ENTITY_AS_MISSION_ENTITY"
	hash "0xAD738C3085FE7E11"
	jhash (0x5D1F9E0F)
	arguments {
		Entity "entity",

		BOOL "p1",

		BOOL "p2",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Makes the specified entity (ped, vehicle or object) persistent. Persistent entities will not automatically be removed by the engine.

		p1 has no effect when either its on or off 
		maybe a quick disassembly will tell us what it does

		p2 has no effect when either its on or off 
		maybe a quick disassembly will tell us what it does
</summary>
	]]

native "SET_ENTITY_AS_NO_LONGER_NEEDED"
	hash "0xB736A491E64A32CF"
	jhash (0xADF2267C)
	arguments {
		EntityPtr "entity",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Marks the specified entity (ped, vehicle or object) as no longer needed.
		Entities marked as no longer needed, will be deleted as the engine sees fit.
</summary>
	]]

native "SET_PED_AS_NO_LONGER_NEEDED"
	hash "0x2595DD4236549CE3"
	jhash (0x9A388380)
	arguments {
		PedPtr "ped",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		This is an alias of SET_ENTITY_AS_NO_LONGER_NEEDED.
</summary>
	]]

native "SET_VEHICLE_AS_NO_LONGER_NEEDED"
	hash "0x629BFA74418D6239"
	jhash (0x9B0E10BE)
	arguments {
		VehiclePtr "vehicle",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		This is an alias of SET_ENTITY_AS_NO_LONGER_NEEDED.
</summary>
	]]

native "SET_OBJECT_AS_NO_LONGER_NEEDED"
	hash "0x3AE22DEB5BA5A3E6"
	jhash (0x3F6B949F)
	arguments {
		ObjectPtr "object",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		This is an alias of SET_ENTITY_AS_NO_LONGER_NEEDED.
</summary>
	]]

native "SET_ENTITY_CAN_BE_DAMAGED"
	hash "0x1760FFA8AB074D66"
	jhash (0x60B6E744)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_CAN_BE_DAMAGED_BY_RELATIONSHIP_GROUP"
	hash "0xE22D8FDE858B8119"
	jhash (0x34165B5D)
	arguments {
		Entity "entity",

		BOOL "bCanBeDamaged",

		int "relGroup",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_CAN_BE_TARGETED_WITHOUT_LOS"
	hash "0xD3997889736FD899"
	jhash (0x3B13797C)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Sets whether the entity can be targeted without being in line-of-sight.
</summary>
	]]

native "SET_ENTITY_COLLISION"
	hash "0x1A9205C1B9EE827F"
	jhash (0x139FD37D)
	arguments {
		Entity "entity",

		BOOL "toggle",

		BOOL "keepPhysics",
	}
	ns "ENTITY"
	returns	"void"

native "_GET_ENTITY_COLLISON_DISABLED"
	hash "0xCCF1E97BEFDAE480"
	arguments {
		Entity "entity",
	}
	alias "0xCCF1E97BEFDAE480"
	ns "ENTITY"
	returns	"BOOL"
	doc [[!
<summary>
		console hash: 0xE8C0C629
</summary>
	]]

native "_SET_ENTITY_COLLISION_2"
	hash "0x9EBC85ED0FFFE51C"
	arguments {
		Entity "entity",

		BOOL "p1",

		BOOL "p2",
	}
	alias "0x9EBC85ED0FFFE51C"
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		console hash: 0xBD0D4831

		internally it calls the same function as 'SET_ENTITY_COLLISION'. but uses a hard coded parameter that only activates when p1 is set to true 
		=============================
		Weirdly enough in the 3 scripts it's used in on PC,
		- director_mode (2 hits)
		- re_duel (2 hits)
		- re_seaplane (1 hit)

		Most of the time in the hits its actually used after the normal SET_ENTITY_COLLISION. Example from re_seaplane,

		Local_49[iParam0 /*6*/] = create_ped(26, iVar4, vVar0, fVar3, 1, true);
		set_entity_collision(Local_49[iParam0 /*6*/], iVar42, 0);
		_0x9EBC85ED0FFFE51C(Local_49[iParam0 /*6*/], !iVar66, 0); (_SET_ENTITY_COLLISION_2)

		iVar42 being true so the normal collision native is true, 0
		iVar66 being false so !false so it's true, 0

		Gonna ignore the 'vars' for the create_ped no point in defining them.
</summary>
	]]

native "SET_ENTITY_COORDS"
	hash "0x06843DA7060A026B"
	jhash (0xDF70B41B)
	arguments {
		Entity "entity",

		float "xPos",

		float "yPos",

		float "zPos",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",

		BOOL "clearArea",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		p7 is always 1 in the scripts. Set to 1, an area around the destination coords for the moved entity is cleared from other entities. 

		Often ends with 1, 0, 0, 1); in the scripts. It works. 

		Axis - Invert Axis Flags
</summary>
	]]

native "_SET_ENTITY_COORDS_2"
	hash "0x621873ECE1178967"
	arguments {
		Entity "entity",

		float "xPos",

		float "yPos",

		float "zPos",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",

		BOOL "clearArea",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		does the same as SET_ENTITY_COORDS.

		Console Hash: 0x749B282E
</summary>
	]]

native "SET_ENTITY_COORDS_NO_OFFSET"
	hash "0x239A3351AC1DA385"
	jhash (0x4C83DE8D)
	arguments {
		Entity "entity",

		float "xPos",

		float "yPos",

		float "zPos",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Axis - Invert Axis Flags
</summary>
	]]

native "SET_ENTITY_DYNAMIC"
	hash "0x1718DE8E3F2823CA"
	jhash (0x236F525B)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_HEADING"
	hash "0x8E2530AA8ADA980E"
	jhash (0xE0FF064D)
	arguments {
		Entity "entity",

		float "heading",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_HEALTH"
	hash "0x6B76DC1F3AE6E6A3"
	jhash (0xFBCD1831)
	arguments {
		Entity "entity",

		int "health",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		health &gt;= 0
</summary>
	]]

native "SET_ENTITY_INVINCIBLE"
	hash "0x3882114BDE571AD4"
	jhash (0xC1213A21)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Sets a ped or an object totally invincible. It doesn't take any kind of damage. Peds will not ragdoll on explosions and the tazer animation won't apply either.

		If you use this for a ped and you want Ragdoll to stay enabled, then do:
		*(DWORD *)(pedAddress + 0x188) |= (1 &lt;&lt; 9);

		Use this if you want to get the invincibility status:
			bool IsPedInvincible(Ped ped)
			{
				auto addr = getScriptHandleBaseAddress(ped);	

				if (addr)
				{
					DWORD flag = *(DWORD *)(addr + 0x188);
					return ((flag &amp; (1 &lt;&lt; 8)) != 0) || ((flag &amp; (1 &lt;&lt; 9)) != 0);
				}

				return false;
			}
</summary>
	]]

native "SET_ENTITY_IS_TARGET_PRIORITY"
	hash "0xEA02E132F5C68722"
	jhash (0x9729EE32)
	arguments {
		Entity "entity",

		BOOL "p1",

		float "p2",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_LIGHTS"
	hash "0x7CFBA6A80BDF3874"
	jhash (0xE8FC85AF)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_LOAD_COLLISION_FLAG"
	hash "0x0DC7CABAB1E9B67E"
	jhash (0xC52F295B)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Certainly not the main usage of this native but when set to true for a Vehicle, it will prevent the vehicle to explode if it is spawned far away from the player.
</summary>
	]]

native "HAS_COLLISION_LOADED_AROUND_ENTITY"
	hash "0xE9676F61BC0B3321"
	jhash (0x851687F9)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"BOOL"

native "SET_ENTITY_MAX_SPEED"
	hash "0x0E46A3FCBDE2A1B1"
	jhash (0x46AFFED3)
	arguments {
		Entity "entity",

		float "speed",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_ONLY_DAMAGED_BY_PLAYER"
	hash "0x79F020FF9EDC0748"
	jhash (0x4B707F50)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_ONLY_DAMAGED_BY_RELATIONSHIP_GROUP"
	hash "0x7022BD828FA0B082"
	jhash (0x202237E2)
	arguments {
		Entity "entity",

		BOOL "p1",

		Hash "relationshipHash",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_PROOFS"
	hash "0xFAEE099C6F890BB8"
	jhash (0x7E9EAB66)
	arguments {
		Entity "entity",

		BOOL "bulletProof",

		BOOL "fireProof",

		BOOL "explosionProof",

		BOOL "collisionProof",

		BOOL "meleeProof",

		BOOL "p6",

		BOOL "p7",

		BOOL "p8",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Enable / disable each type of damage.

		--------------
		p7 is to to '1' in am_mp_property_ext/int: entity::set_entity_proofs(uParam0-&gt;f_19, true, true, true, true, true, true, 1, true);

</summary>
	]]

native "SET_ENTITY_QUATERNION"
	hash "0x77B21BE7AC540F07"
	jhash (0x83B6046F)
	arguments {
		Entity "entity",

		float "x",

		float "y",

		float "z",

		float "w",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		w is the correct parameter name!
</summary>
	]]

native "SET_ENTITY_RECORDS_COLLISIONS"
	hash "0x0A50A1EEDAD01E65"
	jhash (0x6B189A1A)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_ROTATION"
	hash "0x8524A8B0171D5E07"
	jhash (0x0A345EFE)
	arguments {
		Entity "entity",

		float "pitch",

		float "roll",

		float "yaw",

		int "rotationOrder",

		BOOL "p5",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		rotationOrder refers to the order yaw pitch roll is applied
		value ranges from 0 to 5. What you use for rotationOrder when setting must be the same as rotationOrder when getting the rotation. 
		Unsure what value corresponds to what rotation order, more testing will be needed for that.
		For the most part R* uses 1 or 2 as the order.
		p5 is usually set as true

</summary>
	]]

native "SET_ENTITY_VISIBLE"
	hash "0xEA1C610A04DB6BBB"
	jhash (0xD043E8E1)
	arguments {
		Entity "entity",

		BOOL "toggle",

		BOOL "unk",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		unk was always 0.
</summary>
	]]

native "SET_ENTITY_VELOCITY"
	hash "0x1C99BB7B6E96D16F"
	jhash (0xFF5A1988)
	arguments {
		Entity "entity",

		float "x",

		float "y",

		float "z",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Note that the third parameter(denoted as z) is "up and down" with positive ment.
</summary>
	]]

native "SET_ENTITY_HAS_GRAVITY"
	hash "0x4A4722448F18EEF5"
	jhash (0xE2F262BF)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_LOD_DIST"
	hash "0x5927F96A78577363"
	jhash (0xD7ACC7AD)
	arguments {
		Entity "entity",

		int "value",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		LOD distance can be 0 to 0xFFFF (higher values will result in 0xFFFF) as it is actually stored as a 16-bit value (aka uint16_t).
</summary>
	]]

native "GET_ENTITY_LOD_DIST"
	hash "0x4159C2762B5791D6"
	jhash (0x4DA3D51F)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"int"
	doc [[!
<summary>
		Returns the LOD distance of an entity.
</summary>
	]]

native "SET_ENTITY_ALPHA"
	hash "0x44A0870B7E92D7C0"
	jhash (0xAE667CB0)
	arguments {
		Entity "entity",

		int "alphaLevel",

		int "skin",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		skin - everything alpha except skin
		Set entity alpha level. Ranging from 0 to 255 but chnages occur after every 20 percent (after every 51).
</summary>
	]]

native "GET_ENTITY_ALPHA"
	hash "0x5A47B3B5E63E94C6"
	jhash (0x1560B017)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"int"

native "RESET_ENTITY_ALPHA"
	hash "0x9B1E824FFBB7027A"
	jhash (0x8A30761C)
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"Any"

native "0x5C3B791D580E0BC2"
	hash "0x5C3B791D580E0BC2"
	arguments {
		Entity "entity",

		float "p1",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Only called once in the scripts.

		Related to weapon objects.

</summary>
	]]

native "SET_ENTITY_ALWAYS_PRERENDER"
	hash "0xACAD101E1FB66689"
	jhash (0xD8FF798A)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_RENDER_SCORCHED"
	hash "0x730F5F8D3F0F2050"
	jhash (0xAAC9317B)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_TRAFFICLIGHT_OVERRIDE"
	hash "0x57C5DB656185EAC4"
	jhash (0xC47F5B91)
	arguments {
		Entity "entity",

		int "state",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Example here: www.gtaforums.com/topic/830463-help-with-turning-lights-green-and-causing-peds-to-crash-into-each-other/#entry1068211340

		0 = green
		1 = red
		2 = yellow
		changing lights may not change the behavior of vehicles
</summary>
	]]

native "0x78E8E3A640178255"
	hash "0x78E8E3A640178255"
	arguments {
		Entity "entity",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Related to cutscene entities. Unsure about the use.
</summary>
	]]

native "CREATE_MODEL_SWAP"
	hash "0x92C47782FDA8B2A3"
	jhash (0x0BC12F9E)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "originalModel",

		Hash "newModel",

		BOOL "p6",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Only works with objects!
		Network players do not see changes done with this.
</summary>
	]]

native "REMOVE_MODEL_SWAP"
	hash "0x033C0F9A64E229AE"
	jhash (0xCE0AA8BC)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "originalModel",

		Hash "newModel",

		BOOL "p6",
	}
	ns "ENTITY"
	returns	"void"

native "CREATE_MODEL_HIDE"
	hash "0x8A97BCA30A0CE478"
	jhash (0x7BD5CF2F)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "model",

		BOOL "p5",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		p5 = sets as true in scripts
		Same as the comment for CREATE_MODEL_SWAP unless for some reason p5 affects it this only works with objects as well.

		Network players do not see changes done with this.
</summary>
	]]

native "CREATE_MODEL_HIDE_EXCLUDING_SCRIPT_OBJECTS"
	hash "0x3A52AE588830BF7F"
	jhash (0x07AAF22C)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "model",

		BOOL "p5",
	}
	ns "ENTITY"
	returns	"void"

native "REMOVE_MODEL_HIDE"
	hash "0xD9E3006FB3CBD765"
	jhash (0x993DBC10)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",

		Any "p5",
	}
	ns "ENTITY"
	returns	"void"

native "CREATE_FORCED_OBJECT"
	hash "0x150E808B375A385A"
	jhash (0x335190A2)
	arguments {
		float "x",

		float "y",

		float "z",

		Any "p3",

		Hash "modelHash",

		BOOL "p5",
	}
	ns "ENTITY"
	returns	"void"

native "REMOVE_FORCED_OBJECT"
	hash "0x61B6775E83C0DB6F"
	jhash (0xAED73ADD)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",
	}
	ns "ENTITY"
	returns	"void"

native "SET_ENTITY_NO_COLLISION_ENTITY"
	hash "0xA53ED5520C07654A"
	jhash (0x1E11BFE9)
	arguments {
		Entity "entity1",

		Entity "entity2",

		BOOL "unknown",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		Calling this function, regardless of the "unknown" value, disabled collision between two entities.

		Importance of entity1 and 2 order is unclear.
</summary>
	]]

native "SET_ENTITY_MOTION_BLUR"
	hash "0x295D82A8559F9150"
	jhash (0xE90005B8)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "ENTITY"
	returns	"void"

native "0xE12ABE5E3A389A6C"
	hash "0xE12ABE5E3A389A6C"
	jhash (0x44767B31)
	arguments {
		Entity "entity",

		BOOL "p1",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		p1 always false.
</summary>
	]]

native "0xA80AE305E0A3044F"
	hash "0xA80AE305E0A3044F"
	jhash (0xE224A6A5)
	arguments {
		Entity "entity",

		BOOL "p1",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		p1 always false.
</summary>
	]]

native "0xDC6F8601FAF2E893"
	hash "0xDC6F8601FAF2E893"
	arguments {
		Entity "entity",

		BOOL "p1",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		SET_ENTITY_*

		x360 Hash: 0xA0466A69

		Only called within 1 script for x360. 'fm_mission_controller' and it used on an object. 

		Ran after these 2 natives,
		set_object_targettable(uParam0, 0);
		set_entity_invincible(uParam0, 1);
</summary>
	]]

native "0x2C2E3DC128F44309"
	hash "0x2C2E3DC128F44309"
	arguments {
		Entity "entity",

		BOOL "p1",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		SET_ENTITY_*
</summary>
	]]

native "0x1A092BB0C3808B96"
	hash "0x1A092BB0C3808B96"
	arguments {
		Entity "entity",

		BOOL "p1",
	}
	ns "ENTITY"
	returns	"void"
	doc [[!
<summary>
		SET_ENTITY_*
</summary>
	]]

native "CREATE_PED"
	hash "0xD49F9B0955C367DE"
	jhash (0x0389EF71)
	arguments {
		int "pedType",

		Hash "modelHash",

		float "x",

		float "y",

		float "z",

		float "heading",

		BOOL "isNetwork",

		BOOL "thisScriptCheck",
	}
	ns "PED"
	returns	"Ped"
	doc [[!
<summary>
		thisScriptCheck - can be destroyed if it belongs to the calling script.

		p7 - last parameter does not mean ped handle is returned
		maybe a quick view in disassembly will tell us what is actually does


		*Heading*: 0.0
		*Heading* is the Z axis spawn rotation of the ped 0-&gt;5th parameter.

		Ped Types:

		enum PedTypes
		{
			PED_TYPE_PLAYER_0,				// michael
			PED_TYPE_PLAYER_1,				// franklin
			PED_TYPE_NETWORK_PLAYER,			// mp character
			PED_TYPE_PLAYER_2,				// trevor
			PED_TYPE_CIVMALE,
			PED_TYPE_CIVFEMALE,
			PED_TYPE_COP,
			PED_TYPE_GANG_ALBANIAN,
			PED_TYPE_GANG_BIKER_1,
			PED_TYPE_GANG_BIKER_2,
			PED_TYPE_GANG_ITALIAN,
			PED_TYPE_GANG_RUSSIAN,
			PED_TYPE_GANG_RUSSIAN_2,
			PED_TYPE_GANG_IRISH,
			PED_TYPE_GANG_JAMAICAN,
			PED_TYPE_GANG_AFRICAN_AMERICAN,
			PED_TYPE_GANG_KOREAN,
			PED_TYPE_GANG_CHINESE_JAPANESE,
			PED_TYPE_GANG_PUERTO_RICAN,
			PED_TYPE_DEALER,
			PED_TYPE_MEDIC,
			PED_TYPE_FIREMAN,
			PED_TYPE_CRIMINAL,
			PED_TYPE_BUM,
			PED_TYPE_PROSTITUTE,
			PED_TYPE_SPECIAL,
			PED_TYPE_MISSION,
			PED_TYPE_SWAT,
			PED_TYPE_ANIMAL,
			PED_TYPE_ARMY
		};
</summary>
	]]

native "DELETE_PED"
	hash "0x9614299DCB53E54B"
	jhash (0x13EFB9A0)
	arguments {
		PedPtr "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Deletes the specified ped, then sets the handle pointed to by the pointer to NULL.
</summary>
	]]

native "CLONE_PED"
	hash "0xEF29A16337FACADB"
	jhash (0x8C8A8D6E)
	arguments {
		Ped "ped",

		float "heading",

		BOOL "isNetwork",

		BOOL "thisScriptCheck",
	}
	ns "PED"
	returns	"Ped"
	doc [[!
<summary>
		thisScriptCheck - can be destroyed if it belongs to the calling script.

		Example of Cloning Your Player:
		CLONE_PED(PLAYER_PED_ID(), GET_ENTITY_HEADING(PLAYER_PED_ID()), 0, 1);
</summary>
	]]

native "CLONE_PED_TO_TARGET"
	hash "0xE952D6431689AD9A"
	jhash (0xFC70EEC7)
	arguments {
		Ped "ped",

		Ped "targetPed",
	}
	alias "_ASSIGN_PLAYER_TO_PED"
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		What exactly is the difference? What does this exactly do by chance?

		^ Copies ped's components and props to targetPed.

		---------------------------------------------------------------------------------
		| Internally has a 3rd param (bool) which is set to true by default |
</summary>
	]]

native "IS_PED_IN_VEHICLE"
	hash "0xA3EE4A07279BB9DB"
	jhash (0x7DA6BC83)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		BOOL "atGetIn",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Gets a value indicating whether the specified ped is in the specified vehicle.

		If 'atGetIn' is false, the function will not return true until the ped is sitting in the vehicle and is about to close the door. If it's true, the function returns true the moment the ped starts to get onto the seat (after opening the door). Eg. if false, and the ped is getting into a submersible, the function will not return true until the ped has descended down into the submersible and gotten into the seat, while if it's true, it'll return true the moment the hatch has been opened and the ped is about to descend into the submersible.
</summary>
	]]

native "IS_PED_IN_MODEL"
	hash "0x796D90EFB19AA332"
	jhash (0xA6438D4B)
	arguments {
		Ped "ped",

		Hash "modelHash",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_IN_ANY_VEHICLE"
	hash "0x997ABD671D25CA0B"
	jhash (0x3B0171EE)
	arguments {
		Ped "ped",

		BOOL "atGetIn",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Gets a value indicating whether the specified ped is in any vehicle.

		If 'atGetIn' is false, the function will not return true until the ped is sitting in the vehicle and is about to close the door. If it's true, the function returns true the moment the ped starts to get onto the seat (after opening the door). Eg. if false, and the ped is getting into a submersible, the function will not return true until the ped has descended down into the submersible and gotten into the seat, while if it's true, it'll return true the moment the hatch has been opened and the ped is about to descend into the submersible.
</summary>
	]]

native "IS_COP_PED_IN_AREA_3D"
	hash "0x16EC4839969F9F5E"
	jhash (0xB98DB96B)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		xyz - relative to the world origin.
</summary>
	]]

native "IS_PED_INJURED"
	hash "0x84A2DD9AC37C35C1"
	jhash (0x2530A087)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Gets a value indicating whether this ped's health is below its injured threshold.

		The default threshold is 100.
</summary>
	]]

native "IS_PED_HURT"
	hash "0x5983BB449D7FDB12"
	jhash (0x69DFA0AF)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether the specified ped is hurt.
</summary>
	]]

native "IS_PED_FATALLY_INJURED"
	hash "0xD839450756ED5A80"
	jhash (0xBADA0093)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Gets a value indicating whether this ped's health is below its fatally injured threshold. The default threshold is 100.
		If the handle is invalid, the function returns true.
</summary>
	]]

native "IS_PED_DEAD_OR_DYING"
	hash "0x3317DEDB88C95038"
	jhash (0xCBDB7739)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Seems to consistently return true if the ped is dead.

		p1 is always passed 1 in the scripts.

		I suggest to remove "OR_DYING" part, because it does not detect dying phase.

		That's what the devs call it, cry about it.

		lol

		that's a good meme right there.
</summary>
	]]

native "IS_CONVERSATION_PED_DEAD"
	hash "0xE0A0AEC214B1FABA"
	jhash (0x1FA39EFE)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_AIMING_FROM_COVER"
	hash "0x3998B1276A3300E5"
	jhash (0xDEBAB2AF)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_RELOADING"
	hash "0x24B100C68C645951"
	jhash (0x961E1745)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether the specified ped is reloading.
</summary>
	]]

native "IS_PED_A_PLAYER"
	hash "0x12534C348C6CB68B"
	jhash (0x404794CA)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the given ped has a valid pointer to CPlayerInfo in its CPed class. That's it.
</summary>
	]]

native "CREATE_PED_INSIDE_VEHICLE"
	hash "0x7DD959874C1FD534"
	jhash (0x3000F092)
	arguments {
		Vehicle "vehicle",

		int "pedType",

		Hash "modelHash",

		int "seat",

		BOOL "isNetwork",

		BOOL "thisScriptCheck",
	}
	ns "PED"
	returns	"Ped"
	doc [[!
<summary>
		thisScriptCheck - can be destroyed if it belongs to the calling script.

		p5 - last parameter does not mean ped handle is returned
		maybe a quick view in disassembly will tell us what is actually does


		Ped Types:

		enum ePedType
		{
			PED_TYPE_PLAYER_0 = 0,
			PED_TYPE_PLAYER_1 = 1,
			PED_TYPE_PLAYER_2 = 3,
			PED_TYPE_CIVMALE = 4,
			PED_TYPE_CIVFEMALE = 5,
			PED_TYPE_COP = 6,
			PED_TYPE_UNKNOWN_7 = 7,
			PED_TYPE_UNKNOWN_12 = 12, // gang member?
			PED_TYPE_UNKNOWN_19 = 19,
			PED_TYPE_MEDIC = 20,
			PED_TYPE_FIREMAN = 21,
			PED_TYPE_UNKNOWN_22 = 22,
			PED_TYPE_UNKNOWN_25 = 25,
			PED_TYPE_UNKNOWN_26 = 26,
			PED_TYPE_SWAT = 27,
			PED_TYPE_ANIMAL = 28,
			PED_TYPE_ARMY = 29
		};
</summary>
	]]

native "SET_PED_DESIRED_HEADING"
	hash "0xAA5A7ECE2AA8FE70"
	jhash (0x961458F9)
	arguments {
		Ped "ped",

		float "heading",
	}
	ns "PED"
	returns	"void"

native "_FREEZE_PED_CAMERA_ROTATION"
	hash "0xFF287323B0E2C69A"
	jhash (0x290421BE)
	arguments {
		Ped "ped",
	}
	alias "0xFF287323B0E2C69A"
	ns "PED"
	returns	"void"

native "IS_PED_FACING_PED"
	hash "0xD71649DB0A545AA3"
	jhash (0x0B775838)
	arguments {
		Ped "ped",

		Ped "otherPed",

		float "angle",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		angle is ped's view cone
</summary>
	]]

native "IS_PED_IN_MELEE_COMBAT"
	hash "0x4E209B2C1EAD5159"
	jhash (0xFD7814A5)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Notes: The function only returns true while the ped is: 
		A.) Swinging a random melee attack (including pistol-whipping)

		B.) Reacting to being hit by a melee attack (including pistol-whipping)

		C.) Is locked-on to an enemy (arms up, strafing/skipping in the default fighting-stance, ready to dodge+counter). 

		You don't have to be holding the melee-targetting button to be in this stance; you stay in it by default for a few seconds after swinging at someone. If you do a sprinting punch, it returns true for the duration of the punch animation and then returns false again, even if you've punched and made-angry many peds
</summary>
	]]

native "IS_PED_STOPPED"
	hash "0x530944F6F4B8A214"
	jhash (0xA0DC0B87)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the ped doesn't do any movement. If the ped is being pushed forwards by using APPLY_FORCE_TO_ENTITY for example, the function returns false.
</summary>
	]]

native "IS_PED_SHOOTING_IN_AREA"
	hash "0x7E9DFE24AC1E58EF"
	jhash (0x741BF04F)
	arguments {
		Ped "ped",

		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		BOOL "p7",

		BOOL "p8",
	}
	ns "PED"
	returns	"BOOL"

native "IS_ANY_PED_SHOOTING_IN_AREA"
	hash "0xA0D3D71EA1086C55"
	jhash (0x91833867)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		BOOL "p6",

		BOOL "p7",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_SHOOTING"
	hash "0x34616828CD07F1A1"
	jhash (0xE7C3405E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether the specified ped is shooting.
</summary>
	]]

native "SET_PED_ACCURACY"
	hash "0x7AEFB85C1D49DEB6"
	jhash (0x6C17122E)
	arguments {
		Ped "ped",

		int "accuracy",
	}
	ns "PED"
	returns	"Any"
	doc [[!
<summary>
		accuracy = 0-100, 100 being perfectly accurate
</summary>
	]]

native "GET_PED_ACCURACY"
	hash "0x37F4AD56ECBC0CD6"
	jhash (0x0A2A0AA0)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"

native "IS_PED_MODEL"
	hash "0xC9D55B1A358A5BF7"
	jhash (0x5F1DDFCB)
	arguments {
		Ped "ped",

		Hash "modelHash",
	}
	ns "PED"
	returns	"BOOL"

native "EXPLODE_PED_HEAD"
	hash "0x2D05CED3A38D0F3A"
	jhash (0x05CC1380)
	arguments {
		Ped "ped",

		Hash "weaponHash",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Forces the ped to fall back and kills it.

		It doesn't really explode the ped's head but it kills the ped
</summary>
	]]

native "REMOVE_PED_ELEGANTLY"
	hash "0xAC6D445B994DF95E"
	jhash (0x4FFB8C6C)
	arguments {
		PedPtr "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Judging purely from a quick disassembly, if the ped is in a vehicle, the ped will be deleted immediately. If not, it'll be marked as no longer needed. - very elegant..
</summary>
	]]

native "ADD_ARMOUR_TO_PED"
	hash "0x5BA652A0CD14DF2F"
	jhash (0xF686B26E)
	arguments {
		Ped "ped",

		int "amount",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Same as SET_PED_ARMOUR, but ADDS 'amount' to the armor the Ped already has.
</summary>
	]]

native "SET_PED_ARMOUR"
	hash "0xCEA04D83135264CC"
	jhash (0x4E3A0CC4)
	arguments {
		Ped "ped",

		int "amount",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Sets the armor of the specified ped.

		ped: The Ped to set the armor of.
		amount: A value between 0 and 100 indicating the value to set the Ped's armor to.
</summary>
	]]

native "SET_PED_INTO_VEHICLE"
	hash "0xF75B0D629E1C063D"
	jhash (0x07500C79)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		int "seatIndex",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Ped: The ped to warp.
		vehicle: The vehicle to warp the ped into.
		Seat_Index: [-1 is driver seat, -2 first free passenger seat]

		Moreinfo of Seat Index
		DriverSeat = -1
		Passenger = 0
		Left Rear = 1
		RightRear = 2
</summary>
	]]

native "SET_PED_ALLOW_VEHICLES_OVERRIDE"
	hash "0x3C028C636A414ED9"
	jhash (0x58A80BD5)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "CAN_CREATE_RANDOM_PED"
	hash "0x3E8349C08E4B82E4"
	jhash (0xF9ABE88F)
	arguments {
		BOOL "unk",
	}
	ns "PED"
	returns	"BOOL"

native "CREATE_RANDOM_PED"
	hash "0xB4AC7D0CF06BFE8F"
	jhash (0x5A949543)
	arguments {
		float "posX",

		float "posY",

		float "posZ",
	}
	ns "PED"
	returns	"Ped"
	doc [[!
<summary>
		vb.net
		Dim ped_handle As Integer
		                    With Game.Player.Character
		                        Dim pos As Vector3 = .Position + .ForwardVector * 3
		                        ped_handle = Native.Function.Call(Of Integer)(Hash.CREATE_RANDOM_PED, pos.X, pos.Y, pos.Z)
		                    End With

		Creates a Ped at the specified location, returns the Ped Handle.  
		Ped will not act until SET_PED_AS_NO_LONGER_NEEDED is called.
</summary>
	]]

native "CREATE_RANDOM_PED_AS_DRIVER"
	hash "0x9B62392B474F44A0"
	jhash (0xB927CE9A)
	arguments {
		Vehicle "vehicle",

		BOOL "returnHandle",
	}
	ns "PED"
	returns	"Ped"

native "CAN_CREATE_RANDOM_DRIVER"
	hash "0xB8EB95E5B4E56978"
	jhash (0x99861609)
	ns "PED"
	returns	"BOOL"

native "CAN_CREATE_RANDOM_BIKE_RIDER"
	hash "0xEACEEDA81751915C"
	jhash (0x7018BE31)
	ns "PED"
	returns	"BOOL"

native "SET_PED_MOVE_ANIMS_BLEND_OUT"
	hash "0x9E8C908F41584ECD"
	jhash (0x20E01957)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_BE_DRAGGED_OUT"
	hash "0xC1670E958EEE24E5"
	jhash (0xAA7F1131)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0xF2BEBCDFAFDAA19E"
	hash "0xF2BEBCDFAFDAA19E"
	jhash (0x6CD58238)
	arguments {
		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		toggle was always 0 except in one instance (b678).

		The one time this is set to true seems to do with when you fail the mission.
</summary>
	]]

native "IS_PED_MALE"
	hash "0x6D9F5FAA7488BA46"
	jhash (0x90950455)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true/false if the ped is/isn't male.
</summary>
	]]

native "IS_PED_HUMAN"
	hash "0xB980061DA992779D"
	jhash (0x194BB7B0)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true/false if the ped is/isn't humanoid.
</summary>
	]]

native "GET_VEHICLE_PED_IS_IN"
	hash "0x9A9112A0FE9A4713"
	jhash (0xAFE92319)
	arguments {
		Ped "ped",

		BOOL "lastVehicle",
	}
	ns "PED"
	returns	"Vehicle"
	doc [[!
<summary>
		Gets the vehicle the specified Ped is/was in depending on bool value.

		[False = CurrentVehicle, True = LastVehicle]
</summary>
	]]

native "RESET_PED_LAST_VEHICLE"
	hash "0xBB8DE8CF6A8DD8BB"
	jhash (0x5E3B5942)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Resets the value for the last vehicle driven by the Ped.
</summary>
	]]

native "SET_PED_DENSITY_MULTIPLIER_THIS_FRAME"
	hash "0x95E3D6257B166CF2"
	jhash (0x039C82BB)
	arguments {
		float "multiplier",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>

		• Usage

		→ Use this native inside a looped function.
		→ Values:
		→ 0.0 = no peds on streets
		→ 1.0 = normal peds on streets
</summary>
	]]

native "SET_SCENARIO_PED_DENSITY_MULTIPLIER_THIS_FRAME"
	hash "0x7A556143A1C03898"
	jhash (0x2909ABF0)
	arguments {
		float "p0",

		float "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p0 and p1 are always the same
</summary>
	]]

native "0x5A7F62FDA59759BD"
	hash "0x5A7F62FDA59759BD"
	jhash (0xB48C0C04)
	ns "PED"
	returns	"void"

native "SET_SCRIPTED_CONVERSION_COORD_THIS_FRAME"
	hash "0x5086C7843552CF85"
	jhash (0x25EA2AA5)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "PED"
	returns	"void"

native "SET_PED_NON_CREATION_AREA"
	hash "0xEE01041D559983EA"
	jhash (0x7A97283F)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		The distance between these points, is the diagonal of a box (remember it's 3D).
</summary>
	]]

native "CLEAR_PED_NON_CREATION_AREA"
	hash "0x2E05208086BA0651"
	jhash (0x6F7043A3)
	ns "PED"
	returns	"void"

native "0x4759CC730F947C81"
	hash "0x4759CC730F947C81"
	jhash (0x8C555ADD)
	ns "PED"
	returns	"void"

native "IS_PED_ON_MOUNT"
	hash "0x460BC76A0E10655E"
	jhash (0x43103006)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Same function call as PED::GET_MOUNT, aka just returns 0
</summary>
	]]

native "GET_MOUNT"
	hash "0xE7E11B8DCBED1058"
	jhash (0xDD31EC4E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Ped"
	doc [[!
<summary>

		Function just returns 0
		void __fastcall ped__get_mount(NativeContext *a1)
		{
		  NativeContext *v1; // rbx@1

		  v1 = a1;
		  GetAddressOfPedFromScriptHandle(a1-&gt;Args-&gt;Arg1);
		  v1-&gt;Returns-&gt;Item1= 0;
		}
</summary>
	]]

native "IS_PED_ON_VEHICLE"
	hash "0x67722AEB798E5FAB"
	jhash (0xA1AE7CC7)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Gets a value indicating whether the specified ped is on top of any vehicle.

		Return 1 when ped is on vehicle.
		Return 0 when ped is not on a vehicle.

</summary>
	]]

native "IS_PED_ON_SPECIFIC_VEHICLE"
	hash "0xEC5F66E459AF3BB2"
	jhash (0x63CB4603)
	arguments {
		Ped "ped",

		Vehicle "vehicle",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_MONEY"
	hash "0xA9C8960E8684C1B5"
	jhash (0x40D90BF2)
	arguments {
		Ped "ped",

		int "amount",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Maximum possible amount of money on MP is 2000. ~JX

		-----------------------------------------------------------------------------

		Maximum amount that a ped can theoretically have is 65535 (0xFFFF) since the amount is stored as an unsigned short (uint16_t) value.
</summary>
	]]

native "GET_PED_MONEY"
	hash "0x3F69145BBA87BAE7"
	jhash (0xEB3C4C7E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"

native "0xFF4803BC019852D9"
	hash "0xFF4803BC019852D9"
	jhash (0xD41C9AED)
	arguments {
		float "p0",

		Any "p1",
	}
	ns "PED"
	returns	"void"

native "0x6B0E6172C9A4D902"
	hash "0x6B0E6172C9A4D902"
	jhash (0x30B98369)
	arguments {
		BOOL "p0",
	}
	ns "PED"
	returns	"void"

native "0x9911F4A24485F653"
	hash "0x9911F4A24485F653"
	jhash (0x02A080C8)
	arguments {
		BOOL "p0",
	}
	ns "PED"
	returns	"void"

native "SET_PED_SUFFERS_CRITICAL_HITS"
	hash "0xEBD76F2359F190AC"
	jhash (0x6F6FC7E6)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		ped cannot be headshot if this is set to false
</summary>
	]]

native "0xAFC976FD0580C7B3"
	hash "0xAFC976FD0580C7B3"
	jhash (0x1572022A)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "IS_PED_SITTING_IN_VEHICLE"
	hash "0xA808AA1D79230FC2"
	jhash (0xDDDE26FA)
	arguments {
		Ped "ped",

		Vehicle "vehicle",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Detect if ped is sitting in the specified vehicle
		[True/False]
</summary>
	]]

native "IS_PED_SITTING_IN_ANY_VEHICLE"
	hash "0x826AA586EDB9FEF8"
	jhash (0x0EA9CA03)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Detect if ped is in any vehicle
		[True/False]
</summary>
	]]

native "IS_PED_ON_FOOT"
	hash "0x01FEE67DB37F59B2"
	jhash (0xC60D0785)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_ON_ANY_BIKE"
	hash "0x94495889E22C6479"
	jhash (0x4D885B2E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_PLANTING_BOMB"
	hash "0xC70B5FAE151982D8"
	jhash (0x0EDAC574)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "GET_DEAD_PED_PICKUP_COORDS"
	hash "0xCD5003B097200F36"
	jhash (0x129F9DC1)
	arguments {
		Ped "ped",

		float "p1",

		float "p2",
	}
	ns "PED"
	returns	"Vector3"

native "IS_PED_IN_ANY_BOAT"
	hash "0x2E0E1C2B4F6CB339"
	jhash (0x1118A947)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_IN_ANY_SUB"
	hash "0xFBFC01CCFB35D99E"
	jhash (0xE65F8059)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_IN_ANY_HELI"
	hash "0x298B91AE825E5705"
	jhash (0x7AB5523B)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_IN_ANY_PLANE"
	hash "0x5FFF4CFC74D8FB80"
	jhash (0x51BBCE7E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_IN_FLYING_VEHICLE"
	hash "0x9134873537FA419C"
	jhash (0xCA072485)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_DIES_IN_WATER"
	hash "0x56CEF0AC79073BDE"
	jhash (0x604C872B)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_DIES_IN_SINKING_VEHICLE"
	hash "0xD718A22995E2B4BC"
	jhash (0x8D4D9ABB)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "GET_PED_ARMOUR"
	hash "0x9483AF821605B1D8"
	jhash (0x2CE311A7)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"

native "SET_PED_STAY_IN_VEHICLE_WHEN_JACKED"
	hash "0xEDF4079F9D54C9A1"
	jhash (0xB014A09C)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_BE_SHOT_IN_VEHICLE"
	hash "0xC7EF1BA83230BA07"
	jhash (0x5DB7B3A9)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "GET_PED_LAST_DAMAGE_BONE"
	hash "0xD75960F6BD9EA49C"
	jhash (0xAB933841)
	arguments {
		Ped "ped",

		intPtr "outBone",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Pretty sure outBone is an int.
</summary>
	]]

native "CLEAR_PED_LAST_DAMAGE_BONE"
	hash "0x8EF6B7AC68E2F01B"
	jhash (0x56CB715E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_AI_WEAPON_DAMAGE_MODIFIER"
	hash "0x1B1E2A40A65B8521"
	jhash (0x516E30EE)
	arguments {
		float "value",
	}
	ns "PED"
	returns	"void"

native "RESET_AI_WEAPON_DAMAGE_MODIFIER"
	hash "0xEA16670E7BA4743C"
	jhash (0x6E965420)
	ns "PED"
	returns	"void"

native "SET_AI_MELEE_WEAPON_DAMAGE_MODIFIER"
	hash "0x66460DEDDD417254"
	jhash (0x0F9A401F)
	arguments {
		float "modifier",
	}
	ns "PED"
	returns	"void"

native "RESET_AI_MELEE_WEAPON_DAMAGE_MODIFIER"
	hash "0x46E56A7CD1D63C3F"
	jhash (0x97886238)
	ns "PED"
	returns	"void"

native "0x2F3C3D9F50681DE4"
	hash "0x2F3C3D9F50681DE4"
	jhash (0xCC9D7F1A)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_BE_TARGETTED"
	hash "0x63F58F7C80513AAD"
	jhash (0x75C49F74)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_BE_TARGETTED_BY_TEAM"
	hash "0xBF1CA77833E58F2C"
	jhash (0xB103A8E1)
	arguments {
		Ped "ped",

		int "team",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_BE_TARGETTED_BY_PLAYER"
	hash "0x66B57B72E0836A76"
	jhash (0xD050F490)
	arguments {
		Ped "ped",

		Player "player",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0x061CB768363D6424"
	hash "0x061CB768363D6424"
	jhash (0x7DA12905)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "SET_TIME_EXCLUSIVE_DISPLAY_TEXTURE"
	hash "0xFD325494792302D7"
	jhash (0x7F67671D)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Hash collision. Please change back to _0x_
</summary>
	]]

native "IS_PED_IN_ANY_POLICE_VEHICLE"
	hash "0x0BD04E29640C9C12"
	jhash (0x84FA790D)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "FORCE_PED_TO_OPEN_PARACHUTE"
	hash "0x16E42E800B472221"
	jhash (0xA819680B)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "IS_PED_IN_PARACHUTE_FREE_FALL"
	hash "0x7DCE8BDA0F1C1200"
	jhash (0xCD71F11B)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_FALLING"
	hash "0xFB92A102F1C4DFA3"
	jhash (0xABF77334)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_JUMPING"
	hash "0xCEDABC5900A0BF97"
	jhash (0x07E5BC0E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_CLIMBING"
	hash "0x53E8CB4F48BFE623"
	jhash (0xBCE03D35)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_VAULTING"
	hash "0x117C70D1F5730B5E"
	jhash (0xC3169BDA)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Definition of vaulting?
</summary>
	]]

native "IS_PED_DIVING"
	hash "0x5527B8246FEF9B11"
	jhash (0x7BC5BF3C)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_JUMPING_OUT_OF_VEHICLE"
	hash "0x433DDFFE2044B636"
	jhash (0xB19215F6)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "0x26AF0E8E30BD2A2C"
	hash "0x26AF0E8E30BD2A2C"
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "GET_PED_PARACHUTE_STATE"
	hash "0x79CFD9827CC979B6"
	jhash (0x7D4BC475)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Returns:

		-1: Normal
		0: Wearing parachute on back
		1: Parachute opening
		2: Parachute open
		3: Falling to doom (e.g. after exiting parachute)

		Normal means no parachute?
</summary>
	]]

native "GET_PED_PARACHUTE_LANDING_TYPE"
	hash "0x8B9F1FC6AE8166C0"
	jhash (0x01F3B035)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		-1: no landing
		0: landing on both feet
		1: stumbling
		2: rolling
		3: ragdoll
</summary>
	]]

native "SET_PED_PARACHUTE_TINT_INDEX"
	hash "0x333FC8DB079B7186"
	jhash (0x5AEFEC3A)
	arguments {
		Ped "ped",

		int "tintIndex",
	}
	ns "PED"
	returns	"void"

native "GET_PED_PARACHUTE_TINT_INDEX"
	hash "0xEAF5F7E5AE7C6C9D"
	jhash (0xE9E7FAC5)
	arguments {
		Ped "ped",

		intPtr "outTintIndex",
	}
	ns "PED"
	returns	"void"

native "SET_PED_RESERVE_PARACHUTE_TINT_INDEX"
	hash "0xE88DA0751C22A2AD"
	jhash (0x177EFC79)
	arguments {
		Ped "ped",

		Any "p1",
	}
	ns "PED"
	returns	"void"

native "0x8C4F3BF23B6237DB"
	hash "0x8C4F3BF23B6237DB"
	arguments {
		Ped "ped",

		BOOL "p1",

		BOOL "p2",
	}
	ns "PED"
	returns	"Entity"

native "SET_PED_DUCKING"
	hash "0x030983CA930B692D"
	jhash (0xB90353D7)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		This is the SET_CHAR_DUCKING from GTA IV, that makes Peds duck. This function does nothing in GTA V. It cannot set the ped as ducking in vehicles, and IS_PED_DUCKING will always return false.
</summary>
	]]

native "IS_PED_DUCKING"
	hash "0xD125AE748725C6BC"
	jhash (0x9199C77D)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_IN_ANY_TAXI"
	hash "0x6E575D6A898AB852"
	jhash (0x16FD386C)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_ID_RANGE"
	hash "0xF107E836A70DCE05"
	jhash (0xEF3B4ED9)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "0x52D59AB61DDC05DD"
	hash "0x52D59AB61DDC05DD"
	jhash (0x9A2180FF)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0xEC4B4B3B9908052A"
	hash "0xEC4B4B3B9908052A"
	jhash (0xF30658D2)
	arguments {
		Ped "ped",

		float "unk",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		SET_PED_*

		Has most likely to do with some shooting attributes as it sets the float which is in the same range as shootRate.
</summary>
	]]

native "0x733C87D4CE22BEA2"
	hash "0x733C87D4CE22BEA2"
	jhash (0x43709044)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "SET_PED_SEEING_RANGE"
	hash "0xF29CF591C4BF6CEE"
	jhash (0x4BD72FE8)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "SET_PED_HEARING_RANGE"
	hash "0x33A8F7F7D5F7F33C"
	jhash (0xB32087E0)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "SET_PED_VISUAL_FIELD_MIN_ANGLE"
	hash "0x2DB492222FB21E26"
	jhash (0x72E2E18B)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "SET_PED_VISUAL_FIELD_MAX_ANGLE"
	hash "0x70793BDCA1E854D4"
	jhash (0x0CEA0F9A)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "SET_PED_VISUAL_FIELD_MIN_ELEVATION_ANGLE"
	hash "0x7A276EB2C224D70F"
	jhash (0x5CC2F1B8)
	arguments {
		Ped "ped",

		float "angle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		This native refers to the field of vision the ped has below them, starting at 0 degrees. The angle value should be negative.
</summary>
	]]

native "SET_PED_VISUAL_FIELD_MAX_ELEVATION_ANGLE"
	hash "0x78D0B67629D75856"
	jhash (0x39D9102F)
	arguments {
		Ped "ped",

		float "angle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		This native refers to the field of vision the ped has above them, starting at 0 degrees. 90f would let the ped see enemies directly above of them.
</summary>
	]]

native "SET_PED_VISUAL_FIELD_PERIPHERAL_RANGE"
	hash "0x9C74B0BC831B753A"
	jhash (0xFDF2F7C2)
	arguments {
		Ped "ped",

		float "range",
	}
	ns "PED"
	returns	"void"

native "SET_PED_VISUAL_FIELD_CENTER_ANGLE"
	hash "0x3B6405E8AB34A907"
	jhash (0xE57202A1)
	arguments {
		Ped "ped",

		float "angle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_STEALTH_MOVEMENT"
	hash "0x88CBB5CEB96B7BD2"
	jhash (0x67E28E1D)
	arguments {
		Ped "ped",

		BOOL "p1",

		charPtr "action",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p1 is usually 0 in the scripts. action is either 0 or a pointer to "DEFAULT_ACTION".
</summary>
	]]

native "GET_PED_STEALTH_MOVEMENT"
	hash "0x7C2AC9CA66575FBF"
	jhash (0x40321B83)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether the entity is in stealth mode
</summary>
	]]

native "CREATE_GROUP"
	hash "0x90370EBE0FEE1A3D"
	jhash (0x8DC0368D)
	arguments {
		int "unused",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Creates a new ped group.
		Groups can contain up to 8 peds.

		The parameter is unused.

		Returns a handle to the created group, or 0 if a group couldn't be created.
</summary>
	]]

native "SET_PED_AS_GROUP_LEADER"
	hash "0x2A7819605465FBCE"
	jhash (0x7265BEA2)
	arguments {
		Ped "ped",

		int "groupId",
	}
	ns "PED"
	returns	"void"

native "SET_PED_AS_GROUP_MEMBER"
	hash "0x9F3480FE65DB31B5"
	jhash (0x0EE13F92)
	arguments {
		Ped "ped",

		int "groupId",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_TELEPORT_TO_GROUP_LEADER"
	hash "0x2E2F4240B3F24647"
	jhash (0xD0D8BDBC)
	arguments {
		Ped "pedHandle",

		int "groupHandle",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		This only will teleport the ped to the group leader if the group leader teleports (sets coords).

		Only works in singleplayer
</summary>
	]]

native "REMOVE_GROUP"
	hash "0x8EB2F69076AF7053"
	jhash (0x48D72B88)
	arguments {
		int "groupId",
	}
	ns "PED"
	returns	"void"

native "REMOVE_PED_FROM_GROUP"
	hash "0xED74007FFB146BC2"
	jhash (0x82697713)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "IS_PED_GROUP_MEMBER"
	hash "0x9BB01E3834671191"
	jhash (0x876D5363)
	arguments {
		Ped "ped",

		int "groupId",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_HANGING_ON_TO_VEHICLE"
	hash "0x1C86D8AEF8254B78"
	jhash (0x9678D4FF)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_GROUP_SEPARATION_RANGE"
	hash "0x4102C7858CFEE4E4"
	jhash (0x7B820CD5)
	arguments {
		int "groupHandle",

		float "separationRange",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Sets the range at which members will automatically leave the group.
</summary>
	]]

native "SET_PED_MIN_GROUND_TIME_FOR_STUNGUN"
	hash "0xFA0675AB151073FA"
	jhash (0x2F0D0973)
	arguments {
		Ped "ped",

		int "ms",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Ped will stay on the ground after being stunned for at lest ms time. (in milliseconds)
</summary>
	]]

native "IS_PED_PRONE"
	hash "0xD6A86331A537A7B9"
	jhash (0x02C2A6C3)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_IN_COMBAT"
	hash "0x4859F1FC66A6278E"
	jhash (0xFE027CB5)
	arguments {
		Ped "ped",

		Ped "target",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Checks to see if ped and target are in combat with eachother. Only goes one-way: if target is engaged in combat with ped but ped has not yet reacted, the function will return false until ped starts fighting back.

		p1 is usually 0 in the scripts because it gets the ped id during the task sequence. For instance: PED::IS_PED_IN_COMBAT(l_42E[4/*14*/], PLAYER::PLAYER_PED_ID()) // armenian2.ct4: 43794
</summary>
	]]

native "CAN_PED_IN_COMBAT_SEE_TARGET"
	hash "0xEAD42DE3610D0721"
	jhash (0xCCD525E1)
	arguments {
		Ped "ped",

		Ped "target",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_DOING_DRIVEBY"
	hash "0xB2C086CC1BF8F2BF"
	jhash (0xAC3CEB9C)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_JACKING"
	hash "0x4AE4FF911DFB61DA"
	jhash (0x3B321816)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_BEING_JACKED"
	hash "0x9A497FE2DF198913"
	jhash (0xD45D605C)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_BEING_STUNNED"
	hash "0x4FBACCE3B4138EE8"
	jhash (0x0A66CE30)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		p1 is always 0
</summary>
	]]

native "GET_PEDS_JACKER"
	hash "0x9B128DC36C1E04CF"
	jhash (0xDE1DBB59)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Ped"

native "GET_JACK_TARGET"
	hash "0x5486A79D9FBD342D"
	jhash (0x1D196361)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Ped"

native "IS_PED_FLEEING"
	hash "0xBBCCE00B381F8482"
	jhash (0x85D813C6)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_IN_COVER"
	hash "0x60DFD0691A170B88"
	jhash (0x972C5A8B)
	arguments {
		Ped "ped",

		BOOL "exceptUseWeapon",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		p1 is nearly always 0 in the scripts. 
</summary>
	]]

native "IS_PED_IN_COVER_FACING_LEFT"
	hash "0x845333B3150583AB"
	jhash (0xB89DBB80)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "_IS_PED_STANDING_IN_COVER"
	hash "0x6A03BF943D767C93"
	arguments {
		Ped "ped",
	}
	alias "0x6A03BF943D767C93"
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Console Hash: 0xDD5D08A7
</summary>
	]]

native "IS_PED_GOING_INTO_COVER"
	hash "0x9F65DBC537E59AD5"
	jhash (0xA3589628)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_PINNED_DOWN"
	hash "0xAAD6D1ACF08F4612"
	jhash (0xCC78999D)
	arguments {
		Ped "ped",

		BOOL "pinned",

		int "p2",
	}
	ns "PED"
	returns	"Any"
	doc [[!
<summary>
		p2 could be time. Only example in the decompiled scripts uses it as -1.
</summary>
	]]

native "GET_SEAT_PED_IS_TRYING_TO_ENTER"
	hash "0x6F4C85ACD641BCD2"
	jhash (0xACF162E0)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"

native "GET_VEHICLE_PED_IS_TRYING_TO_ENTER"
	hash "0x814FA8BE5449445D"
	jhash (0x99968B37)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Vehicle"
	doc [[!
<summary>
		Should be renamed GET_CAR_PED_IS_TRYING_TO_ENTER...

		Because this works only for cars, not for helis, planes,motorcycles or bicycles...

		From Calderon

		This is what R* named it, deal with it.
</summary>
	]]

native "GET_PED_SOURCE_OF_DEATH"
	hash "0x93C8B64DEB84728C"
	jhash (0x84ADF9EB)
	arguments {
		Ped "ped",
	}
	alias "_GET_PED_KILLER"
	ns "PED"
	returns	"Entity"
	doc [[!
<summary>
		Returns the Entity (Ped, Vehicle, or ?Object?) that killed the 'ped'

		Is best to check if the Ped is dead before asking for its killer.
</summary>
	]]

native "GET_PED_CAUSE_OF_DEATH"
	hash "0x16FFE42AB2D2DC59"
	jhash (0x63458C27)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Hash"
	doc [[!
<summary>
		Returns the hash of the weapon/model/object that killed the ped.
</summary>
	]]

native "0x1E98817B311AE98A"
	hash "0x1E98817B311AE98A"
	arguments {
		Ped "ped",
	}
	alias "_GET_PED_TIME_OF_DEATH"
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Console Hash: 0xDF6D5D54


		Name was _GET_PED_TIME_OF_DEATH
		-----------------------------------------------------------------
		There is no way this is the correct name. The only time this is called it's compared with the game timer and I used this to test something and noticed when I was killed by no matter what it was my 'Time Of Death' via this native was always 0, but my friends was some random big number like so, 147591.

		Retreives [CPed + 15CC] (as of 944)
</summary>
	]]

native "0x5407B7288D0478B7"
	hash "0x5407B7288D0478B7"
	jhash (0xEF0B78E6)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"int"

native "0x336B3D200AB007CB"
	hash "0x336B3D200AB007CB"
	jhash (0xFB18CB19)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",
	}
	ns "PED"
	returns	"Any"

native "SET_PED_RELATIONSHIP_GROUP_DEFAULT_HASH"
	hash "0xADB3F206518799E8"
	jhash (0x423B7BA2)
	arguments {
		Ped "ped",

		Hash "hash",
	}
	ns "PED"
	returns	"void"

native "SET_PED_RELATIONSHIP_GROUP_HASH"
	hash "0xC80A74AC829DDD92"
	jhash (0x79F8C18C)
	arguments {
		Ped "ped",

		Hash "hash",
	}
	ns "PED"
	returns	"void"

native "SET_RELATIONSHIP_BETWEEN_GROUPS"
	hash "0xBF25EB89375A37AD"
	jhash (0xD4A215BA)
	arguments {
		int "relationship",

		Hash "group1",

		Hash "group2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Sets the relationship between two groups. This should be called twice (once for each group).

		Relationship types:
		0 = Companion
		1 = Respect
		2 = Like
		3 = Neutral
		4 = Dislike
		5 = Hate
		255 = Pedestrians

		Example:
		PED::SET_RELATIONSHIP_BETWEEN_GROUPS(2, l_1017, 0xA49E591C);
		PED::SET_RELATIONSHIP_BETWEEN_GROUPS(2, 0xA49E591C, l_1017);
</summary>
	]]

native "CLEAR_RELATIONSHIP_BETWEEN_GROUPS"
	hash "0x5E29243FB56FC6D4"
	jhash (0x994B8C2D)
	arguments {
		int "relationship",

		Hash "group1",

		Hash "group2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Clears the relationship between two groups. This should be called twice (once for each group).

		Relationship types:
		0 = Companion
		1 = Respect
		2 = Like
		3 = Neutral
		4 = Dislike
		5 = Hate
		255 = Pedestrians
		(Credits: Inco)

		Example:
		PED::CLEAR_RELATIONSHIP_BETWEEN_GROUPS(2, l_1017, 0xA49E591C);
		PED::CLEAR_RELATIONSHIP_BETWEEN_GROUPS(2, 0xA49E591C, l_1017);
</summary>
	]]

native "ADD_RELATIONSHIP_GROUP"
	hash "0xF372BC22FCB88606"
	jhash (0x8B635546)
	arguments {
		charPtr "name",

		HashPtr "groupHash",
	}
	ns "PED"
	returns	"Any"
	doc [[!
<summary>
		Can't select void. This function returns nothing. The hash of the created relationship group is output in the second parameter.
</summary>
	]]

native "REMOVE_RELATIONSHIP_GROUP"
	hash "0xB6BA2444AB393DA2"
	jhash (0x4A1DC59A)
	arguments {
		Hash "groupHash",
	}
	ns "PED"
	returns	"void"

native "GET_RELATIONSHIP_BETWEEN_PEDS"
	hash "0xEBA5AD3A0EAF7121"
	jhash (0xE254C39C)
	arguments {
		Ped "ped1",

		Ped "ped2",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Gets the relationship between two peds. This should be called twice (once for each ped).

		Relationship types:
		0 = Companion
		1 = Respect
		2 = Like
		3 = Neutral
		4 = Dislike
		5 = Hate
		255 = Pedestrians
		(Credits: Inco)

		Example:
		PED::GET_RELATIONSHIP_BETWEEN_PEDS(2, l_1017, 0xA49E591C);
		PED::GET_RELATIONSHIP_BETWEEN_PEDS(2, 0xA49E591C, l_1017);
</summary>
	]]

native "GET_PED_RELATIONSHIP_GROUP_DEFAULT_HASH"
	hash "0x42FDD0F017B1E38E"
	jhash (0x714BD6E4)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Hash"

native "GET_PED_RELATIONSHIP_GROUP_HASH"
	hash "0x7DBDD04862D95F04"
	jhash (0x354F283C)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Hash"

native "GET_RELATIONSHIP_BETWEEN_GROUPS"
	hash "0x9E6B70061662AE5C"
	jhash (0x4E372FE2)
	arguments {
		Hash "group1",

		Hash "group2",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Gets the relationship between two groups. This should be called twice (once for each group).

		Relationship types:
		0 = Companion
		1 = Respect
		2 = Like
		3 = Neutral
		4 = Dislike
		5 = Hate
		255 = Pedestrians

		Example:
		PED::GET_RELATIONSHIP_BETWEEN_GROUPS(l_1017, 0xA49E591C);
		PED::GET_RELATIONSHIP_BETWEEN_GROUPS(0xA49E591C, l_1017);
</summary>
	]]

native "SET_PED_CAN_BE_TARGETED_WITHOUT_LOS"
	hash "0x4328652AE5769C71"
	jhash (0x7FDDC0A6)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_TO_INFORM_RESPECTED_FRIENDS"
	hash "0x112942C6E708F70B"
	jhash (0xD78AC46C)
	arguments {
		Ped "ped",

		float "radius",

		int "maxFriends",
	}
	ns "PED"
	returns	"void"

native "IS_PED_RESPONDING_TO_EVENT"
	hash "0x625B774D75C87068"
	jhash (0x7A877554)
	arguments {
		Ped "ped",

		Any "event",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_FIRING_PATTERN"
	hash "0x9AC577F5A12AD8A9"
	jhash (0xB4629D66)
	arguments {
		Ped "ped",

		Hash "patternHash",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		FIRING_PATTERN_BURST_FIRE = 0xD6FF6D61 ( 1073727030 )
		FIRING_PATTERN_BURST_FIRE_IN_COVER = 0x026321F1 ( 40051185 )
		FIRING_PATTERN_BURST_FIRE_DRIVEBY = 0xD31265F2 ( -753768974 )
		FIRING_PATTERN_FROM_GROUND = 0x2264E5D6 ( 577037782 )
		FIRING_PATTERN_DELAY_FIRE_BY_ONE_SEC = 0x7A845691 ( 2055493265 )
		FIRING_PATTERN_FULL_AUTO = 0xC6EE6B4C ( -957453492 )
		FIRING_PATTERN_SINGLE_SHOT = 0x5D60E4E0 ( 1566631136 )
		FIRING_PATTERN_BURST_FIRE_PISTOL = 0xA018DB8A ( -1608983670 )
		FIRING_PATTERN_BURST_FIRE_SMG = 0xD10DADEE ( 1863348768 )
		FIRING_PATTERN_BURST_FIRE_RIFLE = 0x9C74B406 ( -1670073338 )
		FIRING_PATTERN_BURST_FIRE_MG = 0xB573C5B4 ( -1250703948 )
		FIRING_PATTERN_BURST_FIRE_PUMPSHOTGUN = 0x00BAC39B ( 12239771 )
		FIRING_PATTERN_BURST_FIRE_HELI = 0x914E786F ( -1857128337 )
		FIRING_PATTERN_BURST_FIRE_MICRO = 0x42EF03FD ( 1122960381 )
		FIRING_PATTERN_SHORT_BURSTS = 0x1A92D7DF ( 445831135 )
		FIRING_PATTERN_SLOW_FIRE_TANK = 0xE2CA3A71 ( -490063247 )

		if anyone is interested firing pattern info: pastebin.com/Px036isB
</summary>
	]]

native "SET_PED_SHOOT_RATE"
	hash "0x614DA022990752DC"
	jhash (0xFB301746)
	arguments {
		Ped "ped",

		int "shootRate",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		shootRate 0-1000
</summary>
	]]

native "SET_COMBAT_FLOAT"
	hash "0xFF41B4B141ED981C"
	jhash (0xD8B7637C)
	arguments {
		Ped "ped",

		int "combatType",

		float "p2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		combatType can be between 0-14. See GET_COMBAT_FLOAT below for a list of possible parameters.
</summary>
	]]

native "GET_COMBAT_FLOAT"
	hash "0x52DFF8A10508090A"
	jhash (0x511D7EF8)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "PED"
	returns	"float"
	doc [[!
<summary>
		p0: Ped Handle
		p1: int i | 0 &lt;= i &lt;= 27

		p1 probably refers to the attributes configured in combatbehavior.meta. There are 13. Example:

		&lt;BlindFireChance value="0.1"/&gt;
		&lt;WeaponShootRateModifier value="1.0"/&gt;
		&lt;TimeBetweenBurstsInCover value="1.25"/&gt;
		&lt;BurstDurationInCover value="2.0"/&gt;
		&lt;TimeBetweenPeeks value="10.0"/&gt;
		&lt;WeaponAccuracy value="0.18"/&gt;
		&lt;FightProficiency value="0.8"/&gt;
		&lt;StrafeWhenMovingChance value="1.0"/&gt;
		&lt;WalkWhenStrafingChance value="0.0"/&gt;
		&lt;AttackWindowDistanceForCover value="55.0"/&gt;
		&lt;TimeToInvalidateInjuredTarget value="9.0"/&gt;
		&lt;TriggerChargeTime_Near value="4.0"/&gt;
		&lt;TriggerChargeTime_Far value="10.0"/&gt;

		-------------Confirmed by editing combatbehavior.meta:
		p1:
		0=BlindFireChance
		1=BurstDurationInCover
		3=TimeBetweenBurstsInCover
		4=TimeBetweenPeeks
		5=StrafeWhenMovingChance
		8=WalkWhenStrafingChance
		11=AttackWindowDistanceForCover
		12=TimeToInvalidateInjuredTarget
		16=OptimalCoverDistance

</summary>
	]]

native "GET_GROUP_SIZE"
	hash "0x8DE69FE35CA09A45"
	jhash (0xF7E1A691)
	arguments {
		int "groupID",

		AnyPtr "unknown",

		intPtr "sizeInMembers",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p1 may be a BOOL representing whether or not the group even exists
</summary>
	]]

native "DOES_GROUP_EXIST"
	hash "0x7C6B0C22F9F40BBE"
	jhash (0x935C978D)
	arguments {
		int "groupId",
	}
	ns "PED"
	returns	"BOOL"

native "GET_PED_GROUP_INDEX"
	hash "0xF162E133B4E7A675"
	jhash (0x134E0785)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Returns the group id of which the specified ped is a member of.
</summary>
	]]

native "IS_PED_IN_GROUP"
	hash "0x5891CAC5D4ACFF74"
	jhash (0x836D9795)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "GET_PLAYER_PED_IS_FOLLOWING"
	hash "0x6A3975DEA89F9A17"
	jhash (0xDE7442EE)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Player"

native "SET_GROUP_FORMATION"
	hash "0xCE2F5FC3AF7E8C1E"
	jhash (0x08FAC739)
	arguments {
		int "groupId",

		int "formationType",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		0: Default
		1: Circle Around Leader
		2: Alternative Circle Around Leader
		3: Line, with Leader at center
</summary>
	]]

native "SET_GROUP_FORMATION_SPACING"
	hash "0x1D9D45004C28C916"
	jhash (0xB1E086FF)
	arguments {
		int "groupId",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "PED"
	returns	"void"

native "RESET_GROUP_FORMATION_DEFAULT_SPACING"
	hash "0x63DAB4CCB3273205"
	jhash (0x267FCEAD)
	arguments {
		int "groupHandle",
	}
	ns "PED"
	returns	"void"

native "GET_VEHICLE_PED_IS_USING"
	hash "0x6094AD011A2EA87D"
	jhash (0x6DE3AADA)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Vehicle"
	doc [[!
<summary>
		Gets ID of vehicle player using. It means it can get ID at any interaction with vehicle. Enter\exit for example. And that means it is faster than GET_VEHICLE_PED_IS_IN but less safe.
</summary>
	]]

native "SET_EXCLUSIVE_PHONE_RELATIONSHIPS"
	hash "0xF92691AED837A5FC"
	jhash (0x56E0C163)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Vehicle"
	doc [[!
<summary>
		In appcamera.c4, Line 106:
		if (VEHICLE::IS_VEHICLE_DRIVEABLE(PED::SET_EXCLUSIVE_PHONE_RELATIONSHIPS(PLAYER::PLAYER_PED_ID()), 0))
		So return type could be a vehicle?

		!Hash collision - gets the vehicle handle from ped which is about entering the vehicle!

		sfink: agreed, 100%
		Proper name is GET_VEHICLE_PED_IS_ENTERING
</summary>
	]]

native "SET_PED_GRAVITY"
	hash "0x9FF447B6B6AD960A"
	jhash (0x3CA16652)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		enable or disable the gravity of a ped

		Examples:
		PED::SET_PED_GRAVITY(PLAYER::PLAYER_PED_ID(), 0x00000001);
		PED::SET_PED_GRAVITY(Local_289[iVar0 /*20*/], 0x00000001);
</summary>
	]]

native "APPLY_DAMAGE_TO_PED"
	hash "0x697157CED63F18D4"
	jhash (0x4DC27FCF)
	arguments {
		Ped "ped",

		int "damageAmount",

		BOOL "armorFirst",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		damages a ped with the given amount

		----

		armorFirst means it will damage/lower the armor first before damaging the player.

		setting damageAmount to a negative amount will cause the player or the armor (depending on armorFirst) to be healed by damageAmount instead.
</summary>
	]]

native "0x36B77BB84687C318"
	hash "0x36B77BB84687C318"
	arguments {
		Ped "ped",

		Any "p1",
	}
	ns "PED"
	returns	"Any"
	doc [[!
<summary>
		GET_TIME_SINCE_???
</summary>
	]]

native "SET_PED_ALLOWED_TO_DUCK"
	hash "0xDA1F1B7BE1A8766F"
	jhash (0xC4D122F8)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_NEVER_LEAVES_GROUP"
	hash "0x3DBFC55D5C9BB447"
	jhash (0x0E038813)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "GET_PED_TYPE"
	hash "0xFF059E1E4C01E63C"
	jhash (0xB1460D43)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Ped Types: (ordered by return priority)

		Michael = 0
		Franklin = 1
		Trevor = 2

		Army = 29
		Animal = 28
		SWAT = 27
		LSFD = 21
		Paramedic = 20

		Cop = 6

		Male = 4
		Female = 5 

		Human = 26

		Note/Exception
		hc_gunman : 4 // Mix male and female
		hc_hacker : 4 // Mix male and female
		mp_f_misty_01 : 4 // Female character
		s_f_y_ranger_01 : 5 // Ranger
		s_m_y_ranger_01 : 4 // Ranger
		s_m_y_uscg_01 : 6 // US Coast Guard
</summary>
	]]

native "SET_PED_AS_COP"
	hash "0xBB03C38DD3FB7FFD"
	jhash (0x84E7DE9F)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Turns the desired ped into a cop. If you use this on the player ped, you will become almost invisible to cops dispatched for you. You will also report your own crimes, get a generic cop voice, get a cop-vision-cone on the radar, and you will be unable to shoot at other cops. SWAT and Army will still shoot at you. Toggling ped as "false" has no effect; you must change p0's ped model to disable the effect.
</summary>
	]]

native "SET_PED_MAX_HEALTH"
	hash "0xF5F6378C4F3419D3"
	jhash (0x5533F60B)
	arguments {
		Ped "ped",

		int "value",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		sets the maximum health of a ped

		I think it's never been used in any script
</summary>
	]]

native "GET_PED_MAX_HEALTH"
	hash "0x4700A416E8324EF3"
	jhash (0xA45B6C8D)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"

native "SET_PED_MAX_TIME_IN_WATER"
	hash "0x43C851690662113D"
	jhash (0xFE0A106B)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "SET_PED_MAX_TIME_UNDERWATER"
	hash "0x6BA428C528D9E522"
	jhash (0x082EF240)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "0x2735233A786B1BEF"
	hash "0x2735233A786B1BEF"
	jhash (0x373CC405)
	arguments {
		Ped "ped",

		float "p1",
	}
	ns "PED"
	returns	"void"

native "0x952F06BEECD775CC"
	hash "0x952F06BEECD775CC"
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "PED"
	returns	"void"

native "0xE6CA85E7259CE16B"
	hash "0xE6CA85E7259CE16B"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_BE_KNOCKED_OFF_VEHICLE"
	hash "0x7A6535691B477C48"
	jhash (0x8A251612)
	arguments {
		Ped "ped",

		int "state",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		0 = can (bike)
		1 = can't (bike)
		2 = unk 
		3 = unk
</summary>
	]]

native "CAN_KNOCK_PED_OFF_VEHICLE"
	hash "0x51AC07A44D4F5B8A"
	jhash (0xC9D098B3)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "KNOCK_PED_OFF_VEHICLE"
	hash "0x45BBCBA77C29A841"
	jhash (0xACDD0674)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_PED_COORDS_NO_GANG"
	hash "0x87052FE446E07247"
	jhash (0x9561AD98)
	arguments {
		Ped "ped",

		float "posX",

		float "posY",

		float "posZ",
	}
	ns "PED"
	returns	"void"

native "GET_PED_AS_GROUP_MEMBER"
	hash "0x51455483CF23ED97"
	jhash (0x9AA3CC8C)
	arguments {
		int "groupID",

		int "memberNumber",
	}
	ns "PED"
	returns	"Ped"
	doc [[!
<summary>
		from fm_mission_controller.c4 (variable names changed for clarity):

		int groupID = PLAYER::GET_PLAYER_GROUP(PLAYER::PLAYER_ID());
		PED::GET_GROUP_SIZE(group, &amp;unused, &amp;groupSize);
		if (groupSize &gt;= 1) {
		. . . . for (int memberNumber = 0; memberNumber &lt; groupSize; memberNumber++) {
		. . . . . . . . Ped ped1 = PED::GET_PED_AS_GROUP_MEMBER(groupID, memberNumber);
		. . . . . . . . //and so on
</summary>
	]]

native "_GET_PED_AS_GROUP_LEADER"
	hash "0x5CCE68DBD5FE93EC"
	arguments {
		int "groupID",
	}
	ns "PED"
	returns	"Ped"

native "SET_PED_KEEP_TASK"
	hash "0x971D38760FBC02EF"
	jhash (0xA7EC79CE)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0x49E50BDB8BA4DAB2"
	hash "0x49E50BDB8BA4DAB2"
	jhash (0x397F06E3)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "IS_PED_SWIMMING"
	hash "0x9DE327631295B4C2"
	jhash (0x7AB43DB8)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_SWIMMING_UNDER_WATER"
	hash "0xC024869A53992F34"
	jhash (0x0E8D524F)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_COORDS_KEEP_VEHICLE"
	hash "0x9AFEFF481A85AB2E"
	jhash (0xD66AE1D3)
	arguments {
		Ped "ped",

		float "posX",

		float "posY",

		float "posZ",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		teleports ped to coords along with the vehicle ped is in
</summary>
	]]

native "SET_PED_DIES_IN_VEHICLE"
	hash "0x2A30922C90C9B42C"
	jhash (0x6FE1E440)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_CREATE_RANDOM_COPS"
	hash "0x102E68B2024D536D"
	jhash (0x23441648)
	arguments {
		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_CREATE_RANDOM_COPS_NOT_ON_SCENARIOS"
	hash "0x8A4986851C4EF6E7"
	jhash (0x82E548CC)
	arguments {
		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_CREATE_RANDOM_COPS_ON_SCENARIOS"
	hash "0x444CB7D7DBE6973D"
	jhash (0xEDC31475)
	arguments {
		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "CAN_CREATE_RANDOM_COPS"
	hash "0x5EE2CAFF7F17770D"
	jhash (0xAA73DAD9)
	ns "PED"
	returns	"BOOL"

native "SET_PED_AS_ENEMY"
	hash "0x02A0C9720B854BFA"
	jhash (0xAE620A1B)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_SMASH_GLASS"
	hash "0x1CCE141467FF42A2"
	jhash (0x149C60A8)
	arguments {
		Ped "ped",

		BOOL "p1",

		BOOL "p2",
	}
	ns "PED"
	returns	"void"

native "IS_PED_IN_ANY_TRAIN"
	hash "0x6F972C1AB75A1ED0"
	jhash (0x759EF63A)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_GETTING_INTO_A_VEHICLE"
	hash "0xBB062B2B5722478E"
	jhash (0x90E805AC)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_TRYING_TO_ENTER_A_LOCKED_VEHICLE"
	hash "0x44D28D5DDFE5F68C"
	jhash (0x46828B4E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_ENABLE_HANDCUFFS"
	hash "0xDF1AF8B5D56542FA"
	jhash (0xAC9BBA23)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		ped can not pull out a weapon when true
</summary>
	]]

native "SET_ENABLE_BOUND_ANKLES"
	hash "0xC52E0F855C58FC2E"
	jhash (0x9208D689)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_ENABLE_SCUBA"
	hash "0xF99F62004024D506"
	jhash (0x7BF61471)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Enables diving motion when underwater.
</summary>
	]]

native "SET_CAN_ATTACK_FRIENDLY"
	hash "0xB3B1CB349FF9C75D"
	jhash (0x47C60963)
	arguments {
		Ped "ped",

		BOOL "toggle",

		BOOL "p2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Setting ped to true allows the ped to shoot "friendlies".

		p2 set to true when toggle is also true seams to make peds permanently unable to aim at, even if you set p2 back to false.

		p1 = false &amp; p2 = false for unable to aim at.
		p1 = true &amp; p2 = false for able to aim at. 
</summary>
	]]

native "GET_PED_ALERTNESS"
	hash "0xF6AA118530443FD2"
	jhash (0xF83E4DAF)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Returns the ped's alertness (0-3).

		Values : 

		0 : Neutral
		1 : Heard something (gun shot, hit, etc)
		2 : Knows (the origin of the event)
		3 : Fully alerted (is facing the event?)

		If the Ped does not exist, returns -1.
</summary>
	]]

native "SET_PED_ALERTNESS"
	hash "0xDBA71115ED9941A6"
	jhash (0x2C32D9AE)
	arguments {
		Ped "ped",

		int "value",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		value ranges from 0 to 3.
</summary>
	]]

native "SET_PED_GET_OUT_UPSIDE_DOWN_VEHICLE"
	hash "0xBC0ED94165A48BC2"
	jhash (0x89AD49FF)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_MOVEMENT_CLIPSET"
	hash "0xAF8A94EDE7712BEF"
	jhash (0xA817CDEB)
	arguments {
		Ped "ped",

		charPtr "clipSet",

		float "p2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p2 is usually 1.0f

		EDIT 12/24/16: 
		p2 does absolutely nothing no matter what the value is. 

		EDIT 08/16/17:
		p2 is the time for a smooth changing to the new clipset.

		List of movement clipsets:
		Thanks to elsewhat for list.

		 "ANIM_GROUP_MOVE_BALLISTIC"
		 "ANIM_GROUP_MOVE_LEMAR_ALLEY"
		 "clipset@move@trash_fast_turn"
		 "FEMALE_FAST_RUNNER"
		 "missfbi4prepp1_garbageman"
		 "move_characters@franklin@fire"
		 "move_characters@Jimmy@slow@"
		 "move_characters@michael@fire"
		 "move_f@flee@a"
		 "move_f@scared"
		 "move_f@sexy@a"
		 "move_heist_lester"
		 "move_injured_generic"
		 "move_lester_CaneUp"
		 "move_m@bag"
		 "MOVE_M@BAIL_BOND_NOT_TAZERED"
		 "MOVE_M@BAIL_BOND_TAZERED"
		 "move_m@brave"
		 "move_m@casual@d"
		 "move_m@drunk@moderatedrunk"
		 "MOVE_M@DRUNK@MODERATEDRUNK"
		 "MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP"
		 "MOVE_M@DRUNK@SLIGHTLYDRUNK"
		 "MOVE_M@DRUNK@VERYDRUNK"
		 "move_m@fire"
		 "move_m@gangster@var_e"
		 "move_m@gangster@var_f"
		 "move_m@gangster@var_i"
		 "move_m@JOG@"
		 "MOVE_M@PRISON_GAURD"
		 "MOVE_P_M_ONE"
		 "MOVE_P_M_ONE_BRIEFCASE"
		 "move_p_m_zero_janitor"
		 "move_p_m_zero_slow"
		 "move_ped_bucket"
		 "move_ped_crouched"
		 "move_ped_mop"
		 "MOVE_M@FEMME@"
		 "MOVE_F@FEMME@"
		 "MOVE_M@GANGSTER@NG"
		 "MOVE_F@GANGSTER@NG"
		 "MOVE_M@POSH@"
		 "MOVE_F@POSH@"
		 "MOVE_M@TOUGH_GUY@"
		 "MOVE_F@TOUGH_GUY@"

		~ NotCrunchyTaco
</summary>
	]]

native "RESET_PED_MOVEMENT_CLIPSET"
	hash "0xAA74EC0CB0AAEA2C"
	jhash (0xB83CEE93)
	arguments {
		Ped "ped",

		float "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		If p1 is 0.0, I believe you are back to normal. 
		If p1 is 1.0, it looks like you can only rotate the ped, not walk.

		Using the following code to reset back to normal
		PED::RESET_PED_MOVEMENT_CLIPSET(PLAYER::PLAYER_PED_ID(), 0.0);
</summary>
	]]

native "SET_PED_STRAFE_CLIPSET"
	hash "0x29A28F3F8CF6D854"
	jhash (0x0BACF010)
	arguments {
		Ped "ped",

		charPtr "clipSet",
	}
	ns "PED"
	returns	"void"

native "RESET_PED_STRAFE_CLIPSET"
	hash "0x20510814175EA477"
	jhash (0xF1967A12)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_PED_WEAPON_MOVEMENT_CLIPSET"
	hash "0x2622E35B77D3ACA2"
	jhash (0xF8BE54DC)
	arguments {
		Ped "ped",

		charPtr "clipSet",
	}
	ns "PED"
	returns	"void"

native "RESET_PED_WEAPON_MOVEMENT_CLIPSET"
	hash "0x97B0DB5B4AA74E77"
	jhash (0xC60C9ACD)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_PED_DRIVE_BY_CLIPSET_OVERRIDE"
	hash "0xED34AB6C5CB36520"
	jhash (0xD4C73595)
	arguments {
		Ped "ped",

		charPtr "clipset",
	}
	ns "PED"
	returns	"void"

native "CLEAR_PED_DRIVE_BY_CLIPSET_OVERRIDE"
	hash "0x4AFE3690D7E0B5AC"
	jhash (0xAEC9163B)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "0x9DBA107B4937F809"
	hash "0x9DBA107B4937F809"
	arguments {
		Any "p0",

		charPtr "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Found in the b617d scripts:
		PED::_9DBA107B4937F809(v_7, "trevor_heist_cover_2h");
</summary>
	]]

native "0xC79196DCB36F6121"
	hash "0xC79196DCB36F6121"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "0x80054D7FCC70EEC6"
	hash "0x80054D7FCC70EEC6"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "SET_PED_IN_VEHICLE_CONTEXT"
	hash "0x530071295899A8C6"
	jhash (0x27F25C0E)
	arguments {
		Ped "ped",

		Hash "context",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		PED::SET_PED_IN_VEHICLE_CONTEXT(l_128, GAMEPLAY::GET_HASH_KEY("MINI_PROSTITUTE_LOW_PASSENGER"));
		PED::SET_PED_IN_VEHICLE_CONTEXT(l_128, GAMEPLAY::GET_HASH_KEY("MINI_PROSTITUTE_LOW_RESTRICTED_PASSENGER"));
		PED::SET_PED_IN_VEHICLE_CONTEXT(l_3212, GAMEPLAY::GET_HASH_KEY("MISS_FAMILY1_JIMMY_SIT"));
		PED::SET_PED_IN_VEHICLE_CONTEXT(l_3212, GAMEPLAY::GET_HASH_KEY("MISS_FAMILY1_JIMMY_SIT_REAR"));
		PED::SET_PED_IN_VEHICLE_CONTEXT(l_95, GAMEPLAY::GET_HASH_KEY("MISS_FAMILY2_JIMMY_BICYCLE"));
		PED::SET_PED_IN_VEHICLE_CONTEXT(num3, GAMEPLAY::GET_HASH_KEY("MISSFBI2_MICHAEL_DRIVEBY"));
		PED::SET_PED_IN_VEHICLE_CONTEXT(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("MISS_ARMENIAN3_FRANKLIN_TENSE"));
		PED::SET_PED_IN_VEHICLE_CONTEXT(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("MISSFBI5_TREVOR_DRIVING"));
</summary>
	]]

native "RESET_PED_IN_VEHICLE_CONTEXT"
	hash "0x22EF8FF8778030EB"
	jhash (0x3C94D88A)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "IS_SCRIPTED_SCENARIO_PED_USING_CONDITIONAL_ANIM"
	hash "0x6EC47A344923E1ED"
	jhash (0x3C30B447)
	arguments {
		Ped "ped",

		charPtr "animDict",

		charPtr "anim",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "SET_PED_ALTERNATE_WALK_ANIM"
	hash "0x6C60394CB4F75E9A"
	jhash (0x895E1D67)
	arguments {
		Ped "ped",

		charPtr "animDict",

		charPtr "animName",

		float "p3",

		BOOL "p4",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>


		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "CLEAR_PED_ALTERNATE_WALK_ANIM"
	hash "0x8844BBFCE30AA9E9"
	jhash (0x5736FB23)
	arguments {
		Ped "ped",

		float "p1",
	}
	ns "PED"
	returns	"void"

native "SET_PED_ALTERNATE_MOVEMENT_ANIM"
	hash "0x90A43CC281FFAB46"
	jhash (0xBA84FD8C)
	arguments {
		Ped "ped",

		int "stance",

		charPtr "animDictionary",

		charPtr "animationName",

		float "p4",

		BOOL "p5",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		stance:
		0 = idle
		1 = walk
		2 = running

		p5 = usually set to true

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "CLEAR_PED_ALTERNATE_MOVEMENT_ANIM"
	hash "0xD8D19675ED5FBDCE"
	jhash (0x7A7F5BC3)
	arguments {
		Ped "ped",

		int "stance",

		float "p2",
	}
	ns "PED"
	returns	"void"

native "SET_PED_GESTURE_GROUP"
	hash "0xDDF803377F94AAA8"
	jhash (0x170DA109)
	arguments {
		Ped "ped",

		charPtr "animGroupGesture",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		From the scripts:
		PED::SET_PED_GESTURE_GROUP(PLAYER::PLAYER_PED_ID(),
		"ANIM_GROUP_GESTURE_MISS_FRA0");
		PED::SET_PED_GESTURE_GROUP(PLAYER::PLAYER_PED_ID(),
		"ANIM_GROUP_GESTURE_MISS_DocksSetup1");
</summary>
	]]

native "GET_ANIM_INITIAL_OFFSET_POSITION"
	hash "0xBE22B26DD764C040"
	jhash (0xC59D4268)
	arguments {
		charPtr "animDict",

		charPtr "animName",

		float "x",

		float "y",

		float "z",

		float "xRot",

		float "yRot",

		float "zRot",

		float "p8",

		int "p9",
	}
	ns "PED"
	returns	"Vector3"
	doc [[!
<summary>


		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "GET_ANIM_INITIAL_OFFSET_ROTATION"
	hash "0x4B805E6046EE9E47"
	jhash (0x5F7789E6)
	arguments {
		charPtr "animDict",

		charPtr "animName",

		float "x",

		float "y",

		float "z",

		float "xRot",

		float "yRot",

		float "zRot",

		float "p8",

		int "p9",
	}
	ns "PED"
	returns	"Vector3"
	doc [[!
<summary>


		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "GET_PED_DRAWABLE_VARIATION"
	hash "0x67F3780DD425D4FC"
	jhash (0x29850FE2)
	arguments {
		Ped "ped",

		int "componentId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Ids

		1 
		2 
		3 
		4 
		5 
		6 
		7 - ------
		8 - Accessories 1
		9 - Accessories 2
		10
		11 - Auxiliary parts for torso
</summary>
	]]

native "GET_NUMBER_OF_PED_DRAWABLE_VARIATIONS"
	hash "0x27561561732A7842"
	jhash (0x9754C27D)
	arguments {
		Ped "ped",

		int "componentId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "GET_PED_TEXTURE_VARIATION"
	hash "0x04A355E041E004E6"
	jhash (0xC0A8590A)
	arguments {
		Ped "ped",

		int "componentId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "GET_NUMBER_OF_PED_TEXTURE_VARIATIONS"
	hash "0x8F7156A3142A6BAD"
	jhash (0x83D9FBE7)
	arguments {
		Ped "ped",

		int "componentId",

		int "drawableId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "GET_NUMBER_OF_PED_PROP_DRAWABLE_VARIATIONS"
	hash "0x5FAF9754E789FB47"
	jhash (0xC9780B95)
	arguments {
		Ped "ped",

		int "propId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS"
	hash "0xA6E7F1CEB523E171"
	jhash (0x4892B882)
	arguments {
		Ped "ped",

		int "propId",

		int "drawableId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Need to check behavior when drawableId = -1

		- Doofy.Ass
		Why this function doesn't work and return nill value?
		GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS(PLAYER.PLAYER_PED_ID(), 0, 5)

		tick: scripts/addins/menu_execute.lua:51: attempt to call field 'GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS' (a nil value)


		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "GET_PED_PALETTE_VARIATION"
	hash "0xE3DD5F2A84B42281"
	jhash (0xEF1BC082)
	arguments {
		Ped "ped",

		int "componentId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "0x9E30E91FB03A2CAF"
	hash "0x9E30E91FB03A2CAF"
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",
	}
	ns "PED"
	returns	"BOOL"

native "0x1E77FA7A62EE6C4C"
	hash "0x1E77FA7A62EE6C4C"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"Any"

native "0xF033419D1B81FAE8"
	hash "0xF033419D1B81FAE8"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"Any"

native "IS_PED_COMPONENT_VARIATION_VALID"
	hash "0xE825F6B6CEA7671D"
	jhash (0x952ABD9A)
	arguments {
		Ped "ped",

		int "componentId",

		int "drawableId",

		int "textureId",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if the component variation is valid, this works great for randomizing components using loops.

		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "SET_PED_COMPONENT_VARIATION"
	hash "0x262B14F48D29DE80"
	jhash (0xD4F7B05C)
	arguments {
		Ped "ped",

		int "componentId",

		int "drawableId",

		int "textureId",

		int "paletteId",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		paletteId/palletColor -  0 to 3. 
		enum PedVariationData
		{
			PED_VARIATION_FACE = 0,
			PED_VARIATION_HEAD = 1,
			PED_VARIATION_HAIR = 2,
			PED_VARIATION_TORSO = 3,
			PED_VARIATION_LEGS = 4,
			PED_VARIATION_HANDS = 5,
			PED_VARIATION_FEET = 6,
			PED_VARIATION_EYES = 7,
			PED_VARIATION_ACCESSORIES = 8,
			PED_VARIATION_TASKS = 9,
			PED_VARIATION_TEXTURES = 10,
			PED_VARIATION_TORSO2 = 11
		};
		Usage: 
		SET_PED_COMPONENT_VARIATION(playerPed, PED_VARIATION_FACE, GET_NUMBER_OF_PED_DRAWABLE_VARIATIONS(playerPed, PED_VARIATION_FACE), GET_NUMBER_OF_PED_TEXTURE_VARIATIONS(playerPed, PED_VARIATION_FACE, 0), 2);


		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "SET_PED_RANDOM_COMPONENT_VARIATION"
	hash "0xC8A9481A01E63C28"
	jhash (0x4111BA46)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p1 is always false in R* scripts.

		Quick disassembly seems to indicate that p1 is unused.

		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "SET_PED_RANDOM_PROPS"
	hash "0xC44AA05345C992C6"
	jhash (0xE3318E0E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "SET_PED_DEFAULT_COMPONENT_VARIATION"
	hash "0x45EEE61580806D63"
	jhash (0xC866A984)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Sets Ped Default Clothes
</summary>
	]]

native "SET_PED_BLEND_FROM_PARENTS"
	hash "0x137BBD05230DB22D"
	jhash (0x837BD370)
	arguments {
		Ped "ped",

		Ped "father",

		Ped "mother",

		float "fathersSide",

		float "mothersSide",
	}
	ns "PED"
	returns	"void"

native "SET_PED_HEAD_BLEND_DATA"
	hash "0x9414E18B9434C2FE"
	jhash (0x60746B88)
	arguments {
		Ped "ped",

		int "shapeFirstID",

		int "shapeSecondID",

		int "shapeThirdID",

		int "skinFirstID",

		int "skinSecondID",

		int "skinThirdID",

		float "shapeMix",

		float "skinMix",

		float "thirdMix",

		BOOL "isParent",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		The "shape" parameters control the shape of the ped's face. The "skin" parameters control the skin tone. ShapeMix and skinMix control how much the first and second IDs contribute,(typically mother and father.) ThirdMix overrides the others in favor of the third IDs. IsParent is set for "children" of the player character's grandparents during old-gen character creation. It has unknown effect otherwise.

		The IDs start at zero and go Male Non-DLC, Female Non-DLC, Male DLC, and Female DLC.

		!!!Can someone add working example for this???

		try this:
				headBlendData headData;
				_GET_PED_HEAD_BLEND_DATA(PLAYER_PED_ID(), &amp;headData);

				SET_PED_HEAD_BLEND_DATA(PLAYER_PED_ID(), headData.shapeFirst, headData.shapeSecond, headData.shapeThird, headData.skinFirst, headData.skinSecond
					, headData.skinThird, headData.shapeMix, headData.skinMix, headData.skinThird, 0);


		For more info please refer to this topic. 
		gtaforums.com/topic/858970-all-gtao-face-ids-pedset-ped-head-blend-data-explained
</summary>
	]]

native "_GET_PED_HEAD_BLEND_DATA"
	hash "0x2746BD9D88C5C5D0"
	arguments {
		Ped "ped",

		AnyPtr "headBlendData",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		The pointer is to a padded struct that matches the arguments to SET_PED_HEAD_BLEND_DATA(...). There are 4 bytes of padding after each field.

		(Edit) Console Hash: 0x44E1680C

		pass this struct in the second parameter 
		typedef struct
		{
		        int shapeFirst, shapeSecond, shapeThird; 
		        int skinFirst, skinSecond, skinThird; 
			float shapeMix, skinMix, thirdMix;
		} headBlendData;
</summary>
	]]

native "UPDATE_PED_HEAD_BLEND_DATA"
	hash "0x723538F61C647C5A"
	jhash (0x5CB76219)
	arguments {
		Ped "ped",

		float "shapeMix",

		float "skinMix",

		float "thirdMix",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		See SET_PED_HEAD_BLEND_DATA().
</summary>
	]]

native "_SET_PED_EYE_COLOR"
	hash "0x50B56988B170AFDF"
	arguments {
		Ped "ped",

		int "index",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Used for freemode (online) characters.

		For some reason, the scripts use a rounded float for the index.
</summary>
	]]

native "SET_PED_HEAD_OVERLAY"
	hash "0x48F44967FA05CC1E"
	jhash (0xD28DBA90)
	arguments {
		Ped "ped",

		int "overlayID",

		int "index",

		float "opacity",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		OverlayID ranges from 0 to 12, index from 0 to _GET_NUM_OVERLAY_VALUES(overlayID)-1, and opacity from 0.0 to 1.0. 

		overlayID       Part                  Index, to disable
		0               Blemishes             0 - 23, 255
		1               Facial Hair           0 - 28, 255
		2               Eyebrows              0 - 33, 255
		3               Ageing                0 - 14, 255
		4               Makeup                0 - 74, 255
		5               Blush                 0 - 6, 255
		6               Complexion            0 - 11, 255
		7               Sun Damage            0 - 10, 255
		8               Lipstick              0 - 9, 255
		9               Moles/Freckles        0 - 17, 255
		10              Chest Hair            0 - 16, 255
		11              Body Blemishes        0 - 11, 255
		12              Add Body Blemishes    0 - 1, 255
</summary>
	]]

native "_GET_PED_HEAD_OVERLAY_VALUE"
	hash "0xA60EF3B6461A4D43"
	arguments {
		Ped "ped",

		int "overlayID",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Likely a char, if that overlay is not set, e.i. "None" option, returns 255;

</summary>
	]]

native "_GET_NUM_HEAD_OVERLAY_VALUES"
	hash "0xCF1CE768BB43480E"
	jhash (0xFF43C18D)
	arguments {
		int "overlayID",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Used with freemode (online) characters.
</summary>
	]]

native "_SET_PED_HEAD_OVERLAY_COLOR"
	hash "0x497BF74A7B9CB952"
	arguments {
		Ped "ped",

		int "overlayID",

		int "colorType",

		int "colorID",

		int "secondColorID",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Used for freemode (online) characters.

		ColorType is 1 for eyebrows, beards, and chest hair; 2 for blush and lipstick; and 0 otherwise, though not called in those cases.

		Called after SET_PED_HEAD_OVERLAY().
</summary>
	]]

native "_SET_PED_HAIR_COLOR"
	hash "0x4CFFC65454C93A49"
	arguments {
		Ped "ped",

		int "colorID",

		int "highlightColorID",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Used for freemode (online) characters.
</summary>
	]]

native "_GET_NUM_HAIR_COLORS"
	hash "0xE5C0CF872C2AD150"
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Used for freemode (online) characters.
</summary>
	]]

native "_GET_NUM_MAKEUP_COLORS"
	hash "0xD1F7CA1535D22818"
	alias "0xD1F7CA1535D22818"
	ns "PED"
	returns	"int"

native "0x4852FC386E2E1BB5"
	hash "0x4852FC386E2E1BB5"
	arguments {
		Any "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",
	}
	ns "PED"
	returns	"void"

native "0x013E5CFC38CD5387"
	hash "0x013E5CFC38CD5387"
	arguments {
		Any "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",
	}
	ns "PED"
	returns	"void"

native "0xED6D8E27A43B8CDE"
	hash "0xED6D8E27A43B8CDE"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"BOOL"

native "0xEA9960D07DADCF10"
	hash "0xEA9960D07DADCF10"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"int"

native "0x3E802F11FBE27674"
	hash "0x3E802F11FBE27674"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"BOOL"

native "0xF41B5D290C99A3D6"
	hash "0xF41B5D290C99A3D6"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"BOOL"

native "_IS_PED_HAIR_COLOR_VALID"
	hash "0xE0D36E5D9E99CC21"
	arguments {
		int "colorID",
	}
	alias "0xE0D36E5D9E99CC21"
	ns "PED"
	returns	"BOOL"

native "0xAAA6A3698A69E048"
	hash "0xAAA6A3698A69E048"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"Any"

native "_IS_PED_LIPSTICK_COLOR_VALID"
	hash "0x0525A2C2562F3CD4"
	arguments {
		int "colorID",
	}
	alias "0x0525A2C2562F3CD4"
	ns "PED"
	returns	"BOOL"

native "_IS_PED_BLUSH_COLOR_VALID"
	hash "0x604E810189EE3A59"
	arguments {
		int "colorID",
	}
	alias "0x604E810189EE3A59"
	ns "PED"
	returns	"BOOL"

native "0xC56FBF2F228E1DAC"
	hash "0xC56FBF2F228E1DAC"
	arguments {
		Hash "modelHash",

		Any "p1",

		Any "p2",
	}
	ns "PED"
	returns	"Any"

native "_SET_PED_FACE_FEATURE"
	hash "0x71A5C1DBA060049E"
	arguments {
		Ped "ped",

		int "index",

		float "scale",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Sets the various freemode face features, e.g. nose length, chin shape. Scale ranges from -1.0 to 1.0.

		Index can be 0 

		Edit:----&gt;Thanks to the first user.

		    Enum Face_Feature
		        Nose_Width
		        Nose_Peak_Hight
		        Nose_Peak_Lenght
		        Nose_Bone_High
		        Nose_Peak_Lowering
		        Nose_Bone_Twist
		        EyeBrown_High
		        EyeBrown_Forward
		        Cheeks_Bone_High
		        Cheeks_Bone_Width
		        Cheeks_Width
		        Eyes_Openning
		        Lips_Thickness
		        Jaw_Bone_Width 'Bone size to sides
		        Jaw_Bone_Back_Lenght 'Bone size to back
		        Chimp_Bone_Lowering 'Go Down
		        Chimp_Bone_Lenght 'Go forward
		        Chimp_Bone_Width
		        Chimp_Hole
		        Neck_Thikness
		    End Enum

		Example in VB.Net

		Public Shared Sub SET_PED_FACE_FEATURE(FreemodePed As Ped, Index As Face_Feature, Scale As Single)

		Native.Function.Call(Native.Hash._SET_PED_FACE_FEATURE, FreemodePed, Index, Scale)
		End Sub
</summary>
	]]

native "HAS_PED_HEAD_BLEND_FINISHED"
	hash "0x654CD0A825161131"
	jhash (0x2B1BD9C5)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "0x4668D80430D6C299"
	hash "0x4668D80430D6C299"
	jhash (0x894314A4)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "0xCC9682B8951C5229"
	hash "0xCC9682B8951C5229"
	jhash (0x57E5B3F9)
	arguments {
		Ped "ped",

		int "r",

		int "g",

		int "b",

		int "p4",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p4 seems to vary from 0 to 3.
</summary>
	]]

native "0xA21C118553BBDF02"
	hash "0xA21C118553BBDF02"
	jhash (0xC6F36292)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "_GET_FIRST_PARENT_ID_FOR_PED_TYPE"
	hash "0x68D353AB88B97E0C"
	jhash (0x211DEFEC)
	arguments {
		int "type",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Type equals 0 for male non-dlc, 1 for female non-dlc, 2 for male dlc, and 3 for female dlc.

		Used when calling SET_PED_HEAD_BLEND_DATA.
</summary>
	]]

native "_GET_NUM_PARENT_PEDS_OF_TYPE"
	hash "0x5EF37013A6539C9D"
	jhash (0x095D3BD8)
	arguments {
		int "type",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Type equals 0 for male non-dlc, 1 for female non-dlc, 2 for male dlc, and 3 for female dlc.
</summary>
	]]

native "0x39D55A620FCB6A3A"
	hash "0x39D55A620FCB6A3A"
	jhash (0x45F3BDFB)
	arguments {
		Ped "ped",

		int "slot",

		int "drawableId",

		int "textureId",
	}
	ns "PED"
	returns	"Any"
	doc [[!
<summary>
		from extreme3.c4
		PED::_39D55A620FCB6A3A(PLAYER::PLAYER_PED_ID(), 8, PED::GET_PED_DRAWABLE_VARIATION(PLAYER::PLAYER_PED_ID(), 8), PED::GET_PED_TEXTURE_VARIATION(PLAYER::PLAYER_PED_ID(), 8));

		p1 is probably componentId
</summary>
	]]

native "0x66680A92700F43DF"
	hash "0x66680A92700F43DF"
	jhash (0xC6517D52)
	arguments {
		Ped "p0",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Normally returns true. Returns false briefly whilst getting into a plane. This is probably a check to see if the ped model and all its components/drawables are properly loaded yet.
</summary>
	]]

native "0x5AAB586FFEC0FD96"
	hash "0x5AAB586FFEC0FD96"
	jhash (0x6435F67F)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "_IS_PED_PROP_VALID"
	hash "0x2B16A3BFF1FBCE49"
	jhash (0xC0E23671)
	arguments {
		Ped "ped",

		int "componentId",

		int "drawableId",

		int "TextureId",
	}
	alias "0x2B16A3BFF1FBCE49"
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "0x784002A632822099"
	hash "0x784002A632822099"
	jhash (0x3B0CA391)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Normally returns true. Returns false briefly whilst putting on a helmet after getting onto a motorbike. Not sure what that's about.
</summary>
	]]

native "0xF79F9DEF0AADE61A"
	hash "0xF79F9DEF0AADE61A"
	jhash (0xFD103BA7)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "GET_PED_PROP_INDEX"
	hash "0x898CC20EA75BACD8"
	jhash (0x746DDAC0)
	arguments {
		Ped "ped",

		int "componentId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "SET_PED_PROP_INDEX"
	hash "0x93376B65A266EB5F"
	jhash (0x0829F2E2)
	arguments {
		Ped "ped",

		int "componentId",

		int "drawableId",

		int "TextureId",

		BOOL "attach",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		ComponentId can be set to various things based on what category you're wanting to set
		enum PedPropsData
		{
			PED_PROP_HATS = 0,
			PED_PROP_GLASSES = 1,
			PED_PROP_EARS = 2,
			PED_PROP_WATCHES = 3,
		};
		Usage: SET_PED_PROP_INDEX(playerPed, PED_PROP_HATS, GET_NUMBER_OF_PED_PROP_DRAWABLE_VARIATIONS(playerPed, PED_PROP_HATS), GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS(playerPed, PED_PROP_HATS, 0), TRUE);

		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "KNOCK_OFF_PED_PROP"
	hash "0x6FD7816A36615F48"
	jhash (0x08D8B180)
	arguments {
		Ped "ped",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",

		BOOL "p4",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "CLEAR_PED_PROP"
	hash "0x0943E5B8E078E76E"
	jhash (0x2D23D743)
	arguments {
		Ped "ped",

		int "propId",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "CLEAR_ALL_PED_PROPS"
	hash "0xCD8A7537A9B52F06"
	jhash (0x81DF8B43)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "0xAFF4710E2A0A6C12"
	hash "0xAFF4710E2A0A6C12"
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "GET_PED_PROP_TEXTURE_INDEX"
	hash "0xE131A28626F81AB2"
	jhash (0x922A6653)
	arguments {
		Ped "ped",

		int "componentId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "0x1280804F7CFD2D6C"
	hash "0x1280804F7CFD2D6C"
	jhash (0x7BCD8991)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "0x36C6984C3ED0C911"
	hash "0x36C6984C3ED0C911"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		when player character is used plays remove scuba gear animation
</summary>
	]]

native "0xB50EB4CCB29704AC"
	hash "0xB50EB4CCB29704AC"
	jhash (0x080275EE)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "0xFEC9A3B1820F3331"
	hash "0xFEC9A3B1820F3331"
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"BOOL"

native "SET_BLOCKING_OF_NON_TEMPORARY_EVENTS"
	hash "0x9F8AA94D6D97DBF4"
	jhash (0xDFE34E4A)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		works with AI::TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS to make a ped completely oblivious to all events going on around him
</summary>
	]]

native "SET_PED_BOUNDS_ORIENTATION"
	hash "0x4F5F651ACCC9C4CF"
	jhash (0xCFA20D68)
	arguments {
		Ped "ped",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",
	}
	ns "PED"
	returns	"void"

native "REGISTER_TARGET"
	hash "0x2F25D9AEFA34FBA2"
	jhash (0x50A95442)
	arguments {
		Ped "ped",

		Ped "target",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		PED::REGISTER_TARGET(l_216, PLAYER::PLAYER_PED_ID()); from re_prisonbreak.txt.

		l_216 = RECSBRobber1
</summary>
	]]

native "REGISTER_HATED_TARGETS_AROUND_PED"
	hash "0x9222F300BF8354FE"
	jhash (0x7F87559E)
	arguments {
		Ped "ped",

		float "radius",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Based on TASK_COMBAT_HATED_TARGETS_AROUND_PED, the parameters are likely similar (PedHandle, and area to attack in).
</summary>
	]]

native "GET_RANDOM_PED_AT_COORD"
	hash "0x876046A8E3A4B71C"
	jhash (0xDC8239EB)
	arguments {
		float "x",

		float "y",

		float "z",

		float "xRadius",

		float "yRadius",

		float "zRadius",

		int "pedType",
	}
	ns "PED"
	returns	"Ped"
	doc [[!
<summary>
		Gets a random ped in the x/y/zRadius near the x/y/z coordinates passed. 

		Ped Types:
		Any = -1
		Player = 1
		Male = 4 
		Female = 5 
		Cop = 6
		Human = 26
		SWAT = 27 
		Animal = 28
		Army = 29
</summary>
	]]

native "GET_CLOSEST_PED"
	hash "0xC33AB876A77F8164"
	jhash (0x8F6C1F55)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		BOOL "p4",

		BOOL "p5",

		PedPtr "outPed",

		BOOL "p7",

		BOOL "p8",

		int "pedType",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Gets the closest ped in a radius.

		Ped Types:
		Any ped = -1
		Player = 1
		Male = 4 
		Female = 5 
		Cop = 6
		Human = 26
		SWAT = 27 
		Animal = 28
		Army = 29

		------------------
		P4 P5 P7 P8
		1  0  x  x  = return nearest walking Ped
		1  x  0  x  = return nearest walking Ped
		x  1  1  x  = return Ped you are using
		0  0  x  x  = no effect
		0  x  0  x  = no effect

		x = can be 1 or 0. Does not have any obvious changes.

		This function does not return ped who is:
		1. Standing still
		2. Driving
		3. Fleeing
		4. Attacking

		This function only work if the ped is:
		1. walking normally.
		2. waiting to cross a road.

		Note: PED::GET_PED_NEARBY_PEDS works for more peds.
</summary>
	]]

native "SET_SCENARIO_PEDS_TO_BE_RETURNED_BY_NEXT_COMMAND"
	hash "0x14F19A8782C8071E"
	jhash (0x85615FD0)
	arguments {
		BOOL "value",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Sets a value indicating whether scenario peds should be returned by the next call to a command that returns peds. Eg. GET_CLOSEST_PED.
</summary>
	]]

native "0x03EA03AF85A85CB7"
	hash "0x03EA03AF85A85CB7"
	jhash (0x18DD76A1)
	arguments {
		Ped "ped",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",

		BOOL "p4",

		BOOL "p5",

		BOOL "p6",

		BOOL "p7",

		Any "p8",
	}
	ns "PED"
	returns	"BOOL"

native "0xDED5AF5A0EA4B297"
	hash "0xDED5AF5A0EA4B297"
	jhash (0x6D55B3B3)
	arguments {
		Ped "driver",

		float "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Scripts use 0.2, 0.5 and 1.0.

		SET_DRIVER_*
</summary>
	]]

native "SET_DRIVER_ABILITY"
	hash "0xB195FFA8042FC5C3"
	jhash (0xAAD4012C)
	arguments {
		Ped "driver",

		float "ability",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		The function specifically verifies the value is equal to, or less than 1.0f. If it is greater than 1.0f, the function does nothing at all.
</summary>
	]]

native "SET_DRIVER_AGGRESSIVENESS"
	hash "0xA731F608CA104E3C"
	jhash (0x8B02A8FB)
	arguments {
		Ped "driver",

		float "aggressiveness",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		range 0.0f - 1.0f
</summary>
	]]

native "CAN_PED_RAGDOLL"
	hash "0x128F79EDCECE4FD5"
	jhash (0xC0EFB7A3)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Prevents the ped from going limp.

		[Example: Can prevent peds from falling when standing on moving vehicles.]
</summary>
	]]

native "SET_PED_TO_RAGDOLL"
	hash "0xAE99FB955581844A"
	jhash (0x83CB5052)
	arguments {
		Ped "ped",

		int "time1",

		int "time2",

		int "ragdollType",

		BOOL "p4",

		BOOL "p5",

		BOOL "p6",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		time1- Time Ped is in ragdoll mode(ms)

		time2- Unknown time, in milliseconds

		ragdollType-
		0 : Normal ragdoll
		1 : Falls with stiff legs/body
		2 : Narrow leg stumble(may not fall)
		3 : Wide leg stumble(may not fall)

		p4, p5, p6- No idea. In R*'s scripts they are usually either "true, true, false" or "false, false, false".




		EDIT 3/11/16: unclear what 'mircoseconds' mean-- a microsecond is 1000x a ms, so time2 must be 1000x time1?  more testing needed.  -sob

		Edit Mar 21, 2017: removed part about time2 being the microseconds version of time1. this just isn't correct. time2 is in milliseconds, and time1 and time2 don't seem to be connected in any way.
</summary>
	]]

native "SET_PED_TO_RAGDOLL_WITH_FALL"
	hash "0xD76632D99E4966C8"
	jhash (0xFA12E286)
	arguments {
		Ped "ped",

		int "time",

		int "p2",

		int "ragdollType",

		float "x",

		float "y",

		float "z",

		float "p7",

		float "p8",

		float "p9",

		float "p10",

		float "p11",

		float "p12",

		float "p13",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Return variable is never used in R*'s scripts.

		Not sure what p2 does. It seems like it would be a time judging by it's usage in R*'s scripts, but didn't seem to affect anything in my testings.

		x, y, and z are coordinates, most likely to where the ped will fall.

		p7 is probably the force of the fall, but untested, so I left the variable name the same.

		p8 to p13 are always 0f in R*'s scripts.

		(Simplified) Example of the usage of the function from R*'s scripts:
		ped::set_ped_to_ragdoll_with_fall(ped, 1500, 2000, 1, -entity::get_entity_forward_vector(ped), 1f, 0f, 0f, 0f, 0f, 0f, 0f);

</summary>
	]]

native "SET_PED_RAGDOLL_ON_COLLISION"
	hash "0xF0A4F1BBF4FA7497"
	jhash (0x2654A0F4)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Causes Ped to ragdoll on collision with any object (e.g Running into trashcan). If applied to player you will sometimes trip on the sidewalk.
</summary>
	]]

native "IS_PED_RAGDOLL"
	hash "0x47E4E977581C5B55"
	jhash (0xC833BBE1)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		If the ped handle passed through the parenthesis is in a ragdoll state this will return true.
</summary>
	]]

native "IS_PED_RUNNING_RAGDOLL_TASK"
	hash "0xE3B6097CC25AA69E"
	jhash (0x44A153F2)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_RAGDOLL_FORCE_FALL"
	hash "0x01F6594B923B9251"
	jhash (0x20A5BDE0)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Any"

native "RESET_PED_RAGDOLL_TIMER"
	hash "0x9FA4664CF62E47E8"
	jhash (0xF2865370)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_RAGDOLL"
	hash "0xB128377056A54E2A"
	jhash (0xCF1384C4)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0xD1871251F3B5ACD7"
	hash "0xD1871251F3B5ACD7"
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_RUNNING_MOBILE_PHONE_TASK"
	hash "0x2AFE52F782F25775"
	jhash (0xFB2AFED1)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "0xA3F3564A5B3646C0"
	hash "0xA3F3564A5B3646C0"
	jhash (0x97353375)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Only called once in the scripts:

		if (sub_1abd() &amp;&amp; (!PED::_A3F3564A5B3646C0(l_8C))) {
		    if (sub_52e3("RESNA_CELLR", 0)) {
		        PED::SET_PED_CAN_PLAY_GESTURE_ANIMS(l_8C, 1);
		        PED::SET_PED_CAN_PLAY_AMBIENT_ANIMS(l_8C, 1);
		        PED::SET_PED_CAN_PLAY_VISEME_ANIMS(l_8C, 1, 0);
		        l_184 += 1;
		    }
		}
</summary>
	]]

native "_SET_PED_RAGDOLL_BLOCKING_FLAGS"
	hash "0x26695EC767728D84"
	jhash (0x9C8F830D)
	arguments {
		Ped "ped",

		int "flags",
	}
	alias "0x26695EC767728D84"
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Works for both player and peds, but some flags don't seem to work for the player (1, for example)

		1 - Blocks ragdolling when shot.
		2 - Blocks ragdolling when hit by a vehicle. The ped still might play a falling animation.
		4 - Blocks ragdolling when set on fire.

		-----------------------------------------------------------------------

		There seem to be 26 flags
</summary>
	]]

native "_RESET_PED_RAGDOLL_BLOCKING_FLAGS"
	hash "0xD86D101FCFD00A4B"
	jhash (0x77CBA290)
	arguments {
		Ped "ped",

		int "flags",
	}
	alias "0xD86D101FCFD00A4B"
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		There seem to be 26 flags
</summary>
	]]

native "SET_PED_ANGLED_DEFENSIVE_AREA"
	hash "0xC7F76DF27A5045A1"
	jhash (0x3EFBDD9B)
	arguments {
		Ped "ped",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		BOOL "p8",

		BOOL "p9",
	}
	ns "PED"
	returns	"void"

native "SET_PED_SPHERE_DEFENSIVE_AREA"
	hash "0x9D3151A373974804"
	jhash (0xBD96D8E8)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "radius",

		BOOL "p5",

		BOOL "p6",
	}
	ns "PED"
	returns	"void"

native "SET_PED_DEFENSIVE_SPHERE_ATTACHED_TO_PED"
	hash "0xF9B8F91AAD3B953E"
	jhash (0x40638BDC)
	arguments {
		Ped "ped",

		Ped "target",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		float "radius",

		BOOL "p6",
	}
	alias "0xF9B8F91AAD3B953E"
	ns "PED"
	returns	"void"

native "0xE4723DB6E736CCFF"
	hash "0xE4723DB6E736CCFF"
	jhash (0x4763B2C6)
	arguments {
		Ped "ped",

		Any "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		BOOL "p6",
	}
	ns "PED"
	returns	"void"

native "SET_PED_DEFENSIVE_AREA_ATTACHED_TO_PED"
	hash "0x4EF47FE21698A8B6"
	jhash (0x74BDA7CE)
	arguments {
		Ped "ped",

		Ped "attachPed",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		BOOL "p9",

		BOOL "p10",
	}
	ns "PED"
	returns	"void"

native "SET_PED_DEFENSIVE_AREA_DIRECTION"
	hash "0x413C6C763A4AFFAD"
	jhash (0xB66B0C9A)
	arguments {
		Ped "ped",

		float "p1",

		float "p2",

		float "p3",

		BOOL "p4",
	}
	ns "PED"
	returns	"void"

native "REMOVE_PED_DEFENSIVE_AREA"
	hash "0x74D4E028107450A9"
	jhash (0x34AAAFA5)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Ped will no longer get angry when you stay near him.
</summary>
	]]

native "GET_PED_DEFENSIVE_AREA_POSITION"
	hash "0x3C06B8786DD94CD1"
	jhash (0xCB65198D)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"Vector3"

native "0xBA63D9FE45412247"
	hash "0xBA63D9FE45412247"
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_PREFERRED_COVER_SET"
	hash "0x8421EB4DA7E391B9"
	jhash (0xF3B7EFBF)
	arguments {
		Ped "ped",

		Any "itemSet",
	}
	alias "0x8421EB4DA7E391B9"
	ns "PED"
	returns	"void"

native "REMOVE_PED_PREFERRED_COVER_SET"
	hash "0xFDDB234CF74073D9"
	jhash (0xA0134498)
	arguments {
		Ped "ped",
	}
	alias "0xFDDB234CF74073D9"
	ns "PED"
	returns	"void"

native "REVIVE_INJURED_PED"
	hash "0x8D8ACD8388CD99CE"
	jhash (0x14D3E6E3)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		It will revive/cure the injured ped. The condition is ped must not be dead.

		Upon setting and converting the health int, found, if health falls below 5, the ped will lay on the ground in pain(Maximum default health is 100).

		This function is well suited there.
</summary>
	]]

native "RESURRECT_PED"
	hash "0x71BC8E838B9C6035"
	jhash (0xA4B82097)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		This function will simply bring the dead person back to life.

		Try not to use it alone, since using this function alone, will make peds fall through ground in hell(well for the most of the times).

		Instead, before calling this function, you may want to declare the position, where your Resurrected ped to be spawn at.(For instance, Around 2 floats of Player's current position.) 

		Also, disabling any assigned task immediately helped in the number of scenarios, where If you want peds to perform certain decided tasks.
</summary>
	]]

native "SET_PED_NAME_DEBUG"
	hash "0x98EFA132A4117BE1"
	jhash (0x20D6273E)
	arguments {
		Ped "ped",

		charPtr "name",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.

		*untested but char *name could also be a hash for a localized string
</summary>
	]]

native "GET_PED_EXTRACTED_DISPLACEMENT"
	hash "0xE0AF41401ADF87E3"
	jhash (0x5231F901)
	arguments {
		Ped "ped",

		BOOL "worldSpace",
	}
	ns "PED"
	returns	"Vector3"
	doc [[!
<summary>
		Gets the offset the specified ped has moved since the previous tick.

		If worldSpace is false, the returned offset is relative to the ped. That is, if the ped has moved 1 meter right and 5 meters forward, it'll return 1,5,0.

		If worldSpace is true, the returned offset is relative to the world. That is, if the ped has moved 1 meter on the X axis and 5 meters on the Y axis, it'll return 1,5,0.
</summary>
	]]

native "SET_PED_DIES_WHEN_INJURED"
	hash "0x5BA7919BED300023"
	jhash (0xE94E24D4)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"Any"

native "SET_PED_ENABLE_WEAPON_BLOCKING"
	hash "0x97A790315D3831FD"
	jhash (0x4CAD1A4A)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"Any"

native "0xF9ACF4A08098EA25"
	hash "0xF9ACF4A08098EA25"
	jhash (0x141CC936)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p1 was always 1 (true).

		Kicks the ped from the current vehicle and keeps the rendering-focus on this ped (also disables its collision). If doing this for your player ped, you'll still be able to drive the vehicle.

		Actual name begins with 'S'
</summary>
	]]

native "RESET_PED_VISIBLE_DAMAGE"
	hash "0x3AC1F7B898F30C05"
	jhash (0xC4BC4841)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Any"

native "APPLY_PED_BLOOD_DAMAGE_BY_ZONE"
	hash "0x816F6981C60BF53B"
	jhash (0x1E54DB12)
	arguments {
		Ped "ped",

		Any "p1",

		float "p2",

		float "p3",

		Any "p4",
	}
	alias "0x816F6981C60BF53B"
	ns "PED"
	returns	"void"

native "APPLY_PED_BLOOD"
	hash "0x83F7E01C7B769A26"
	jhash (0x376CE3C0)
	arguments {
		Ped "ped",

		int "boneIndex",

		float "xRot",

		float "yRot",

		float "zRot",

		charPtr "woundType",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Found one occurence in re_crashrescue.c4

		PED::APPLY_PED_BLOOD(l_4B, 3, 0.0, 0.0, 0.0, "wound_sheet");




</summary>
	]]

native "APPLY_PED_BLOOD_BY_ZONE"
	hash "0x3311E47B91EDCBBC"
	jhash (0x8F3F3A9C)
	arguments {
		Ped "ped",

		Any "p1",

		float "p2",

		float "p3",

		AnyPtr "p4",
	}
	alias "0x3311E47B91EDCBBC"
	ns "PED"
	returns	"void"

native "APPLY_PED_BLOOD_SPECIFIC"
	hash "0xEF0D582CBF2D9B0F"
	jhash (0xFC13CE80)
	arguments {
		Ped "ped",

		Any "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		Any "p6",

		float "p7",

		AnyPtr "p8",
	}
	alias "0xEF0D582CBF2D9B0F"
	ns "PED"
	returns	"void"

native "APPLY_PED_DAMAGE_DECAL"
	hash "0x397C38AA7B4A5F83"
	jhash (0x8A13A41F)
	arguments {
		Ped "ped",

		int "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		int "p7",

		BOOL "p8",

		charPtr "p9",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		APPLY_PED_DAMAGE_DECAL(ped, 1, 0.5f, 0.513f, 0f, 1f, unk, 0, 0, "blushing");
</summary>
	]]

native "APPLY_PED_DAMAGE_PACK"
	hash "0x46DF918788CB093F"
	jhash (0x208D0CB8)
	arguments {
		Ped "ped",

		charPtr "damagePack",

		float "damage",

		float "mult",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Damage Packs:

		"SCR_TrevorTreeBang"
		"HOSPITAL_0"
		"HOSPITAL_1"
		"HOSPITAL_2"
		"HOSPITAL_3"
		"HOSPITAL_4"
		"HOSPITAL_5"
		"HOSPITAL_6"
		"HOSPITAL_7"
		"HOSPITAL_8"
		"HOSPITAL_9"
		"SCR_Dumpster"
		"BigHitByVehicle"
		"SCR_Finale_Michael_Face"
		"SCR_Franklin_finb"
		"SCR_Finale_Michael"
		"SCR_Franklin_finb2"
		"Explosion_Med"
		"SCR_Torture"
		"SCR_TracySplash"
		"Skin_Melee_0"

		Additional damage packs:

		gist.github.com/alexguirre/f3f47f75ddcf617f416f3c8a55ae2227
</summary>
	]]

native "CLEAR_PED_BLOOD_DAMAGE"
	hash "0x8FE22675A5A45817"
	jhash (0xF7ADC960)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "CLEAR_PED_BLOOD_DAMAGE_BY_ZONE"
	hash "0x56E3B78C5408D9F4"
	jhash (0xF210BE69)
	arguments {
		Ped "ped",

		int "p1",
	}
	alias "0x56E3B78C5408D9F4"
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Somehow related to changing ped's clothes.
</summary>
	]]

native "HIDE_PED_BLOOD_DAMAGE_BY_ZONE"
	hash "0x62AB793144DE75DC"
	jhash (0x0CB6C4ED)
	arguments {
		Ped "ped",

		Any "p1",

		BOOL "p2",
	}
	alias "0x62AB793144DE75DC"
	ns "PED"
	returns	"void"

native "CLEAR_PED_DAMAGE_DECAL_BY_ZONE"
	hash "0x523C79AEEFCC4A2A"
	jhash (0x70AA5B7D)
	arguments {
		Ped "ped",

		int "p1",

		charPtr "p2",
	}
	alias "0x523C79AEEFCC4A2A"
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p1: from 0 to 5 in the b617d scripts.
		p2: "blushing" and "ALL" found in the b617d scripts.
</summary>
	]]

native "GET_PED_DECORATIONS_STATE"
	hash "0x71EAB450D86954A1"
	jhash (0x47187F7F)
	arguments {
		Ped "ped",
	}
	alias "0x71EAB450D86954A1"
	ns "PED"
	returns	"Any"

native "0x2B694AFCF64E6994"
	hash "0x2B694AFCF64E6994"
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "CLEAR_PED_WETNESS"
	hash "0x9C720776DAA43E7E"
	jhash (0x629F15BD)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		It clears the wetness of the selected Ped/Player. Clothes have to be wet to notice the difference.
</summary>
	]]

native "SET_PED_WETNESS_HEIGHT"
	hash "0x44CB6447D2571AA0"
	jhash (0x7B33289A)
	arguments {
		Ped "ped",

		float "height",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		It adds the wetness level to the player clothing/outfit. As if player just got out from water surface.


</summary>
	]]

native "SET_PED_WETNESS_ENABLED_THIS_FRAME"
	hash "0xB5485E4907B53019"
	jhash (0xBDE749F7)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		combined with PED::SET_PED_WETNESS_HEIGHT(), this native makes the ped drenched in water up to the height specified in the other function
</summary>
	]]

native "0x6585D955A68452A5"
	hash "0x6585D955A68452A5"
	jhash (0xA993915F)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Any"
	doc [[!
<summary>
		Something related to clearing the ped because always used with CLEAR_PED_WETNESS, CLEAR_PED_BLOOD_DAMAGE and RESET_PED_VISIBLE_DAMAGE.
</summary>
	]]

native "SET_PED_SWEAT"
	hash "0x27B0405F59637D1F"
	jhash (0x76A1DB9F)
	arguments {
		Ped "ped",

		float "sweat",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Sweat is set to 100.0 or 0.0 in the decompiled scripts.
</summary>
	]]

native "_SET_PED_DECORATION"
	hash "0x5F5D1665E352A839"
	jhash (0x70559AC7)
	arguments {
		Ped "ped",

		Hash "collection",

		Hash "overlay",
	}
	alias "_APPLY_PED_OVERLAY"
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Applies an Item from a PedDecorationCollection to a ped. These include tattoos and shirt decals.

		collection - PedDecorationCollection filename hash
		overlay - Item name hash

		Example:
		Entry inside "mpbeach_overlays.xml" -
		&lt;Item&gt;
		  &lt;uvPos x="0.500000" y="0.500000" /&gt;
		  &lt;scale x="0.600000" y="0.500000" /&gt;
		  &lt;rotation value="0.000000" /&gt;
		  &lt;nameHash&gt;FM_Hair_Fuzz&lt;/nameHash&gt;
		  &lt;txdHash&gt;mp_hair_fuzz&lt;/txdHash&gt;
		  &lt;txtHash&gt;mp_hair_fuzz&lt;/txtHash&gt;
		  &lt;zone&gt;ZONE_HEAD&lt;/zone&gt;
		  &lt;type&gt;TYPE_TATTOO&lt;/type&gt;
		  &lt;faction&gt;FM&lt;/faction&gt;
		  &lt;garment&gt;All&lt;/garment&gt;
		  &lt;gender&gt;GENDER_DONTCARE&lt;/gender&gt;
		  &lt;award /&gt;
		  &lt;awardLevel /&gt;
		&lt;/Item&gt;

		Code:
		PED::_0x5F5D1665E352A839(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("mpbeach_overlays"), GAMEPLAY::GET_HASH_KEY("fm_hair_fuzz"))
</summary>
	]]

native "_SET_PED_FACIAL_DECORATION"
	hash "0x5619BFA07CFD7833"
	arguments {
		Ped "ped",

		Hash "collection",

		Hash "overlay",
	}
	alias "0x5619BFA07CFD7833"
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Console Hash: 0x8CD3E487

</summary>
	]]

native "_GET_TATTOO_ZONE"
	hash "0x9FD452BFBE7A7A8B"
	jhash (0x3543019E)
	arguments {
		Hash "collection",

		Hash "overlay",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Returns the zoneID for the overlay if it is a member of collection.
		enum TattooZoneData
		{
			ZONE_TORSO = 0,
			ZONE_HEAD = 1,
			ZONE_LEFT_ARM = 2,
			ZONE_RIGHT_ARM = 3,
			ZONE_LEFT_LEG = 4,
			ZONE_RIGHT_LEG = 5,
			ZONE_UNKNOWN = 6,
			ZONE_NONE = 7,
		};
</summary>
	]]

native "CLEAR_PED_DECORATIONS"
	hash "0x0E5173C163976E38"
	jhash (0xD4496BF3)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "_CLEAR_PED_FACIAL_DECORATIONS"
	hash "0xE3B27E70CEAB9F0C"
	jhash (0xEFD58EB9)
	arguments {
		Ped "ped",
	}
	alias "0xE3B27E70CEAB9F0C"
	ns "PED"
	returns	"void"

native "WAS_PED_SKELETON_UPDATED"
	hash "0x11B499C1E0FF8559"
	jhash (0xF7E2FBAD)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Despite this function's name, it simply returns whether the specified handle is a Ped.
</summary>
	]]

native "GET_PED_BONE_COORDS"
	hash "0x17C07FC640E86B4E"
	jhash (0x4579CAB1)
	arguments {
		Ped "ped",

		int "boneId",

		float "offsetX",

		float "offsetY",

		float "offsetZ",
	}
	ns "PED"
	returns	"Vector3"
	doc [[!
<summary>
		Gets the position of the specified bone of the specified ped.

		ped: The ped to get the position of a bone from.
		boneId: The ID of the bone to get the position from. This is NOT the index.
		offsetX: The X-component of the offset to add to the position relative to the bone's rotation.
		offsetY: The Y-component of the offset to add to the position relative to the bone's rotation.
		offsetZ: The Z-component of the offset to add to the position relative to the bone's rotation.
</summary>
	]]

native "CREATE_NM_MESSAGE"
	hash "0x418EF2A1BCE56685"
	jhash (0x1CFBFD4B)
	arguments {
		BOOL "startImmediately",

		int "messageId",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Creates a new NaturalMotion message.

		startImmediately: If set to true, the character will perform the message the moment it receives it by GIVE_PED_NM_MESSAGE. If false, the Ped will get the message but won't perform it yet. While it's a boolean value, if negative, the message will not be initialized.
		messageId: The ID of the NaturalMotion message.

		If a message already exists, this function does nothing. A message exists until the point it has been successfully dispatched by GIVE_PED_NM_MESSAGE.
</summary>
	]]

native "GIVE_PED_NM_MESSAGE"
	hash "0xB158DFCCC56E5C5B"
	jhash (0x737C3689)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Sends the message that was created by a call to CREATE_NM_MESSAGE to the specified Ped.

		If a message hasn't been created already, this function does nothing.
		If the Ped is not ragdolled with Euphoria enabled, this function does nothing.
		The following call can be used to ragdoll the Ped with Euphoria enabled: SET_PED_TO_RAGDOLL(ped, 4000, 5000, 1, 1, 1, 0);

		Call order:
		SET_PED_TO_RAGDOLL
		CREATE_NM_MESSAGE
		GIVE_PED_NM_MESSAGE

		Multiple messages can be chained. Eg. to make the ped stagger and swing his arms around, the following calls can be made:
		SET_PED_TO_RAGDOLL(ped, 4000, 5000, 1, 1, 1, 0);
		CREATE_NM_MESSAGE(true, 0); // stopAllBehaviours - Stop all other behaviours, in case the Ped is already doing some Euphoria stuff.
		GIVE_PED_NM_MESSAGE(ped); // Dispatch message to Ped.
		CREATE_NM_MESSAGE(true, 1151); // staggerFall - Attempt to walk while falling.
		GIVE_PED_NM_MESSAGE(ped); // Dispatch message to Ped.
		CREATE_NM_MESSAGE(true, 372); // armsWindmill - Swing arms around.
		GIVE_PED_NM_MESSAGE(ped); // Dispatch message to Ped.
</summary>
	]]

native "ADD_SCENARIO_BLOCKING_AREA"
	hash "0x1B5C85C612E5256E"
	jhash (0xA38C0234)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		BOOL "p6",

		BOOL "p7",

		BOOL "p8",

		BOOL "p9",
	}
	ns "PED"
	returns	"int"

native "REMOVE_SCENARIO_BLOCKING_AREAS"
	hash "0xD37401D78A929A49"
	jhash (0x4DDF845F)
	ns "PED"
	returns	"void"

native "REMOVE_SCENARIO_BLOCKING_AREA"
	hash "0x31D16B74C6E29D66"
	jhash (0x4483EF06)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "SET_SCENARIO_PEDS_SPAWN_IN_SPHERE_AREA"
	hash "0x28157D43CF600981"
	jhash (0x80EAD297)
	arguments {
		float "x",

		float "y",

		float "z",

		float "range",

		int "p4",
	}
	ns "PED"
	returns	"void"

native "IS_PED_USING_SCENARIO"
	hash "0x1BF094736DD62C2E"
	jhash (0x0F65B0D4)
	arguments {
		Ped "ped",

		charPtr "scenario",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_USING_ANY_SCENARIO"
	hash "0x57AB4A3080F85143"
	jhash (0x195EF5B7)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "0xFE07FF6495D52E2A"
	hash "0xFE07FF6495D52E2A"
	jhash (0x59DE73AC)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "PED"
	returns	"Any"

native "0x9A77DFD295E29B09"
	hash "0x9A77DFD295E29B09"
	jhash (0xC08FE5F6)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0x25361A96E0F7E419"
	hash "0x25361A96E0F7E419"
	jhash (0x58C0F6CF)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "PED"
	returns	"Any"

native "0xEC6935EBE0847B90"
	hash "0xEC6935EBE0847B90"
	jhash (0x761F8F48)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "PED"
	returns	"Any"

native "0xA3A9299C4F2ADB98"
	hash "0xA3A9299C4F2ADB98"
	jhash (0x033F43FA)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "0xF1C03A5352243A30"
	hash "0xF1C03A5352243A30"
	jhash (0x4C684C81)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "0xEEED8FAFEC331A70"
	hash "0xEEED8FAFEC331A70"
	jhash (0x7B4C3E6F)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "PED"
	returns	"Any"

native "0x425AECF167663F48"
	hash "0x425AECF167663F48"
	jhash (0x5BC276AE)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0x5B6010B3CBC29095"
	hash "0x5B6010B3CBC29095"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0xCEDA60A74219D064"
	hash "0xCEDA60A74219D064"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "PLAY_FACIAL_ANIM"
	hash "0xE1E65CA8AC9C00ED"
	jhash (0x1F6CCDDE)
	arguments {
		Ped "ped",

		charPtr "animName",

		charPtr "animDict",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Look at facials@gen_male@base and facials@gen_female@base for some common facial animations. 

		!!!NOTE!!!

		Unlike most animation natives, the animation comes BEFORE the animation dictionary here. So you could call e.g. 

		PLAY_FACIAL_ANIM(ped, "dead_1", "facials@gen_male@base")
</summary>
	]]

native "SET_FACIAL_IDLE_ANIM_OVERRIDE"
	hash "0xFFC24B988B938B38"
	jhash (0x9BA19C13)
	arguments {
		Ped "ped",

		charPtr "animName",

		charPtr "animDict",
	}
	ns "PED"
	returns	"void"

native "CLEAR_FACIAL_IDLE_ANIM_OVERRIDE"
	hash "0x726256CC1EEB182F"
	jhash (0x5244F4E2)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_PLAY_GESTURE_ANIMS"
	hash "0xBAF20C5432058024"
	jhash (0xE131E3B3)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_PLAY_VISEME_ANIMS"
	hash "0xF833DDBA3B104D43"
	jhash (0xA2FDAF27)
	arguments {
		Ped "ped",

		BOOL "toggle",

		BOOL "p2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p2 usually 0
</summary>
	]]

native "_SET_PED_CAN_PLAY_INJURED_ANIMS"
	hash "0x33A60D8BDD6E508C"
	jhash (0xADB2511A)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	alias "0x33A60D8BDD6E508C"
	ns "PED"
	returns	"void"

native "SET_PED_CAN_PLAY_AMBIENT_ANIMS"
	hash "0x6373D1349925A70E"
	jhash (0xF8053081)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_PLAY_AMBIENT_BASE_ANIMS"
	hash "0x0EB0585D15254740"
	jhash (0x5720A5DD)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0xC2EE020F5FB4DB53"
	hash "0xC2EE020F5FB4DB53"
	jhash (0xB7CD0A49)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_ARM_IK"
	hash "0x6C3B4D6D13B4C841"
	jhash (0x343B4DE0)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_HEAD_IK"
	hash "0xC11C18092C5530DC"
	jhash (0xD3B04476)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_LEG_IK"
	hash "0x73518ECE2485412B"
	jhash (0x9955BC6F)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_TORSO_IK"
	hash "0xF2B7106D37947CE0"
	jhash (0x8E5D4EAB)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0xF5846EDB26A98A24"
	hash "0xF5846EDB26A98A24"
	jhash (0x7B0040A8)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0x6647C5F6F5792496"
	hash "0x6647C5F6F5792496"
	jhash (0x0FDA62DE)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_USE_AUTO_CONVERSATION_LOOKAT"
	hash "0xEC4686EC06434678"
	jhash (0x584C5178)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "IS_PED_HEADTRACKING_PED"
	hash "0x5CD3CB88A7F8850D"
	jhash (0x2A5DF721)
	arguments {
		Ped "ped1",

		Ped "ped2",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_HEADTRACKING_ENTITY"
	hash "0x813A0A7C9D2E831F"
	jhash (0x233C9ACF)
	arguments {
		Ped "ped",

		Entity "entity",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_PRIMARY_LOOKAT"
	hash "0xCD17B554996A8D9E"
	jhash (0x6DEF6F1C)
	arguments {
		Ped "ped",

		Ped "lookAt",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		This is only called once in the scripts.

		sub_1CD9(&amp;l_49, 0, getElem(3, &amp;l_34, 4), "MICHAEL", 0, 1);
		                    sub_1CA8("WORLD_HUMAN_SMOKING", 2);
		                    PED::SET_PED_PRIMARY_LOOKAT(getElem(3, &amp;l_34, 4), PLAYER::PLAYER_PED_ID());
</summary>
	]]

native "0x78C4E9961DB3EB5B"
	hash "0x78C4E9961DB3EB5B"
	jhash (0xFC942D7C)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CLOTH_PRONE"
	hash "0x82A3D6D9CC2CB8E3"
	jhash (0x89EEE07B)
	arguments {
		Any "p0",

		Any "p1",
	}
	alias "0x82A3D6D9CC2CB8E3"
	ns "PED"
	returns	"void"

native "0xA660FAF550EB37E5"
	hash "0xA660FAF550EB37E5"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CONFIG_FLAG"
	hash "0x1913FE4CBF41C463"
	jhash (0x9CFBE10D)
	arguments {
		Ped "ped",

		int "flagId",

		BOOL "value",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Research help : pastebin.com/fPL1cSwB
		New items added with underscore as first char
		-----------------------------------------------------------------------

		enum PedConfigFlags
		{
			PED_FLAG_CAN_FLY_THRU_WINDSCREEN = 32,
		        PED_FLAG_DIES_BY_RAGDOLL = 33,
			PED_FLAG_NO_COLLISION = 52,
		        _PED_FLAG_IS_SHOOTING = 58,
		        _PED_FLAG_IS_ON_GROUND = 60,
			PED_FLAG_NO_COLLIDE = 62,
			PED_FLAG_DEAD = 71,
		        PED_FLAG_IS_SNIPER_SCOPE_ACTIVE = 72,
			PED_FLAG_SUPER_DEAD = 73,
		        _PED_FLAG_IS_IN_AIR = 76,
			PED_FLAG_IS_AIMING = 78,
			PED_FLAG_DRUNK = 100,
		        _PED_FLAG_IS_NOT_RAGDOLL_AND_NOT_PLAYING_ANIM = 104,
		        PED_FLAG_NO_PLAYER_MELEE = 122,
			PED_FLAG_NM_MESSAGE_466 = 125,
			PED_FLAG_INJURED_LIMP = 166,
			PED_FLAG_INJURED_LIMP_2 = 170,
			PED_FLAG_INJURED_DOWN = 187,
			PED_FLAG_SHRINK = 223,
		        PED_FLAG_MELEE_COMBAT = 224,
		        _PED_FLAG_IS_ON_STAIRS = 253,
		        _PED_FLAG_HAS_ONE_LEG_ON_GROUND = 276,
			PED_FLAG_NO_WRITHE = 281,
			PED_FLAG_FREEZE = 292,
			PED_FLAG_IS_STILL = 301,
		        PED_FLAG_NO_PED_MELEE = 314,
		        _PED_SWITCHING_WEAPON = 331,
			PED_FLAG_ALPHA = 410,
		};

		(*) When flagId is set to 33 and the bool value to true, peds will die by starting ragdoll, so you should set this flag to false when you resurrect a ped.
		When flagId is set to 62 and the boolvalue to false this happens: Ped is taken out of vehicle and can't get back in when jacking their empty vehicle. If in a plane it falls from the sky and crashes. Sometimes peds vehicle continue to drive the route without its driver who's running after. 

		(*)
		JUMPING CHANGES  60,61,104 TO FALSE
		BEING ON WATER CHANGES 60,61 TO FALSE AND 65,66,168 TO TRUE
		FALLING CHANGES 60,61,104,276 TO FALSE AND TO 76 TRUE
		DYING CHANGES 60,61,104,276* TO FALSE AND (NONE) TO TRUE
		DYING MAKES 60,61,104 TO FALSE
		BEING IN A CAR CHANGES 60,79,104 TO FALSE AND 62 TO TRUE

		(*)Maximum value for flagId is 0x1AA (426) in b944.
		ID 0xF0 (240) appears to be a special flag which is handled different compared to the others IDs.

</summary>
	]]

native "SET_PED_RESET_FLAG"
	hash "0xC1E8A365BF3B29F2"
	jhash (0xCFF6FF66)
	arguments {
		Ped "ped",

		int "flagId",

		BOOL "doReset",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		PED::SET_PED_RESET_FLAG(PLAYER::PLAYER_PED_ID(), 240, 1);
</summary>
	]]

native "GET_PED_CONFIG_FLAG"
	hash "0x7EE53118C892B513"
	jhash (0xABE98267)
	arguments {
		Ped "ped",

		int "flagId",

		BOOL "p2",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		p2 is always 1 in the scripts.

		if (GET_PED_CONFIG_FLAG(ped, 78, 1))
		= returns true if ped is aiming/shooting a gun
</summary>
	]]

native "GET_PED_RESET_FLAG"
	hash "0xAF9E59B1B1FBF2A0"
	jhash (0x2FC10D11)
	arguments {
		Ped "ped",

		int "flagId",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_GROUP_MEMBER_PASSENGER_INDEX"
	hash "0x0BDDB8D9EC6BCF3C"
	jhash (0x2AB3670B)
	arguments {
		Ped "ped",

		int "index",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_EVASIVE_DIVE"
	hash "0x6B7A646C242A7059"
	jhash (0x542FEB4D)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "IS_PED_EVASIVE_DIVING"
	hash "0x414641C26E105898"
	jhash (0xD82829DC)
	arguments {
		Ped "ped",

		EntityPtr "evadingEntity",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Presumably returns the Entity that the Ped is currently diving out of the way of.

		var num3;
		    if (PED::IS_PED_EVASIVE_DIVING(A_0, &amp;num3) != 0)
		        if (ENTITY::IS_ENTITY_A_VEHICLE(num3) != 0)
</summary>
	]]

native "SET_PED_SHOOTS_AT_COORD"
	hash "0x96A05E4FB321B1BA"
	jhash (0xFD64EAE5)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_MODEL_IS_SUPPRESSED"
	hash "0xE163A4BCE4DE6F11"
	jhash (0x7820CA43)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "STOP_ANY_PED_MODEL_BEING_SUPPRESSED"
	hash "0xB47BD05FA66B40CF"
	jhash (0x5AD7DC55)
	ns "PED"
	returns	"void"

native "SET_PED_CAN_BE_TARGETED_WHEN_INJURED"
	hash "0x638C03B0F9878F57"
	jhash (0x6FD9A7CD)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_GENERATES_DEAD_BODY_EVENTS"
	hash "0x7FB17BA2E7DECA5B"
	jhash (0xE9B97A2B)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0xE43A13C9E4CCCBCF"
	hash "0xE43A13C9E4CCCBCF"
	jhash (0xFF1F6AEB)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_RAGDOLL_FROM_PLAYER_IMPACT"
	hash "0xDF993EE5E90ABA25"
	jhash (0xE9BD733A)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "GIVE_PED_HELMET"
	hash "0x54C7C4A94367717E"
	jhash (0x1862A461)
	arguments {
		Ped "ped",

		BOOL "cannotRemove",

		int "helmetFlag",

		int "textureIndex",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		PoliceMotorcycleHelmet	1024	
		RegularMotorcycleHelmet	4096	
		FiremanHelmet	16384	
		PilotHeadset	32768	
		PilotHelmet	65536
		--
		p2 is generally 4096 or 16384 in the scripts. p1 varies between 1 and 0.
</summary>
	]]

native "REMOVE_PED_HELMET"
	hash "0xA7B2458D0AD6DED8"
	jhash (0x2086B1F0)
	arguments {
		Ped "ped",

		BOOL "instantly",
	}
	ns "PED"
	returns	"void"

native "0x14590DDBEDB1EC85"
	hash "0x14590DDBEDB1EC85"
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_HELMET"
	hash "0x560A43136EB58105"
	jhash (0xED366E53)
	arguments {
		Ped "ped",

		BOOL "canWearHelmet",
	}
	ns "PED"
	returns	"void"

native "SET_PED_HELMET_FLAG"
	hash "0xC0E78D5C2CE3EB25"
	jhash (0x12677780)
	arguments {
		Ped "ped",

		int "helmetFlag",
	}
	ns "PED"
	returns	"void"

native "SET_PED_HELMET_PROP_INDEX"
	hash "0x26D83693ED99291C"
	jhash (0xA316D13F)
	arguments {
		Ped "ped",

		int "propIndex",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		List of component/props ID
		gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
</summary>
	]]

native "SET_PED_HELMET_TEXTURE_INDEX"
	hash "0xF1550C4BD22582E2"
	jhash (0x5F6C3328)
	arguments {
		Ped "ped",

		int "textureIndex",
	}
	ns "PED"
	returns	"void"

native "IS_PED_WEARING_HELMET"
	hash "0xF33BDFE19B309B19"
	jhash (0x0D680D49)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the ped passed through the parenthesis is wearing a helmet.
</summary>
	]]

native "0x687C0B594907D2E8"
	hash "0x687C0B594907D2E8"
	jhash (0x24A1284E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "0x451294E859ECC018"
	hash "0x451294E859ECC018"
	jhash (0x8A3A3116)
	arguments {
		int "p0",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		yoga.ysc
		if (PED::IS_PED_WEARING_HELMET(iParam0) &amp;&amp; PED::_0x451294E859ECC018(iParam0) != -1)
		{
			*uParam2 = PED::_0x451294E859ECC018(iParam0);
			*uParam3 = PED::_0x9D728C1E12BF5518(iParam0);
		}

</summary>
	]]

native "0x9D728C1E12BF5518"
	hash "0x9D728C1E12BF5518"
	jhash (0x74EB662D)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"Any"

native "0xF2385935BFFD4D92"
	hash "0xF2385935BFFD4D92"
	jhash (0xFFF149FE)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_TO_LOAD_COVER"
	hash "0x332B562EEDA62399"
	jhash (0xCF94BA97)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_COWER_IN_COVER"
	hash "0xCB7553CDCEF4A735"
	jhash (0x5194658B)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		It simply makes the said ped to cower behind cover object(wall, desk, car)

		Peds flee attributes must be set to not to flee, first. Else, most of the peds, will just flee from gunshot sounds or any other panic situations.
</summary>
	]]

native "SET_PED_CAN_PEEK_IN_COVER"
	hash "0xC514825C507E3736"
	jhash (0xC1DAE216)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_PLAYS_HEAD_ON_HORN_ANIM_WHEN_DIES_IN_VEHICLE"
	hash "0x94D94BF1A75AED3D"
	jhash (0x7C563CD2)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Points to the same function as for example GET_RANDOM_VEHICLE_MODEL_IN_MEMORY and it does absolutely nothing.
</summary>
	]]

native "SET_PED_LEG_IK_MODE"
	hash "0xC396F5B86FF9FEBD"
	jhash (0xFDDB042E)
	arguments {
		Ped "ped",

		int "mode",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		"IK" stands for "Inverse kinematics." I assume this has something to do with how the ped uses his legs to balance. In the scripts, the second parameter is always an int with a value of 2, 0, or sometimes 1
</summary>
	]]

native "SET_PED_MOTION_BLUR"
	hash "0x0A986918B102B448"
	jhash (0xA211A128)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_CAN_SWITCH_WEAPON"
	hash "0xED7F7EFE9FABF340"
	jhash (0xB5F8BA28)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_DIES_INSTANTLY_IN_WATER"
	hash "0xEEB64139BA29A7CF"
	jhash (0xFE2554FC)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0x1A330D297AAC6BC1"
	hash "0x1A330D297AAC6BC1"
	jhash (0x77BB7CB8)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Only appears in lamar1 script.
</summary>
	]]

native "STOP_PED_WEAPON_FIRING_WHEN_DROPPED"
	hash "0xC158D28142A34608"
	jhash (0x4AC3421E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "SET_SCRIPTED_ANIM_SEAT_OFFSET"
	hash "0x5917BBA32D06C230"
	jhash (0x7CEFFA45)
	arguments {
		Ped "ped",

		float "p1",
	}
	ns "PED"
	returns	"void"

native "SET_PED_COMBAT_MOVEMENT"
	hash "0x4D9CA1009AFBD057"
	jhash (0x12E62F9E)
	arguments {
		Ped "ped",

		int "combatMovement",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		0 - Stationary (Will just stand in place)
		1 - Defensive (Will try to find cover and very likely to blind fire)
		2 - Offensive (Will attempt to charge at enemy but take cover as well)
		3 - Suicidal Offensive (Will try to flank enemy in a suicidal attack)
</summary>
	]]

native "GET_PED_COMBAT_MOVEMENT"
	hash "0xDEA92412FCAEB3F5"
	jhash (0xF3E7730E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"

native "SET_PED_COMBAT_ABILITY"
	hash "0xC7622C0D36B2FDA8"
	jhash (0x6C23D329)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		100 would equal attack
		less then 50ish would mean run away

		Only the values 0, 1 and 2 occur in the decompiled scripts. Most likely refers directly to the values also described in combatbehaviour.meta:
		0: CA_Poor
		1: CA_Average
		2: CA_Professional

		Tested this and got the same results as the first explanation here. Could not find any difference between 0, 1 and 2. 
</summary>
	]]

native "SET_PED_COMBAT_RANGE"
	hash "0x3C606747B23E497B"
	jhash (0x8818A959)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Only the values 0, 1 and 2 occur in the decompiled scripts. Most likely refers directly to the values also described as AttackRange in combatbehaviour.meta:
		0: CR_Near
		1: CR_Medium
		2: CR_Far
</summary>
	]]

native "GET_PED_COMBAT_RANGE"
	hash "0xF9D9F7F2DB8E2FA0"
	jhash (0x9B9B7163)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Any"

native "SET_PED_COMBAT_ATTRIBUTES"
	hash "0x9F7794730795E019"
	jhash (0x81D64248)
	arguments {
		Ped "ped",

		int "attributeIndex",

		BOOL "enabled",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		These combat attributes seem to be the same as the BehaviourFlags from combatbehaviour.meta.
		So far, these are the equivalents found:
		enum CombatAttributes
		{
			BF_CanUseCover = 0,
			BF_CanUseVehicles = 1,
			BF_CanDoDrivebys = 2,
			BF_CanLeaveVehicle = 3,
			BF_CanFightArmedPedsWhenNotArmed = 5,
			BF_CanTauntInVehicle = 20,
			BF_AlwaysFight = 46,
			BF_IgnoreTrafficWhenDriving = 52,
		        BF_FreezeMovement = 292,
		        BF_PlayerCanUseFiringWeapons = 1424
		};

		8 = ?
		9 = ?
		13 = ?
		14 ?

		Research thread: gtaforums.com/topic/833391-researchguide-combat-behaviour-flags/
</summary>
	]]

native "SET_PED_TARGET_LOSS_RESPONSE"
	hash "0x0703B9079823DA4A"
	jhash (0xCFA613FF)
	arguments {
		Ped "ped",

		int "responseType",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Only 1 and 2 appear in the scripts. combatbehaviour.meta seems to only have TLR_SearchForTarget for all peds, but we don't know if that's 1 or 2.
</summary>
	]]

native "0xDCCA191DF9980FD7"
	hash "0xDCCA191DF9980FD7"
	jhash (0x139C0875)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_PERFORMING_STEALTH_KILL"
	hash "0xFD4CCDBCC59941B7"
	jhash (0x9ADD7B21)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "0xEBD0EDBA5BE957CF"
	hash "0xEBD0EDBA5BE957CF"
	jhash (0x9BE7C860)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_BEING_STEALTH_KILLED"
	hash "0x863B23EFDE9C5DF2"
	jhash (0xD044C8AF)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "GET_MELEE_TARGET_FOR_PED"
	hash "0x18A3E9EE1297FD39"
	jhash (0xAFEC26A4)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"Ped"

native "WAS_PED_KILLED_BY_STEALTH"
	hash "0xF9800AA1A771B000"
	jhash (0x2EA4B54E)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "WAS_PED_KILLED_BY_TAKEDOWN"
	hash "0x7F08E26039C7347C"
	jhash (0xBDD3CE69)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "0x61767F73EACEED21"
	hash "0x61767F73EACEED21"
	jhash (0x3993092B)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_FLEE_ATTRIBUTES"
	hash "0x70A2D1137C8ED7C9"
	jhash (0xA717A875)
	arguments {
		Ped "ped",

		int "attributes",

		BOOL "p2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Bool probably has something to do with vehicles, maybe if the ped can use vehicle to flee?

		Values used as attributes are those in sequence of powers of two, 1, 2, 4, 8, 16, 32, 64.... 65536.

		jedijosh920: Setting attribute "2" to true will make the ped steal a vehicle.
</summary>
	]]

native "SET_PED_COWER_HASH"
	hash "0xA549131166868ED3"
	jhash (0x16F30DF4)
	arguments {
		Ped "ped",

		charPtr "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p1: Only "CODE_HUMAN_STAND_COWER" found in the b617d scripts.
</summary>
	]]

native "0x2016C603D6B8987C"
	hash "0x2016C603D6B8987C"
	jhash (0xA6F2C057)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "SET_PED_STEERS_AROUND_PEDS"
	hash "0x46F2193B3AD1D891"
	jhash (0x797CAE4F)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_STEERS_AROUND_OBJECTS"
	hash "0x1509C089ADC208BF"
	jhash (0x3BD9B0A6)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "SET_PED_STEERS_AROUND_VEHICLES"
	hash "0xEB6FB9D48DDE23EC"
	jhash (0x533C0651)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0xA9B61A329BFDCBEA"
	hash "0xA9B61A329BFDCBEA"
	jhash (0x2276DE0D)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0x570389D1C3DE3C6B"
	hash "0x570389D1C3DE3C6B"
	jhash (0x59C52BE6)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "0x576594E8D64375E2"
	hash "0x576594E8D64375E2"
	jhash (0x1D87DDC1)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0xA52D5247A4227E14"
	hash "0xA52D5247A4227E14"
	jhash (0xB52BA5F5)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "IS_ANY_PED_NEAR_POINT"
	hash "0x083961498679DC9F"
	jhash (0xFBD9B050)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",
	}
	ns "PED"
	returns	"BOOL"

native "0x2208438012482A1A"
	hash "0x2208438012482A1A"
	jhash (0x187B9070)
	arguments {
		Ped "ped",

		BOOL "p1",

		BOOL "p2",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Function.Call(Hash._0x2208438012482A1A, ped, 0, 0);

		This makes the ped have faster animations
</summary>
	]]

native "0xFCF37A457CB96DC0"
	hash "0xFCF37A457CB96DC0"
	jhash (0x45037B9B)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",
	}
	ns "PED"
	returns	"BOOL"

native "0x7D7A2E43E74E2EB8"
	hash "0x7D7A2E43E74E2EB8"
	jhash (0x840D24D3)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		i found this function just like VEHICLE::TRACK_VEHICLE_VISIBILITY 
		example:
		PED::_0x7D7A2E43E74E2EB8(ped);// TRACK_PED_VISIBILITY
		if (PED::IS_TRACKED_PED_VISIBLE(ped))
		{

		}
</summary>
	]]

native "GET_PED_FLOOD_INVINCIBILITY"
	hash "0x2BC338A7B21F4608"
	jhash (0x31C31DAA)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		hash collision???
</summary>
	]]

native "0xCD018C591F94CB43"
	hash "0xCD018C591F94CB43"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0x75BA1CB3B7D40CAF"
	hash "0x75BA1CB3B7D40CAF"
	jhash (0x9194DB71)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "IS_TRACKED_PED_VISIBLE"
	hash "0x91C8E617F64188AC"
	jhash (0x33248CC1)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		returns whether or not a ped is visible within your FOV, not this check auto's to false after a certain distance.


		Target needs to be tracked.. won't work otherwise.
</summary>
	]]

native "0x511F1A683387C7E2"
	hash "0x511F1A683387C7E2"
	jhash (0x5B1B70AA)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"Any"

native "IS_PED_TRACKED"
	hash "0x4C5E1F087CD10BB7"
	jhash (0x7EB613D9)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "HAS_PED_RECEIVED_EVENT"
	hash "0x8507BCB710FA6DC0"
	jhash (0xECD73DB0)
	arguments {
		Ped "ped",

		Any "p1",
	}
	ns "PED"
	returns	"BOOL"

native "_CAN_PED_SEE_PED"
	hash "0x6CD5A433374D4CFB"
	jhash (0x74A0F291)
	arguments {
		Ped "ped1",

		Ped "ped2",
	}
	alias "0x6CD5A433374D4CFB"
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if ped1 can see ped2 in their line of vision
</summary>
	]]

native "0x9C6A6C19B6C0C496"
	hash "0x9C6A6C19B6C0C496"
	arguments {
		Ped "p0",

		AnyPtr "p1",
	}
	ns "PED"
	returns	"BOOL"

native "GET_PED_BONE_INDEX"
	hash "0x3F428D08BE5AAE31"
	jhash (0x259C6BA2)
	arguments {
		Ped "ped",

		int "boneId",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Bone ID enum: pastebin.com/3pz17QGd
</summary>
	]]

native "GET_PED_RAGDOLL_BONE_INDEX"
	hash "0x2057EF813397A772"
	jhash (0x849F0716)
	arguments {
		Ped "ped",

		int "bone",
	}
	ns "PED"
	returns	"int"

native "SET_PED_ENVEFF_SCALE"
	hash "0xBF29516833893561"
	jhash (0xFC1CFC27)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Values look to be between 0.0 and 1.0
		From decompiled scripts: 0.0, 0.6, 0.65, 0.8, 1.0

		You are correct, just looked in IDA it breaks from the function if it's less than 0.0f or greater than 1.0f.
</summary>
	]]

native "GET_PED_ENVEFF_SCALE"
	hash "0x9C14D30395A51A3C"
	jhash (0xA3421E39)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"float"

native "SET_ENABLE_PED_ENVEFF_SCALE"
	hash "0xD2C5AA0C0E8D0F1E"
	jhash (0xC70F4A84)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0x110F526AB784111F"
	hash "0x110F526AB784111F"
	jhash (0x3B882533)
	arguments {
		Ped "ped",

		float "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		In agency_heist3b.c4, its like this 90% of the time:

		PED::_110F526AB784111F(ped, 0.099);
		PED::SET_PED_ENVEFF_SCALE(ped, 1.0);
		PED::_D69411AA0CEBF9E9(ped, 87, 81, 68);
		PED::SET_ENABLE_PED_ENVEFF_SCALE(ped, 1);

		and its like this 10% of the time:

		PED::_110F526AB784111F(ped, 0.2);
		PED::SET_PED_ENVEFF_SCALE(ped, 0.65);
		PED::_D69411AA0CEBF9E9(ped, 74, 69, 60);
		PED::SET_ENABLE_PED_ENVEFF_SCALE(ped, 1);
</summary>
	]]

native "0xD69411AA0CEBF9E9"
	hash "0xD69411AA0CEBF9E9"
	jhash (0x87A0C174)
	arguments {
		Ped "ped",

		int "p1",

		int "p2",

		int "p3",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Something related to the environmental effects natives.
		In the "agency_heist3b" script, p1 - p3 are always under 100 - usually they are {87, 81, 68}. If SET_PED_ENVEFF_SCALE is set to 0.65 (instead of the usual 1.0), they use {74, 69, 60}
</summary>
	]]

native "0x1216E0BFA72CC703"
	hash "0x1216E0BFA72CC703"
	jhash (0x7BD26837)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "PED"
	returns	"void"

native "0x2B5AA717A181FB4C"
	hash "0x2B5AA717A181FB4C"
	jhash (0x98E29ED0)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "PED"
	returns	"void"

native "0xB8B52E498014F5B0"
	hash "0xB8B52E498014F5B0"
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		if (!$B8B52E498014F5B0(PLAYER::PLAYER_PED_ID())) {
</summary>
	]]

native "CREATE_SYNCHRONIZED_SCENE"
	hash "0x8C18E0F9080ADD73"
	jhash (0xFFDDF8FA)
	arguments {
		float "x",

		float "y",

		float "z",

		float "roll",

		float "pitch",

		float "yaw",

		int "p6",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		p6 always 2 (but it doesnt seem to matter...)

		roll and pitch 0
		yaw to Ped.rotation
</summary>
	]]

native "_CREATE_SYNCHRONIZED_SCENE_2"
	hash "0x62EC273D00187DCA"
	jhash (0xF3876894)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "object",
	}
	alias "0x62EC273D00187DCA"
	ns "PED"
	returns	"int"

native "IS_SYNCHRONIZED_SCENE_RUNNING"
	hash "0x25D39B935A038A26"
	jhash (0x57A282F1)
	arguments {
		int "sceneId",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if a synchronized scene is running
</summary>
	]]

native "SET_SYNCHRONIZED_SCENE_ORIGIN"
	hash "0x6ACF6B7225801CD7"
	jhash (0x2EC2A0B2)
	arguments {
		int "sceneID",

		float "x",

		float "y",

		float "z",

		float "roll",

		float "pitch",

		float "yaw",

		BOOL "p7",
	}
	ns "PED"
	returns	"void"

native "SET_SYNCHRONIZED_SCENE_PHASE"
	hash "0x734292F4F0ABF6D0"
	jhash (0xF5AB0D98)
	arguments {
		int "sceneID",

		float "phase",
	}
	ns "PED"
	returns	"void"

native "GET_SYNCHRONIZED_SCENE_PHASE"
	hash "0xE4A310B1D7FA73CC"
	jhash (0xB0B2C852)
	arguments {
		int "sceneID",
	}
	ns "PED"
	returns	"float"

native "SET_SYNCHRONIZED_SCENE_RATE"
	hash "0xB6C49F8A5E295A5D"
	jhash (0xF10112FD)
	arguments {
		int "sceneID",

		float "rate",
	}
	ns "PED"
	returns	"void"

native "GET_SYNCHRONIZED_SCENE_RATE"
	hash "0xD80932D577274D40"
	jhash (0x89365F0D)
	arguments {
		int "sceneID",
	}
	ns "PED"
	returns	"float"

native "SET_SYNCHRONIZED_SCENE_LOOPED"
	hash "0xD9A897A4C6C2974F"
	jhash (0x32ED9F82)
	arguments {
		int "sceneID",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "IS_SYNCHRONIZED_SCENE_LOOPED"
	hash "0x62522002E0C391BA"
	jhash (0x47D87A84)
	arguments {
		int "sceneID",
	}
	ns "PED"
	returns	"BOOL"

native "_SET_SYNCHRONIZED_SCENE_OCCLUSION_PORTAL"
	hash "0x394B9CD12435C981"
	jhash (0x2DE48DA1)
	arguments {
		Any "sceneID",

		BOOL "p1",
	}
	alias "0x394B9CD12435C981"
	ns "PED"
	returns	"void"

native "0x7F2F4F13AC5257EF"
	hash "0x7F2F4F13AC5257EF"
	jhash (0x72CF2514)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"BOOL"

native "ATTACH_SYNCHRONIZED_SCENE_TO_ENTITY"
	hash "0x272E4723B56A3B96"
	jhash (0xE9BA6189)
	arguments {
		int "sceneID",

		Entity "entity",

		int "boneIndex",
	}
	ns "PED"
	returns	"void"

native "DETACH_SYNCHRONIZED_SCENE"
	hash "0x6D38F1F04CBB37EA"
	jhash (0x52A1CAB2)
	arguments {
		int "sceneID",
	}
	ns "PED"
	returns	"void"

native "_DISPOSE_SYNCHRONIZED_SCENE"
	hash "0xCD9CC7E200A52A6F"
	jhash (0xBF7F9035)
	arguments {
		int "scene",
	}
	alias "0xCD9CC7E200A52A6F"
	ns "PED"
	returns	"void"

native "FORCE_PED_MOTION_STATE"
	hash "0xF28965D04F570DCA"
	jhash (0x164DDEFF)
	arguments {
		Ped "ped",

		Hash "motionStateHash",

		BOOL "p2",

		BOOL "p3",

		BOOL "p4",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Some motionstate hashes are

		0xec17e58 (standing idle), 0xbac0f10b (nothing?), 0x3f67c6af (aiming with pistol 2-h), 0x422d7a25 (stealth), 0xbd8817db, 0x916e828c

		and those for the strings

		"motionstate_idle", "motionstate_walk", "motionstate_run", "motionstate_actionmode_idle", and "motionstate_actionmode_walk".

		Regarding p2, p3 and p4: Most common is 0, 0, 0); followed by 0, 1, 0); and 1, 1, 0); in the scripts. p4 is very rarely something other than 0.

		 [31/03/2017] ins1de :

		        enum MotionState
		        {
		            StopRunning = -530524,
		            StopWalking = -668482597,
		            Idle = 247561816, // 1, 1, 0
		            Idl2 = -1871534317,
		            SkyDive =-1161760501, // 0, 1, 0
		            Stealth = 1110276645,
		            Sprint = -1115154469,
		            Swim = -1855028596,
		            Unknown1 = 1063765679,
		            Unknown2 = -633298724,
		        }
</summary>
	]]

native "0xF60165E1D2C5370B"
	hash "0xF60165E1D2C5370B"
	arguments {
		Ped "ped",

		AnyPtr "p1",

		AnyPtr "p2",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_MAX_MOVE_BLEND_RATIO"
	hash "0x433083750C5E064A"
	jhash (0xEAD0269A)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "SET_PED_MIN_MOVE_BLEND_RATIO"
	hash "0x01A898D26E2333DD"
	jhash (0x383EC364)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"

native "SET_PED_MOVE_RATE_OVERRIDE"
	hash "0x085BF80FA50A39D1"
	jhash (0x900008C6)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Min: 0.00
		Max: 10.00

		Can be used in combo with fast run cheat.

		When value is set to 10.00:
		Sprinting without fast run cheat: 66 m/s
		Sprinting with fast run cheat: 77 m/s

		Does not need to be looped!

		Note: According to IDA for the Xbox360 xex, when they check bgt they seem to have the min to 0.0f, but the max set to 1.15f not 10.0f.
</summary>
	]]

native "0x46B05BCAE43856B0"
	hash "0x46B05BCAE43856B0"
	jhash (0x79543043)
	arguments {
		Ped "ped",

		int "flag",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if the specified unknown flag is set in the ped's model.
		The engine itself seems to exclusively check for flags 1 and 4 (Might be inlined code of the check that checks for other flags).
		Game scripts exclusively check for flags 1 and 4.
</summary>
	]]

native "GET_PED_NEARBY_VEHICLES"
	hash "0xCFF869CBFA210D82"
	jhash (0xCB716F68)
	arguments {
		Ped "ped",

		intPtr "sizeAndVehs",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		Returns size of array, passed into the second variable.

		See below for usage information.

		This function actually requires a struct, where the first value is the maximum number of elements to return.  Here is a sample of how I was able to get it to work correctly, without yet knowing the struct format.

		//Setup the array
			const int numElements = 10;
			const int arrSize = numElements * 2 + 2;
			Any veh[arrSize];
			//0 index is the size of the array
			veh[0] = numElements;

			int count = PED::GET_PED_NEARBY_VEHICLES(PLAYER::PLAYER_PED_ID(), veh);

			if (veh != NULL)
			{
				//Simple loop to go through results
				for (int i = 0; i &lt; count; i++)
				{
					int offsettedID = i * 2 + 2;
					//Make sure it exists
					if (veh[offsettedID] != NULL &amp;&amp; ENTITY::DOES_ENTITY_EXIST(veh[offsettedID]))
					{
						//Do something
					}
				}
			}  

		Here's the right way to do it (console and pc):
		pastebin.com/SsFej963
</summary>
	]]

native "GET_PED_NEARBY_PEDS"
	hash "0x23F8F5FC7E8C4A6B"
	jhash (0x4D3325F4)
	arguments {
		Ped "ped",

		intPtr "sizeAndPeds",

		int "ignore",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		sizeAndPeds - is a pointer to an array. The array is filled with peds found nearby the ped supplied to the first argument.
		ignore - ped type to ignore

		Return value is the number of peds found and added to the array passed.

		-----------------------------------

		To make this work in most menu bases at least in C++ do it like so,

		 Formatted Example: pastebin.com/D8an9wwp

		-----------------------------------

		Example: gtaforums.com/topic/789788-function-args-to-pedget-ped-nearby-peds/?p=1067386687

		Here's the right way to do it (console and pc):
		pastebin.com/SsFej963
</summary>
	]]

native "0x7350823473013C02"
	hash "0x7350823473013C02"
	jhash (0xF9FB4B71)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "IS_PED_USING_ACTION_MODE"
	hash "0x00E73468D085F745"
	jhash (0x5AE7EDA2)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"BOOL"

native "SET_PED_USING_ACTION_MODE"
	hash "0xD75ACCF5E0FB5367"
	jhash (0x8802F696)
	arguments {
		Ped "ped",

		BOOL "p1",

		Any "p2",

		charPtr "action",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p2 is usually -1 in the scripts. action is either 0 or "DEFAULT_ACTION".
</summary>
	]]

native "0x781DE8FA214E87D2"
	hash "0x781DE8FA214E87D2"
	arguments {
		Ped "ped",

		charPtr "p1",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		p1: "MP_FEMALE_ACTION" found multiple times in the b617d scripts.

		Console Hash: 0x83BAE814
</summary>
	]]

native "SET_PED_CAPSULE"
	hash "0x364DF566EC833DE2"
	jhash (0xB153E1B9)
	arguments {
		Ped "ped",

		float "value",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		Overrides the ped's collision capsule radius for the current tick.
		Must be called every tick to be effective.

		Setting this to 0.001 will allow warping through some objects.
</summary>
	]]

native "REGISTER_PEDHEADSHOT"
	hash "0x4462658788425076"
	jhash (0xFFE2667B)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"int"
	doc [[!
<summary>
		gtaforums.com/topic/885580-ped-headshotmugshot-txd/
</summary>
	]]

native "0x953563CE563143AF"
	hash "0x953563CE563143AF"
	jhash (0x4DD03628)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"Any"

native "UNREGISTER_PEDHEADSHOT"
	hash "0x96B1361D9B24C2FF"
	jhash (0x0879AE45)
	arguments {
		int "handle",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		gtaforums.com/topic/885580-ped-headshotmugshot-txd/
</summary>
	]]

native "IS_PEDHEADSHOT_VALID"
	hash "0xA0A9668F158129A2"
	jhash (0x0B1080C4)
	arguments {
		int "handle",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		gtaforums.com/topic/885580-ped-headshotmugshot-txd/
</summary>
	]]

native "IS_PEDHEADSHOT_READY"
	hash "0x7085228842B13A67"
	jhash (0x761CD02E)
	arguments {
		int "handle",
	}
	ns "PED"
	returns	"BOOL"
	doc [[!
<summary>
		gtaforums.com/topic/885580-ped-headshotmugshot-txd/
</summary>
	]]

native "GET_PEDHEADSHOT_TXD_STRING"
	hash "0xDB4EACD4AD0A5D6B"
	jhash (0x76D28E96)
	arguments {
		int "handle",
	}
	ns "PED"
	returns	"charPtr"
	doc [[!
<summary>
		gtaforums.com/topic/885580-ped-headshotmugshot-txd/
</summary>
	]]

native "0xF0DAEF2F545BEE25"
	hash "0xF0DAEF2F545BEE25"
	jhash (0x10F2C023)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"BOOL"

native "0x5D517B27CF6ECD04"
	hash "0x5D517B27CF6ECD04"
	jhash (0x0DBB2FA7)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "0xEBB376779A760AA8"
	hash "0xEBB376779A760AA8"
	jhash (0x810158F8)
	ns "PED"
	returns	"Any"

native "0x876928DDDFCCC9CD"
	hash "0x876928DDDFCCC9CD"
	jhash (0x05023F8F)
	ns "PED"
	returns	"Any"

native "0xE8A169E666CBC541"
	hash "0xE8A169E666CBC541"
	jhash (0xAA39FD6C)
	ns "PED"
	returns	"Any"

native "0xC1F6EBF9A3D55538"
	hash "0xC1F6EBF9A3D55538"
	jhash (0xEF9142DB)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "PED"
	returns	"void"

native "0x600048C60D5C2C51"
	hash "0x600048C60D5C2C51"
	jhash (0x0688DE64)
	arguments {
		Any "p0",
	}
	ns "PED"
	returns	"void"

native "0x2DF9038C90AD5264"
	hash "0x2DF9038C90AD5264"
	jhash (0x909A1D76)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		int "interiorFlags",

		float "scale",

		int "duration",
	}
	ns "PED"
	returns	"void"

native "0xB2AFF10216DEFA2F"
	hash "0xB2AFF10216DEFA2F"
	jhash (0x4AAD0ECB)
	arguments {
		float "x",

		float "y",

		float "z",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		int "interiorFlags",

		float "scale",

		int "duration",
	}
	ns "PED"
	returns	"void"

native "0xFEE4A5459472A9F8"
	hash "0xFEE4A5459472A9F8"
	jhash (0x492C9E46)
	ns "PED"
	returns	"void"

native "0x3C67506996001F5E"
	hash "0x3C67506996001F5E"
	jhash (0x814A28F4)
	ns "PED"
	returns	"Any"

native "0xA586FBEB32A53DBB"
	hash "0xA586FBEB32A53DBB"
	jhash (0x0B60D2BA)
	ns "PED"
	returns	"Any"

native "0xF445DE8DA80A1792"
	hash "0xF445DE8DA80A1792"
	jhash (0x6B83ABDF)
	ns "PED"
	returns	"Any"

native "0xA635C11B8C44AFC2"
	hash "0xA635C11B8C44AFC2"
	jhash (0xF46B4DC8)
	ns "PED"
	returns	"Any"

native "0x280C7E3AC7F56E90"
	hash "0x280C7E3AC7F56E90"
	jhash (0x36A4AC65)
	arguments {
		Any "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",
	}
	ns "PED"
	returns	"void"

native "0xB782F8238512BAD5"
	hash "0xB782F8238512BAD5"
	jhash (0xBA699DDF)
	arguments {
		Any "p0",

		AnyPtr "p1",
	}
	ns "PED"
	returns	"void"

native "SET_IK_TARGET"
	hash "0xC32779C16FCEECD9"
	jhash (0x6FE5218C)
	arguments {
		Ped "ped",

		int "ikIndex",

		Entity "entityLookAt",

		int "boneLookAt",

		float "offsetX",

		float "offsetY",

		float "offsetZ",

		Any "p7",

		int "blendInDuration",

		int "blendOutDuration",
	}
	ns "PED"
	returns	"void"
	doc [[!
<summary>
		No other indices work...
		IK Index ---------
		1 = head
		3 = left arm
		4 = right arm
		------------------


		EntityLookAt can be null (0 handle)


</summary>
	]]

native "0xED3C76ADFA6D07C4"
	hash "0xED3C76ADFA6D07C4"
	jhash (0xFB4000DC)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "REQUEST_ACTION_MODE_ASSET"
	hash "0x290E2780BB7AA598"
	jhash (0x572BA553)
	arguments {
		charPtr "asset",
	}
	ns "PED"
	returns	"void"

native "HAS_ACTION_MODE_ASSET_LOADED"
	hash "0xE4B5F4BF2CB24E65"
	jhash (0xF7EB2BF1)
	arguments {
		charPtr "asset",
	}
	ns "PED"
	returns	"BOOL"

native "REMOVE_ACTION_MODE_ASSET"
	hash "0x13E940F88470FA51"
	jhash (0x3F480F92)
	arguments {
		charPtr "asset",
	}
	ns "PED"
	returns	"void"

native "REQUEST_STEALTH_MODE_ASSET"
	hash "0x2A0A62FCDEE16D4F"
	jhash (0x280A004A)
	arguments {
		charPtr "asset",
	}
	ns "PED"
	returns	"void"

native "HAS_STEALTH_MODE_ASSET_LOADED"
	hash "0xE977FC5B08AF3441"
	jhash (0x39245667)
	arguments {
		charPtr "asset",
	}
	ns "PED"
	returns	"BOOL"

native "REMOVE_STEALTH_MODE_ASSET"
	hash "0x9219857D21F0E842"
	jhash (0x8C0B243A)
	arguments {
		charPtr "asset",
	}
	ns "PED"
	returns	"void"

native "SET_PED_LOD_MULTIPLIER"
	hash "0xDC2C5C242AAC342B"
	jhash (0x1D2B5C70)
	arguments {
		Ped "ped",

		float "multiplier",
	}
	ns "PED"
	returns	"void"

native "0xE861D0B05C7662B8"
	hash "0xE861D0B05C7662B8"
	jhash (0x2F9550C2)
	arguments {
		Pickup "p0",

		Any "p1",

		BlipPtr "p2",
	}
	ns "PED"
	returns	"void"

native "0x129466ED55140F8D"
	hash "0x129466ED55140F8D"
	jhash (0x37DBC2AD)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "PED"
	returns	"void"

native "0xCB968B53FC7F916D"
	hash "0xCB968B53FC7F916D"
	jhash (0xC0F1BC91)
	arguments {
		Any "p0",

		BOOL "p1",

		Any "p2",

		Any "p3",
	}
	ns "PED"
	returns	"void"

native "0x68772DB2B2526F9F"
	hash "0x68772DB2B2526F9F"
	jhash (0x1A464167)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "range",
	}
	ns "PED"
	returns	"BOOL"

native "0x06087579E7AA85A9"
	hash "0x06087579E7AA85A9"
	jhash (0xD0567D41)
	arguments {
		Any "p0",

		Any "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",
	}
	ns "PED"
	returns	"BOOL"

native "0xD8C3BE3EE94CAF2D"
	hash "0xD8C3BE3EE94CAF2D"
	jhash (0x4BBE5E2C)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",
	}
	ns "PED"
	returns	"void"

native "0xD33DAA36272177C4"
	hash "0xD33DAA36272177C4"
	jhash (0xA89A53F2)
	arguments {
		Ped "ped",
	}
	ns "PED"
	returns	"void"

native "0x83A169EABCDB10A2"
	hash "0x83A169EABCDB10A2"
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "PED"
	returns	"void"

native "0x288DF530C92DAD6F"
	hash "0x288DF530C92DAD6F"
	arguments {
		Any "p0",

		float "p1",
	}
	ns "PED"
	returns	"void"

native "CREATE_VEHICLE"
	hash "0xAF35D0D2583051B0"
	jhash (0xDD75460A)
	arguments {
		Hash "modelHash",

		float "x",

		float "y",

		float "z",

		float "heading",

		BOOL "isNetwork",

		BOOL "thisScriptCheck",
	}
	ns "VEHICLE"
	returns	"Vehicle"
	doc [[!
<summary>
		thisScriptCheck - can be destroyed if it belongs to the calling script.
</summary>
	]]

native "DELETE_VEHICLE"
	hash "0xEA386986E786A54F"
	jhash (0x9803AF60)
	arguments {
		VehiclePtr "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Deletes a vehicle.
		The vehicle must be a mission entity to delete, so call this before deleting: SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true);

		eg how to use:
		SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true);
		DELETE_VEHICLE(&amp;vehicle);

		Deletes the specified vehicle, then sets the handle pointed to by the pointer to NULL.
</summary>
	]]

native "0x7D6F9A3EF26136A0"
	hash "0x7D6F9A3EF26136A0"
	jhash (0xBB54ECCA)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",

		BOOL "p2",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		what does this native do?

		Here's some pseudocode of the internal setter function:

		__int64 __fastcall sub_140CD86B4(signed int vehicle, char a2, char a3)
		{
		  char v3; // di@1
		  char v4; // bl@1
		  __int64 result; // rax@1
		  __int16 v6; // cx@3

		  v3 = a3;
		  v4 = a2;
		  result = GetVehicleAddress(vehicle);
		  if ( result )
		  {
		    if ( v3 || (v6 = *(_WORD *)(result + 0xDA), (v6 &amp; 0xFu) - 6 &lt;= 1) )
		    {
		      *(_BYTE *)(result + 0x89B) &amp;= 0xDFu;
		      *(_BYTE *)(result + 0x89B) |= 32 * (v4 &amp; 1);
		    }
		  }
		  return result;
		}

		Now it's time for you to find out :P
</summary>
	]]

native "SET_VEHICLE_ALLOW_NO_PASSENGERS_LOCKON"
	hash "0x5D14D4154BFE7B2C"
	jhash (0x8BAAC437)
	arguments {
		Vehicle "veh",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Makes the vehicle accept no passengers.
</summary>
	]]

native "0xE6B0E8CFC3633BF0"
	hash "0xE6B0E8CFC3633BF0"
	jhash (0xFBDE9FD8)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		GET_VEHICLE_*
</summary>
	]]

native "IS_VEHICLE_MODEL"
	hash "0x423E8DE37D934D89"
	jhash (0x013B10B6)
	arguments {
		Vehicle "vehicle",

		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "DOES_SCRIPT_VEHICLE_GENERATOR_EXIST"
	hash "0xF6086BC836400876"
	jhash (0xF6BDDA30)
	arguments {
		int "v",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "CREATE_SCRIPT_VEHICLE_GENERATOR"
	hash "0x9DEF883114668116"
	jhash (0x25A9A261)
	arguments {
		float "x",

		float "y",

		float "z",

		float "heading",

		float "p4",

		float "p5",

		Hash "modelHash",

		int "p7",

		int "p8",

		int "p9",

		int "p10",

		BOOL "p11",

		BOOL "p12",

		BOOL "p13",

		BOOL "p14",

		BOOL "p15",

		int "p16",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Creates a script vehicle generator at the given coordinates. Most parameters after the model hash are unknown.

		Parameters:
		a/w/s - Generator position
		heading - Generator heading
		p4 - Unknown (always 5.0)
		p5 - Unknown (always 3.0)
		modelHash - Vehicle model hash
		p7/8/9/10 - Unknown (always -1)
		p11 - Unknown (usually TRUE, only one instance of FALSE)
		p12/13 - Unknown (always FALSE)
		p14 - Unknown (usally FALSE, only two instances of TRUE)
		p15 - Unknown (always TRUE)
		p16 - Unknown (always -1)

		Vector3 coords = GET_ENTITY_COORDS(PLAYER_PED_ID(), 0);	CREATE_SCRIPT_VEHICLE_GENERATOR(coords.x, coords.y, coords.z, 1.0f, 5.0f, 3.0f, GET_HASH_KEY("adder"), -1. -1, -1, -1, -1, true, false, false, false, true, -1);
</summary>
	]]

native "DELETE_SCRIPT_VEHICLE_GENERATOR"
	hash "0x22102C9ABFCF125D"
	jhash (0xE4328E3F)
	arguments {
		int "vehicleGenerator",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_SCRIPT_VEHICLE_GENERATOR"
	hash "0xD9D620E0AC6DC4B0"
	jhash (0x40D73747)
	arguments {
		int "vehicleGenerator",

		BOOL "enabled",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Only called once in the decompiled scripts. Presumably activates the specified generator.
</summary>
	]]

native "SET_ALL_VEHICLE_GENERATORS_ACTIVE_IN_AREA"
	hash "0xC12321827687FE4D"
	jhash (0xB4E0E69A)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		BOOL "p6",

		BOOL "p7",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_ALL_VEHICLE_GENERATORS_ACTIVE"
	hash "0x34AD89078831A4BC"
	jhash (0xAB1FDD76)
	ns "VEHICLE"
	returns	"void"

native "SET_ALL_LOW_PRIORITY_VEHICLE_GENERATORS_ACTIVE"
	hash "0x608207E7A8FB787C"
	jhash (0x87F767F2)
	arguments {
		BOOL "active",
	}
	ns "VEHICLE"
	returns	"void"

native "0x9A75585FB2E54FAD"
	hash "0x9A75585FB2E54FAD"
	jhash (0x935A95DA)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Example gotten from chinese2.c4
		    VEHICLE::_9A75585FB2E54FAD(2004.4471435546875, 3076.806640625, 46.60689926147461, 10.0);


</summary>
	]]

native "0x0A436B8643716D14"
	hash "0x0A436B8643716D14"
	jhash (0x6C73E45A)
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_ON_GROUND_PROPERLY"
	hash "0x49733E92263139D1"
	jhash (0xE14FDBA6)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Sets a vehicle on the ground on all wheels.  Returns whether or not the operation was successful.

		sfink: This has an additional param(Vehicle vehicle, float p1) which is always set to 5.0f in the b944 scripts.
</summary>
	]]

native "SET_ALL_VEHICLES_SPAWN"
	hash "0xE023E8AC4EF7C117"
	jhash (0xA0909ADB)
	arguments {
		Vehicle "p0",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",
	}
	ns "VEHICLE"
	returns	"Any"
	doc [[!
<summary>
		Most likely a hash collision
</summary>
	]]

native "IS_VEHICLE_STUCK_ON_ROOF"
	hash "0xB497F06B288DCFDF"
	jhash (0x18D07C6C)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "ADD_VEHICLE_UPSIDEDOWN_CHECK"
	hash "0xB72E26D81006005B"
	jhash (0x3A13D384)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "REMOVE_VEHICLE_UPSIDEDOWN_CHECK"
	hash "0xC53EB42A499A7E90"
	jhash (0xF390BA1B)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "IS_VEHICLE_STOPPED"
	hash "0x5721B434AD84D57A"
	jhash (0x655F072C)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		MulleDK19: Returns true if the vehicle's speed is equal to, or less than 0.02 meters per second, or 0.05 meters per second, if the vehicle's handbrake is engaged.
</summary>
	]]

native "GET_VEHICLE_NUMBER_OF_PASSENGERS"
	hash "0x24CB2137731FFE89"
	jhash (0x1EF20849)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Gets the number of passengers, NOT including the driver. Use IS_VEHICLE_SEAT_FREE(Vehicle, -1) to also check for the driver
</summary>
	]]

native "GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS"
	hash "0xA7C4F2C6E744A550"
	jhash (0x0A2FC08C)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"

native "GET_VEHICLE_MODEL_NUMBER_OF_SEATS"
	hash "0x2AD93716F184EDA4"
	jhash (0x838F7BF7)
	arguments {
		Hash "modelHash",
	}
	alias "_GET_VEHICLE_MODEL_MAX_NUMBER_OF_PASSENGERS"
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Returns max number of passengers (including the driver) for the specified vehicle model.

		For a full list, see here: pastebin.com/MdETCS1j
</summary>
	]]

native "0xF7F203E31F96F6A1"
	hash "0xF7F203E31F96F6A1"
	jhash (0x769E5CF2)
	arguments {
		Vehicle "vehicle",

		BOOL "flag",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		IS_S*
</summary>
	]]

native "0xE33FFA906CE74880"
	hash "0xE33FFA906CE74880"
	arguments {
		Vehicle "vehicle",

		Any "p1",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		IS_*
</summary>
	]]

native "SET_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME"
	hash "0x245A6883D966D537"
	jhash (0xF4187E51)
	arguments {
		float "multiplier",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		• Usage

		→ Use this native inside a looped function.
		→ Values:
		   → 0.0 = no vehicles on streets
		   → 1.0 = normal vehicles on streets




</summary>
	]]

native "SET_RANDOM_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME"
	hash "0xB3B3359379FE77D3"
	jhash (0x543F712B)
	arguments {
		float "multiplier",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_PARKED_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME"
	hash "0xEAE6DCC7EEE3DB1D"
	jhash (0xDD46CEBE)
	arguments {
		float "multiplier",
	}
	ns "VEHICLE"
	returns	"void"

native "_SET_SOMETHING_MULTIPLIER_THIS_FRAME"
	hash "0xD4B8E3D1917BC86B"
	jhash (0x09462665)
	arguments {
		BOOL "toggle",
	}
	alias "0xD4B8E3D1917BC86B"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		SET_*_MULTIPLIER_THIS_FRAME
</summary>
	]]

native "_SET_SOME_VEHICLE_DENSITY_MULTIPLIER_THIS_FRAME"
	hash "0x90B6DA738A9A25DA"
	jhash (0xDAE2A2BE)
	arguments {
		float "value",
	}
	alias "0x90B6DA738A9A25DA"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Judging from the effect, this is some sort of vehicle density multiplier.
</summary>
	]]

native "SET_FAR_DRAW_VEHICLES"
	hash "0x26324F33423F3CC3"
	jhash (0x9F019C49)
	arguments {
		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_NUMBER_OF_PARKED_VEHICLES"
	hash "0xCAA15F13EBD417FF"
	jhash (0x206A58E8)
	arguments {
		int "value",
	}
	ns "VEHICLE"
	returns	"Any"

native "SET_VEHICLE_DOORS_LOCKED"
	hash "0xB664292EAECF7FA6"
	jhash (0x4CDD35D0)
	arguments {
		Vehicle "vehicle",

		int "doorLockStatus",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>

		1 
		2 - CARLOCK_LOCKED (locked)
		3 
		4 - CARLOCK_LOCKED_PLAYER_INSIDE (can get in, can't leave)

		(maybe, these are leftovers from GTA:VC)
		5 
		6 
		7 

		(source: GTA VC miss2 leak, matching constants for 0/2/4, testing)

		They use 10 in am_mp_property_int, don't know what it does atm.
</summary>
	]]

native "SET_PED_TARGETTABLE_VEHICLE_DESTROY"
	hash "0xBE70724027F85BCD"
	jhash (0xD61D182D)
	arguments {
		Vehicle "vehicle",

		int "doorIndex",

		int "destroyType",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Hash collision!!!

		SET_VEHICLE_I*

		destroyType is 1 for opens on damage, 2 for breaks on damage.
</summary>
	]]

native "DISABLE_VEHICLE_IMPACT_EXPLOSION_ACTIVATION"
	hash "0xD8050E0EB60CF274"
	jhash (0xC54156A9)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		if set to true, prevents vehicle sirens from having sound, leaving only the lights.

		HASH COLLISION !!! Please change to _SET_DISABLE_VEHICLE_SIREN_SOUND

		-----

		SET_VEHICLE_HAS_*
</summary>
	]]

native "SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER"
	hash "0x517AAF684BB50CD1"
	jhash (0x49829236)
	arguments {
		Vehicle "vehicle",

		Player "player",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_VEHICLE_DOORS_LOCKED_FOR_PLAYER"
	hash "0xF6AF6CB341349015"
	jhash (0x1DC50247)
	arguments {
		Vehicle "vehicle",

		Player "player",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS"
	hash "0xA2F80B8D040727CC"
	jhash (0x891BA8A4)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		After some analysis, I've decided that these are what the parameters are.

		We can see this being used in R* scripts such as "am_mp_property_int.ysc.c4":
		l_11A1 = PED::GET_VEHICLE_PED_IS_IN(PLAYER::PLAYER_PED_ID(), 1);
		...
		VEHICLE::SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(l_11A1, 1);
</summary>
	]]

native "0x9737A37136F07E75"
	hash "0x9737A37136F07E75"
	jhash (0xE4EF6514)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		SET_VEHICLE_DOORS_LOCKED_FOR_*
</summary>
	]]

native "SET_VEHICLE_DOORS_LOCKED_FOR_TEAM"
	hash "0xB81F6D4A8F5EEBA8"
	jhash (0x4F85E783)
	arguments {
		Vehicle "vehicle",

		int "team",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "EXPLODE_VEHICLE"
	hash "0xBA71116ADF5B514C"
	jhash (0xBEDEACEB)
	arguments {
		Vehicle "vehicle",

		BOOL "isAudible",

		BOOL "isInvisible",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Explodes a selected vehicle.

		Vehicle vehicle = Vehicle you want to explode.
		BOOL isAudible = If explosion makes a sound.
		BOOL isInvisible = If the explosion is invisible or not.

		First BOOL does not give any visual explosion, the vehicle just falls apart completely but slowly and starts to burn.
</summary>
	]]

native "SET_VEHICLE_OUT_OF_CONTROL"
	hash "0xF19D095E42D430CC"
	jhash (0x3764D734)
	arguments {
		Vehicle "vehicle",

		BOOL "killDriver",

		BOOL "explodeOnImpact",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Tested on the player's current vehicle. Unless you kill the driver, the vehicle doesn't loose control, however, if enabled, explodeOnImpact is still active. The moment you crash, boom.
</summary>
	]]

native "SET_VEHICLE_TIMED_EXPLOSION"
	hash "0x2E0A74E1002380B1"
	jhash (0xDB8CB8E2)
	arguments {
		Vehicle "vehicle",

		Ped "ped",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		                                                VEHICLE::SET_VEHICLE_TIMED_EXPLOSION(v_3, PLAYER::GET_PLAYER_PED(v_5), 1);
</summary>
	]]

native "0x99AD4CCCB128CBC9"
	hash "0x99AD4CCCB128CBC9"
	jhash (0x811373DE)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "0x6ADAABD3068C5235"
	hash "0x6ADAABD3068C5235"
	jhash (0xA4E69134)
	ns "VEHICLE"
	returns	"Any"

native "_REQUEST_VEHICLE_PHONE_EXPLOSION"
	hash "0xEF49CF0270307CBE"
	jhash (0x65255524)
	alias "0xEF49CF0270307CBE"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		used for the remote vehicle explode thing with phones
</summary>
	]]

native "0xAE3FEE8709B39DCB"
	hash "0xAE3FEE8709B39DCB"
	jhash (0xE39DAF36)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_TAXI_LIGHTS"
	hash "0x598803E85E8448D9"
	jhash (0x68639D85)
	arguments {
		Vehicle "vehicle",

		BOOL "state",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		This is not tested - it's just an assumption.


		Doesn't seem to work.  I'll try with an int instead. --JT

		Read the scripts, im dumpass. 

		Doesn't work at all, wether with an bool neither an int

		                            if (!VEHICLE::IS_TAXI_LIGHT_ON(l_115)) {
		                                VEHICLE::SET_TAXI_LIGHTS(l_115, 1);
		                            }
</summary>
	]]

native "IS_TAXI_LIGHT_ON"
	hash "0x7504C0F113AB50FC"
	jhash (0x6FC4924A)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_VEHICLE_IN_GARAGE_AREA"
	hash "0xCEE4490CD57BB3C2"
	jhash (0xA90EC257)
	arguments {
		charPtr "garageName",

		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		garageName example "Michael - Beverly Hills"

		For a full list, see here: pastebin.com/73VfwsmS
</summary>
	]]

native "SET_VEHICLE_COLOURS"
	hash "0x4F1D4BE3A7F24601"
	jhash (0x57F24253)
	arguments {
		Vehicle "vehicle",

		int "colorPrimary",

		int "colorSecondary",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		colorPrimary &amp; colorSecondary are the paint index for the vehicle.
		For a list of valid paint indexes, view: pastebin.com/pwHci0xK
		-------------------------------------------------------------------------
		Use this to get the number of color indices: pastebin.com/RQEeqTSM
		Note: minimum color index is 0, maximum color index is (numColorIndices - 1)
</summary>
	]]

native "SET_VEHICLE_FULLBEAM"
	hash "0x8B7FD87F0DDB421E"
	jhash (0x9C49CC15)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		It switch to highbeam when p1 is set to true.
</summary>
	]]

native "STEER_UNLOCK_BIAS"
	hash "0x07116E24E9D1929D"
	jhash (0xA59E3DCD)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Hash collision!!!

		SET_VEHICLE_IS_*

		p1 (toggle) was always 1 (true) except in one case in the b678 scripts.
</summary>
	]]

native "SET_VEHICLE_CUSTOM_PRIMARY_COLOUR"
	hash "0x7141766F91D15BEA"
	jhash (0x8DF9F9BC)
	arguments {
		Vehicle "vehicle",

		int "r",

		int "g",

		int "b",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		p1, p2, p3 are RGB values for color (255,0,0 for Red, ect)
</summary>
	]]

native "GET_VEHICLE_CUSTOM_PRIMARY_COLOUR"
	hash "0xB64CF2CCA9D95F52"
	jhash (0x1C2B9FEF)
	arguments {
		Vehicle "vehicle",

		intPtr "r",

		intPtr "g",

		intPtr "b",
	}
	ns "VEHICLE"
	returns	"void"

native "CLEAR_VEHICLE_CUSTOM_PRIMARY_COLOUR"
	hash "0x55E1D2758F34E437"
	jhash (0x51E1E33D)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"Any"

native "GET_IS_VEHICLE_PRIMARY_COLOUR_CUSTOM"
	hash "0xF095C0405307B21B"
	jhash (0xD7EC8760)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_CUSTOM_SECONDARY_COLOUR"
	hash "0x36CED73BFED89754"
	jhash (0x9D77259E)
	arguments {
		Vehicle "vehicle",

		int "r",

		int "g",

		int "b",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		p1, p2, p3 are RGB values for color (255,0,0 for Red, ect)
</summary>
	]]

native "GET_VEHICLE_CUSTOM_SECONDARY_COLOUR"
	hash "0x8389CD56CA8072DC"
	jhash (0x3FF247A2)
	arguments {
		Vehicle "vehicle",

		intPtr "r",

		intPtr "g",

		intPtr "b",
	}
	ns "VEHICLE"
	returns	"void"

native "CLEAR_VEHICLE_CUSTOM_SECONDARY_COLOUR"
	hash "0x5FFBDEEC3E8E2009"
	jhash (0x7CE00B29)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"Any"

native "GET_IS_VEHICLE_SECONDARY_COLOUR_CUSTOM"
	hash "0x910A32E7AAD2656C"
	jhash (0x288AD228)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Check if Vehicle Secondary is avaliable for customize
</summary>
	]]

native "SET_VEHICLE_ENVEFF_SCALE"
	hash "0x3AFDC536C3D01674"
	jhash (0x8332730C)
	arguments {
		Vehicle "vehicle",

		float "fade",
	}
	alias "_SET_VEHICLE_PAINT_FADE"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		formerly known as _SET_VEHICLE_PAINT_FADE

		The parameter fade is a value from 0-1, where 0 is fresh paint.
		------------------------------------------------------------------------------------
		The actual value isn't stored as a float but as an unsigned char (BYTE). More info here: pastebin.com/r0h6EM5s
		--------------
		Separate Person: I didn't want to be rude and remove it, but whom ever posted that pastebin above please remove it as the paste says it has been removed.
</summary>
	]]

native "GET_VEHICLE_ENVEFF_SCALE"
	hash "0xA82819CAC9C4C403"
	jhash (0xD5F1EEE1)
	arguments {
		Vehicle "vehicle",
	}
	alias "_GET_VEHICLE_PAINT_FADE"
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		formerly known as _GET_VEHICLE_PAINT_FADE

		The result is a value from 0-1, where 0 is fresh paint.
		-----------------------------------------------------------------------
		The actual value isn't stored as a float but as an unsigned char (BYTE).
</summary>
	]]

native "SET_CAN_RESPRAY_VEHICLE"
	hash "0x52BBA29D5EC69356"
	jhash (0x37677590)
	arguments {
		Vehicle "vehicle",

		BOOL "state",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Hardcoded to not work in multiplayer.
</summary>
	]]

native "0x33506883545AC0DF"
	hash "0x33506883545AC0DF"
	jhash (0x54E9EE75)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_JITTER_VEHICLE"
	hash "0xC59872A5134879C7"
	jhash (0x4A46E814)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",

		float "yaw",

		float "pitch",

		float "roll",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		When I called this with what the script was doing, which was -190f for yaw pitch and roll, all my car did was jitter a little. I also tried 0 and 190f. I altered the p1 variable between TRUE and FALSE and didn't see a difference.

		This might have something to do with the physbox of the vehicle, but I'm not sure.
</summary>
	]]

native "SET_BOAT_ANCHOR"
	hash "0x75DBEC174AEEAD10"
	jhash (0xA3906284)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "_GET_BOAT_ANCHOR"
	hash "0x26C10ECBDA5D043B"
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Console Hash: 0xE97A4F5E
</summary>
	]]

native "0xE3EBAAE484798530"
	hash "0xE3EBAAE484798530"
	jhash (0x0ED84792)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		No observed effect.
</summary>
	]]

native "0xB28B1FE5BFADD7F5"
	hash "0xB28B1FE5BFADD7F5"
	jhash (0xA739012A)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		No observed effect.
</summary>
	]]

native "0xE842A9398079BD82"
	hash "0xE842A9398079BD82"
	jhash (0x66FA450C)
	arguments {
		Vehicle "vehicle",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Vehicle must be a boat.
</summary>
	]]

native "0x8F719973E1445BA2"
	hash "0x8F719973E1445BA2"
	jhash (0x35614622)
	arguments {
		Vehicle "vehicle",

		Vehicle "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		No observed effect.
</summary>
	]]

native "SET_VEHICLE_SIREN"
	hash "0xF4924635A19EB37D"
	jhash (0x4AC1EFC7)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Activate siren on vehicle (Only works if the vehicle has a siren).
</summary>
	]]

native "IS_VEHICLE_SIREN_ON"
	hash "0x4C9BF537BE2634B2"
	jhash (0x25EB5873)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "_IS_VEHICLE_SIREN_SOUND_ON"
	hash "0xB5CC40FBCB586380"
	arguments {
		Vehicle "vehicle",
	}
	alias "0xB5CC40FBCB586380"
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_STRONG"
	hash "0x3E8C8727991A8A0B"
	jhash (0xC758D19F)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		If set to true, vehicle will not take crash damage, but is still susceptible to damage from bullets and explosives
</summary>
	]]

native "REMOVE_VEHICLE_STUCK_CHECK"
	hash "0x8386BFB614D06749"
	jhash (0x81594917)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_VEHICLE_COLOURS"
	hash "0xA19435F193E081AC"
	jhash (0x40D82D88)
	arguments {
		Vehicle "vehicle",

		intPtr "colorPrimary",

		intPtr "colorSecondary",
	}
	ns "VEHICLE"
	returns	"void"

native "IS_VEHICLE_SEAT_FREE"
	hash "0x22AC59A870E6A669"
	jhash (0xDAF42B02)
	arguments {
		Vehicle "vehicle",

		int "seatIndex",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Has an additional BOOL parameter since version [???].

		Check if a vehicle seat is free.
		-1 being the driver seat.
		Use GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle) - 1 for last seat index.
</summary>
	]]

native "GET_PED_IN_VEHICLE_SEAT"
	hash "0xBB40DD2270B65366"
	jhash (0x388FDE9A)
	arguments {
		Vehicle "vehicle",

		int "index",
	}
	ns "VEHICLE"
	returns	"Ped"
	doc [[!
<summary>
		-1 (driver) &lt;= index &lt; GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle)
</summary>
	]]

native "GET_LAST_PED_IN_VEHICLE_SEAT"
	hash "0x83F969AA1EE2A664"
	jhash (0xF7C6792D)
	arguments {
		Vehicle "vehicle",

		int "seatIndex",
	}
	ns "VEHICLE"
	returns	"Ped"

native "GET_VEHICLE_LIGHTS_STATE"
	hash "0xB91B4C20085BD12F"
	jhash (0x7C278621)
	arguments {
		Vehicle "vehicle",

		BOOLPtr "lightsOn",

		BOOLPtr "highbeamsOn",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_VEHICLE_TYRE_BURST"
	hash "0xBA291848A0815CA9"
	jhash (0x48C80210)
	arguments {
		Vehicle "vehicle",

		int "wheelID",

		BOOL "completely",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		wheelID used for 4 wheelers seem to be (0, 1, 4, 5)
		completely - is to check if tire completely gone from rim.

		'0 = wheel_lf / bike, plane or jet front
		'1 = wheel_rf
		'2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left
		'3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right
		'4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left
		'5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right
		'45 = 6 wheels trailer mid wheel left
		'47 = 6 wheels trailer mid wheel right
</summary>
	]]

native "SET_VEHICLE_FORWARD_SPEED"
	hash "0xAB54A438726D25D5"
	jhash (0x69880D14)
	arguments {
		Vehicle "vehicle",

		float "speed",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		SCALE: Setting the speed to 30 would result in a speed of roughly 60mph, according to speedometer.

		Speed is in meters per second
		You can convert meters/s to mph here:
		http://www.calculateme.com/Speed/MetersperSecond/ToMilesperHour.htm
</summary>
	]]

native "_SET_VEHICLE_HALT"
	hash "0x260BE8F09E326A20"
	jhash (0xCBC7D3C8)
	arguments {
		Vehicle "vehicle",

		float "distance",

		int "killEngine",

		BOOL "unknown",
	}
	alias "0x260BE8F09E326A20"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		This native makes the vehicle stop immediately, as happens when we enter a MP garage.

		. distance defines how far it will travel until stopping. Garage doors use 3.0.

		. If killEngine is set to 1, you cannot resume driving the vehicle once it stops. This looks like is a bitmapped integer.
</summary>
	]]

native "0x37EBBF3117BD6A25"
	hash "0x37EBBF3117BD6A25"
	jhash (0x943A6CFC)
	arguments {
		Vehicle "vehicle",

		float "height",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets some values in a vehicle gadget (tow arm, digger arm, etc.). Don't know which one though.

		I've tested on the towtruck 1 &amp; 2, Dock Lift (Crate Arm), Dozer, and such have no effect. However when used on a Forklift it sets the height of the forks. 0.0 = Lowest 1.0 = Highest. This is best to be used if you wanna pick-up a car since un-realistically on GTA V forklifts can't pick up much of anything due to vehicle mass. If you put this under a car then set it above 0.0 to a 'lifted-value' it will raise the car with no issue lol
</summary>
	]]

native "SET_PED_ENABLED_BIKE_RINGTONE"
	hash "0x57715966069157AD"
	jhash (0x7FB25568)
	arguments {
		Vehicle "vehicle",

		Entity "entity",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		This is a hash collision...

		_IS_VEHICLE_NEAR_ENTITY
</summary>
	]]

native "0x62CA17B74C435651"
	hash "0x62CA17B74C435651"
	jhash (0x593143B9)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "_GET_VEHICLE_ATTACHED_TO_ENTITY"
	hash "0x375E7FC44F21C8AB"
	jhash (0x70DD5E25)
	arguments {
		Vehicle "object",
	}
	alias "0x375E7FC44F21C8AB"
	ns "VEHICLE"
	returns	"Vehicle"
	doc [[!
<summary>
		Get the vehicle attached to the object/entity? May also just convert it to a vehicle, but I'm not sure.
</summary>
	]]

native "0x89D630CF5EA96D23"
	hash "0x89D630CF5EA96D23"
	jhash (0xFBF5536A)
	arguments {
		Vehicle "vehicle",

		Entity "entity",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "0x6A98C2ECF57FA5D4"
	hash "0x6A98C2ECF57FA5D4"
	jhash (0x20AB5783)
	arguments {
		Vehicle "vehicle",

		Entity "entity",
	}
	ns "VEHICLE"
	returns	"void"

native "0x7C0043FDFF6436BC"
	hash "0x7C0043FDFF6436BC"
	jhash (0x0F11D01F)
	arguments {
		Vehicle "x",
	}
	ns "VEHICLE"
	returns	"void"

native "0x8AA9180DE2FEDD45"
	hash "0x8AA9180DE2FEDD45"
	jhash (0xAE040377)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x0A6A279F3AA4FD70"
	hash "0x0A6A279F3AA4FD70"
	jhash (0x4C0E4031)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x634148744F385576"
	hash "0x634148744F385576"
	jhash (0x6346B7CC)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "0xE6F13851780394DA"
	hash "0xE6F13851780394DA"
	jhash (0xCCB41A55)
	arguments {
		Vehicle "vehicle",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_TYRE_BURST"
	hash "0xEC6A202EE4960385"
	jhash (0x89D28068)
	arguments {
		Vehicle "vehicle",

		int "index",

		BOOL "onRim",

		float "p3",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		"To burst tyres VEHICLE::SET_VEHICLE_TYRE_BURST(vehicle, 0, true, 1000.0)
		to burst all tyres type it 8 times where p1 = 0 to 7.

		p3 seems to be how much damage it has taken. 0 doesn't deflate them, 1000 completely deflates them.

		'0 = wheel_lf / bike, plane or jet front
		'1 = wheel_rf
		'2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left
		'3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right
		'4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left
		'5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right
		'45 = 6 wheels trailer mid wheel left
		'47 = 6 wheels trailer mid wheel right
</summary>
	]]

native "SET_VEHICLE_DOORS_SHUT"
	hash "0x781B3D62BB013EF5"
	jhash (0xBB1FF6E7)
	arguments {
		Vehicle "vehicle",

		BOOL "closeInstantly",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Closes all doors of a vehicle:
</summary>
	]]

native "SET_VEHICLE_TYRES_CAN_BURST"
	hash "0xEB9DC3C7D8596C46"
	jhash (0xA198DB54)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Allows you to toggle bulletproof tires.
</summary>
	]]

native "GET_VEHICLE_TYRES_CAN_BURST"
	hash "0x678B9BB8C3F58FEB"
	jhash (0x4D76CD2F)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_WHEELS_CAN_BREAK"
	hash "0x29B18B4FD460CA8F"
	jhash (0x829ED654)
	arguments {
		Vehicle "vehicle",

		BOOL "enabled",
	}
	ns "VEHICLE"
	returns	"Any"

native "SET_VEHICLE_DOOR_OPEN"
	hash "0x7C65DAC73C35C862"
	jhash (0xBB75D38B)
	arguments {
		Vehicle "vehicle",

		int "doorIndex",

		BOOL "loose",

		BOOL "openInstantly",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		doorIndex:
		0 = Front Left Door
		1 = Front Right Door
		2 = Back Left Door
		3 = Back Right Door
		4 = Hood
		5 = Trunk
		6 = Back
		7 = Back2
</summary>
	]]

native "REMOVE_VEHICLE_WINDOW"
	hash "0xA711568EEDB43069"
	jhash (0xBB8104A3)
	arguments {
		Vehicle "vehicle",

		int "windowIndex",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		windowIndex:
		0 = Front Right Window
		1 = Front Left Window
		2 = Back Right Window
		3 = Back Left Window
</summary>
	]]

native "ROLL_DOWN_WINDOWS"
	hash "0x85796B0549DDE156"
	jhash (0x51A16DC6)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Roll down all the windows of the vehicle passed through the first parameter.
</summary>
	]]

native "ROLL_DOWN_WINDOW"
	hash "0x7AD9E6CE657D69E3"
	jhash (0xF840134C)
	arguments {
		Vehicle "vehicle",

		int "windowIndex",
	}
	ns "VEHICLE"
	returns	"Any"
	doc [[!
<summary>
		windowIndex:
		0 = Front Right Window
		1 = Front Left Window
		2 = Back Right Window
		3 = Back Left Window
</summary>
	]]

native "ROLL_UP_WINDOW"
	hash "0x602E548F46E24D59"
	jhash (0x83B7E06A)
	arguments {
		Vehicle "vehicle",

		int "windowIndex",
	}
	ns "VEHICLE"
	returns	"Any"
	doc [[!
<summary>
		0 = Front Right Window
		1 = Front Left Window
		2 = Back Right Window
		3 = Back Left Window
</summary>
	]]

native "SMASH_VEHICLE_WINDOW"
	hash "0x9E5B5E4D2CCD2259"
	jhash (0xDDD9A8C2)
	arguments {
		Vehicle "vehicle",

		int "index",
	}
	ns "VEHICLE"
	returns	"Any"

native "FIX_VEHICLE_WINDOW"
	hash "0x772282EBEB95E682"
	jhash (0x6B8E990D)
	arguments {
		Vehicle "vehicle",

		int "index",
	}
	ns "VEHICLE"
	returns	"Any"

native "_DETACH_VEHICLE_WINDSCREEN"
	hash "0x6D645D59FB5F5AD3"
	jhash (0xCC95C96B)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Detaches the vehicle's windscreen.
		For further information, see : gtaforums.com/topic/859570-glass/#entry1068894566
</summary>
	]]

native "_EJECT_JB700_ROOF"
	hash "0xE38CB9D7D39FDBCC"
	jhash (0xFDA7B6CA)
	arguments {
		Vehicle "vehicle",

		float "x",

		float "y",

		float "z",
	}
	alias "0xE38CB9D7D39FDBCC"
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_LIGHTS"
	hash "0x34E710FF01247C5A"
	jhash (0xE8930226)
	arguments {
		Vehicle "vehicle",

		int "state",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		set's if the vehicle has lights or not.
		not an on off toggle.
		p1 = 0 ;vehicle normal lights, off then lowbeams, then highbeams
		p1 = 1 ;vehicle doesn't have lights, always off
		p1 = 2 ;vehicle has always on lights
		p1 = 3 ;or even larger like 4,5,... normal lights like =1
		note1: when using =2 on day it's lowbeam,highbeam
		but at night it's lowbeam,lowbeam,highbeam
		note2: when using =0 it's affected by day or night for highbeams don't exist in daytime.
</summary>
	]]

native "0xC45C27EF50F36ADC"
	hash "0xC45C27EF50F36ADC"
	jhash (0x4221E435)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_SET_VEHICLE_LIGHTS_MODE"
	hash "0x1FD09E7390A74D54"
	arguments {
		Vehicle "vehicle",

		int "p1",
	}
	alias "0x1FD09E7390A74D54"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		p1 can be either 0, 1 or 2.

		Determines how vehicle lights behave when toggled.

		0 = Default (Lights can be toggled between off, normal and high beams)
		1 = Lights Disabled (Lights are fully disabled, cannot be toggled)
		2 = Always On (Lights can be toggled between normal and high beams)
</summary>
	]]

native "SET_VEHICLE_ALARM"
	hash "0xCDE5E70C1DDB954C"
	jhash (0x24877D84)
	arguments {
		Vehicle "vehicle",

		BOOL "state",
	}
	ns "VEHICLE"
	returns	"void"

native "START_VEHICLE_ALARM"
	hash "0xB8FF7AB45305C345"
	jhash (0x5B451FF7)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"Any"

native "IS_VEHICLE_ALARM_ACTIVATED"
	hash "0x4319E335B71FFF34"
	jhash (0xF2630A4C)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_INTERIORLIGHT"
	hash "0xBC2042F090AF6AD3"
	jhash (0x9AD1FE1E)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_LIGHT_MULTIPLIER"
	hash "0xB385454F8791F57C"
	jhash (0x48039D6A)
	arguments {
		Vehicle "vehicle",

		float "multiplier",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		multiplier = brightness of head lights.
		this value isn't capped afaik.

		multiplier = 0.0 no lights
		multiplier = 1.0 default game value

</summary>
	]]

native "ATTACH_VEHICLE_TO_TRAILER"
	hash "0x3C7D42D58F770B54"
	jhash (0x2133977F)
	arguments {
		Vehicle "vehicle",

		Vehicle "trailer",

		float "radius",
	}
	ns "VEHICLE"
	returns	"void"

native "0x16B5E274BDE402F8"
	hash "0x16B5E274BDE402F8"
	jhash (0x12AC1A16)
	arguments {
		Vehicle "vehicle",

		Vehicle "trailer",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		float "p9",

		float "p10",

		float "p11",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		only documented to be continued...


</summary>
	]]

native "0x374706271354CB18"
	hash "0x374706271354CB18"
	jhash (0x40C4763F)
	arguments {
		Vehicle "vehicle",

		Entity "p1",

		float "p2",
	}
	ns "VEHICLE"
	returns	"void"

native "DETACH_VEHICLE_FROM_TRAILER"
	hash "0x90532EDF0D2BDD86"
	jhash (0xB5DBF91D)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Public Sub detatchTrailer(vh1 As Vehicle)
		        Native.Function.Call(Hash.DETACH_VEHICLE_FROM_TRAILER, vh1)
		    End Sub
</summary>
	]]

native "IS_VEHICLE_ATTACHED_TO_TRAILER"
	hash "0xE7CF3C4F9F489F0C"
	jhash (0xE142BBCC)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Public Function isVehicleAttachedToTrailer(vh As Vehicle) As Boolean
		        Return Native.Function.Call(Of Boolean)(Hash.IS_VEHICLE_ATTACHED_TO_TRAILER, vh)
		    End Function
</summary>
	]]

native "0x2A8F319B392E7B3F"
	hash "0x2A8F319B392E7B3F"
	jhash (0xE74E85CE)
	arguments {
		Vehicle "vehicle",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		                VEHICLE::_2A8F319B392E7B3F(vehicle, 0.5);

</summary>
	]]

native "0x95CF53B3D687F9FA"
	hash "0x95CF53B3D687F9FA"
	jhash (0x06C47A6F)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		in the decompiled scripts, seems to be always called on the vehicle right after being attached to a trailer.
</summary>
	]]

native "SET_VEHICLE_TYRE_FIXED"
	hash "0x6E13FC662B882D1D"
	jhash (0xA42EFA6B)
	arguments {
		Vehicle "vehicle",

		int "tyreIndex",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		tyreIndex = 0 to 4 on normal vehicles

		'0 = wheel_lf / bike, plane or jet front
		'1 = wheel_rf
		'2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left
		'3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right
		'4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left
		'5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right
		'45 = 6 wheels trailer mid wheel left
		'47 = 6 wheels trailer mid wheel right
</summary>
	]]

native "SET_VEHICLE_NUMBER_PLATE_TEXT"
	hash "0x95A88F0B409CDA47"
	jhash (0x400F9556)
	arguments {
		Vehicle "vehicle",

		charPtr "plateText",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets a vehicle's license plate text.  8 chars maximum.

		Example:
		Ped playerPed = PLAYER::PLAYER_PED_ID();
		Vehicle veh = PED::GET_VEHICLE_PED_IS_USING(playerPed);
		char *plateText = "KING";
		VEHICLE::SET_VEHICLE_NUMBER_PLATE_TEXT(veh, plateText);
</summary>
	]]

native "GET_VEHICLE_NUMBER_PLATE_TEXT"
	hash "0x7CE1CCB9B293020E"
	jhash (0xE8522D58)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"charPtr"
	doc [[!
<summary>
		Returns the license plate text from a vehicle.  8 chars maximum.
</summary>
	]]

native "GET_NUMBER_OF_VEHICLE_NUMBER_PLATES"
	hash "0x4C4D6B2644F458CB"
	jhash (0xD24BC1AE)
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Returns the number of *types* of licence plates, enumerated below in SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX.
</summary>
	]]

native "SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX"
	hash "0x9088EB5A43FFB0A1"
	jhash (0xA1A1890E)
	arguments {
		Vehicle "vehicle",

		int "plateIndex",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Plates:
		Blue/White 
		Yellow/black 
		Yellow/Blue 
		Blue/White2 
		Blue/White3 
		Yankton 
</summary>
	]]

native "GET_VEHICLE_NUMBER_PLATE_TEXT_INDEX"
	hash "0xF11BC2DD9A3E7195"
	jhash (0x499747B6)
	arguments {
		Vehicle "elegy",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Returns the PlateType of a vehicle
				Blue_on_White_1 = 3,
				Blue_on_White_2 = 0,
				Blue_on_White_3 = 4,
				Yellow_on_Blue = 2,
				Yellow_on_Black = 1,
				North_Yankton = 5,
</summary>
	]]

native "SET_RANDOM_TRAINS"
	hash "0x80D9F74197EA47D9"
	jhash (0xD461CA7F)
	arguments {
		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "CREATE_MISSION_TRAIN"
	hash "0x63C6CCA8E68AE8C8"
	jhash (0xD4C2EAFD)
	arguments {
		int "variation",

		float "x",

		float "y",

		float "z",

		BOOL "direction",
	}
	ns "VEHICLE"
	returns	"Vehicle"
	doc [[!
<summary>
		Train models HAVE TO be loaded (requested) before you use this.
		For variation 15 - request:

		freight
		freightcar
		freightgrain
		freightcont1
		freightcont2
		freighttrailer


</summary>
	]]

native "SWITCH_TRAIN_TRACK"
	hash "0xFD813BB7DB977F20"
	jhash (0x68BFDD61)
	arguments {
		int "intersectionId",

		BOOL "state",
	}
	ns "VEHICLE"
	returns	"Any"

native "0x21973BBF8D17EDFA"
	hash "0x21973BBF8D17EDFA"
	jhash (0xD5774FB7)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Only called once inside main_persitant with the parameters, 0 
</summary>
	]]

native "DELETE_ALL_TRAINS"
	hash "0x736A718577F39C7D"
	jhash (0x83DE7ABF)
	ns "VEHICLE"
	returns	"void"

native "SET_TRAIN_SPEED"
	hash "0xAA0BC91BE0B796E3"
	jhash (0xDFC35E4D)
	arguments {
		Vehicle "train",

		float "speed",
	}
	ns "VEHICLE"
	returns	"Any"

native "SET_TRAIN_CRUISE_SPEED"
	hash "0x16469284DB8C62B5"
	jhash (0xB507F51D)
	arguments {
		Vehicle "train",

		float "speed",
	}
	ns "VEHICLE"
	returns	"Any"

native "SET_RANDOM_BOATS"
	hash "0x84436EC293B1415F"
	jhash (0xB505BD89)
	arguments {
		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"Any"

native "SET_GARBAGE_TRUCKS"
	hash "0x2AFD795EEAC8D30D"
	jhash (0xD9ABB0FF)
	arguments {
		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"Any"

native "DOES_VEHICLE_HAVE_STUCK_VEHICLE_CHECK"
	hash "0x57E4C39DE5EE8470"
	jhash (0x5D91D9AC)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Maximum amount of vehicles with vehicle stuck check appears to be 16.
</summary>
	]]

native "GET_VEHICLE_RECORDING_ID"
	hash "0x21543C612379DB3C"
	jhash (0x328D601D)
	arguments {
		int "p0",

		charPtr "p1",
	}
	ns "VEHICLE"
	returns	"int"

native "REQUEST_VEHICLE_RECORDING"
	hash "0xAF514CABE74CBF15"
	jhash (0x91AFEFD9)
	arguments {
		int "i",

		charPtr "name",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		In script files, seen as REQUEST_VEHICLE_RECORDING(1, "FBIs1UBER");
</summary>
	]]

native "HAS_VEHICLE_RECORDING_BEEN_LOADED"
	hash "0x300D614A4C785FC4"
	jhash (0xF52CD7F5)
	arguments {
		Any "p0",

		AnyPtr "p1",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "REMOVE_VEHICLE_RECORDING"
	hash "0xF1160ACCF98A3FC8"
	jhash (0xD3C05B00)
	arguments {
		Any "p0",

		AnyPtr "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x92523B76657A517D"
	hash "0x92523B76657A517D"
	jhash (0xF31973BB)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "VEHICLE"
	returns	"int"

native "GET_POSITION_OF_VEHICLE_RECORDING_AT_TIME"
	hash "0xD242728AA6F0FBA2"
	jhash (0x7178558D)
	arguments {
		int "p0",

		float "p1",

		charPtr "p2",
	}
	ns "VEHICLE"
	returns	"Vector3"
	doc [[!
<summary>
		p1 is some kind of tolerance
</summary>
	]]

native "0xF0F2103EFAF8CBA7"
	hash "0xF0F2103EFAF8CBA7"
	jhash (0x4D1C15C2)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "VEHICLE"
	returns	"Vector3"

native "GET_ROTATION_OF_VEHICLE_RECORDING_AT_TIME"
	hash "0x2058206FBE79A8AD"
	jhash (0xD96DEC68)
	arguments {
		Any "p0",

		float "p1",

		AnyPtr "p2",
	}
	ns "VEHICLE"
	returns	"int"

native "GET_TOTAL_DURATION_OF_VEHICLE_RECORDING_ID"
	hash "0x102D125411A7B6E6"
	jhash (0x7116785E)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"float"

native "GET_TOTAL_DURATION_OF_VEHICLE_RECORDING"
	hash "0x0E48D1C262390950"
	jhash (0x5B35EEB7)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "VEHICLE"
	returns	"Any"

native "GET_POSITION_IN_RECORDING"
	hash "0x2DACD605FC681475"
	jhash (0x7DCD644C)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"float"

native "GET_TIME_POSITION_IN_RECORDING"
	hash "0x5746F3A7AB7FE544"
	jhash (0xF8C3E4A2)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"float"

native "START_PLAYBACK_RECORDED_VEHICLE"
	hash "0x3F878F92B3A7A071"
	jhash (0xCF614CA8)
	arguments {
		Vehicle "vehicle",

		int "p1",

		charPtr "playback",

		BOOL "p3",
	}
	ns "VEHICLE"
	returns	"void"

native "START_PLAYBACK_RECORDED_VEHICLE_WITH_FLAGS"
	hash "0x7D80FD645D4DA346"
	jhash (0x4E721AD2)
	arguments {
		Vehicle "vehicle",

		Any "p1",

		charPtr "playback",

		Any "p3",

		Any "p4",

		Any "p5",
	}
	ns "VEHICLE"
	returns	"void"

native "0x1F2E4E06DEA8992B"
	hash "0x1F2E4E06DEA8992B"
	jhash (0x01B91CD0)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "STOP_PLAYBACK_RECORDED_VEHICLE"
	hash "0x54833611C17ABDEA"
	jhash (0xAE99C57C)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "PAUSE_PLAYBACK_RECORDED_VEHICLE"
	hash "0x632A689BF42301B1"
	jhash (0xCCF54912)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "UNPAUSE_PLAYBACK_RECORDED_VEHICLE"
	hash "0x8879EE09268305D5"
	jhash (0x59060F75)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "IS_PLAYBACK_GOING_ON_FOR_VEHICLE"
	hash "0x1C8A4C2C19E68EEC"
	jhash (0x61F7650D)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_PLAYBACK_USING_AI_GOING_ON_FOR_VEHICLE"
	hash "0xAEA8FD591FAD4106"
	jhash (0x63022C58)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "GET_CURRENT_PLAYBACK_FOR_VEHICLE"
	hash "0x42BC05C27A946054"
	jhash (0xA3F44390)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"Any"

native "SKIP_TO_END_AND_STOP_PLAYBACK_RECORDED_VEHICLE"
	hash "0xAB8E2EDA0C0A5883"
	jhash (0x8DEA18C8)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_PLAYBACK_SPEED"
	hash "0x6683AB880E427778"
	jhash (0x684E26E4)
	arguments {
		Vehicle "vehicle",

		float "speed",
	}
	ns "VEHICLE"
	returns	"void"

native "START_PLAYBACK_RECORDED_VEHICLE_USING_AI"
	hash "0x29DE5FA52D00428C"
	jhash (0x8DE8E24E)
	arguments {
		Any "p0",

		Any "p1",

		AnyPtr "p2",

		float "p3",

		Any "p4",
	}
	ns "VEHICLE"
	returns	"void"

native "SKIP_TIME_IN_PLAYBACK_RECORDED_VEHICLE"
	hash "0x9438F7AD68771A20"
	jhash (0xCF3EFA4B)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_PLAYBACK_TO_USE_AI"
	hash "0xA549C3B37EA28131"
	jhash (0xB536CCD7)
	arguments {
		Vehicle "vehicle",

		int "flag",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_PLAYBACK_TO_USE_AI_TRY_TO_REVERT_BACK_LATER"
	hash "0x6E63860BBB190730"
	jhash (0x0C8ABAA4)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		BOOL "p3",
	}
	ns "VEHICLE"
	returns	"void"

native "0x5845066D8A1EA7F7"
	hash "0x5845066D8A1EA7F7"
	jhash (0x943A58EB)
	arguments {
		Vehicle "vehicle",

		float "x",

		float "y",

		float "z",

		Any "p4",
	}
	ns "VEHICLE"
	returns	"void"

native "0x796A877E459B99EA"
	hash "0x796A877E459B99EA"
	jhash (0x5C9F477C)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "VEHICLE"
	returns	"void"

native "0xFAF2A78061FD9EF4"
	hash "0xFAF2A78061FD9EF4"
	jhash (0xCD83C393)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "VEHICLE"
	returns	"void"

native "0x063AE2B2CC273588"
	hash "0x063AE2B2CC273588"
	jhash (0x2EF8435C)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "EXPLODE_VEHICLE_IN_CUTSCENE"
	hash "0x786A4EB67B01BF0B"
	jhash (0xA85207B5)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "ADD_VEHICLE_STUCK_CHECK_WITH_WARP"
	hash "0x2FA9923062DD396C"
	jhash (0xC8B789AD)
	arguments {
		Any "p0",

		float "p1",

		Any "p2",

		BOOL "p3",

		BOOL "p4",

		BOOL "p5",

		Any "p6",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_MODEL_IS_SUPPRESSED"
	hash "0x0FC2D89AC25A5814"
	jhash (0x42A08C9B)
	arguments {
		Hash "model",

		BOOL "suppressed",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		seems to make the vehicle stop spawning naturally in traffic. Here's an essential example:

		VEHICLE::SET_VEHICLE_MODEL_IS_SUPPRESSED(GAMEPLAY::GET_HASH_KEY("taco"), true);

		god I hate taco vans

		Confirmed to work? Needs to be looped? Can not get it to work.
</summary>
	]]

native "GET_RANDOM_VEHICLE_IN_SPHERE"
	hash "0x386F6CE5BAF6091C"
	jhash (0x57216D03)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "modelHash",

		int "flags",
	}
	ns "VEHICLE"
	returns	"Vehicle"
	doc [[!
<summary>
		Gets a random vehicle in a sphere at the specified position, of the specified radius.

		x: The X-component of the position of the sphere.
		y: The Y-component of the position of the sphere.
		z: The Z-component of the position of the sphere.
		radius: The radius of the sphere. Max is 9999.9004.
		modelHash: The vehicle model to limit the selection to. Pass 0 for any model.
		flags: The bitwise flags that modifies the behaviour of this function.
</summary>
	]]

native "GET_RANDOM_VEHICLE_FRONT_BUMPER_IN_SPHERE"
	hash "0xC5574E0AEB86BA68"
	jhash (0xDCADEB66)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		int "p4",

		int "p5",

		int "p6",
	}
	ns "VEHICLE"
	returns	"Vehicle"

native "GET_RANDOM_VEHICLE_BACK_BUMPER_IN_SPHERE"
	hash "0xB50807EABE20A8DC"
	jhash (0xD6343F6B)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		int "p4",

		int "p5",

		int "p6",
	}
	ns "VEHICLE"
	returns	"Vehicle"

native "GET_CLOSEST_VEHICLE"
	hash "0xF73EB622C4F1689B"
	jhash (0xD7E26B2C)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "modelHash",

		int "flags",
	}
	ns "VEHICLE"
	returns	"Vehicle"
	doc [[!
<summary>
		Example usage
		VEHICLE::GET_CLOSEST_VEHICLE(x, y, z, radius, hash, unknown leave at 70) 

		x, y, z: Position to get closest vehicle to.
		radius: Max radius to get a vehicle.
		modelHash: Limit to vehicles with this model. 0 for any.
		flags: The bitwise flags altering the function's behaviour.

		Does not return police cars or helicopters.

		It seems to return police cars for me, does not seem to return helicopters, planes or boats for some reason

		Only returns non police cars and motorbikes with the flag set to 70 and modelHash to 0. ModelHash seems to always be 0 when not a modelHash in the scripts, as stated above. 

		These flags were found in the b617d scripts: 0,2,4,6,7,23,127,260,2146,2175,12294,16384,16386,20503,32768,67590,67711,98309,100359.
		Converted to binary, each bit probably represents a flag as explained regarding another native here: gtaforums.com/topic/822314-guide-driving-styles

		Conversion of found flags to binary: pastebin.com/kghNFkRi

		At exactly 16384 which is 0100000000000000 in binary and 4000 in hexadecimal only planes are returned. 

		It's probably more convenient to use worldGetAllVehicles(int *arr, int arrSize) and check the shortest distance yourself and sort if you want by checking the vehicle type with for example VEHICLE::IS_THIS_MODEL_A_BOAT

		-------------------------------------------------------------------------

		Conclusion: This native is not worth trying to use. Use something like this instead: pastebin.com/xiFdXa7h
</summary>
	]]

native "GET_TRAIN_CARRIAGE"
	hash "0x08AAFD0814722BC3"
	jhash (0x2544E7A6)
	arguments {
		Vehicle "train",

		int "trailerNumber",
	}
	ns "VEHICLE"
	returns	"Entity"
	doc [[!
<summary>
		Corrected p1. it's basically the 'carriage/trailer number'. So if the train has 3 trailers you'd call the native once with a var or 3 times with 1, 2, 3.
</summary>
	]]

native "DELETE_MISSION_TRAIN"
	hash "0x5B76B14AE875C795"
	jhash (0x86C9497D)
	arguments {
		VehiclePtr "train",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_MISSION_TRAIN_AS_NO_LONGER_NEEDED"
	hash "0xBBE7648349B49BE8"
	jhash (0x19808560)
	arguments {
		VehiclePtr "train",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		p1 is always 0
</summary>
	]]

native "SET_MISSION_TRAIN_COORDS"
	hash "0x591CA673AA6AB736"
	jhash (0xD6D70803)
	arguments {
		Vehicle "train",

		float "x",

		float "y",

		float "z",
	}
	ns "VEHICLE"
	returns	"void"

native "IS_THIS_MODEL_A_BOAT"
	hash "0x45A9187928F4B9E3"
	jhash (0x10F6085C)
	arguments {
		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "_IS_THIS_MODEL_A_JETSKI"
	hash "0x9537097412CF75FE"
	arguments {
		Hash "model",
	}
	alias "_IS_THIS_MODEL_A_SUBMERSIBLE"
	alias "_IS_THIS_MODEL_AN_EMERGENCY_BOAT"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if model is a boat, then checks for FLAG_IS_JETSKI.

		@whoever named this _IS_THIS_MODEL_AN_EMERGENCY_BOAT: please do some tests before naming natives, thanks.
</summary>
	]]

native "IS_THIS_MODEL_A_PLANE"
	hash "0xA0948AB42D7BA0DE"
	jhash (0x3B3907BB)
	arguments {
		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_THIS_MODEL_A_HELI"
	hash "0xDCE4334788AF94EA"
	jhash (0x8AF7F568)
	arguments {
		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_THIS_MODEL_A_CAR"
	hash "0x7F6DB52EEFC96DF8"
	jhash (0x60E4C22F)
	arguments {
		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		To check if the model is an amphibious car, see gtaforums.com/topic/717612-v-scriptnative-documentation-and-research/page-33#entry1069317363 (for build 944 and above only!)
</summary>
	]]

native "IS_THIS_MODEL_A_TRAIN"
	hash "0xAB935175B22E822B"
	jhash (0xF87DCFFD)
	arguments {
		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_THIS_MODEL_A_BIKE"
	hash "0xB50C0B0CEDC6CE84"
	jhash (0x7E702CDD)
	arguments {
		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the model is motorcycle or bycicle.
</summary>
	]]

native "IS_THIS_MODEL_A_BICYCLE"
	hash "0xBF94DD42F63BDED2"
	jhash (0x328E6FF5)
	arguments {
		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_THIS_MODEL_A_QUADBIKE"
	hash "0x39DAC362EE65FA28"
	jhash (0xC1625277)
	arguments {
		Hash "model",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_HELI_BLADES_FULL_SPEED"
	hash "0xA178472EBB8AE60D"
	jhash (0x033A9408)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Equivalent of SET_HELI_BLADES_SPEED(vehicleHandle, 1.0f);

		this native works on planes to?
</summary>
	]]

native "SET_HELI_BLADES_SPEED"
	hash "0xFD280B4D7F3ABC4D"
	jhash (0x5C7D4EA9)
	arguments {
		Vehicle "vehicle",

		float "speed",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets the speed of the helicopter blades in percentage of the full speed.

		vehicleHandle: The helicopter.
		speed: The speed in percentage, 0.0f being 0% and 1.0f being 100%.
</summary>
	]]

native "0x99CAD8E7AFDB60FA"
	hash "0x99CAD8E7AFDB60FA"
	jhash (0x1128A45B)
	arguments {
		Vehicle "vehicle",

		float "p1",

		float "p2",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_CAN_BE_TARGETTED"
	hash "0x3750146A28097A82"
	jhash (0x64B70B1D)
	arguments {
		Vehicle "vehicle",

		BOOL "state",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		This has not yet been tested - it's just an assumption of what the types could be.
</summary>
	]]

native "0xDBC631F109350B8C"
	hash "0xDBC631F109350B8C"
	jhash (0x486C1280)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Related to locking the vehicle or something similar.

		In the decompiled scripts, its always called after
		VEHICLE::_SET_EXCLUSIVE_DRIVER(a_0, 0, 0);
		VEHICLE::SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(a_0, 1);
		VEHICLE::SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(a_0, PLAYER::PLAYER_ID(), 0);
</summary>
	]]

native "SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED"
	hash "0x4C7028F78FFD3681"
	jhash (0xC5D94017)
	arguments {
		Vehicle "vehicle",

		BOOL "state",
	}
	ns "VEHICLE"
	returns	"void"

native "0x1AA8A837D2169D94"
	hash "0x1AA8A837D2169D94"
	jhash (0x009AB49E)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x2311DD7159F00582"
	hash "0x2311DD7159F00582"
	jhash (0x758C5E2E)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_VEHICLE_DIRT_LEVEL"
	hash "0x8F17BC8BA08DA62B"
	jhash (0xFD15C065)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Dirt level 0..15
</summary>
	]]

native "SET_VEHICLE_DIRT_LEVEL"
	hash "0x79D3B596FE44EE8B"
	jhash (0x2B39128B)
	arguments {
		Vehicle "vehicle",

		float "dirtLevel",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		You can't use values greater than 15.0
		You can see why here: pastebin.com/Wbn34fGD

		Also, R* does (float)(rand() % 15) to get a random dirt level when generating a vehicle.
</summary>
	]]

native "_IS_VEHICLE_DAMAGED"
	hash "0xBCDC5017D3CE1E9E"
	jhash (0xDAC523BC)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Appears to return true if the vehicle has any damage, including cosmetically.
</summary>
	]]

native "IS_VEHICLE_DOOR_FULLY_OPEN"
	hash "0x3E933CFF7B111C22"
	jhash (0xC2385B6F)
	arguments {
		Vehicle "v",

		int "rwing",
	}
	ns "VEHICLE"
	returns	"Vehicle"
	doc [[!
<summary>
		doorIndex:
		0 = Front Left Door
		1 = Front Right Door
		2 = Back Left Door
		3 = Back Right Door
		4 = Hood
		5 = Trunk
		6 = Trunk2
</summary>
	]]

native "SET_VEHICLE_ENGINE_ON"
	hash "0x2497C4717C8B881E"
	jhash (0x7FBC86F1)
	arguments {
		Vehicle "vehicle",

		BOOL "value",

		BOOL "instantly",

		BOOL "otherwise",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Starts or stops the engine on the specified vehicle.

		vehicle: The vehicle to start or stop the engine on.
		value: true to turn the vehicle on; false to turn it off.
		instantly: if true, the vehicle will be set to the state immediately; otherwise, the current driver will physically turn on or off the engine.

		--------------------------------------
		from what I've tested when I do this to a helicopter the propellers turn off after the engine has started. so is there any way to keep the heli propellers on?
		--------------------------------------
		And what's with BOOL otherwise, what does it do???
</summary>
	]]

native "SET_VEHICLE_UNDRIVEABLE"
	hash "0x8ABA6AF54B942B95"
	jhash (0x48D02A4E)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Player won't be able to drive the car or enter it, unless you task him to get into any other seat than the driver one.
</summary>
	]]

native "SET_VEHICLE_PROVIDES_COVER"
	hash "0x5AFEEDD9BB2899D7"
	jhash (0xEFC01CA9)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_DOOR_CONTROL"
	hash "0xF2BFA0430F0A0FCB"
	jhash (0x572DD360)
	arguments {
		Vehicle "vehicle",

		int "doorIndex",

		int "speed",

		float "angle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		doorIndex:
		0 = Front Left Door (driver door)
		1 = Front Right Door
		2 = Back Left Door
		3 = Back Right Door
		4 = Hood
		5 = Trunk
		6 = Trunk2

		p2:
		mostly use 0 and 1, very rare using 3 and 5

		p3:
		It seems it is an angle

		Example in VB: 
		    Public Shared Sub Set_Vehicle_Door_Angle(Vehicle As Vehicle, Door As VehicleDoor, Angle As Single)
		        Native.Function.Call(Hash.SET_VEHICLE_DOOR_CONTROL, Vehicle.Handle, Door, 1, Angle)
		    End Sub

		I'm Not MentaL

		sfink: p2 is speed, 5 is fast, 1 is slow 3 is medium
</summary>
	]]

native "SET_VEHICLE_DOOR_LATCHED"
	hash "0xA5A9653A8D2CAF48"
	jhash (0x4EB7BBFC)
	arguments {
		Vehicle "vehicle",

		int "doorIndex",

		BOOL "forceClose",

		BOOL "lock",

		BOOL "p4",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		When lock is false other entities can overwrite it.
</summary>
	]]

native "GET_VEHICLE_DOOR_ANGLE_RATIO"
	hash "0xFE3F9C29F7B32BD5"
	jhash (0x0E399C26)
	arguments {
		Vehicle "vehicle",

		int "door",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		example in vb:
		    Public Shared Function Get_Vehicle_Door_Angle(Vehicle As Vehicle, Door As VehicleDoor) As Single
		        Return Native.Function.Call(Of Single)(Hash.GET_VEHICLE_DOOR_ANGLE_RATIO, Vehicle.Handle, Door)
		    End Function

		I'm Not MentaL
</summary>
	]]

native "_GET_PED_USING_VEHICLE_DOOR"
	hash "0x218297BF0CFD853B"
	arguments {
		Vehicle "vehicle",

		int "doorIndex",
	}
	alias "0x218297BF0CFD853B"
	ns "VEHICLE"
	returns	"Ped"
	doc [[!
<summary>
		Quick disassembly and test seems to indicate that this native gets the Ped currently using the specified door.
</summary>
	]]

native "SET_VEHICLE_DOOR_SHUT"
	hash "0x93D9BD300D7789E5"
	jhash (0x142606BD)
	arguments {
		Vehicle "vehicle",

		int "doorIndex",

		BOOL "closeInstantly",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		doorIndex:
		0 = Front Left Door
		1 = Front Right Door
		2 = Back Left Door
		3 = Back Right Door
		4 = Hood
		5 = Trunk
		6 = Trunk2
</summary>
	]]

native "SET_VEHICLE_DOOR_BROKEN"
	hash "0xD4D4F6A4AB575A33"
	jhash (0x8147FEA7)
	arguments {
		Vehicle "vehicle",

		int "doorIndex",

		BOOL "deleteDoor",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		doorIndex:
		0 = Front Right Door
		1 = Front Left Door
		2 = Back Right Door
		3 = Back Left Door
		4 = Hood
		5 = Trunk

		Changed last paramater from CreateDoorObject To NoDoorOnTheFloor because when on false, the door object is created,and not created when on true...the former parameter name was counter intuitive...(by Calderon)


</summary>
	]]

native "SET_VEHICLE_CAN_BREAK"
	hash "0x59BF8C3D52C92F66"
	jhash (0x90A810D1)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "DOES_VEHICLE_HAVE_ROOF"
	hash "0x8AC862B0B32C5B80"
	jhash (0xDB817403)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_BIG_VEHICLE"
	hash "0x9F243D3919F442FE"
	jhash (0x9CDBA8DE)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "GET_NUMBER_OF_VEHICLE_COLOURS"
	hash "0x3B963160CD65D41E"
	jhash (0xF2442EE2)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Actually number of color combinations
</summary>
	]]

native "SET_VEHICLE_COLOUR_COMBINATION"
	hash "0x33E8CD3322E2FE31"
	jhash (0xA557AEAD)
	arguments {
		Vehicle "vehicle",

		int "colorCombination",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		dont be a dick
</summary>
	]]

native "GET_VEHICLE_COLOUR_COMBINATION"
	hash "0x6A842D197F845D56"
	jhash (0x77AC1B4C)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"

native "SET_VEHICLE_IS_CONSIDERED_BY_PLAYER"
	hash "0x31B927BBC44156CD"
	jhash (0x14413319)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Setting this to false, makes the specified vehicle to where if you press Y your character doesn't even attempt the animation to enter the vehicle. Hence it's not considered aka ignored.
</summary>
	]]

native "0xBE5C1255A1830FF5"
	hash "0xBE5C1255A1830FF5"
	jhash (0xA6D8D7A5)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "0x9BECD4B9FEF3F8A6"
	hash "0x9BECD4B9FEF3F8A6"
	jhash (0xACAB8FF3)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x88BC673CA9E0AE99"
	hash "0x88BC673CA9E0AE99"
	jhash (0xF0E5C41D)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0xE851E480B814D4BA"
	hash "0xE851E480B814D4BA"
	jhash (0x2F98B4B7)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_RANDOM_VEHICLE_MODEL_IN_MEMORY"
	hash "0x055BF0AC0C34F4FD"
	jhash (0xE2C45631)
	arguments {
		BOOL "p0",

		HashPtr "modelHash",

		intPtr "p2",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Not present in the retail version! It's just a nullsub.

		p0 always true (except in one case)
		p1 a random vehicle hash loaded in memory
		p2 0 if success, -1 if failed
</summary>
	]]

native "GET_VEHICLE_DOOR_LOCK_STATUS"
	hash "0x25BC98A59C2EA962"
	jhash (0x0D72CEF2)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		2 seems to disable getting vehicle in modshop
</summary>
	]]

native "IS_VEHICLE_DOOR_DAMAGED"
	hash "0xB8E181E559464527"
	jhash (0x4999E3C3)
	arguments {
		Vehicle "veh",

		int "doorID",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		doorID starts at 0, not seeming to skip any numbers. Four door vehicles intuitively range from 0 to 3.
</summary>
	]]

native "_SET_VEHICLE_DOOR_CAN_BREAK"
	hash "0x2FA133A4A9D37ED8"
	jhash (0x065B92B3)
	arguments {
		Vehicle "vehicle",

		int "doorIndex",

		BOOL "isBreakable",
	}
	alias "_SET_VEHICLE_DOOR_BREAKABLE"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Keeps Vehicle Doors/Hood/Trunk from breaking off
</summary>
	]]

native "0x27B926779DEB502D"
	hash "0x27B926779DEB502D"
	jhash (0xB3A2CC4F)
	arguments {
		Vehicle "vehicle",

		BOOL "frontBumper",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		IS_VEHICLE_BUMPER_HANGING_OFF

		Not sure what the actual name is but this checks if the bumper of a vehicle is hanging off. It will return true if it is hanging, false if it falls off and false if it is not hanging off.
</summary>
	]]

native "IS_VEHICLE_BUMPER_BROKEN_OFF"
	hash "0x468056A6BB6F3846"
	jhash (0xAF25C027)
	arguments {
		Vehicle "vehicle",

		BOOL "front",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_COP_VEHICLE_IN_AREA_3D"
	hash "0x7EEF65D5F153E26A"
	jhash (0xFB16C6D1)
	arguments {
		float "x1",

		float "x2",

		float "y1",

		float "y2",

		float "z1",

		float "z2",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Usage:

		public bool isCopInRange(Vector3 Location, float Range)
		        {
		            return Function.Call&lt;bool&gt;(Hash.IS_COP_PED_IN_AREA_3D, Location.X - Range, Location.Y - Range, Location.Z - Range, Location.X + Range, Location.Y + Range, Location.Z + Range);
		        }
</summary>
	]]

native "IS_VEHICLE_ON_ALL_WHEELS"
	hash "0xB104CD1BABF302E2"
	jhash (0x10089F8E)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		 Public Function isVehicleOnAllWheels(vh As Vehicle) As Boolean
		        Return Native.Function.Call(Of Boolean)(Hash.IS_VEHICLE_ON_ALL_WHEELS, vh)
		    End Function

</summary>
	]]

native "GET_VEHICLE_LAYOUT_HASH"
	hash "0x28D37D4F71AC5C58"
	jhash (0xE0B35187)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"Hash"

native "0xA01BC64DD4BFBBAC"
	hash "0xA01BC64DD4BFBBAC"
	arguments {
		Vehicle "vehicle",

		int "p1",
	}
	ns "VEHICLE"
	returns	"Any"

native "SET_RENDER_TRAIN_AS_DERAILED"
	hash "0x317B11A312DF5534"
	jhash (0x899D9092)
	arguments {
		Vehicle "train",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		makes the train all jumbled up and derailed as it moves on the tracks (though that wont stop it from its normal operations)
</summary>
	]]

native "SET_VEHICLE_EXTRA_COLOURS"
	hash "0x2036F561ADD12E33"
	jhash (0x515DB2A0)
	arguments {
		Vehicle "vehicle",

		int "pearlescentColor",

		int "wheelColor",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		They use the same color indexs as SET_VEHICLE_COLOURS.
</summary>
	]]

native "GET_VEHICLE_EXTRA_COLOURS"
	hash "0x3BC4245933A166F7"
	jhash (0x80E4659B)
	arguments {
		Vehicle "vehicle",

		intPtr "pearlescentColor",

		intPtr "wheelColor",
	}
	ns "VEHICLE"
	returns	"void"

native "STOP_ALL_GARAGE_ACTIVITY"
	hash "0x0F87E938BDF29D66"
	jhash (0x17A0BCE5)
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_FIXED"
	hash "0x115722B1B9C14C1C"
	jhash (0x17469AA1)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_DEFORMATION_FIXED"
	hash "0x953DA1E1B12C0491"
	jhash (0xDD2920C8)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		This fixes the deformation of a vehicle but the vehicle health doesn't improve
</summary>
	]]

native "0x206BC5DC9D1AC70A"
	hash "0x206BC5DC9D1AC70A"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x51BB2D88D31A914B"
	hash "0x51BB2D88D31A914B"
	jhash (0x88F0F7E7)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x192547247864DFDD"
	hash "0x192547247864DFDD"
	jhash (0x90D6EE57)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_DISABLE_VEHICLE_PETROL_TANK_FIRES"
	hash "0x465BF26AB9684352"
	jhash (0xC40192B5)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	alias "0x465BF26AB9684352"
	ns "VEHICLE"
	returns	"void"

native "SET_DISABLE_VEHICLE_PETROL_TANK_DAMAGE"
	hash "0x37C8252A7C92D017"
	jhash (0xAD3E05F2)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "0x91A0BD635321F145"
	hash "0x91A0BD635321F145"
	jhash (0x1784BA1A)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0xC50CE861B55EAB8B"
	hash "0xC50CE861B55EAB8B"
	jhash (0x40C323AE)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x6EBFB22D646FFC18"
	hash "0x6EBFB22D646FFC18"
	jhash (0x847F1304)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		sfink: sets bit in vehicle's structure, used by maintransition, fm_mission_controller, mission_race and a couple of other scripts. see dissassembly: 
		CVehicle *__fastcall sub_140CDAA10(signed int a1, char a2)
		{
		    CVehicle *result; // rax@1

		    result = EntityAsCVehicle(a1);
		    if ( result )
		    {
		        result-&gt;field_886 &amp;= 0xEFu;
		        result-&gt;field_886 |= 16 * (a2 &amp; 1);
		    }
		    return result;
		}
</summary>
	]]

native "0x25367DE49D64CF16"
	hash "0x25367DE49D64CF16"
	jhash (0xCBD98BA1)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "REMOVE_VEHICLES_FROM_GENERATORS_IN_AREA"
	hash "0x46A1E1A299EC4BBA"
	jhash (0x42CC15E0)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		Any "unk",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_STEER_BIAS"
	hash "0x42A8EC77D5150CBE"
	jhash (0x7357C1EB)
	arguments {
		Vehicle "vehicle",

		float "value",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Locks the vehicle's steering to the desired angle, explained below.

		Requires to be called onTick. Steering is unlocked the moment the function stops being called on the vehicle.

		Steer bias:
		-1.0 = full right
		0.0 = centered steering
		1.0 = full left
</summary>
	]]

native "IS_VEHICLE_EXTRA_TURNED_ON"
	hash "0xD2E6822DBFD6C8BD"
	jhash (0x042098B5)
	arguments {
		Vehicle "vehicle",

		int "extraId",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_EXTRA"
	hash "0x7EE3A3C5E4A40CC9"
	jhash (0x642D065C)
	arguments {
		Vehicle "vehicle",

		int "extraId",

		BOOL "disable",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Note: only some vehicle have extras
		extra ids are from 1 - 9 depending on the vehicle

		-------------------------------------------------

		^ not sure if outdated or simply wrong. Max extra ID for b944 is 14

		-------------------------------------------------

		p2 is not a on/off toggle. mostly 0 means on and 1 means off.
		not sure if it really should be a BOOL.

		-------------------------------------------------

		Confirmed p2 does not work as a bool. Changed to int. [0=on, 1=off]
</summary>
	]]

native "DOES_EXTRA_EXIST"
	hash "0x1262D55792428154"
	jhash (0x409411CC)
	arguments {
		Vehicle "vehicle",

		int "extraId",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Checks via CVehicleModelInfo
</summary>
	]]

native "SET_CONVERTIBLE_ROOF"
	hash "0xF39C4F538B5124C2"
	jhash (0xC87B6A51)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "LOWER_CONVERTIBLE_ROOF"
	hash "0xDED51F703D0FA83D"
	jhash (0xC5F72EAE)
	arguments {
		Vehicle "vehicle",

		BOOL "instantlyLower",
	}
	ns "VEHICLE"
	returns	"void"

native "RAISE_CONVERTIBLE_ROOF"
	hash "0x8F5FB35D7E88FC70"
	jhash (0xA4E4CBA3)
	arguments {
		Vehicle "vehicle",

		BOOL "instantlyRaise",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_CONVERTIBLE_ROOF_STATE"
	hash "0xF8C397922FC03F41"
	jhash (0x1B09714D)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		0 -&gt; up
		1 -&gt; lowering down
		2 -&gt; down
		3 -&gt; raising up

		enum RoofState
		{
		     ROOFSTATE_UP = 0;
		     ROOFSTATE_LOWERING,
		     ROOFSTATE_DOWN,
		     ROOFSTATE_RAISING
		};
</summary>
	]]

native "IS_VEHICLE_A_CONVERTIBLE"
	hash "0x52F357A30698BCCE"
	jhash (0x6EF54490)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		p1 is false almost always.

		However, in launcher_carwash/carwash1/carwash2 scripts, p1 is true and is accompanied by DOES_VEHICLE_HAVE_ROOF 
</summary>
	]]

native "IS_VEHICLE_STOPPED_AT_TRAFFIC_LIGHTS"
	hash "0x2959F696AE390A99"
	jhash (0x69200FA4)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		is this for red lights only?  more testing required.
</summary>
	]]

native "SET_VEHICLE_DAMAGE"
	hash "0xA1DD317EA8FD4F29"
	jhash (0x21B458B2)
	arguments {
		Vehicle "vehicle",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		float "damage",

		float "radius",

		BOOL "p6",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Apply damage to vehicle at a location. Location is relative to vehicle model (not world).

		Radius of effect damage applied in a sphere at impact location
</summary>
	]]

native "GET_VEHICLE_ENGINE_HEALTH"
	hash "0xC45D23BAF168AAB8"
	jhash (0x8880038A)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Returns 1000.0 if the function is unable to get the address of the specified vehicle or if it's not a vehicle.

		Minimum: -4000
		Maximum: 1000

		-4000: Engine is destroyed
		0 and below: Engine catches fire and health rapidly declines
		300: Engine is smoking and losing functionality
		1000: Engine is perfect
</summary>
	]]

native "SET_VEHICLE_ENGINE_HEALTH"
	hash "0x45F6D8EEF34ABEF1"
	jhash (0x1B760FB5)
	arguments {
		Vehicle "vehicle",

		float "health",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		1000 is max health
		Begins leaking gas at around 650 health
		-999.90002441406 appears to be minimum health, although nothing special occurs &lt;- false statement

		-------------------------
		Minimum: -4000
		Maximum: 1000

		-4000: Engine is destroyed
		0 and below: Engine catches fire and health rapidly declines
		300: Engine is smoking and losing functionality
		1000: Engine is perfect
</summary>
	]]

native "GET_VEHICLE_PETROL_TANK_HEALTH"
	hash "0x7D5DABE888D2D074"
	jhash (0xE41595CE)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		1000 is max health
		Begins leaking gas at around 650 health
</summary>
	]]

native "SET_VEHICLE_PETROL_TANK_HEALTH"
	hash "0x70DB57649FA8D0D8"
	jhash (0x660A3692)
	arguments {
		Vehicle "vehicle",

		float "health",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		1000 is max health
		Begins leaking gas at around 650 health
</summary>
	]]

native "IS_VEHICLE_STUCK_TIMER_UP"
	hash "0x679BE1DAF71DA874"
	jhash (0x2FCF58C1)
	arguments {
		Vehicle "vehicle",

		int "p1",

		int "p2",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		p1 can be anywhere from 0 to 3 in the scripts. p2 is generally somewhere in the 1000 to 10000 range.
</summary>
	]]

native "RESET_VEHICLE_STUCK_TIMER"
	hash "0xD7591B0065AFAA7A"
	jhash (0xEF2A6016)
	arguments {
		Vehicle "vehicle",

		int "nullAttributes",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		The inner function has a switch on the second parameter. It's the stuck timer index.

		Here's some pseudo code I wrote for the inner function:
		void __fastcall NATIVE_RESET_VEHICLE_STUCK_TIMER_INNER(CUnknown* unknownClassInVehicle, int timerIndex)
		{
			switch (timerIndex)
			{
			case 0:
				unknownClassInVehicle-&gt;FirstStuckTimer = (WORD)0u;
			case 1:
				unknownClassInVehicle-&gt;SecondStuckTimer = (WORD)0u;
			case 2:
				unknownClassInVehicle-&gt;ThirdStuckTimer = (WORD)0u;
			case 3:
				unknownClassInVehicle-&gt;FourthStuckTimer = (WORD)0u;
			case 4:
				unknownClassInVehicle-&gt;FirstStuckTimer = (WORD)0u;
				unknownClassInVehicle-&gt;SecondStuckTimer = (WORD)0u;
				unknownClassInVehicle-&gt;ThirdStuckTimer = (WORD)0u;
				unknownClassInVehicle-&gt;FourthStuckTimer = (WORD)0u;
				break;
			};
		}
</summary>
	]]

native "IS_VEHICLE_DRIVEABLE"
	hash "0x4C241E39B23DF959"
	jhash (0x41A7267A)
	arguments {
		Vehicle "vehicle",

		BOOL "isOnFireCheck",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		p1 is always 0 in the scripts.

		p1 = check if vehicle is on fire
</summary>
	]]

native "SET_VEHICLE_HAS_BEEN_OWNED_BY_PLAYER"
	hash "0x2B5F9D2AF1F1722D"
	jhash (0xB4D3DBFB)
	arguments {
		Vehicle "vehicle",

		BOOL "owned",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_NEEDS_TO_BE_HOTWIRED"
	hash "0xFBA550EA44404EE6"
	jhash (0xD8260751)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "0x9F3F689B814F2599"
	hash "0x9F3F689B814F2599"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x4E74E62E0A97E901"
	hash "0x4E74E62E0A97E901"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "START_VEHICLE_HORN"
	hash "0x9C8C6504B5B63D2C"
	jhash (0x0DF5ADB3)
	arguments {
		Vehicle "vehicle",

		int "duration",

		Hash "mode",

		BOOL "forever",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sounds the horn for the specified vehicle.

		vehicle: The vehicle to activate the horn for.
		mode: The hash of "NORMAL" or "HELDDOWN". Can be 0.
		duration: The duration to sound the horn, in milliseconds.

		Note: If a player is in the vehicle, it will only sound briefly.
</summary>
	]]

native "_SET_VEHICLE_SILENT"
	hash "0x9D44FCCE98450843"
	jhash (0x968E5770)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	alias "0x9D44FCCE98450843"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		If set to TRUE, it seems to suppress door noises and doesn't allow the horn to be continuous.
</summary>
	]]

native "SET_VEHICLE_HAS_STRONG_AXLES"
	hash "0x92F0CF722BC4202F"
	jhash (0x0D1CBC65)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		if true, axles won't bend.
</summary>
	]]

native "GET_DISPLAY_NAME_FROM_VEHICLE_MODEL"
	hash "0xB215AAC32D25D019"
	jhash (0xEC86DF39)
	arguments {
		Hash "modelHash",
	}
	ns "VEHICLE"
	returns	"charPtr"
	doc [[!
<summary>
		Returns model name of vehicle in all caps. Needs to be displayed through localizing text natives to get proper display name.
		-----------------------------------------------------------------------------------------------------------------------------------------
		While often the case, this does not simply return the model name of the vehicle (which could be hashed to return the model hash). Variations of the same vehicle may also use the same display name.
		-----------------------------------------------------------------------------------------------------------------------------------------

		Returns "CARNOTFOUND" if the hash doesn't match a vehicle hash.

		Using UI::_GET_LABEL_TEXT, you can get the localized name.

		For a full list, see here: pastebin.com/wvpyS4kS (pastebin.com/dA3TbkZw)


</summary>
	]]

native "GET_VEHICLE_DEFORMATION_AT_POS"
	hash "0x4EC6CFBC7B2E9536"
	jhash (0xABF02075)
	arguments {
		Vehicle "vehicle",

		float "offsetX",

		float "offsetY",

		float "offsetZ",
	}
	ns "VEHICLE"
	returns	"Vector3"
	doc [[!
<summary>
		The only example I can find of this function in the scripts, is this:

		struct _s = VEHICLE::GET_VEHICLE_DEFORMATION_AT_POS(rPtr((A_0) + 4), 1.21f, 6.15f, 0.3f);

		-----------------------------------------------------------------------------------------------------------------------------------------
		PC scripts:

		v_5/*{3}*/ = VEHICLE::GET_VEHICLE_DEFORMATION_AT_POS(a_0._f1, 1.21, 6.15, 0.3);
</summary>
	]]

native "SET_VEHICLE_LIVERY"
	hash "0x60BF608F1B8CD1B6"
	jhash (0x7AD87059)
	arguments {
		Vehicle "vehicle",

		int "liveryIndex",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Note: Only seems to work on Emergency Vehicles
</summary>
	]]

native "GET_VEHICLE_LIVERY"
	hash "0x2BB9230590DA5E8A"
	jhash (0xEC82A51D)
	arguments {
		Vehicle "trailers2",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		-1 = no livery
</summary>
	]]

native "GET_VEHICLE_LIVERY_COUNT"
	hash "0x87B63E25A529D526"
	jhash (0xFB0CA947)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Returns -1 if the vehicle has no livery
</summary>
	]]

native "IS_VEHICLE_WINDOW_INTACT"
	hash "0x46E571A0E20D01F1"
	jhash (0xAC4EF23D)
	arguments {
		Vehicle "vehicle",

		int "windowIndex",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "ARE_ALL_VEHICLE_WINDOWS_INTACT"
	hash "0x11D862A3E977A9EF"
	jhash (0xBB619744)
	arguments {
		Vehicle "vehicle",
	}
	alias "_ARE_ALL_VEHICLE_WINDOWS_INTACT"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Appears to return false if any window is broken.
</summary>
	]]

native "ARE_ANY_VEHICLE_SEATS_FREE"
	hash "0x2D34FC3BC4ADB780"
	jhash (0x648E685A)
	arguments {
		Vehicle "vehicle",
	}
	alias "_IS_ANY_VEHICLE_SEAT_EMPTY"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Returns false if every seat is occupied.
</summary>
	]]

native "RESET_VEHICLE_WHEELS"
	hash "0x21D2E5662C1F6FED"
	jhash (0xD5FFE779)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "IS_HELI_PART_BROKEN"
	hash "0xBC74B4BE25EB6C8A"
	jhash (0xF4E4C439)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "_GET_HELI_MAIN_ROTOR_HEALTH"
	hash "0xE4CB7541F413D2C5"
	jhash (0xF01E2AAB)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Max 1000.
		At 0 the main rotor will stall.
</summary>
	]]

native "_GET_HELI_TAIL_ROTOR_HEALTH"
	hash "0xAE8CE82A4219AC8C"
	jhash (0xA41BC13D)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Max 1000.
		At 0 the tail rotor will stall.

</summary>
	]]

native "_GET_HELI_ENGINE_HEALTH"
	hash "0xAC51915D27E4A5F7"
	jhash (0x8A68388F)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Max 1000.
		At -100 both helicopter rotors will stall.
</summary>
	]]

native "WAS_COUNTER_ACTIVATED"
	hash "0x3EC8BF18AA453FE9"
	jhash (0x2916D69B)
	arguments {
		Vehicle "vehicle",

		Any "p1",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Hash collision
</summary>
	]]

native "SET_VEHICLE_NAME_DEBUG"
	hash "0xBFDF984E2C22B94F"
	jhash (0xA712FF5C)
	arguments {
		Vehicle "vehicle",

		charPtr "name",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE"
	hash "0x71B0892EC081D60A"
	jhash (0x38CC692B)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets a vehicle to be strongly resistant to explosions. p0 is the vehicle; set p1 to false to toggle the effect on/off.
</summary>
	]]

native "0x3441CAD2F2231923"
	hash "0x3441CAD2F2231923"
	jhash (0xC306A9A3)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x2B6747FAA9DB9D6B"
	hash "0x2B6747FAA9DB9D6B"
	jhash (0x95A9ACCB)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"Any"

native "CONTROL_LANDING_GEAR"
	hash "0xCFC8BE9A5E1FE575"
	jhash (0x24F873FB)
	arguments {
		Vehicle "vehicle",

		int "state",
	}
	alias "_SET_VEHICLE_LANDING_GEAR"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Works for vehicles with a retractable landing gear

		landing gear states:

		0: Deployed
		1: Closing
		2: Opening
		3: Retracted
</summary>
	]]

native "GET_LANDING_GEAR_STATE"
	hash "0x9B0F3DCA3DB0F4CD"
	jhash (0xA6F02670)
	arguments {
		Vehicle "vehicle",
	}
	alias "_GET_VEHICLE_LANDING_GEAR"
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		landing gear states:

		0: Deployed
		1: Closing
		2: Opening
		3: Retracted
</summary>
	]]

native "IS_ANY_VEHICLE_NEAR_POINT"
	hash "0x61E1DD6125A3EEE6"
	jhash (0x2867A834)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "REQUEST_VEHICLE_HIGH_DETAIL_MODEL"
	hash "0xA6E9FDCB2C76785E"
	jhash (0x9DA21956)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "REMOVE_VEHICLE_HIGH_DETAIL_MODEL"
	hash "0x00689CDE5F7C6787"
	jhash (0x382BE070)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "IS_VEHICLE_HIGH_DETAIL"
	hash "0x1F25887F3C104278"
	jhash (0x55D41928)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "REQUEST_VEHICLE_ASSET"
	hash "0x81A15811460FAB3A"
	jhash (0x902B4F06)
	arguments {
		Hash "vehicleHash",

		int "vehicleAsset",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		REQUEST_VEHICLE_ASSET(GET_HASH_KEY(cargobob3), 3);

		vehicle found that have asset's:
		cargobob3
		submersible
		blazer
</summary>
	]]

native "HAS_VEHICLE_ASSET_LOADED"
	hash "0x1BBE0523B8DB9A21"
	jhash (0x8DAAC3CB)
	arguments {
		int "vehicleAsset",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "REMOVE_VEHICLE_ASSET"
	hash "0xACE699C71AB9DEB5"
	jhash (0x9620E9C6)
	arguments {
		int "vehicleAsset",
	}
	ns "VEHICLE"
	returns	"void"

native "_SET_TOW_TRUCK_CRANE_HEIGHT"
	hash "0xFE54B92A344583CA"
	jhash (0x88236E22)
	arguments {
		Vehicle "towTruck",

		float "height",
	}
	alias "_SET_TOW_TRUCK_CRANE_RAISED"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets how much the crane on the tow truck is raised, where 0.0 is fully lowered and 1.0 is fully raised.
</summary>
	]]

native "ATTACH_VEHICLE_TO_TOW_TRUCK"
	hash "0x29A16F8D621C4508"
	jhash (0x8151571A)
	arguments {
		Vehicle "towTruck",

		Vehicle "vehicle",

		BOOL "rear",

		float "hookOffsetX",

		float "hookOffsetY",

		float "hookOffsetZ",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		HookOffset defines where the hook is attached. leave at 0 for default attachment.

		When using the tow truck online, this is not used (set a breakpoint and never called during tow truck attachment)
</summary>
	]]

native "DETACH_VEHICLE_FROM_TOW_TRUCK"
	hash "0xC2DB6B6708350ED8"
	jhash (0xC666CF33)
	arguments {
		Vehicle "towTruck",

		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		First two parameters swapped. Scripts verify that towTruck is the first parameter, not the second.
</summary>
	]]

native "DETACH_VEHICLE_FROM_ANY_TOW_TRUCK"
	hash "0xD0E9CE05A1E68CD8"
	jhash (0x3BF93651)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_VEHICLE_ATTACHED_TO_TOW_TRUCK"
	hash "0x146DF9EC4C4B9FD4"
	jhash (0x9699CFDC)
	arguments {
		Vehicle "towTruck",

		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Scripts verify that towTruck is the first parameter, not the second.
</summary>
	]]

native "GET_ENTITY_ATTACHED_TO_TOW_TRUCK"
	hash "0xEFEA18DCF10F8F75"
	jhash (0x11EC7844)
	arguments {
		Vehicle "towTruck",
	}
	ns "VEHICLE"
	returns	"Entity"

native "SET_VEHICLE_AUTOMATICALLY_ATTACHES"
	hash "0x8BA6F76BC53A1493"
	jhash (0x4273A8D3)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",

		Any "p2",
	}
	ns "VEHICLE"
	returns	"Any"
	doc [[!
<summary>
		Please change to void.
</summary>
	]]

native "0xF8EBCCC96ADB9FB7"
	hash "0xF8EBCCC96ADB9FB7"
	jhash (0xED23C8A3)
	arguments {
		Any "p0",

		float "p1",

		BOOL "p2",
	}
	ns "VEHICLE"
	returns	"void"

native "0x56B94C6D7127DFBA"
	hash "0x56B94C6D7127DFBA"
	jhash (0xB1A52EF7)
	arguments {
		Any "p0",

		float "p1",

		BOOL "p2",
	}
	ns "VEHICLE"
	returns	"void"

native "0x1093408B4B9D1146"
	hash "0x1093408B4B9D1146"
	jhash (0xF30C566F)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_SET_DESIRED_VERTICAL_FLIGHT_PHASE"
	hash "0x30D779DE7C4F6DD3"
	jhash (0xA7DF64D7)
	arguments {
		Vehicle "vehicle",

		float "angleRatio",
	}
	alias "0x30D779DE7C4F6DD3"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		MulleDK19: This starts moving the VTOL engines towards the specified angle ratio (0f-1f).
</summary>
	]]

native "_SET_VERTICAL_FLIGHT_PHASE"
	hash "0x9AA47FFF660CB932"
	jhash (0xDD7936F5)
	arguments {
		Vehicle "vehicle",

		float "angle",
	}
	alias "0x9AA47FFF660CB932"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		MulleDK19: This immediately sets the VTOL engines at the specified angle ratio (0f-1f).
</summary>
	]]

native "0xA4822F1CF23F4810"
	hash "0xA4822F1CF23F4810"
	jhash (0x34E02FCD)
	arguments {
		Vector3Ptr "outVec",

		Any "p1",

		Vector3Ptr "outVec1",

		Any "p3",

		Any "p4",

		Any "p5",

		Any "p6",

		Any "p7",

		Any "p8",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_BURNOUT"
	hash "0xFB8794444A7D60FB"
	jhash (0x9B6EF0EA)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		On accelerating, spins the driven wheels with the others braked, so you don't go anywhere.
</summary>
	]]

native "IS_VEHICLE_IN_BURNOUT"
	hash "0x1297A88E081430EB"
	jhash (0x6632BC12)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether the specified vehicle is currently in a burnout.


		vb.net
		Public Function isVehicleInBurnout(vh As Vehicle) As Boolean
		        Return Native.Function.Call(Of Boolean)(Hash.IS_VEHICLE_IN_BURNOUT, vh)
		    End Function
</summary>
	]]

native "SET_VEHICLE_REDUCE_GRIP"
	hash "0x222FF6A823D122E2"
	jhash (0x90D3A0D9)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Reduces grip significantly so it's hard to go anywhere.
</summary>
	]]

native "SET_VEHICLE_INDICATOR_LIGHTS"
	hash "0xB5D45264751B7DF0"
	jhash (0xA6073B5D)
	arguments {
		Vehicle "vehicle",

		int "turnSignal",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets the turn signal enabled for a vehicle.
		Set turnSignal to 1 for left light, 0 for right light.
</summary>
	]]

native "SET_VEHICLE_BRAKE_LIGHTS"
	hash "0x92B35082E0B42F66"
	jhash (0x6D9BA11E)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_HANDBRAKE"
	hash "0x684785568EF26A22"
	jhash (0xBA729A25)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "0x48ADC8A773564670"
	hash "0x48ADC8A773564670"
	jhash (0x37BC6ACB)
	ns "VEHICLE"
	returns	"void"

native "0x91D6DD290888CBAB"
	hash "0x91D6DD290888CBAB"
	jhash (0x71D898EF)
	ns "VEHICLE"
	returns	"BOOL"

native "0x51DB102F4A3BA5E0"
	hash "0x51DB102F4A3BA5E0"
	jhash (0x0B0523B0)
	arguments {
		BOOL "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_VEHICLE_TRAILER_VEHICLE"
	hash "0x1CDD6BADC297830D"
	jhash (0xAE84D758)
	arguments {
		Vehicle "vehicle",

		VehiclePtr "trailer",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Gets the trailer of a vehicle and puts it into the trailer parameter.
</summary>
	]]

native "0xCAC66558B944DA67"
	hash "0xCAC66558B944DA67"
	jhash (0x0B200CE2)
	arguments {
		charPtr "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		rerere
</summary>
	]]

native "SET_VEHICLE_RUDDER_BROKEN"
	hash "0x09606148B6C71DEF"
	jhash (0x3FAC3CD4)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x1A78AD3D8240536F"
	hash "0x1A78AD3D8240536F"
	jhash (0x0858678C)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_GET_VEHICLE_MAX_SPEED"
	hash "0x53AF99BAA671CA47"
	jhash (0x7D1A0616)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x53AF99BAA671CA47"
	ns "VEHICLE"
	returns	"float"

native "GET_VEHICLE_MAX_BRAKING"
	hash "0xAD7E85FC227197C4"
	jhash (0x03B926F6)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"

native "GET_VEHICLE_MAX_TRACTION"
	hash "0xA132FB5370554DB0"
	jhash (0x7E5A1587)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"

native "GET_VEHICLE_ACCELERATION"
	hash "0x5DD35C8D074E57AE"
	jhash (0x00478321)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		static - max acceleration
</summary>
	]]

native "_GET_VEHICLE_MODEL_MAX_SPEED"
	hash "0xF417C2502FFFED43"
	jhash (0x8F291C4A)
	arguments {
		Hash "modelHash",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Returns max speed (without mods) of the specified vehicle model in m/s.

		For a full list, see here: pastebin.com/AUuHHK06

		GET_VEHICLE_MODEL_*
</summary>
	]]

native "GET_VEHICLE_MODEL_MAX_BRAKING"
	hash "0xDC53FD41B4ED944C"
	jhash (0x7EF02883)
	arguments {
		Hash "modelHash",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Returns max braking of the specified vehicle model.

		For a full list, see here: pastebin.com/3N8DVbpG
</summary>
	]]

native "_GET_VEHICLE_MODEL_HAND_BRAKE"
	hash "0xBFBA3BA79CFF7EBF"
	jhash (0xF3A7293F)
	arguments {
		Hash "modelHash",
	}
	alias "0xBFBA3BA79CFF7EBF"
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		GET_VEHICLE_MODEL_MAX_*
		max braking if air vehicle, else max braking + 0.1

		-------------------

		For a full list, see here: pastebin.com/Cb9L1Cn0
</summary>
	]]

native "GET_VEHICLE_MODEL_MAX_TRACTION"
	hash "0x539DE94D44FDFD0D"
	jhash (0x7F985597)
	arguments {
		Hash "modelHash",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Returns max traction of the specified vehicle model.

		For a full list, see here: pastebin.com/ERnntVjK
</summary>
	]]

native "GET_VEHICLE_MODEL_ACCELERATION"
	hash "0x8C044C5C84505B6A"
	jhash (0x29CB3537)
	arguments {
		Hash "modelHash",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Returns the acceleration of the specified model.

		For a full list, see here: pastebin.com/GaN6vT4R

</summary>
	]]

native "_GET_VEHICLE_MODEL_DOWN_FORCE"
	hash "0x53409B5163D5B846"
	jhash (0x37FBA7BC)
	arguments {
		Hash "modelHash",
	}
	alias "0x53409B5163D5B846"
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		GET_VEHICLE_MODEL_*

		9.8 * thrust if air vehicle, else 0.38 + drive force?

		For a full list, see here: pastebin.com/bJQeDqNd
</summary>
	]]

native "_GET_VEHICLE_MODEL_MAX_KNOTS"
	hash "0xC6AD107DDC9054CC"
	jhash (0x95BB67EB)
	arguments {
		Hash "modelHash",
	}
	alias "0xC6AD107DDC9054CC"
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		GET_VEHICLE_MODEL_*

		Function pertains only to aviation vehicles.

		For a full list, see here: pastebin.com/JwuGNp2K
</summary>
	]]

native "_GET_VEHICLE_MODEL_MOVE_RESISTANCE"
	hash "0x5AA3F878A178C4FC"
	jhash (0x87C5D271)
	arguments {
		Hash "modelHash",
	}
	alias "0x5AA3F878A178C4FC"
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		GET_VEHICLE_MODEL_*

		called if the vehicle is a boat -- returns vecMoveResistanceX?

		For a full list, see here: pastebin.com/Pyb2RhZ9
</summary>
	]]

native "_GET_VEHICLE_CLASS_MAX_SPEED"
	hash "0x00C09F246ABEDD82"
	jhash (0xCE67162C)
	arguments {
		int "vehicleClass",
	}
	alias "0x00C09F246ABEDD82"
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		GET_VEHICLE_CLASS_MAX_*
</summary>
	]]

native "GET_VEHICLE_CLASS_MAX_TRACTION"
	hash "0xDBC86D85C5059461"
	jhash (0x5B4FDC16)
	arguments {
		int "vehicleClass",
	}
	ns "VEHICLE"
	returns	"float"

native "GET_VEHICLE_CLASS_MAX_AGILITY"
	hash "0x4F930AD022D6DE3B"
	jhash (0x45F2BD83)
	arguments {
		int "vehicleClass",
	}
	ns "VEHICLE"
	returns	"float"

native "GET_VEHICLE_CLASS_MAX_ACCELERATION"
	hash "0x2F83E7E45D9EA7AE"
	jhash (0x3E220A9B)
	arguments {
		int "vehicleClass",
	}
	ns "VEHICLE"
	returns	"float"

native "GET_VEHICLE_CLASS_MAX_BRAKING"
	hash "0x4BF54C16EC8FEC03"
	jhash (0xD08CC1A5)
	arguments {
		int "vehicleClass",
	}
	ns "VEHICLE"
	returns	"float"

native "_ADD_SPEED_ZONE_FOR_COORD"
	hash "0x2CE544C68FB812A0"
	jhash (0xD6685803)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		float "speed",

		BOOL "p5",
	}
	alias "0x2CE544C68FB812A0"
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		This is used to add a speedzone on a position.

		Example usage C#:

		uint speedZone = Function.Call&lt;uint&gt;((Hash) 0x2CE544C68FB812A0, Game.PlayerPed.Position.X, Game.PlayerPed.Position.Y, Game.PlayerPed.Position.Z, 100.0f, 0.0f, false);

		(Thanks to alexguirre for his help!)

		==========================================
		What is the point in adding a speed zone? Does it just generally affect the speed NPCs will drive? I can imagine running this on every section of the interstate setting it to 3 MPH rip.
</summary>
	]]

native "_REMOVE_SPEED_ZONE"
	hash "0x1033371FC8E842A7"
	jhash (0x0C0332A6)
	arguments {
		int "speedzone",
	}
	alias "0x1033371FC8E842A7"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Used to remove a speedzone.

		This is the speed zone native.

		Example usage C#:

		uint speedZone = Function.Call&lt;uint&gt;((Hash) 0x2CE544C68FB812A0, Game.PlayerPed.Position.X, Game.PlayerPed.Position.Y, Game.PlayerPed.Position.Z, 100.0f, 0.0f, false);

		bool speedZoneClosed = Function.Call&lt;bool&gt;((Hash) 0x1033371FC8E842A7, speedZone);

		(Thanks to alexguirre for his help!)
</summary>
	]]

native "OPEN_BOMB_BAY_DOORS"
	hash "0x87E7F24270732CB1"
	jhash (0x6574041D)
	arguments {
		Vehicle "vehicle",
	}
	alias "_OPEN_VEHICLE_BOMB_BAY"
	ns "VEHICLE"
	returns	"void"

native "CLOSE_BOMB_BAY_DOORS"
	hash "0x3556041742A0DC74"
	jhash (0xF8EC5751)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x3556041742A0DC74"
	ns "VEHICLE"
	returns	"void"

native "IS_VEHICLE_SEARCHLIGHT_ON"
	hash "0xC0F97FCE55094987"
	jhash (0xADAF3513)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Possibly: Returns whether the searchlight (found on police vehicles) is toggled on.
</summary>
	]]

native "SET_VEHICLE_SEARCHLIGHT"
	hash "0x14E85C5EE7A4D542"
	jhash (0xE2C0DD8A)
	arguments {
		Vehicle "heli",

		BOOL "toggle",

		BOOL "canBeUsedByAI",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Only works during nighttime.
		And only if there is a driver in heli.
</summary>
	]]

native "0x639431E895B9AA57"
	hash "0x639431E895B9AA57"
	jhash (0xAB0E79EB)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		BOOL "p2",

		BOOL "p3",

		BOOL "p4",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "CAN_SHUFFLE_SEAT"
	hash "0x30785D90C956BF35"
	jhash (0xB3EB01ED)
	arguments {
		Vehicle "vehicle",

		Any "p1",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "GET_NUM_MOD_KITS"
	hash "0x33F2E3FE70EAAE1D"
	jhash (0xE4903AA0)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"

native "SET_VEHICLE_MOD_KIT"
	hash "0x1F2AA07F00B3217A"
	jhash (0xB8132158)
	arguments {
		Vehicle "vehicle",

		int "modKit",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Set modKit to 0 if you plan to call SET_VEHICLE_MOD. That's what the game does. Most body modifications through SET_VEHICLE_MOD will not take effect until this is set to 0.

		---------

		Setting the modKit to 0 also seems to load some livery related vehicle information. For example, using GET_LIVERY_NAME() will return NULL if you haven't set the modKit to 0 in advance. As soon as you set it to 0, GET_LIVERY_NAME() will work properly.
</summary>
	]]

native "GET_VEHICLE_MOD_KIT"
	hash "0x6325D1A044AE510D"
	jhash (0x9FE60927)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"

native "GET_VEHICLE_MOD_KIT_TYPE"
	hash "0xFC058F5121E54C32"
	jhash (0xE5F76765)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"

native "GET_VEHICLE_WHEEL_TYPE"
	hash "0xB3ED1BFB4BE636DC"
	jhash (0xDA58D7AE)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Returns an int

		Wheel Types:
		0: Sport
		1: Muscle
		2: Lowrider
		3: SUV
		4: Offroad
		5: Tuner
		6: Bike Wheels
		7: High End

		Tested in Los Santos Customs
</summary>
	]]

native "SET_VEHICLE_WHEEL_TYPE"
	hash "0x487EB21CC7295BA1"
	jhash (0x64BDAAAD)
	arguments {
		Vehicle "vehicle",

		int "WheelType",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		0: Sport
		1: Muscle
		2: Lowrider
		3: SUV
		4: Offroad
		5: Tuner
		6: Bike Wheels
		7: High End
</summary>
	]]

native "GET_NUM_MOD_COLORS"
	hash "0xA551BE18C11A476D"
	jhash (0x73722CD9)
	arguments {
		int "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"int"

native "SET_VEHICLE_MOD_COLOR_1"
	hash "0x43FEB945EE7F85B8"
	jhash (0xCBE9A54D)
	arguments {
		Vehicle "vehicle",

		int "paintType",

		int "color",

		int "p3",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		paintType:
		0: Normal
		1: Metallic
		2: Pearl
		3: Matte
		4: Metal
		5: Chrome

		color: number of the color.

		p3 seems to always be 0.
</summary>
	]]

native "SET_VEHICLE_MOD_COLOR_2"
	hash "0x816562BADFDEC83E"
	jhash (0xC32613C2)
	arguments {
		Vehicle "vehicle",

		int "paintType",

		int "color",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Changes the secondary paint type and color
		paintType:
		0: Normal
		1: Metallic
		2: Pearl
		3: Matte
		4: Metal
		5: Chrome

		color: number of the color
</summary>
	]]

native "GET_VEHICLE_MOD_COLOR_1"
	hash "0xE8D65CA700C9A693"
	jhash (0xE625510A)
	arguments {
		Vehicle "vehicle",

		intPtr "paintType",

		intPtr "color",

		intPtr "pearlescentColor",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		p3 seems to be the pearlescent highlight color.
		Seems redondant with void GET_VEHICLE_EXTRA_COLOURS(Vehicle vehicle, int *pearlescentColor, int *wheelColor)
</summary>
	]]

native "GET_VEHICLE_MOD_COLOR_2"
	hash "0x81592BE4E3878728"
	jhash (0x9B76BB8E)
	arguments {
		Vehicle "vehicle",

		intPtr "paintType",

		intPtr "color",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_VEHICLE_MOD_COLOR_1_NAME"
	hash "0xB45085B721EFD38C"
	jhash (0x9A0840FD)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	alias "0xB45085B721EFD38C"
	ns "VEHICLE"
	returns	"charPtr"
	doc [[!
<summary>
		returns a string which is the codename of the vehicle's currently selected primary color

		p1 is always 0
</summary>
	]]

native "GET_VEHICLE_MOD_COLOR_2_NAME"
	hash "0x4967A516ED23A5A1"
	jhash (0x9BDC0B49)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x4967A516ED23A5A1"
	ns "VEHICLE"
	returns	"charPtr"
	doc [[!
<summary>
		returns a string which is the codename of the vehicle's currently selected secondary color
</summary>
	]]

native "_IS_VEHICLE_MOD_LOAD_DONE"
	hash "0x9A83F5F9963775EF"
	jhash (0x112D637A)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x9A83F5F9963775EF"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether or not the vehicle has a CVehicleStreamRequestGfx that's trying to load mods.

		True if it isn't loading mods, false if it is.
</summary>
	]]

native "SET_VEHICLE_MOD"
	hash "0x6AF0636DDEDCB6DD"
	jhash (0xB52E5ED5)
	arguments {
		Vehicle "vehicle",

		int "modType",

		int "modIndex",

		BOOL "customTires",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		In b944, there are 50 (0 - 49) mod types.

		Sets the vehicle mod.
		The vehicle must have a mod kit first.

		Any out of range ModIndex is stock.

		#Mod Type
		Spoilers 
		Front Bumper 
		Rear Bumper 
		Side Skirt 
		Exhaust 
		Frame 
		Grille 
		Hood 
		Fender 
		Right Fender 
		Roof 
		Engine 
		Brakes 
		Transmission 
		Horns - 14 (modIndex from 0 to 51)
		Suspension 
		Armor 
		Front Wheels 
		Back Wheels - 24 //only for motocycles
		Plate holders 
		Trim Design 
		Ornaments 
		Dial Design 
		Steering Wheel 
		Shifter Leavers 
		Plaques 
		Hydraulics 
		Livery 

		ENUMS: pastebin.com/QzEAn02v
</summary>
	]]

native "GET_VEHICLE_MOD"
	hash "0x772960298DA26FDB"
	jhash (0xDC520069)
	arguments {
		Vehicle "vehicle",

		int "modType",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		In b944, there are 50 (0 - 49) mod types.

		Returns -1 if the vehicle mod is stock
</summary>
	]]

native "GET_VEHICLE_MOD_VARIATION"
	hash "0xB3924ECD70E095DC"
	jhash (0xC1B92003)
	arguments {
		Vehicle "vehicle",

		int "modType",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the wheels are custom wheels
</summary>
	]]

native "GET_NUM_VEHICLE_MODS"
	hash "0xE38E9162A2500646"
	jhash (0x8A814FF9)
	arguments {
		Vehicle "vehicle",

		int "modType",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Returns how many possible mods a vehicle has for a given mod type
</summary>
	]]

native "REMOVE_VEHICLE_MOD"
	hash "0x92D619E420858204"
	jhash (0x9CC80A43)
	arguments {
		Vehicle "vehicle",

		int "modType",
	}
	ns "VEHICLE"
	returns	"void"

native "TOGGLE_VEHICLE_MOD"
	hash "0x2A1F4F37F95BAD08"
	jhash (0xD095F811)
	arguments {
		Vehicle "vehicle",

		int "modType",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Toggles:
		UNK17 
		Turbo 
		UNK19 
		Tire Smoke 
		UNK21 
		Xenon Headlights 
</summary>
	]]

native "IS_TOGGLE_MOD_ON"
	hash "0x84B233A8C8FC8AE7"
	jhash (0xF0E1689F)
	arguments {
		Vehicle "vehicle",

		int "modType",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "GET_MOD_TEXT_LABEL"
	hash "0x8935624F8C5592CC"
	jhash (0x0BA39CA7)
	arguments {
		Vehicle "vehicle",

		int "modType",

		int "modValue",
	}
	ns "VEHICLE"
	returns	"charPtr"
	doc [[!
<summary>
		Returns the text label of a mod type for a given vehicle

		Use _GET_LABEL_TEXT to get the part name in the game's language
</summary>
	]]

native "GET_MOD_SLOT_NAME"
	hash "0x51F0FEB9F6AE98C0"
	jhash (0x5E113483)
	arguments {
		Vehicle "vehicle",

		int "modType",
	}
	ns "VEHICLE"
	returns	"charPtr"
	doc [[!
<summary>
		Returns the name for the type of vehicle mod(Armour, engine etc)
		-----------
		for some reason this native seems unreliable: sometimes returns NULL, and when retval != NULL the string can be empty
</summary>
	]]

native "GET_LIVERY_NAME"
	hash "0xB4C7A93837C91A1F"
	jhash (0xED80B5BE)
	arguments {
		Vehicle "vehicle",

		int "liveryIndex",
	}
	ns "VEHICLE"
	returns	"charPtr"
	doc [[!
<summary>
		Second Param = LiveryIndex

		example 

		int count = VEHICLE::GET_VEHICLE_LIVERY_COUNT(veh);
		for (int i = 0; i &lt; count; i++)  
			{
				char* LiveryName = VEHICLE::GET_LIVERY_NAME(veh, i);
			}


		this example will work fine to fetch all names 
		for example for Sanchez we get 

		SANC_LV1
		SANC_LV2
		SANC_LV3
		SANC_LV4
		SANC_LV5


		Use _GET_LABEL_TEXT, to get the localized livery name.

		-----------

		NOTE: You may need to set the vehicle's modKit to 0 by using this function: SET_VEHICLE_MOD_KIT() before getting the name, otherwise this native may return NULL.
		dev-c.com/nativedb/func/info/1f2aa07f00b3217a
</summary>
	]]

native "GET_VEHICLE_MOD_MODIFIER_VALUE"
	hash "0x90A38E9838E0A8C1"
	jhash (0x73AE5505)
	arguments {
		Vehicle "vehicle",

		int "modType",

		int "modIndex",
	}
	ns "VEHICLE"
	returns	"float"

native "_GET_VEHICLE_MOD_DATA"
	hash "0x4593CF82AA179706"
	jhash (0x94850968)
	arguments {
		Vehicle "vehicle",

		int "modType",

		int "modIndex",
	}
	alias "0x4593CF82AA179706"
	ns "VEHICLE"
	returns	"Any"
	doc [[!
<summary>
		Can be used for IS_DLC_VEHICLE_MOD and _0xC098810437312FFF
</summary>
	]]

native "PRELOAD_VEHICLE_MOD"
	hash "0x758F49C24925568A"
	jhash (0x6EA5F4A8)
	arguments {
		Any "p0",

		int "modType",

		Any "p2",
	}
	ns "VEHICLE"
	returns	"void"

native "HAS_PRELOAD_MODS_FINISHED"
	hash "0x06F43E5175EB6D96"
	jhash (0xA8A0D246)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "RELEASE_PRELOAD_MODS"
	hash "0x445D79F995508307"
	jhash (0xD442521F)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_TYRE_SMOKE_COLOR"
	hash "0xB5BA80F839791C0F"
	jhash (0x3EDEC0DB)
	arguments {
		Vehicle "vehicle",

		int "r",

		int "g",

		int "b",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets the tire smoke's color of this vehicle.

		vehicle: The vehicle that is the target of this method.
		r: The red level in the RGB color code.
		g: The green level in the RGB color code.
		b: The blue level in the RGB color code.

		Note:
		setting r,g,b to 0 will give the car independance day tyre smoke
</summary>
	]]

native "GET_VEHICLE_TYRE_SMOKE_COLOR"
	hash "0xB635392A4938B3C3"
	jhash (0x75280015)
	arguments {
		Vehicle "vehicle",

		intPtr "r",

		intPtr "g",

		intPtr "b",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_WINDOW_TINT"
	hash "0x57C51E6BAD752696"
	jhash (0x497C8787)
	arguments {
		Vehicle "vehicle",

		int "tint",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		enum WindowTints
		{
			WINDOWTINT_NONE,
			WINDOWTINT_PURE_BLACK,
			WINDOWTINT_DARKSMOKE,
			WINDOWTINT_LIGHTSMOKE,
			WINDOWTINT_STOCK,
			WINDOWTINT_LIMO,
			WINDOWTINT_GREEN
		};
</summary>
	]]

native "GET_VEHICLE_WINDOW_TINT"
	hash "0x0EE21293DAD47C95"
	jhash (0x13D53892)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"

native "GET_NUM_VEHICLE_WINDOW_TINTS"
	hash "0x9D1224004B3A6707"
	jhash (0x625C7B66)
	ns "VEHICLE"
	returns	"int"

native "GET_VEHICLE_COLOR"
	hash "0xF3CC740D36221548"
	jhash (0x03BC8F1B)
	arguments {
		Vehicle "vehicle",

		intPtr "r",

		intPtr "g",

		intPtr "b",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		What's this for? Primary and Secondary RGB have their own natives and this one doesn't seem specific.
</summary>
	]]

native "0xEEBFC7A7EFDC35B4"
	hash "0xEEBFC7A7EFDC35B4"
	jhash (0x749DEEA2)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Some kind of flags.
</summary>
	]]

native "GET_VEHICLE_CAUSE_OF_DESTRUCTION"
	hash "0xE495D1EF4C91FD20"
	jhash (0x7F8C20DD)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"Hash"
	doc [[!
<summary>
		iVar3 = get_vehicle_cause_of_destruction(uLocal_248[iVar2]);
		if (iVar3 == joaat("weapon_stickybomb"))
		{
		     func_171(726);
		     iLocal_260 = 1;
		}
</summary>
	]]

native "GET_IS_LEFT_VEHICLE_HEADLIGHT_DAMAGED"
	hash "0x5EF77C9ADD3B11A3"
	jhash (0xA0777943)
	arguments {
		Vehicle "vehicle",
	}
	alias "_IS_HEADLIGHT_L_BROKEN"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		From the driver's perspective, is the left headlight broken.
</summary>
	]]

native "GET_IS_RIGHT_VEHICLE_HEADLIGHT_DAMAGED"
	hash "0xA7ECB73355EB2F20"
	jhash (0xF178390B)
	arguments {
		Vehicle "vehicle",
	}
	alias "_IS_HEADLIGHT_R_BROKEN"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		From the driver's perspective, is the right headlight broken.
</summary>
	]]

native "_SET_VEHICLE_ENGINE_POWER_MULTIPLIER"
	hash "0x93A3996368C94158"
	jhash (0xE943B09C)
	arguments {
		Vehicle "vehicle",

		float "value",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Vehicle power multiplier.
		Does not have to be looped each frame. Can be set once.
		Values lower than 1f don't work.

		Note: If the value is set with GET_RANDOM_FLOAT_IN_RANGE, the vehicle will have an absurdly high ammount of power, and will become almost undrivable for the player or NPCs. The range doesn't seem to matter.

		An high value like 10000000000f will visually remove the wheels that apply the power (front wheels for FWD, rear wheels for RWD), but the power multiplier will still apply, and the wheels still work.
		------
		value is a percentage bump which affects directly the parameter known as fInitialDriveForce in handling.meta. For example:
		VEHICLE::_SET_VEHICLE_ENGINE_POWER_MULTIPLIER(myVehicle, 30.0)
		will have this effect: DriveForce *= 1.3
</summary>
	]]

native "_SET_VEHICLE_ST"
	hash "0x1CF38D529D7441D9"
	jhash (0xDF594D8D)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	alias "0x1CF38D529D7441D9"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Has something to do with trains. Always precedes SET_MISSION_TRAIN_AS_NO_LONGER_NEEDED.
		============================================
		May be true that it can be used with trains not sure, but not specifically for trains. Go find Xbox360 decompiled scripts and search for 'func_1333' in freemode.c it isn't used just for trains. Thanks for the info tho.

		Btw, func_1333 ends up calling this func which uses this native,

		void func_1338(int iParam0)//Position 
		{
			ENTITY::FREEZE_ENTITY_POSITION(iParam0, true);
			ENTITY::SET_ENTITY_COLLISION(iParam0, false, 0);
			ENTITY::SET_ENTITY_INVINCIBLE(iParam0, true);
			VEHICLE::_0xDF594D8D(iParam0, true);
		}
</summary>
	]]

native "0x1F9FB66F3A3842D2"
	hash "0x1F9FB66F3A3842D2"
	jhash (0x4D840FC4)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x54B0F614960F4A5F"
	hash "0x54B0F614960F4A5F"
	jhash (0x5AB26C2B)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",
	}
	ns "VEHICLE"
	returns	"Any"

native "0xE30524E1871F481D"
	hash "0xE30524E1871F481D"
	jhash (0xEF05F807)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		REMOTE_VEHICLE_*
</summary>
	]]

native "_ANY_PASSENGERS_RAPPELING"
	hash "0x291E373D483E7EE7"
	jhash (0xD656E7E5)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x291E373D483E7EE7"
	ns "VEHICLE"
	returns	"BOOL"

native "_SET_VEHICLE_ENGINE_TORQUE_MULTIPLIER"
	hash "0xB59E4BD37AE292DB"
	jhash (0x642DA5AA)
	arguments {
		Vehicle "vehicle",

		float "value",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		&lt;1.0 - Decreased torque
		=1.0 - Default torque
		&gt;1.0 - Increased torque

		Negative values will cause the vehicle to go backwards instead of forwards while accelerating.

		value - is between 0.2 and 1.8 in the decompiled scripts. 

		This needs to be called every frame to take effect.
</summary>
	]]

native "0x0AD9E8F87FF7C16F"
	hash "0x0AD9E8F87FF7C16F"
	jhash (0x04F5546C)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_IS_WANTED"
	hash "0xF7EC25A3EBEEC726"
	jhash (0xDAA388E8)
	arguments {
		Vehicle "vehicle",

		BOOL "state",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets the wanted state of this vehicle.

</summary>
	]]

native "0xF488C566413B4232"
	hash "0xF488C566413B4232"
	jhash (0xA25CCB8C)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0xC1F981A6F74F0C23"
	hash "0xC1F981A6F74F0C23"
	jhash (0x00966934)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		same call as VEHICLE::_0x0F3B4D4E43177236
</summary>
	]]

native "0x0F3B4D4E43177236"
	hash "0x0F3B4D4E43177236"
	jhash (0x113DF5FD)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x6636C535F6CC2725"
	hash "0x6636C535F6CC2725"
	jhash (0x7C8D6464)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Something related to vehicle lean? (References CVehicleLeanHelper)
</summary>
	]]

native "DISABLE_PLANE_AILERON"
	hash "0x23428FC53C60919C"
	jhash (0x7E84C45C)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",

		BOOL "p2",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		hash collision??? - Don't think so. It fits alphabetically and it used with a plane in the scripts

		Ailerons are responsible for the rolling motion of a plane.
</summary>
	]]

native "GET_IS_VEHICLE_ENGINE_RUNNING"
	hash "0xAE31E7DF9B5B132E"
	jhash (0x7DC6D022)
	arguments {
		Vehicle "vehicle",
	}
	alias "_IS_VEHICLE_ENGINE_ON"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true when in a vehicle, false whilst entering/exiting.
</summary>
	]]

native "0x1D97D1E3A70A649F"
	hash "0x1D97D1E3A70A649F"
	jhash (0xA03E42DF)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Related to Hao races.
</summary>
	]]

native "_SET_BIKE_LEAN_ANGLE"
	hash "0x9CFA4896C3A53CBB"
	jhash (0x15D40761)
	arguments {
		Vehicle "vehicle",

		float "x",

		float "y",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Only works on bikes, both X and Y work in the -1 - 1 range.

		X forces the bike to turn left or right (-1, 1)
		Y forces the bike to lean to the left or to the right (-1, 1)

		Example with X -1/Y 1
		http://i.imgur.com/TgIuAPJ.jpg
</summary>
	]]

native "0xAB04325045427AAE"
	hash "0xAB04325045427AAE"
	jhash (0x1984F88D)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0xCFD778E7904C255E"
	hash "0xCFD778E7904C255E"
	jhash (0x3FBE904F)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		what does this do?
</summary>
	]]

native "SET_LAST_DRIVEN_VEHICLE"
	hash "0xACFB2463CC22BED2"
	jhash (0xD1B71A25)
	arguments {
		Vehicle "vehicle",
	}
	alias "0xACFB2463CC22BED2"
	ns "VEHICLE"
	returns	"void"

native "GET_LAST_DRIVEN_VEHICLE"
	hash "0xB2D06FAEDE65B577"
	jhash (0xFEB0C0C8)
	alias "0xB2D06FAEDE65B577"
	ns "VEHICLE"
	returns	"Vehicle"
	doc [[!
<summary>
		Not exactly sure on this one, but here's a snippet of code:

		if (PED::IS_PED_IN_ANY_VEHICLE(PLAYER::PLAYER_PED_ID(), 0)) {
		    v_2 = PED::GET_VEHICLE_PED_IS_IN(PLAYER::PLAYER_PED_ID(), 0);
		} else { 
		    v_2 = VEHICLE::_B2D06FAEDE65B577();
		}
</summary>
	]]

native "0xE01903C47C7AC89E"
	hash "0xE01903C47C7AC89E"
	ns "VEHICLE"
	returns	"void"

native "0x02398B627547189C"
	hash "0x02398B627547189C"
	jhash (0x08CD58F9)
	arguments {
		Vehicle "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_SET_PLANE_MIN_HEIGHT_ABOVE_TERRAIN"
	hash "0xB893215D8D4C015B"
	jhash (0x8C4B63E2)
	arguments {
		Vehicle "plane",

		int "height",
	}
	alias "0xB893215D8D4C015B"
	alias "_SET_PLANE_MIN_HEIGHT_ABOVE_GROUND"
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_LOD_MULTIPLIER"
	hash "0x93AE6A61BE015BF1"
	jhash (0x569E5AE3)
	arguments {
		Vehicle "vehicle",

		float "multiplier",
	}
	ns "VEHICLE"
	returns	"void"

native "0x428BACCDF5E26EAD"
	hash "0x428BACCDF5E26EAD"
	jhash (0x1604C2F5)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		if (!ENTITY::DOES_ENTITY_BELONG_TO_THIS_SCRIPT(g_10A5A._f8B[a_0/*1*/], 1)) {
		    sub_20af7("No longer needed: Vehicle owned by other script");
		    if ((((a_0 == 24) &amp;&amp; (!sub_3a04(g_10A5A._f8B[a_0/*1*/]))) &amp;&amp; (!sub_39c9(g_10A5A._f8B[a_0/*1*/]))) &amp;&amp; (ENTITY::GET_ENTITY_MODEL(g_10A5A._f8B[a_0/*1*/]) != ${monster})) {
		        VEHICLE::_428BACCDF5E26EAD(g_10A5A._f8B[a_0/*1*/], 1);
		    }
		    g_10A5A._f8B[a_0/*1*/] = 0;
		    g_10A5A[a_0/*1*/] = 1;
		    sub_20ada(a_0);
		    return ;
		}
</summary>
	]]

native "0x42A4BEB35D372407"
	hash "0x42A4BEB35D372407"
	jhash (0x8CDB0C09)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"Any"
	doc [[!
<summary>
		LOD related
</summary>
	]]

native "0x2C8CBFE1EA5FC631"
	hash "0x2C8CBFE1EA5FC631"
	jhash (0xABC99E21)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"Any"

native "0x4D9D109F63FEE1D4"
	hash "0x4D9D109F63FEE1D4"
	jhash (0x900C878C)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x279D50DE5652D935"
	hash "0x279D50DE5652D935"
	jhash (0xB3200F72)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0xE44A982368A4AF23"
	hash "0xE44A982368A4AF23"
	jhash (0xBAE491C7)
	arguments {
		Vehicle "vehicle",

		Vehicle "vehicle2",
	}
	ns "VEHICLE"
	returns	"void"

native "0xF25E02CB9C5818F8"
	hash "0xF25E02CB9C5818F8"
	jhash (0xF0E59BC1)
	ns "VEHICLE"
	returns	"void"

native "0xBC3CCA5844452B06"
	hash "0xBC3CCA5844452B06"
	jhash (0x929801C6)
	arguments {
		float "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "SET_VEHICLE_SHOOT_AT_TARGET"
	hash "0x74CD9A9327A282EA"
	jhash (0x2343FFDF)
	arguments {
		Ped "driver",

		Entity "entity",

		float "xTarget",

		float "yTarget",

		float "zTarget",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Commands the driver of an armed vehicle (p0) to shoot its weapon at a target (p1). p3, p4 and p5 are the coordinates of the target. Example:

		WEAPON::SET_CURRENT_PED_VEHICLE_WEAPON(pilot,GAMEPLAY::GET_HASH_KEY("VEHICLE_WEAPON_PLANE_ROCKET"));						VEHICLE::SET_VEHICLE_SHOOT_AT_TARGET(pilot, target, targPos.x, targPos.y, targPos.z);
</summary>
	]]

native "_GET_VEHICLE_OWNER"
	hash "0x8F5EBAB1F260CFCE"
	jhash (0x4A557117)
	arguments {
		Vehicle "vehicle",

		EntityPtr "entity",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		The resulting entity can be a Vehicle or Ped.

		The native is stored between GET_VEHICLE_LIVERY_COUNT and GET_VEHICLE_MAX_BRAKING so the actual name is either GET_VEHICLE_L* or GET_VEHICLE_M*

		=========================
		on a side note watching changes in memory this will only store your ped's entityPoolAddress if it's your personal vehicle. So seems to be related to personal vehicles or atleast a specific decor of it maybe.
</summary>
	]]

native "SET_FORCE_HD_VEHICLE"
	hash "0x97CE68CB032583F0"
	jhash (0xE0FC6A32)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	alias "0x97CE68CB032583F0"
	ns "VEHICLE"
	returns	"void"

native "0x182F266C2D9E2BEB"
	hash "0x182F266C2D9E2BEB"
	jhash (0x7D0DE7EA)
	arguments {
		Vehicle "vehicle",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_VEHICLE_PLATE_TYPE"
	hash "0x9CCC9525BF2408E0"
	jhash (0x65CA9286)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"

native "TRACK_VEHICLE_VISIBILITY"
	hash "0x64473AEFDCF47DCA"
	jhash (0x78122DC1)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		in script hook .net 

		Vehicle v = ...;
		Function.Call(Hash.TRACK_VEHICLE_VISIBILITY, v.Handle);
</summary>
	]]

native "IS_VEHICLE_VISIBLE"
	hash "0xAA0A52D24FB98293"
	jhash (0x7E0D6056)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		must be called after TRACK_VEHICLE_VISIBILITY 

		it's not instant so probabilly must pass an 'update' to see correct result.
</summary>
	]]

native "SET_VEHICLE_GRAVITY"
	hash "0x89F149B6131E57DA"
	jhash (0x07B2A6DC)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "0xE6C0C80B8C867537"
	hash "0xE6C0C80B8C867537"
	jhash (0xD2B8ACBD)
	arguments {
		BOOL "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "0x36492C2F0D134C56"
	hash "0x36492C2F0D134C56"
	jhash (0xA4A75FCF)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"Any"
	doc [[!
<summary>
		Returns a float value related to slipstream.
</summary>
	]]

native "0x06582AFF74894C75"
	hash "0x06582AFF74894C75"
	jhash (0x50F89338)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0xDFFCEF48E511DB48"
	hash "0xDFFCEF48E511DB48"
	jhash (0xEB7D7C27)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_IS_VEHICLE_SHOP_RESPRAY_ALLOWED"
	hash "0x8D474C8FAEFF6CDE"
	jhash (0x5EB00A6A)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x8D474C8FAEFF6CDE"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Checks for FLAG_NO_RESPRAY
</summary>
	]]

native "SET_VEHICLE_ENGINE_CAN_DEGRADE"
	hash "0x983765856F2564F9"
	jhash (0x081DAC12)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "0xF0E4BA16D1DB546C"
	hash "0xF0E4BA16D1DB546C"
	jhash (0x5BD8D82D)
	arguments {
		Vehicle "vehicle",

		int "p1",

		int "p2",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Adds some kind of shadow to the vehicle.
</summary>
	]]

native "0xF87D9F2301F7D206"
	hash "0xF87D9F2301F7D206"
	jhash (0x450AD03A)
	arguments {
		Any "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "_VEHICLE_HAS_LANDING_GEAR"
	hash "0x4198AB0022B15F87"
	jhash (0xBD085DCA)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x4198AB0022B15F87"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Vehicle has landing gear?
</summary>
	]]

native "_ARE_PROPELLERS_UNDAMAGED"
	hash "0x755D6D5267CBBD7E"
	jhash (0xABBDD5C6)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x755D6D5267CBBD7E"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Found this in the decompiled scripts, I'd do more research before changing the name --

		if (!ENTITY::IS_ENTITY_DEAD(l_1911)) {
		    if (!VEHICLE::_755D6D5267CBBD7E(l_1911)) {
		        sub_1ba80("TRAFFICKING AIR: FAILING - PROPELLERS ARE DAMAGED");
		        l_12CE = 9;
		    }
		}
</summary>
	]]

native "0x0CDDA42F9E360CA6"
	hash "0x0CDDA42F9E360CA6"
	jhash (0x9B581DE7)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "IS_VEHICLE_STOLEN"
	hash "0x4AF9BD80EEBEB453"
	jhash (0x20B61DDE)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_IS_STOLEN"
	hash "0x67B2C79AA7FF5738"
	jhash (0x70912E42)
	arguments {
		Vehicle "vehicle",

		BOOL "isStolen",
	}
	ns "VEHICLE"
	returns	"Any"

native "0xAD2D28A1AFDFF131"
	hash "0xAD2D28A1AFDFF131"
	jhash (0xED159AE6)
	arguments {
		Vehicle "vehicle",

		float "value",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		For planes only!

		value can be 1.0 or lower (higher values will automatically result in 1.0).
</summary>
	]]

native "_ARE_VEHICLE_WINGS_INTACT"
	hash "0x5991A01434CE9677"
	jhash (0xAF8CB3DF)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x5991A01434CE9677"
	alias "ADD_A_MARKER_OVER_VEHICLE"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		ADD_A_MARKER_OVER_VEHICLE was a hash collision!!!

		Can be used for planes only!
</summary>
	]]

native "0xB264C4D2F2B0A78B"
	hash "0xB264C4D2F2B0A78B"
	jhash (0x45F72495)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		This native doesn't seem to do anything, might be a debug-only native.

		Confirmed, it is a debug native.
</summary>
	]]

native "DETACH_VEHICLE_FROM_CARGOBOB"
	hash "0x0E21D3DF1051399D"
	jhash (0x83D3D331)
	arguments {
		Vehicle "vehicle",

		Vehicle "cargobob",
	}
	ns "VEHICLE"
	returns	"void"

native "DETACH_VEHICLE_FROM_ANY_CARGOBOB"
	hash "0xADF7BE450512C12F"
	jhash (0x50E0EABE)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "IS_VEHICLE_ATTACHED_TO_CARGOBOB"
	hash "0xD40148F22E81A1D9"
	jhash (0x5DEEC76C)
	arguments {
		Vehicle "cargobob",

		Vehicle "vehicleAttached",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "GET_VEHICLE_ATTACHED_TO_CARGOBOB"
	hash "0x873B82D42AC2B9E5"
	jhash (0x301A1D24)
	arguments {
		Vehicle "cargobob",
	}
	ns "VEHICLE"
	returns	"Vehicle"
	doc [[!
<summary>
		Returns attached vehicle (Vehicle in parameter must be cargobob)
</summary>
	]]

native "ATTACH_VEHICLE_TO_CARGOBOB"
	hash "0x4127F1D84E347769"
	jhash (0x607DC9D5)
	arguments {
		Vehicle "vehicle",

		Vehicle "cargobob",

		int "p2",

		float "x",

		float "y",

		float "z",
	}
	ns "VEHICLE"
	returns	"void"

native "0x571FEB383F629926"
	hash "0x571FEB383F629926"
	arguments {
		Vehicle "cargobob",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		consoel hash 0xAEB29F98
</summary>
	]]

native "_GET_CARGOBOB_HOOK_POSITION"
	hash "0xCBDB9B923CACC92D"
	arguments {
		Vehicle "cargobob",
	}
	alias "0xCBDB9B923CACC92D"
	ns "VEHICLE"
	returns	"Vector3"
	doc [[!
<summary>
		Gets the position of the cargobob hook, in world coords.
</summary>
	]]

native "DOES_CARGOBOB_HAVE_PICK_UP_ROPE"
	hash "0x1821D91AD4B56108"
	jhash (0xAF769B81)
	arguments {
		Vehicle "cargobob",
	}
	alias "_IS_CARGOBOB_HOOK_ACTIVE"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true only when the hook is active, will return false if the magnet is active
</summary>
	]]

native "CREATE_PICK_UP_ROPE_FOR_CARGOBOB"
	hash "0x7BEB0C7A235F6F3B"
	jhash (0x4D3C9A99)
	arguments {
		Vehicle "cargobob",

		int "state",
	}
	alias "_ENABLE_CARGOBOB_HOOK"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Drops the Hook/Magnet on a cargobob

		state
		enum eCargobobHook
		{
			CARGOBOB_HOOK = 0,
			CARGOBOB_MAGNET = 1,
		};
</summary>
	]]

native "REMOVE_PICK_UP_ROPE_FOR_CARGOBOB"
	hash "0x9768CF648F54C804"
	jhash (0xA8211EE9)
	arguments {
		Vehicle "cargobob",
	}
	alias "_RETRACT_CARGOBOB_HOOK"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Retracts the hook on the cargobob.

		Note: after you retract it the natives for dropping the hook no longer work
</summary>
	]]

native "_SET_CARGOBOB_HOOK_POSITION"
	hash "0x877C1EAEAC531023"
	jhash (0x3A8AB081)
	arguments {
		Vehicle "cargobob",

		float "xOffset",

		float "yOffset",

		int "state",
	}
	alias "0x877C1EAEAC531023"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		For now, I changed the last one from bool to int.
		According to scripts specifically 'fm_mission_controller' this last parameter is 'false/0' when its called after the create rope native above is called for the magnet and 'true/1' after the create rope native above is called for the hook.
</summary>
	]]

native "0xCF1182F682F65307"
	hash "0xCF1182F682F65307"
	arguments {
		Any "p0",

		Player "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_DOES_CARGOBOB_HAVE_PICKUP_MAGNET"
	hash "0x6E08BF5B3722BAC9"
	arguments {
		Vehicle "cargobob",
	}
	alias "_IS_CARGOBOB_MAGNET_ACTIVE"
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true only when the magnet is active, will return false if the hook is active
		console hash 0x4778CA0A 
</summary>
	]]

native "_SET_CARGOBOB_PICKUP_MAGNET_ACTIVE"
	hash "0x9A665550F8DA349B"
	arguments {
		Vehicle "cargobob",

		BOOL "isActive",
	}
	alias "_CARGOBOB_MAGNET_GRAB_VEHICLE"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Console Hash: 0xF57066DA
		Won't attract or magnetize to any helicopters or planes of course, but that's common sense. 
</summary>
	]]

native "_SET_CARGOBOB_PICKUP_MAGNET_STRENGTH"
	hash "0xBCBFCD9D1DAC19E2"
	arguments {
		Vehicle "cargobob",

		float "strength",
	}
	alias "0xBCBFCD9D1DAC19E2"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		console hash 0xCC3CF97D 
</summary>
	]]

native "0xA17BAD153B51547E"
	hash "0xA17BAD153B51547E"
	arguments {
		Vehicle "cargobob",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x66979ACF5102FD2F"
	hash "0x66979ACF5102FD2F"
	arguments {
		Vehicle "cargobob",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x6D8EAC07506291FB"
	hash "0x6D8EAC07506291FB"
	arguments {
		Vehicle "cargobob",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Console Hash: 0x60E29B78 
</summary>
	]]

native "0xED8286F71A819BAA"
	hash "0xED8286F71A819BAA"
	arguments {
		Vehicle "cargobob",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x685D5561680D088B"
	hash "0x685D5561680D088B"
	arguments {
		Vehicle "vehicle",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0xE301BD63E9E13CF0"
	hash "0xE301BD63E9E13CF0"
	arguments {
		Vehicle "vehicle",

		Vehicle "cargobob",
	}
	ns "VEHICLE"
	returns	"void"

native "0x9BDDC73CC6A115D4"
	hash "0x9BDDC73CC6A115D4"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",

		BOOL "p2",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Console Hash: 0x50CDB295 
</summary>
	]]

native "0x56EB5E94318D3FB6"
	hash "0x56EB5E94318D3FB6"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		console hash = 0x30F43FE3
</summary>
	]]

native "DOES_VEHICLE_HAVE_WEAPONS"
	hash "0x25ECB9F8017D98E0"
	jhash (0xB2E1E1FB)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "0x2C4A1590ABF43E8B"
	hash "0x2C4A1590ABF43E8B"
	jhash (0x2EC19A8B)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "DISABLE_VEHICLE_WEAPON"
	hash "0xF4FC6A6F67D8D856"
	jhash (0xA688B7D1)
	arguments {
		BOOL "disabled",

		Hash "weaponHash",

		Vehicle "vehicle",

		Ped "owner",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		how does this work?
</summary>
	]]

native "0xE05DD0E9707003A3"
	hash "0xE05DD0E9707003A3"
	jhash (0x123E5B90)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x21115BCD6E44656A"
	hash "0x21115BCD6E44656A"
	jhash (0xEBC225C1)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "GET_VEHICLE_CLASS"
	hash "0x29439776AAA00A62"
	jhash (0xC025338E)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		Returns an int

		Vehicle Classes:
		0: Compacts
		1: Sedans
		2: SUVs
		3: Coupes
		4: Muscle
		5: Sports Classics
		6: Sports
		7: Super
		8: Motorcycles
		9: Off-road
		10: Industrial
		11: Utility
		12: Vans
		13: Cycles
		14: Boats
		15: Helicopters
		16: Planes
		17: Service
		18: Emergency
		19: Military
		20: Commercial
		21: Trains

		char buffer[128];
		std::sprintf(buffer, "VEH_CLASS_%i", VEHICLE::GET_VEHICLE_CLASS(vehicle));

		char* className = UI::_GET_LABEL_TEXT(buffer);
</summary>
	]]

native "GET_VEHICLE_CLASS_FROM_NAME"
	hash "0xDEDF1C8BD47C2200"
	jhash (0xEA469980)
	arguments {
		Hash "modelHash",
	}
	ns "VEHICLE"
	returns	"int"
	doc [[!
<summary>
		For a full enum, see here : pastebin.com/i2GGAjY0

		char buffer[128];
		std::sprintf(buffer, "VEH_CLASS_%i", VEHICLE::GET_VEHICLE_CLASS_FROM_NAME (hash));

		char* className = UI::_GET_LABEL_TEXT(buffer);
</summary>
	]]

native "SET_PLAYERS_LAST_VEHICLE"
	hash "0xBCDF8BAF56C87B6A"
	jhash (0xDE86447D)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"Any"

native "SET_VEHICLE_CAN_BE_USED_BY_FLEEING_PEDS"
	hash "0x300504B23BD3B711"
	jhash (0x5130DB1E)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	alias "0x300504B23BD3B711"
	ns "VEHICLE"
	returns	"void"

native "0xE5810AC70602F2F5"
	hash "0xE5810AC70602F2F5"
	jhash (0xB6BE07E0)
	arguments {
		Vehicle "vehicle",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_SET_VEHICLE_CREATES_MONEY_PICKUPS_WHEN_EXPLODED"
	hash "0x068F64F2470F9656"
	jhash (0x4BB5605D)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	alias "0x068F64F2470F9656"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Money pickups are created around cars when they explodes. Only works when the vehicle model is a car. A single pickup is between 1 and 18 dollars in size. All car models seems to give the same amount of money.

		youtu.be/3arlUxzHl5Y 
		i.imgur.com/WrNpYFs.jpg

		From the scripts:
		VEHICLE::_068F64F2470F9656(l_36, 0);

		Found a "correct" name for this :P
		_dead_vehicle_pickups_dies_when_set_exploded_destroy_it_drops_on_money

		SET_VEHICLE_D* or SET_VEHICLE_E*
</summary>
	]]

native "_SET_VEHICLE_JET_ENGINE_ON"
	hash "0xB8FBC8B1330CA9B4"
	jhash (0x51E0064F)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	alias "0xB8FBC8B1330CA9B4"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		VEHICLE::SET_VEHICLE_ENGINE_ON is not enough to start jet engines when not inside the vehicle. But with this native set to true it works: youtu.be/OK0ps2fDpxs 
		i.imgur.com/7XA14pX.png
		Certain planes got jet engines.

		void VEHICLE::_SET_VEHICLE_JET_ENGINE_ON(scrNativeCallContext *args)
		{
		  bool bOn; // bl@1
		  CVehicle *pVehicle; // rax@1
		  scrNativeCallContextArgStruct *pArgs; // rax@1

		  pArgs = args-&gt;pArgs;
		  bOn = pArgs-&gt;a2.INT32 != 0;
		  pVehicle = getEntityAddressIfVehicle(pArgs-&gt;a1.INT32);
		  if ( pVehicle )
		  {
		    pVehicle-&gt;bitmapBulletProofTires &amp;= 0xFBu;
		    pVehicle-&gt;bitmapBulletProofTires |= 4 * bOn;
		  }
		} // sfink
</summary>
	]]

native "0x10655FAB9915623D"
	hash "0x10655FAB9915623D"
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x79DF7E806202CE01"
	hash "0x79DF7E806202CE01"
	jhash (0xAEF9611C)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0x9007A2F21DC108D4"
	hash "0x9007A2F21DC108D4"
	jhash (0x585E49B6)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_SET_HELICOPTER_ROLL_PITCH_YAW_MULT"
	hash "0x6E0859B530A365CC"
	jhash (0x6E67FD35)
	arguments {
		Vehicle "helicopter",

		float "multiplier",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		value between 0.0 and 1.0
</summary>
	]]

native "SET_VEHICLE_FRICTION_OVERRIDE"
	hash "0x1837AF7C627009BA"
	jhash (0x32AFD42E)
	arguments {
		Vehicle "vehicle",

		float "friction",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Seems to be related to the metal parts, not tyres (like i was expecting lol)

		Must be called every tick.
</summary>
	]]

native "SET_VEHICLE_WHEELS_CAN_BREAK_OFF_WHEN_BLOW_UP"
	hash "0xA37B9A517B133349"
	jhash (0x670913A4)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	alias "SET_VEHICLE_MAX_STR_TRAP"
	ns "VEHICLE"
	returns	"void"

native "0xF78F94D60248C737"
	hash "0xF78F94D60248C737"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_CEILING_HEIGHT"
	hash "0xA46413066687A328"
	jhash (0x98A10A86)
	arguments {
		Vehicle "vehicle",

		float "p1",
	}
	alias "GET_VEHICLE_DEFORMATION_GET_TREE"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Previously named GET_VEHICLE_DEFORMATION_GET_TREE (hash collision)

		from Decrypted Scripts I found
		VEHICLE::SET_VEHICLE_CEILING_HEIGHT(l_BD9[2/*2*/], 420.0);
</summary>
	]]

native "0x5E569EC46EC21CAE"
	hash "0x5E569EC46EC21CAE"
	jhash (0xBC649C49)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"

native "0x6D6AF961B72728AE"
	hash "0x6D6AF961B72728AE"
	jhash (0x8DD9AA0C)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"

native "DOES_VEHICLE_EXIST_WITH_DECORATOR"
	hash "0x956B409B984D9BF7"
	jhash (0x39E68EDD)
	arguments {
		charPtr "decorator",
	}
	ns "VEHICLE"
	returns	"BOOL"

native "SET_VEHICLE_EXCLUSIVE_DRIVER"
	hash "0x41062318F23ED854"
	jhash (0xAA8BD440)
	arguments {
		Vehicle "vehicle",

		Ped "ped",
	}
	alias "0x41062318F23ED854"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Seems according to TU27 X360 Scripts, this has 3 arguments as well.

		SET_VEHICLE_EXCLUSIVE_DRIVER(vehicle, 0, 0); in freemode.c

		In case 5 of a switch case, is the only time it shows Arg2 being PLAYER_PED_ID(), otherwise it's 0. Arg3 always seems to be 0.

</summary>
	]]

native "_SET_VEHICLE_EXCLUSIVE_DRIVER_2"
	hash "0xB5C51B5502E85E83"
	arguments {
		Vehicle "vehicle",

		Ped "ped",

		int "p2",
	}
	alias "0xB5C51B5502E85E83"
	ns "VEHICLE"
	returns	"void"

native "0x500873A45724C863"
	hash "0x500873A45724C863"
	arguments {
		Vehicle "vehicle",

		Any "p1",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		console hash: 0x004926A3
</summary>
	]]

native "0xB055A34527CB8FD7"
	hash "0xB055A34527CB8FD7"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_DISPLAY_DISTANT_VEHICLES"
	hash "0xF796359A959DF65D"
	jhash (0xB5CC548B)
	arguments {
		BOOL "toggle",
	}
	alias "0xF796359A959DF65D"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Toggles to render distant vehicles. They may not be vehicles but images to look like vehicles.
</summary>
	]]

native "_SET_VEHICLE_NEON_LIGHTS_COLOUR"
	hash "0x8E0A582209A62695"
	arguments {
		Vehicle "vehicle",

		int "r",

		int "g",

		int "b",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets the color of the neon lights of the specified vehicle.

		More info: pastebin.com/G49gqy8b
</summary>
	]]

native "_GET_VEHICLE_NEON_LIGHTS_COLOUR"
	hash "0x7619EEE8C886757F"
	arguments {
		Vehicle "vehicle",

		intPtr "r",

		intPtr "g",

		intPtr "b",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Gets the color of the neon lights of the specified vehicle.

		See _SET_VEHICLE_NEON_LIGHTS_COLOUR (0x8E0A582209A62695) for more information
</summary>
	]]

native "_SET_VEHICLE_NEON_LIGHT_ENABLED"
	hash "0x2AA720E4287BF269"
	arguments {
		Vehicle "vehicle",

		int "index",

		BOOL "toggle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Sets the neon lights of the specified vehicle on/off.

		Indices:
		0 = Left
		1 = Right
		2 = Front
		3 = Back
</summary>
	]]

native "_IS_VEHICLE_NEON_LIGHT_ENABLED"
	hash "0x8C4B92553E4766A5"
	arguments {
		Vehicle "vehicle",

		int "index",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		indices:
		0 = Left
		1 = Right
		2 = Front
		3 = Back
</summary>
	]]

native "0x35E0654F4BAD7971"
	hash "0x35E0654F4BAD7971"
	arguments {
		BOOL "p0",
	}
	ns "VEHICLE"
	returns	"void"

native "0xB088E9A47AE6EDD5"
	hash "0xB088E9A47AE6EDD5"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "0xDBA3C090E3D74690"
	hash "0xDBA3C090E3D74690"
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		REQUEST_VEHICLE_*
</summary>
	]]

native "GET_VEHICLE_BODY_HEALTH"
	hash "0xF271147EB7B40F12"
	jhash (0x2B2FCC28)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Seems related to vehicle health, like the one in IV.
		Max 1000, min 0.
		Vehicle does not necessarily explode or become undrivable at 0.
</summary>
	]]

native "SET_VEHICLE_BODY_HEALTH"
	hash "0xB77D05AC8C78AADB"
	jhash (0x920C2517)
	arguments {
		Vehicle "vehicle",

		float "value",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		p2 often set to 1000.0 in the decompiled scripts.
</summary>
	]]

native "0xDF7E3EEB29642C38"
	hash "0xDF7E3EEB29642C38"
	arguments {
		Vehicle "vehicle",

		Vector3Ptr "out1",

		Vector3Ptr "out2",
	}
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Outputs 2 Vector3's.
		Scripts check if out2.x - out1.x &gt; someshit.x
		Could be suspension related, as in max suspension height and min suspension height, considering the natives location.
</summary>
	]]

native "_GET_VEHICLE_SUSPENSION_HEIGHT"
	hash "0x53952FD2BAA19F17"
	jhash (0xB73A1486)
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		Gets the height of the vehicle's suspension.
		The higher the value the lower the suspension. Each 0.002 corresponds with one more level lowered.
		0.000 is the stock suspension.
		0.008 is Ultra Suspension.
</summary>
	]]

native "_SET_CAR_HIGH_SPEED_BUMP_SEVERITY_MULTIPLIER"
	hash "0x84FD40F56075E816"
	arguments {
		float "multiplier",
	}
	alias "0x84FD40F56075E816"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		Something to do with "high speed bump severity"?

		if (!sub_87a46("SET_CAR_HIGH_SPEED_BUMP_SEVERITY_MULTIPLIER")) {
		    VEHICLE::_84FD40F56075E816(0.0);
		    sub_8795b("SET_CAR_HIGH_SPEED_BUMP_SEVERITY_MULTIPLIER", 1);
		}
</summary>
	]]

native "0xA7DCDF4DED40A8F4"
	hash "0xA7DCDF4DED40A8F4"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_GET_VEHICLE_BODY_HEALTH_2"
	hash "0xB8EF61207C2393A9"
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"float"
	doc [[!
<summary>
		0 min 100 max
		starts at 100
		Seams to have health zones
		Front of vehicle when damaged goes from 100-50 and stops at 50.
		Rear can be damaged from 100-0
		Only tested with two cars.

		any idea how this differs from the first one?

		--
		May return the vehicle health on a scale of 0.0 - 100.0 (needs to be confirmed)

		example:

		v_F = ENTITY::GET_ENTITY_MODEL(v_3);
		if (((v_F == ${tanker}) || (v_F == ${armytanker})) || (v_F == ${tanker2})) {
		    if (VEHICLE::_GET_VEHICLE_BODY_HEALTH_2(v_3) &lt;= 1.0) {
		        NETWORK::NETWORK_EXPLODE_VEHICLE(v_3, 1, 1, -1);
		    }
		}
</summary>
	]]

native "0xD4C4642CB7F50B5D"
	hash "0xD4C4642CB7F50B5D"
	arguments {
		Vehicle "vehicle",
	}
	ns "VEHICLE"
	returns	"BOOL"
	doc [[!
<summary>
		Only used like this:

		if (VEHICLE::_D4C4642CB7F50B5D(ENTITY::GET_VEHICLE_INDEX_FROM_ENTITY_INDEX(v_3))) {                                                        sub_157e9c(g_40001._f1868, 0);
		}
</summary>
	]]

native "0xC361AA040D6637A8"
	hash "0xC361AA040D6637A8"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "_SET_VEHICLE_HUD_SPECIAL_ABILITY_BAR_ACTIVE"
	hash "0x99C82F8A139F3E4E"
	arguments {
		Vehicle "vehicle",

		BOOL "active",
	}
	alias "0x99C82F8A139F3E4E"
	ns "VEHICLE"
	returns	"void"
	doc [[!
<summary>
		console hash: 0x71CDD52F
</summary>
	]]

native "0xE16142B94664DEFD"
	hash "0xE16142B94664DEFD"
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "VEHICLE"
	returns	"void"

native "CREATE_OBJECT"
	hash "0x509D5878EB39E842"
	jhash (0x2F7AA05C)
	arguments {
		Object "modelHash",

		float "x",

		float "y",

		float "z",

		BOOL "isNetwork",

		BOOL "thisScriptCheck",

		BOOL "dynamic",
	}
	ns "OBJECT"
	returns	"Object"
	doc [[!
<summary>
		thisScriptCheck - can be destroyed if it belongs to the calling script.

		p5 - last parameter does not mean object handle is returned
		maybe a quick view in disassembly will tell us what is actually does

		----------

		prop_tt_screenstatic (0xE2E039BC) is handled different. Not sure how yet but it I know it is.
</summary>
	]]

native "CREATE_OBJECT_NO_OFFSET"
	hash "0x9A294B2138ABB884"
	jhash (0x58040420)
	arguments {
		Hash "modelHash",

		float "x",

		float "y",

		float "z",

		BOOL "isNetwork",

		BOOL "thisScriptCheck",

		BOOL "dynamic",
	}
	ns "OBJECT"
	returns	"Object"
	doc [[!
<summary>
		thisScriptCheck - can be destroyed if it belongs to the calling script.

		p5 - does not mean object handle is returned
		maybe a quick view in disassembly will tell us what is actually does

		----------

		prop_tt_screenstatic (0xE2E039BC) is handled different. Not sure how yet but it I know it is.
</summary>
	]]

native "DELETE_OBJECT"
	hash "0x539E0AE3E6634B9F"
	jhash (0xD6EF9DA7)
	arguments {
		ObjectPtr "object",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		Deletes the specified object, then sets the handle pointed to by the pointer to NULL.

		meme.
</summary>
	]]

native "PLACE_OBJECT_ON_GROUND_PROPERLY"
	hash "0x58A850EAEE20FAA3"
	jhash (0x8F95A20B)
	arguments {
		Object "object",
	}
	ns "OBJECT"
	returns	"BOOL"

native "SLIDE_OBJECT"
	hash "0x2FDFF4107B8C1147"
	jhash (0x63BFA7A0)
	arguments {
		Object "object",

		float "toX",

		float "toY",

		float "toZ",

		float "speedX",

		float "speedY",

		float "speedZ",

		BOOL "collision",
	}
	ns "OBJECT"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the object has finished moving.

		If false, moves the object towards the specified X, Y and Z coordinates with the specified X, Y and Z speed.

		See also: gtag.gtagaming.com/opcode-database/opcode/034E/
</summary>
	]]

native "SET_OBJECT_TARGETTABLE"
	hash "0x8A7391690F5AFD81"
	jhash (0x3F88CD86)
	arguments {
		Object "object",

		BOOL "targettable",
	}
	ns "OBJECT"
	returns	"Any"

native "_SET_OBJECT_SOMETHING"
	hash "0x77F33F2CCF64B3AA"
	jhash (0x483C5C88)
	arguments {
		Object "object",

		BOOL "p1",
	}
	alias "0x77F33F2CCF64B3AA"
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		i don't know what this does

		```&lt;pre&gt;
		void __fastcall OBJECT___0x77F33F2CCF64B3AA_START(scrNativeCallContext *args)
		{
		  bool p2; // bl@1
		  CObject *pObject; // rax@1
		  scrNativeCallContextArgStruct *pArgs; // rax@1

		  pArgs = args-&gt;pArgs;
		  p2 = pArgs-&gt;a2.BOOL != 0;
		  pObject = getAddressOfObject(pArgs-&gt;a1.Object);
		  if ( pObject )
		  {
		    pObject-&gt;field_425 &amp;= 0xDFu;                // 1101 1111 (clear bit 6)
		    pObject-&gt;field_425 |= 32 * p2;              // bit 6 = p2
		  }
		}
		// sfink
		// note to AB: please set "white-space: pre" in css
		```
</summary>
	]]

native "GET_CLOSEST_OBJECT_OF_TYPE"
	hash "0xE143FA2249364369"
	jhash (0x45619B33)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "modelHash",

		BOOL "isMission",

		BOOL "p6",

		BOOL "p7",
	}
	ns "OBJECT"
	returns	"Object"
	doc [[!
<summary>
		Has 8 params in the latest patches.

		isMission - if true doesn't return mission objects
</summary>
	]]

native "HAS_OBJECT_BEEN_BROKEN"
	hash "0x8ABFB70C49CC43E2"
	jhash (0xFE21F891)
	arguments {
		Object "object",
	}
	ns "OBJECT"
	returns	"BOOL"

native "HAS_CLOSEST_OBJECT_OF_TYPE_BEEN_BROKEN"
	hash "0x761B0E69AC4D007E"
	jhash (0x6FC0353D)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		Hash "modelHash",

		Any "p5",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x46494A2475701343"
	hash "0x46494A2475701343"
	jhash (0x7DB578DD)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		Hash "modelHash",

		BOOL "p5",
	}
	ns "OBJECT"
	returns	"BOOL"

native "_GET_OBJECT_OFFSET_FROM_COORDS"
	hash "0x163E252DE035A133"
	jhash (0x87A42A12)
	arguments {
		float "xPos",

		float "yPos",

		float "zPos",

		float "heading",

		float "xOffset",

		float "yOffset",

		float "zOffset",
	}
	ns "OBJECT"
	returns	"Vector3"

native "0x163F8B586BC95F2A"
	hash "0x163F8B586BC95F2A"
	jhash (0x65213FC3)
	arguments {
		Any "coords",

		float "radius",

		Hash "modelHash",

		float "x",

		float "y",

		float "z",

		Vector3Ptr "p6",

		int "p7",
	}
	ns "OBJECT"
	returns	"Any"
	doc [[!
<summary>
		only documented params
		dont know what this does.... To Be Continued... 
</summary>
	]]

native "SET_STATE_OF_CLOSEST_DOOR_OF_TYPE"
	hash "0xF82D8F1926A02C3D"
	jhash (0x38C951A4)
	arguments {
		Hash "type",

		float "x",

		float "y",

		float "z",

		BOOL "locked",

		float "heading",

		BOOL "p6",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		Hardcoded to not work in multiplayer.


		Used to lock/unlock doors to interior areas of the game.

		(Possible) Door Types:

		pastebin.com/9S2m3qA4

		Heading is either 1, 0 or -1 in the scripts. Means default closed(0) or opened either into(1) or out(-1) of the interior.
		Locked means that the heading is locked.  
		p6 is always 0. 

		225 door types, model names and coords found in stripclub.c4:
		pastebin.com/gywnbzsH

		get door info: pastebin.com/i14rbekD
</summary>
	]]

native "GET_STATE_OF_CLOSEST_DOOR_OF_TYPE"
	hash "0xEDC1A5B84AEF33FF"
	jhash (0x4B44A83D)
	arguments {
		Hash "type",

		float "x",

		float "y",

		float "z",

		BOOLPtr "locked",

		floatPtr "heading",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		locked is 0 if no door is found
		locked is 0 if door is unlocked
		locked is 1 if door is found and unlocked.

		-------------
		the locked bool is either 0(unlocked)(false) or 1(locked)(true)
</summary>
	]]

native "_DOOR_CONTROL"
	hash "0x9B12F9A24FABEDB0"
	jhash (0x4E0A260B)
	arguments {
		Hash "doorHash",

		float "x",

		float "y",

		float "z",

		BOOL "locked",

		float "xRotMult",

		float "yRotMult",

		float "zRotMult",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		OBJECT::_9B12F9A24FABEDB0(${prop_gate_prison_01}, 1845.0, 2605.0, 45.0, 0, 0.0, 50.0, 0);  //door unlocked

		OBJECT::_9B12F9A24FABEDB0(${prop_gate_prison_01}, 1845.0, 2605.0, 45.0, 1, 0.0, 50.0, 0);  //door locked

		locked simply tells the game whether or not the door is locked.

		x,y,z RotMult are multipliers that specify how fast the door/gate will rotate in degrees per second.
</summary>
	]]

native "ADD_DOOR_TO_SYSTEM"
	hash "0x6F8838D03D1DC226"
	jhash (0x9D2D778D)
	arguments {
		Hash "doorHash",

		Hash "modelHash",

		float "x",

		float "y",

		float "z",

		BOOL "p5",

		BOOL "p6",

		BOOL "p7",
	}
	ns "OBJECT"
	returns	"void"

native "REMOVE_DOOR_FROM_SYSTEM"
	hash "0x464D8E1427156FE4"
	jhash (0x00253286)
	arguments {
		Hash "doorHash",
	}
	ns "OBJECT"
	returns	"void"

native "_SET_DOOR_ACCELERATION_LIMIT"
	hash "0x6BAB9442830C7F53"
	jhash (0xDF83DB47)
	arguments {
		Hash "doorHash",

		int "limit",

		BOOL "p2",

		BOOL "p3",
	}
	alias "0x6BAB9442830C7F53"
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		Sets the acceleration limit of a door.
		How fast it can open, or the inverse hinge resistance.

		A limit of 0 seems to lock doors.

		p2 is always 0, p3 is always 1.


</summary>
	]]

native "0x160AA1B32F6139B8"
	hash "0x160AA1B32F6139B8"
	jhash (0xD42A41C2)
	arguments {
		Hash "doorHash",
	}
	ns "OBJECT"
	returns	"int"

native "0x4BC2854478F3A749"
	hash "0x4BC2854478F3A749"
	jhash (0xD649B7E1)
	arguments {
		Hash "doorHash",
	}
	ns "OBJECT"
	returns	"int"

native "0x03C27E13B42A0E82"
	hash "0x03C27E13B42A0E82"
	jhash (0x4F44AF21)
	arguments {
		Hash "doorHash",

		float "p1",

		BOOL "p2",

		BOOL "p3",
	}
	ns "OBJECT"
	returns	"void"

native "0x9BA001CB45CBF627"
	hash "0x9BA001CB45CBF627"
	jhash (0x47531446)
	arguments {
		Hash "doorHash",

		float "heading",

		BOOL "p2",

		BOOL "p3",
	}
	ns "OBJECT"
	returns	"void"

native "_SET_DOOR_AJAR_ANGLE"
	hash "0xB6E6FBA95C7324AC"
	jhash (0x34883DE3)
	arguments {
		Hash "doorHash",

		float "ajar",

		BOOL "p2",

		BOOL "p3",
	}
	alias "0xB6E6FBA95C7324AC"
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		Sets the ajar angle of a door.
		Ranges from -1.0 to 1.0, and 0.0 is closed / default.

		p2 is always 0, p3 is always 1.


</summary>
	]]

native "0x65499865FCA6E5EC"
	hash "0x65499865FCA6E5EC"
	jhash (0xB74C3BD7)
	arguments {
		Hash "doorHash",
	}
	ns "OBJECT"
	returns	"float"
	doc [[!
<summary>
		possibly called:
		ADD_DOOR_EXPERIMENTAL_MATRIX
</summary>
	]]

native "0xC485E07E4F0B7958"
	hash "0xC485E07E4F0B7958"
	jhash (0xB4A9A558)
	arguments {
		Hash "doorHash",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",
	}
	ns "OBJECT"
	returns	"void"

native "0xD9B71952F78A2640"
	hash "0xD9B71952F78A2640"
	jhash (0xECE58AE0)
	arguments {
		Hash "doorHash",

		BOOL "p1",
	}
	ns "OBJECT"
	returns	"void"

native "0xA85A21582451E951"
	hash "0xA85A21582451E951"
	jhash (0xF736227C)
	arguments {
		Hash "doorHash",

		BOOL "p1",
	}
	ns "OBJECT"
	returns	"void"

native "_DOES_DOOR_EXIST"
	hash "0xC153C43EA202C8C1"
	jhash (0x5AFCD8A1)
	arguments {
		Hash "doorHash",
	}
	alias "0xC153C43EA202C8C1"
	ns "OBJECT"
	returns	"BOOL"
	doc [[!
<summary>
		Example:
		if (OBJECT::_DOES_DOOR_EXIST(doorHash))
		{
		    OBJECT::REMOVE_DOOR_FROM_SYSTEM(doorHash);
		}
</summary>
	]]

native "IS_DOOR_CLOSED"
	hash "0xC531EE8A1145A149"
	jhash (0x48659CD7)
	arguments {
		Hash "door",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0xC7F29CA00F46350E"
	hash "0xC7F29CA00F46350E"
	jhash (0x9BF33E41)
	arguments {
		BOOL "p0",
	}
	ns "OBJECT"
	returns	"void"

native "0x701FDA1E82076BA4"
	hash "0x701FDA1E82076BA4"
	jhash (0xF592AD10)
	ns "OBJECT"
	returns	"void"

native "0xDF97CDD4FC08FD34"
	hash "0xDF97CDD4FC08FD34"
	jhash (0x17FF9393)
	arguments {
		Any "p0",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x589F80B325CC82C5"
	hash "0x589F80B325CC82C5"
	jhash (0xE9AE494F)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		Any "p3",

		AnyPtr "p4",
	}
	ns "OBJECT"
	returns	"BOOL"

native "IS_GARAGE_EMPTY"
	hash "0x90E47239EA1980B8"
	jhash (0xA8B37DEA)
	arguments {
		Any "garage",

		BOOL "p1",

		int "p2",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x024A60DEB0EA69F0"
	hash "0x024A60DEB0EA69F0"
	jhash (0xC33ED360)
	arguments {
		Any "p0",

		Player "player",

		float "p2",

		int "p3",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x1761DC5D8471CBAA"
	hash "0x1761DC5D8471CBAA"
	jhash (0x41924877)
	arguments {
		Any "p0",

		Player "player",

		int "p2",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x85B6C850546FDDE2"
	hash "0x85B6C850546FDDE2"
	jhash (0x4BD59750)
	arguments {
		Any "p0",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",

		Any "p4",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x673ED815D6E323B7"
	hash "0x673ED815D6E323B7"
	jhash (0x7B44D659)
	arguments {
		Any "p0",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",

		Any "p4",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x372EF6699146A1E4"
	hash "0x372EF6699146A1E4"
	jhash (0x142C8F76)
	arguments {
		Any "p0",

		Entity "entity",

		float "p2",

		int "p3",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0xF0EED5A6BC7B237A"
	hash "0xF0EED5A6BC7B237A"
	jhash (0x95A9AB2B)
	arguments {
		Any "p0",

		Entity "entity",

		int "p2",
	}
	ns "OBJECT"
	returns	"BOOL"
	doc [[!
<summary>
		IS_OBJECT_???
</summary>
	]]

native "0x190428512B240692"
	hash "0x190428512B240692"
	jhash (0xA565E27E)
	arguments {
		Any "p0",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",

		BOOL "p4",
	}
	ns "OBJECT"
	returns	"void"

native "0xF2E1A7133DD356A6"
	hash "0xF2E1A7133DD356A6"
	jhash (0x43BB7E48)
	arguments {
		Hash "hash",

		BOOL "toggle",
	}
	ns "OBJECT"
	returns	"void"

native "0x66A49D021870FE88"
	hash "0x66A49D021870FE88"
	jhash (0x6158959E)
	ns "OBJECT"
	returns	"void"

native "DOES_OBJECT_OF_TYPE_EXIST_AT_COORDS"
	hash "0xBFA48E2FF417213F"
	jhash (0x23FF2BA4)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Hash "hash",

		BOOL "p5",
	}
	ns "OBJECT"
	returns	"BOOL"
	doc [[!
<summary>
		p5 is usually 0.
</summary>
	]]

native "IS_POINT_IN_ANGLED_AREA"
	hash "0x2A70BAE8883E4C81"
	jhash (0x73BCFFDC)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		float "p9",

		BOOL "p10",

		BOOL "p11",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x4D89D607CB3DD1D2"
	hash "0x4D89D607CB3DD1D2"
	jhash (0x19B17769)
	arguments {
		Object "object",

		BOOL "toggle",
	}
	ns "OBJECT"
	returns	"void"

native "SET_OBJECT_PHYSICS_PARAMS"
	hash "0xF6DF6E90DE7DF90F"
	jhash (0xE8D11C58)
	arguments {
		Object "object",

		float "weight",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "gravity",

		float "p7",

		float "p8",

		float "p9",

		float "p10",

		float "buoyancy",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		Adjust the physics parameters of a prop, or otherwise known as "object". This is useful for simulated gravity.

		Other parameters seem to be unknown.

		p2: seems to be weight and gravity related. Higher value makes the obj fall faster. Very sensitive?
		p3: seems similar to p2
		p4: makes obj fall slower the higher the value
		p5: similar to p4
</summary>
	]]

native "GET_OBJECT_FRAGMENT_DAMAGE_HEALTH"
	hash "0xB6FBFD079B8D0596"
	jhash (0xF0B330AD)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "OBJECT"
	returns	"float"

native "SET_ACTIVATE_OBJECT_PHYSICS_AS_SOON_AS_IT_IS_UNFROZEN"
	hash "0x406137F8EF90EAF5"
	jhash (0x3E263AE1)
	arguments {
		Object "object",

		BOOL "toggle",
	}
	ns "OBJECT"
	returns	"void"

native "IS_ANY_OBJECT_NEAR_POINT"
	hash "0x397DC58FF00298D1"
	jhash (0xE9E46941)
	arguments {
		float "x",

		float "y",

		float "z",

		float "range",

		BOOL "p4",
	}
	ns "OBJECT"
	returns	"BOOL"

native "IS_OBJECT_NEAR_POINT"
	hash "0x8C90FE4B381BA60A"
	jhash (0x50A62C43)
	arguments {
		Hash "objectHash",

		float "x",

		float "y",

		float "z",

		float "range",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0x4A39DB43E47CF3AA"
	hash "0x4A39DB43E47CF3AA"
	jhash (0xE3261B35)
	arguments {
		Any "p0",
	}
	ns "OBJECT"
	returns	"void"

native "0xE7E4C198B0185900"
	hash "0xE7E4C198B0185900"
	jhash (0x1E82C2AE)
	arguments {
		Object "p0",

		Any "p1",

		BOOL "p2",
	}
	ns "OBJECT"
	returns	"void"

native "0xF9C1681347C8BD15"
	hash "0xF9C1681347C8BD15"
	arguments {
		Object "object",
	}
	ns "OBJECT"
	returns	"void"

native "TRACK_OBJECT_VISIBILITY"
	hash "0xB252BC036B525623"
	jhash (0x46D06B9A)
	arguments {
		Any "p0",
	}
	ns "OBJECT"
	returns	"void"

native "IS_OBJECT_VISIBLE"
	hash "0x8B32ACE6326A7546"
	jhash (0xF4FD8AE4)
	arguments {
		Object "object",
	}
	ns "OBJECT"
	returns	"BOOL"

native "0xC6033D32241F6FB5"
	hash "0xC6033D32241F6FB5"
	jhash (0xF4A1A14A)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "OBJECT"
	returns	"void"

native "0xEB6F1A9B5510A5D2"
	hash "0xEB6F1A9B5510A5D2"
	jhash (0xAF016CC1)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "OBJECT"
	returns	"void"

native "0xBCE595371A5FBAAF"
	hash "0xBCE595371A5FBAAF"
	jhash (0x3A68AA46)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "OBJECT"
	returns	"void"

native "_GET_DES_OBJECT"
	hash "0xB48FCED898292E52"
	jhash (0xA286DE96)
	arguments {
		float "x",

		float "y",

		float "z",

		float "rotation",

		charPtr "name",
	}
	alias "0xB48FCED898292E52"
	ns "OBJECT"
	returns	"int"
	doc [[!
<summary>
		Gets a destructible object's handle

		Example:
		OBJECT::_B48FCED898292E52(-809.9619750976562, 170.919, 75.7406997680664, 3.0, "des_tvsmash");

		All found arguments for p4 starts with "des_" like "DES_FIB_Floor" and "des_shipsink".
</summary>
	]]

native "_SET_DES_OBJECT_STATE"
	hash "0x5C29F698D404C5E1"
	jhash (0x21F51560)
	arguments {
		int "handle",

		int "state",
	}
	alias "0x5C29F698D404C5E1"
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		Defines the state of a destructible object.
		Use the "0xB48FCED898292E52" native to find an object's handle with its name / coords

		State 2 == object just spawned
		State 4 == Beginning of the animation
		State 6 == Start animation
		State 9 == End of the animation
</summary>
	]]

native "_GET_DES_OBJECT_STATE"
	hash "0x899BA936634A322E"
	jhash (0xF1B8817A)
	arguments {
		int "handle",
	}
	alias "0x899BA936634A322E"
	ns "OBJECT"
	returns	"Any"
	doc [[!
<summary>
		Get a destrictible object's state.
		Substract 1 to get the real state.
		See _SET_DES_OBJECT_STATE to see the different states

		For example, if the object just spawned (state 2), the native will return 3.
</summary>
	]]

native "_DOES_DES_OBJECT_EXIST"
	hash "0x52AF537A0C5B8AAD"
	jhash (0xE08C834D)
	arguments {
		int "handle",
	}
	alias "0x52AF537A0C5B8AAD"
	ns "OBJECT"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if a destructible object with this handle exists, false otherwise.
</summary>
	]]

native "0x260EE4FDBDF4DB01"
	hash "0x260EE4FDBDF4DB01"
	jhash (0x020497DE)
	arguments {
		Any "p0",
	}
	ns "OBJECT"
	returns	"float"

native "CREATE_PICKUP"
	hash "0xFBA08C503DD5FA58"
	jhash (0x5E14DF68)
	arguments {
		Hash "pickupHash",

		float "posX",

		float "posY",

		float "posZ",

		int "p4",

		int "value",

		BOOL "p6",

		Hash "modelHash",
	}
	ns "OBJECT"
	returns	"Pickup"
	doc [[!
<summary>
		Pickup hashes: pastebin.com/8EuSv2r1
</summary>
	]]

native "CREATE_PICKUP_ROTATE"
	hash "0x891804727E0A98B7"
	jhash (0xF015BFE2)
	arguments {
		Hash "pickupHash",

		float "posX",

		float "posY",

		float "posZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		int "flag",

		int "amount",

		Any "p9",

		BOOL "p10",

		Hash "modelHash",
	}
	ns "OBJECT"
	returns	"Pickup"
	doc [[!
<summary>
		Pickup hashes: pastebin.com/8EuSv2r1

		flags:
		8 (1 &lt;&lt; 3): place on ground
		512 (1 &lt;&lt; 9): spin around
</summary>
	]]

native "CREATE_AMBIENT_PICKUP"
	hash "0x673966A0C0FD7171"
	jhash (0x17B99CE7)
	arguments {
		Hash "pickupHash",

		float "posX",

		float "posY",

		float "posZ",

		int "p4",

		int "value",

		Hash "modelHash",

		BOOL "returnHandle",

		BOOL "p8",
	}
	ns "OBJECT"
	returns	"Pickup"
	doc [[!
<summary>
		Used for doing money drop
		Pickup hashes: pastebin.com/8EuSv2r1
</summary>
	]]

native "CREATE_PORTABLE_PICKUP"
	hash "0x2EAF1FDB2FB55698"
	jhash (0x8C886BE5)
	arguments {
		Hash "pickupHash",

		float "x",

		float "y",

		float "z",

		BOOL "placeOnGround",

		Hash "modelHash",
	}
	ns "OBJECT"
	returns	"Pickup"
	doc [[!
<summary>
		Pickup hashes: pastebin.com/8EuSv2r1
</summary>
	]]

native "_CREATE_PORTABLE_PICKUP_2"
	hash "0x125494B98A21AAF7"
	jhash (0x56A02502)
	arguments {
		Hash "pickupHash",

		float "x",

		float "y",

		float "z",

		BOOL "placeOnGround",

		Hash "modelHash",
	}
	alias "0x125494B98A21AAF7"
	ns "OBJECT"
	returns	"Pickup"

native "ATTACH_PORTABLE_PICKUP_TO_PED"
	hash "0x8DC39368BDD57755"
	jhash (0x184F6AB3)
	arguments {
		Ped "ped",

		Any "p1",
	}
	ns "OBJECT"
	returns	"void"

native "DETACH_PORTABLE_PICKUP_FROM_PED"
	hash "0xCF463D1E9A0AECB1"
	jhash (0x1D094562)
	arguments {
		Ped "ped",
	}
	ns "OBJECT"
	returns	"void"

native "0x0BF3B3BD47D79C08"
	hash "0x0BF3B3BD47D79C08"
	jhash (0x7EFBA039)
	arguments {
		Hash "hash",

		int "p1",
	}
	ns "OBJECT"
	returns	"void"

native "0x78857FC65CADB909"
	hash "0x78857FC65CADB909"
	jhash (0xA3CDF152)
	arguments {
		BOOL "p0",
	}
	ns "OBJECT"
	returns	"void"

native "GET_SAFE_PICKUP_COORDS"
	hash "0x6E16BC2503FF1FF0"
	jhash (0x618B5F67)
	arguments {
		float "x",

		float "y",

		float "z",

		Any "p3",

		Any "p4",
	}
	ns "OBJECT"
	returns	"Vector3"

native "GET_PICKUP_COORDS"
	hash "0x225B8B35C88029B3"
	jhash (0xC2E1E2C5)
	arguments {
		Pickup "pickup",
	}
	ns "OBJECT"
	returns	"Vector3"

native "REMOVE_ALL_PICKUPS_OF_TYPE"
	hash "0x27F9D613092159CF"
	jhash (0x40062C53)
	arguments {
		Hash "pickupHash",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		Pickup hashes: pastebin.com/8EuSv2r1
</summary>
	]]

native "HAS_PICKUP_BEEN_COLLECTED"
	hash "0x80EC48E6679313F9"
	jhash (0x0BE5CCED)
	arguments {
		Pickup "pickup",
	}
	ns "OBJECT"
	returns	"BOOL"

native "REMOVE_PICKUP"
	hash "0x3288D8ACAECD2AB2"
	jhash (0x64A7A0E0)
	arguments {
		Pickup "pickup",
	}
	ns "OBJECT"
	returns	"void"

native "CREATE_MONEY_PICKUPS"
	hash "0x0589B5E791CE9B2B"
	jhash (0x36C9A5EA)
	arguments {
		float "x",

		float "y",

		float "z",

		int "value",

		int "amount",

		Hash "model",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		Spawns one or more money pickups.

		x: The X-component of the world position to spawn the money pickups at.
		y: The Y-component of the world position to spawn the money pickups at.
		z: The Z-component of the world position to spawn the money pickups at.
		value: The combined value of the pickups (in dollars).
		amount: The number of pickups to spawn.
		model: The model to use, or 0 for default money model.

		Example:
		CREATE_MONEY_PICKUPS(x, y, z, 1000, 3, 0x684a97ae);

		Spawns 3 spray cans that'll collectively give $1000 when picked up. (Three spray cans, each giving $334, $334, $332 = $1000).

		==============================================

		Max is 2000 in MP. So if you put the amount to 20, but the value to $400,000 eg. They will only be able to pickup 20 - $2,000 bags. So, $40,000
</summary>
	]]

native "DOES_PICKUP_EXIST"
	hash "0xAFC1CA75AD4074D1"
	jhash (0x9C6DA0B3)
	arguments {
		Pickup "pickup",
	}
	ns "OBJECT"
	returns	"BOOL"

native "DOES_PICKUP_OBJECT_EXIST"
	hash "0xD9EFB6DBF7DAAEA3"
	jhash (0xE0B32108)
	arguments {
		Object "pickupObject",
	}
	ns "OBJECT"
	returns	"BOOL"

native "GET_PICKUP_OBJECT"
	hash "0x5099BC55630B25AE"
	jhash (0x6052E62E)
	arguments {
		Pickup "pickup",
	}
	alias "0x5099BC55630B25AE"
	ns "OBJECT"
	returns	"Object"

native "0x0378C08504160D0D"
	hash "0x0378C08504160D0D"
	arguments {
		Any "p0",
	}
	ns "OBJECT"
	returns	"BOOL"

native "_IS_PICKUP_WITHIN_RADIUS"
	hash "0xF9C36251F6E48E33"
	jhash (0xF139681B)
	arguments {
		Hash "pickupHash",

		float "x",

		float "y",

		float "z",

		float "radius",
	}
	ns "OBJECT"
	returns	"BOOL"
	doc [[!
<summary>
		Pickup hashes: pastebin.com/8EuSv2r1
</summary>
	]]

native "SET_PICKUP_REGENERATION_TIME"
	hash "0x78015C9B4B3ECC9D"
	jhash (0xAB11267D)
	arguments {
		Pickup "pickup",

		int "duration",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		duration specifies the time until the next respawn, in ms. (known values: 600000).

		Usage Example:
		Pickup pickup = OBJECT::CREATE_PICKUP_ROTATE(...);
		OBJECT::SET_PICKUP_REGENERATION_TIME(pickup, 600000); // 10mins
</summary>
	]]

native "0x616093EC6B139DD9"
	hash "0x616093EC6B139DD9"
	jhash (0x7FADB4B9)
	arguments {
		Player "player",

		Hash "pickupHash",

		BOOL "p2",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		From the scripts:

		OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_portable_package}, 0);
		OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_portable_package}, 0);
		OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_portable_package}, 1);
		OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_portable_package}, 0);
		OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_armour_standard}, 0);
		OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_armour_standard}, 1);

		SET_PLAYER_P*
</summary>
	]]

native "0x88EAEC617CD26926"
	hash "0x88EAEC617CD26926"
	jhash (0x3A8F1BF7)
	arguments {
		Hash "p0",

		BOOL "p1",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		SET_LOCAL_PLAYER_*
</summary>
	]]

native "SET_TEAM_PICKUP_OBJECT"
	hash "0x53E0DF1A2A3CF0CA"
	jhash (0x77687DC5)
	arguments {
		Object "object",

		Any "p1",

		BOOL "p2",
	}
	ns "OBJECT"
	returns	"void"

native "0x92AEFB5F6E294023"
	hash "0x92AEFB5F6E294023"
	jhash (0xCBB5F9B6)
	arguments {
		Object "object",

		BOOL "p1",

		BOOL "p2",
	}
	ns "OBJECT"
	returns	"void"

native "0xA08FE5E49BDC39DD"
	hash "0xA08FE5E49BDC39DD"
	jhash (0x276A7807)
	arguments {
		Any "p0",

		float "p1",

		BOOL "p2",
	}
	ns "OBJECT"
	returns	"void"

native "0xDB41D07A45A6D4B7"
	hash "0xDB41D07A45A6D4B7"
	jhash (0x000E92DC)
	arguments {
		Any "p0",
	}
	ns "OBJECT"
	returns	"Any"

native "0x318516E02DE3ECE2"
	hash "0x318516E02DE3ECE2"
	jhash (0x9879AC51)
	arguments {
		float "p0",
	}
	ns "OBJECT"
	returns	"void"

native "0x31F924B53EADDF65"
	hash "0x31F924B53EADDF65"
	jhash (0xDB18FA01)
	arguments {
		BOOL "p0",
	}
	ns "OBJECT"
	returns	"void"

native "0xF92099527DB8E2A7"
	hash "0xF92099527DB8E2A7"
	jhash (0xA7E936FD)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "OBJECT"
	returns	"void"

native "0xA2C1F5E92AFE49ED"
	hash "0xA2C1F5E92AFE49ED"
	jhash (0xB241806C)
	ns "OBJECT"
	returns	"void"

native "0x762DB2D380B48D04"
	hash "0x762DB2D380B48D04"
	jhash (0xD1BAAFB7)
	arguments {
		Any "p0",
	}
	ns "OBJECT"
	returns	"void"

native "_HIGHLIGHT_PLACEMENT_COORDS"
	hash "0x3430676B11CDF21D"
	jhash (0x63B02FAD)
	arguments {
		float "x",

		float "y",

		float "z",

		int "colorIndex",
	}
	alias "0x3430676B11CDF21D"
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		draws circular marker at pos
		-1 = none
		0 = red
		1 = green
		2 = blue
		3 = green larger
		4 = nothing
		5 = green small
</summary>
	]]

native "0xB2D0BDE54F0E8E5A"
	hash "0xB2D0BDE54F0E8E5A"
	jhash (0x132B6D92)
	arguments {
		Object "object",

		BOOL "toggle",
	}
	ns "OBJECT"
	returns	"void"

native "_GET_WEAPON_HASH_FROM_PICKUP"
	hash "0x08F96CA6C551AD51"
	jhash (0xEDD01937)
	arguments {
		Pickup "pickupHash",
	}
	alias "0x08F96CA6C551AD51"
	ns "OBJECT"
	returns	"Hash"
	doc [[!
<summary>
		returns the weapon hash of pickup
</summary>
	]]

native "0x11D1E53A726891FE"
	hash "0x11D1E53A726891FE"
	arguments {
		Object "object",
	}
	ns "OBJECT"
	returns	"BOOL"
	doc [[!
<summary>
		console hash: 0x883DAB2D
</summary>
	]]

native "_SET_OBJECT_TEXTURE_VARIANT"
	hash "0x971DA0055324D033"
	arguments {
		Object "object",

		int "paintIndex",
	}
	alias "0x971DA0055324D033"
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		enum ObjectPaintVariants
		{
			Pacific = 0,
			Azure = 1,
			Nautical = 2,
			Continental = 3,
			Battleship = 4,
			Intrepid = 5,
			Uniform = 6,
			Classico = 7,
			Mediterranean = 8,
			Command = 9,
			Mariner = 10,
			Ruby = 11,
			Vintage = 12,
			Pristine = 13,
			Merchant = 14,
			Voyager = 15
		};
</summary>
	]]

native "_GET_PICKUP_HASH"
	hash "0x5EAAD83F8CFB4575"
	jhash (0x6AE36192)
	arguments {
		Pickup "pickupHash",
	}
	alias "0x5EAAD83F8CFB4575"
	ns "OBJECT"
	returns	"Hash"
	doc [[!
<summary>
		returns pickup hash.
</summary>
	]]

native "SET_FORCE_OBJECT_THIS_FRAME"
	hash "0xF538081986E49E9D"
	jhash (0x3DA41C1A)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "OBJECT"
	returns	"void"

native "_MARK_OBJECT_FOR_DELETION"
	hash "0xADBE4809F19F927A"
	jhash (0x2048A7DD)
	arguments {
		Object "object",
	}
	ns "OBJECT"
	returns	"void"
	doc [[!
<summary>
		is this like setting is as no longer needed?
</summary>
	]]

native "TASK_PAUSE"
	hash "0xE73A266DB0CA9042"
	jhash (0x17A64668)
	arguments {
		Ped "ped",

		int "ms",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Stand still (?)
</summary>
	]]

native "TASK_STAND_STILL"
	hash "0x919BE13EED931959"
	jhash (0x6F80965D)
	arguments {
		Ped "ped",

		int "time",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes the specified ped stand still for (time) milliseconds.
</summary>
	]]

native "TASK_JUMP"
	hash "0x0AE4086104E067B1"
	jhash (0x0356E3CE)
	arguments {
		Ped "ped",

		BOOL "unused",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Definition is wrong. This has 4 parameters (Not sure when they were added. v350 has 2, v678 has 4).

		v350: Ped ped, bool unused
		v678: Ped ped, bool unused, bool flag1, bool flag2

		flag1 = super jump, flag2 = do nothing if flag1 is false and doubles super jump height if flag1 is true.
</summary>
	]]

native "TASK_COWER"
	hash "0x3EB1FE9E8E908E15"
	jhash (0x9CF1C19B)
	arguments {
		Ped "ped",

		int "duration",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_HANDS_UP"
	hash "0xF2EAB31979A7F910"
	jhash (0x8DCC19C5)
	arguments {
		Ped "ped",

		int "duration",

		Ped "facingPed",

		int "p3",

		BOOL "p4",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		In the scripts, p3 was always -1.

		p3 seems to be duration or timeout of turn animation.
		Also facingPed can be 0 or -1 so ped will just raise hands up.
</summary>
	]]

native "UPDATE_TASK_HANDS_UP_DURATION"
	hash "0xA98FCAFD7893C834"
	jhash (0x3AA39BE9)
	arguments {
		Ped "ped",

		int "duration",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_OPEN_VEHICLE_DOOR"
	hash "0x965791A9A488A062"
	jhash (0x8EE06BF4)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		int "timeOut",

		int "doorIndex",

		float "speed",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_ENTER_VEHICLE"
	hash "0xC20E50AA46D09CA8"
	jhash (0xB8689B4E)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		int "timeout",

		int "seat",

		float "speed",

		int "flag",

		Any "p6",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		speed 1.0 = walk, 2.0 = run
		p5 1 = normal, 3 = teleport to vehicle, 16 = teleport directly into vehicle
		p6 is always 0

		Usage of seat 
		-1 = driver
		0 = passenger
		1 = left back seat
		2 = right back seat
		3 = outside left
		4 = outside right
</summary>
	]]

native "TASK_LEAVE_VEHICLE"
	hash "0xD3DBCE61A490BE02"
	jhash (0x7B1141C6)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		int "flags",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Flags from decompiled scripts:
		0 = normal exit and closes door.
		1 = normal exit and closes door.
		16 = teleports outside, door kept closed.
		64 = normal exit and closes door, maybe a bit slower animation than 0.
		256 = normal exit but does not close the door.
		4160 = ped is throwing himself out, even when the vehicle is still.
		262144 = ped moves to passenger seat first, then exits normally

		Others to be tried out: 320, 512, 131072.
</summary>
	]]

native "_TASK_GET_OFF_BOAT"
	hash "0x9C00E77AF14B2DFF"
	arguments {
		Ped "ped",

		Vehicle "boat",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Jenkins of this native is 0x4293601F. This is the actual name.
</summary>
	]]

native "TASK_SKY_DIVE"
	hash "0x601736CFE536B0A0"
	jhash (0xD3874AFA)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_PARACHUTE"
	hash "0xD2F1C53C97EE81AB"
	jhash (0xEC3060A2)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		This function has a third parameter as well (bool).
		Second parameter is unused.

		seconds parameter was for jetpack in the early stages of gta and the hard coded code is now removed
</summary>
	]]

native "TASK_PARACHUTE_TO_TARGET"
	hash "0xB33E291AFA6BD03A"
	jhash (0xE0104D6C)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		makes ped parachute to coords x y z. Works well with PATHFIND::GET_SAFE_COORD_FOR_PED
</summary>
	]]

native "SET_PARACHUTE_TASK_TARGET"
	hash "0xC313379AF0FCEDA7"
	jhash (0x6ED3AD81)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"

native "SET_PARACHUTE_TASK_THRUST"
	hash "0x0729BAC1B8C64317"
	jhash (0xD07C8AAA)
	arguments {
		Ped "ped",

		float "thrust",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_RAPPEL_FROM_HELI"
	hash "0x09693B0312F91649"
	jhash (0x2C7ADB93)
	arguments {
		Ped "ped",

		int "unused",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Only appears twice in the scripts.

		AI::TASK_RAPPEL_FROM_HELI(PLAYER::PLAYER_PED_ID(), 0x41200000);
		AI::TASK_RAPPEL_FROM_HELI(a_0, 0x41200000);

		Fixed, definitely not a float and since it's such a big number obviously not a bool. All though note when I thought it was a bool and set it to 1 it seemed to work that same as int 0x41200000.

		0x41200000 = 10.0 as float.

		Not all helicopters support rappelling.
</summary>
	]]

native "TASK_VEHICLE_DRIVE_TO_COORD"
	hash "0xE2A2AA2F659D77A7"
	jhash (0xE4AC0387)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		float "x",

		float "y",

		float "z",

		float "speed",

		Any "p6",

		Hash "vehicleModel",

		int "drivingMode",

		float "stopRange",

		float "p10",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		info about driving modes: HTTP://gtaforums.com/topic/822314-guide-driving-styles/
		---------------------------------------------------------------
		Passing P6 value as floating value didn't throw any errors, though unsure what is it exactly, looks like radius or something.

		P10 though, it is mentioned as float, however, I used bool and set it to true, that too worked.
		Here the e.g. code I used
		Function.Call(Hash.TASK_VEHICLE_DRIVE_TO_COORD, Ped, Vehicle, Cor X, Cor Y, Cor Z, 30f, 1f, Vehicle.GetHashCode(), 16777216, 1f, true);
</summary>
	]]

native "TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE"
	hash "0x158BB33F920D360C"
	jhash (0x1490182A)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		float "x",

		float "y",

		float "z",

		float "speed",

		int "driveMode",

		float "stopRange",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_VEHICLE_DRIVE_WANDER"
	hash "0x480142959D337D00"
	jhash (0x36EC0EB0)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		float "speed",

		int "drivingStyle",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_FOLLOW_TO_OFFSET_OF_ENTITY"
	hash "0x304AE42E357B8C7E"
	jhash (0x2DF5A6AC)
	arguments {
		Ped "ped",

		Entity "entity",

		float "offsetX",

		float "offsetY",

		float "offsetZ",

		float "movementSpeed",

		int "timeout",

		float "stoppingRange",

		BOOL "persistFollowing",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		p6 always -1
		p7 always 10.0
		p8 always 1
</summary>
	]]

native "TASK_GO_STRAIGHT_TO_COORD"
	hash "0xD76B57B44F1E6F8B"
	jhash (0x80A9E7A7)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "speed",

		int "timeout",

		float "targetHeading",

		float "distanceToSlide",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_GO_STRAIGHT_TO_COORD_RELATIVE_TO_ENTITY"
	hash "0x61E360B7E040D12E"
	jhash (0xD26CAC68)
	arguments {
		Entity "entity1",

		Entity "entity2",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		Any "p6",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_ACHIEVE_HEADING"
	hash "0x93B93A37987F1F3D"
	jhash (0x0A0E9B42)
	arguments {
		Ped "ped",

		float "heading",

		int "timeout",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes the specified ped achieve the specified heading.

		pedHandle: The handle of the ped to assign the task to.
		heading: The desired heading.
		timeout: The time, in milliseconds, to allow the task to complete. If the task times out, it is cancelled, and the ped will stay at the heading it managed to reach in the time.
</summary>
	]]

native "TASK_FLUSH_ROUTE"
	hash "0x841142A1376E9006"
	jhash (0x34219154)
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		MulleKD19: Clears the current point route. Call this before TASK_EXTEND_ROUTE and TASK_FOLLOW_POINT_ROUTE.
</summary>
	]]

native "TASK_EXTEND_ROUTE"
	hash "0x1E7889778264843A"
	jhash (0x43271F69)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		MulleKD19: Adds a new point to the current point route. Call TASK_FLUSH_ROUTE before the first call to this. Call TASK_FOLLOW_POINT_ROUTE to make the Ped go the route.

		A maximum of 8 points can be added.
</summary>
	]]

native "TASK_FOLLOW_POINT_ROUTE"
	hash "0x595583281858626E"
	jhash (0xB837C816)
	arguments {
		Ped "ped",

		float "speed",

		int "unknown",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		MulleKD19: Makes the ped go on the created point route.

		ped: The ped to give the task to.
		speed: The speed to move at in m/s.
		int: Unknown. Can be 0, 1, 2 or 3.

		Example:
		TASK_FLUSH_ROUTE();
		TASK_EXTEND_ROUTE(0f, 0f, 70f);
		TASK_EXTEND_ROUTE(10f, 0f, 70f);
		TASK_EXTEND_ROUTE(10f, 10f, 70f);
		TASK_FOLLOW_POINT_ROUTE(GET_PLAYER_PED(), 1f, 0);
</summary>
	]]

native "TASK_GO_TO_ENTITY"
	hash "0x6A071245EB0D1882"
	jhash (0x374827C2)
	arguments {
		Entity "entity",

		Entity "target",

		int "duration",

		float "distance",

		float "speed",

		float "p5",

		int "p6",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		The entity will move towards the target until time is over (duration) or get in target's range (distance). p5 and p6 are unknown, but you could leave p5 = 1073741824 or 100 or even 0 (didn't see any difference but on the decompiled scripts, they use 1073741824 mostly) and p6 = 0

		Note: I've only tested it on entity -&gt; ped and target -&gt; vehicle. It could work differently on other entities, didn't try it yet.

		Example: AI::TASK_GO_TO_ENTITY(pedHandle, vehicleHandle, 5000, 4.0, 100, 1073741824, 0)

		Ped will run towards the vehicle for 5 seconds and stop when time is over or when he gets 4 meters(?) around the vehicle (with duration = -1, the task duration will be ignored).
</summary>
	]]

native "TASK_SMART_FLEE_COORD"
	hash "0x94587F17E9C365D5"
	jhash (0xB2E686FC)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "distance",

		int "time",

		BOOL "p6",

		BOOL "p7",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes the specified ped flee the specified distance from the specified position.
</summary>
	]]

native "TASK_SMART_FLEE_PED"
	hash "0x22B0D0E37CCB840D"
	jhash (0xE52EB560)
	arguments {
		Ped "ped",

		Ped "fleeTarget",

		float "distance",

		Any "fleeTime",

		BOOL "p4",

		BOOL "p5",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes a ped run away from another ped (fleeTarget).

		distance = ped will flee this distance.
		fleeTime = ped will flee for this amount of time, set to "-1" to flee forever
</summary>
	]]

native "TASK_REACT_AND_FLEE_PED"
	hash "0x72C896464915D1B1"
	jhash (0x8A632BD8)
	arguments {
		Ped "ped",

		Ped "fleeTarget",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_SHOCKING_EVENT_REACT"
	hash "0x452419CBD838065B"
	jhash (0x9BD00ACF)
	arguments {
		Ped "ped",

		int "eventHandle",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_WANDER_IN_AREA"
	hash "0xE054346CA3A0F315"
	jhash (0xC6981FB9)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "radius",

		float "minimalLength",

		float "timeBetweenWalks",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_WANDER_STANDARD"
	hash "0xBB9CE077274F6A1B"
	jhash (0xAF59151A)
	arguments {
		Ped "ped",

		float "p1",

		int "p2",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes ped walk around the area.

		set p1 to 10.0f and p2 to 10 if you want the ped to walk anywhere without a duration.
</summary>
	]]

native "TASK_VEHICLE_PARK"
	hash "0x0F3E34E968EA374E"
	jhash (0x5C85FF90)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		float "x",

		float "y",

		float "z",

		float "heading",

		int "mode",

		float "radius",

		BOOL "keepEngineOn",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Modes:
		0 - ignore heading
		1 - park forward
		2 - park backwards

		Depending on the angle of approach, the vehicle can park at the specified heading or at its exact opposite (-180) angle.

		Radius seems to define how close the vehicle has to be -after parking- to the position for this task considered completed. If the value is too small, the vehicle will try to park again until it's exactly where it should be. 20.0 Works well but lower values don't, like the radius is measured in centimeters or something.
</summary>
	]]

native "TASK_STEALTH_KILL"
	hash "0xAA5DC05579D60BD9"
	jhash (0x0D64C2FA)
	arguments {
		Ped "killer",

		Ped "target",

		Hash "actionType",

		float "p3",

		Any "p4",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Stealth kill action name hashes:

		stealth kills can be found here: Grand Theft Auto V\common.rpf\data\action\stealth_kills.meta
		...
		{
		    "ACT_stealth_kill_a",
		    "ACT_stealth_kill_weapon",
		    "ACT_stealth_kill_b",
		    "ACT_stealth_kill_c",
		    "ACT_stealth_kill_d",
		    "ACT_stealth_kill_a_gardener"
		}

		Only known script using this native: fbi4_prep2
		EXAMPLE:
		ai::task_stealth_kill(iParam1, Local_252, gameplay::get_hash_key("AR_stealth_kill_a"), 1f, 0);				ai::task_stealth_kill(iParam1, Local_252, gameplay::get_hash_key("AR_stealth_kill_knife"), 1f, 0);

		Also it may be important to note, that each time this task is called, it's followed by AI::CLEAR_PED_TASKS on the target
</summary>
	]]

native "TASK_PLANT_BOMB"
	hash "0x965FEC691D55E9BF"
	jhash (0x33457535)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "heading",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_FOLLOW_NAV_MESH_TO_COORD"
	hash "0x15D3A79D4E44B913"
	jhash (0xFE4A10D9)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "speed",

		int "timeout",

		float "stoppingRange",

		BOOL "persistFollowing",

		float "unk",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		If no timeout, set timeout to -1.
</summary>
	]]

native "TASK_FOLLOW_NAV_MESH_TO_COORD_ADVANCED"
	hash "0x17F58B88D085DBAC"
	jhash (0x6BF6E296)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "speed",

		int "timeout",

		float "unkFloat",

		int "unkInt",

		float "unkX",

		float "unkY",

		float "unkZ",

		float "unk_40000f",
	}
	ns "BRAIN"
	returns	"void"

native "SET_PED_PATH_CAN_USE_CLIMBOVERS"
	hash "0x8E06A6FE76C9EFF4"
	jhash (0xB7B7D442)
	arguments {
		Ped "ped",

		BOOL "Toggle",
	}
	ns "BRAIN"
	returns	"Any"

native "SET_PED_PATH_CAN_USE_LADDERS"
	hash "0x77A5B103C87F476E"
	jhash (0x53A879EE)
	arguments {
		Ped "ped",

		BOOL "Toggle",
	}
	ns "BRAIN"
	returns	"Any"

native "SET_PED_PATH_CAN_DROP_FROM_HEIGHT"
	hash "0xE361C5C71C431A4F"
	jhash (0x394B7AC9)
	arguments {
		Ped "ped",

		BOOL "Toggle",
	}
	ns "BRAIN"
	returns	"void"

native "0x88E32DB8C1A4AA4B"
	hash "0x88E32DB8C1A4AA4B"
	jhash (0x55E06443)
	arguments {
		Ped "ped",

		float "p1",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		SET_PED_PATH_*

		Could be the move speed on the path. Needs testing.

		Default is 1.0 and maximum is 10.0
</summary>
	]]

native "SET_PED_PATHS_WIDTH_PLANT"
	hash "0xF35425A4204367EC"
	jhash (0x9C606EE3)
	arguments {
		Ped "ped",

		BOOL "mayEnterWater",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Hash collision!!! Actual name: SET_PED_PATH_MAY_ENTER_WATER
</summary>
	]]

native "SET_PED_PATH_PREFER_TO_AVOID_WATER"
	hash "0x38FE1EC73743793C"
	jhash (0x0EA39A29)
	arguments {
		Ped "ped",

		BOOL "avoidWater",
	}
	ns "BRAIN"
	returns	"void"

native "SET_PED_PATH_AVOID_FIRE"
	hash "0x4455517B28441E60"
	jhash (0xDCC5B934)
	arguments {
		Ped "ped",

		BOOL "avoidFire",
	}
	ns "BRAIN"
	returns	"void"

native "SET_GLOBAL_MIN_BIRD_FLIGHT_HEIGHT"
	hash "0x6C6B148586F934F7"
	jhash (0x2AFB14B8)
	arguments {
		float "height",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Needs to be looped! And yes, it does work and is not a hash collision.
		Birds will try to reach the given height.
</summary>
	]]

native "GET_NAVMESH_ROUTE_DISTANCE_REMAINING"
	hash "0xC6F5C0BCDC74D62D"
	jhash (0xD9281778)
	arguments {
		Ped "ped",

		floatPtr "distRemaining",

		BOOLPtr "isPathReady",
	}
	ns "BRAIN"
	returns	"int"
	doc [[!
<summary>
		Looks like the last parameter returns true if the path has been calculated, while the first returns the remaining distance to the end of the path.


		Return value of native is the same as GET_NAVMESH_ROUTE_RESULT
		Looks like the native returns an int for the path's state:

		1 - ???
		2 
		3 - Finished Generating
</summary>
	]]

native "GET_NAVMESH_ROUTE_RESULT"
	hash "0x632E831F382A0FA8"
	jhash (0x96491602)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"int"
	doc [[!
<summary>
		See GET_NAVMESH_ROUTE_DISTANCE_REMAINING for more details.
</summary>
	]]

native "0x3E38E28A1D80DDF6"
	hash "0x3E38E28A1D80DDF6"
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "TASK_GO_TO_COORD_ANY_MEANS"
	hash "0x5BC448CB78FA3E88"
	jhash (0xF91DF93B)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "speed",

		Any "p5",

		BOOL "p6",

		int "walkingStyle",

		float "p8",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		example from fm_mission_controller

		AI::TASK_GO_TO_COORD_ANY_MEANS(l_649, sub_f7e86(-1, 0), 1.0, 0, 0, 786603, 0xbf800000);

</summary>
	]]

native "TASK_GO_TO_COORD_ANY_MEANS_EXTRA_PARAMS"
	hash "0x1DD45F9ECFDB1BC9"
	jhash (0x094B75EF)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "speed",

		Any "p5",

		BOOL "p6",

		int "walkingStyle",

		float "p8",

		Any "p9",

		Any "p10",

		Any "p11",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_GO_TO_COORD_ANY_MEANS_EXTRA_PARAMS_WITH_CRUISE_SPEED"
	hash "0xB8ECD61F531A7B02"
	jhash (0x86DC03F9)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "speed",

		Any "p5",

		BOOL "p6",

		int "walkingStyle",

		float "p8",

		Any "p9",

		Any "p10",

		Any "p11",

		Any "p12",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_PLAY_ANIM"
	hash "0xEA47FE3719165B94"
	jhash (0x5AB552C6)
	arguments {
		Ped "ped",

		charPtr "animDictionary",

		charPtr "animationName",

		float "speed",

		float "speedMultiplier",

		int "duration",

		int "flag",

		float "playbackRate",

		BOOL "lockX",

		BOOL "lockY",

		BOOL "lockZ",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim

		float speed &gt; normal speed is 8.0f
		----------------------

		float speedMultiplier &gt; multiply the playback speed
		----------------------

		int duration: time in millisecond
		----------------------
		-1 _ _ _ _ _ _ _&gt; Default (see flag)
		0 _ _ _ _ _ _ _ &gt; Not play at all
		Small value _ _ &gt; Slow down animation speed
		Other _ _ _ _ _ &gt; freeze player control until specific time (ms) has 
		_ _ _ _ _ _ _ _ _ passed. (No effect if flag is set to be 
		_ _ _ _ _ _ _ _ _ controllable.)

		int flag:
		----------------------
		enum eAnimationFlags
		{
		 ANIM_FLAG_NORMAL = 0,
		   ANIM_FLAG_REPEAT = 1,
		   ANIM_FLAG_STOP_LAST_FRAME = 2,
		   ANIM_FLAG_UPPERBODY = 16,
		   ANIM_FLAG_ENABLE_PLAYER_CONTROL = 32,
		   ANIM_FLAG_CANCELABLE = 120,
		};
		Odd number : loop infinitely
		Even number : Freeze at last frame
		Multiple of 4: Freeze at last frame but controllable

		01 to 15 &gt; Full body
		10 to 31 &gt; Upper body
		32 to 47 &gt; Full body &gt; Controllable
		48 to 63 &gt; Upper body &gt; Controllable
		...
		001 to 255 &gt; Normal
		256 to 511 &gt; Garbled
		...

		playbackRate:

		values are between 0.0 and 1.0


		lockX:  

		0 in most cases 1 for rcmepsilonism8 and rcmpaparazzo_3
		&gt; 1 for mini@sprunk


		lockY:

		0 in most cases 
		1 for missfam5_yoga, missfra1mcs_2_crew_react


		lockZ: 

		    0 for single player 
		    Can be 1 but only for MP 
</summary>
	]]

native "TASK_PLAY_ANIM_ADVANCED"
	hash "0x83CDB10EA29B370B"
	jhash (0x3DDEB0E6)
	arguments {
		Ped "ped",

		charPtr "animDict",

		charPtr "animName",

		float "posX",

		float "posY",

		float "posZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "speed",

		float "speedMultiplier",

		int "duration",

		Any "flag",

		float "animTime",

		Any "p14",

		Any "p15",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		It's similar to the one above, except the first 6 floats let you specify the initial position and rotation of the task. (Ped gets teleported to the position). animTime is a float from 0.0 -&gt; 1.0, lets you start an animation from given point. The rest as in AI::TASK_PLAY_ANIM. 

		Rotation information : rotX and rotY don't seem to have any effect, only rotZ works.

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "STOP_ANIM_TASK"
	hash "0x97FF36A1D40EA00A"
	jhash (0x2B520A57)
	arguments {
		Ped "ped",

		charPtr "animDictionary",

		charPtr "animationName",

		float "p3",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>


		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "TASK_SCRIPTED_ANIMATION"
	hash "0x126EF75F1E17ABE5"
	jhash (0xFC2DCF47)
	arguments {
		Ped "ped",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",

		float "p4",

		float "p5",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		From fm_mission_controller.c:
		reserve_network_mission_objects(get_num_reserved_mission_objects(0) + 1);
					vVar28 = {0.094f, 0.02f, -0.005f};
					vVar29 = {-92.24f, 63.64f, 150.24f};
					func_253(&amp;uVar30, joaat("prop_ld_case_01"), Global_1592429.imm_34757[iParam1 &lt;268&gt;], 1, 1, 0, 1);
					set_entity_lod_dist(net_to_ent(uVar30), 500);
					attach_entity_to_entity(net_to_ent(uVar30), iParam0, get_ped_bone_index(iParam0, 28422), vVar28, vVar29, 1, 0, 0, 0, 2, 1);
					Var31.imm_4 = 1065353216;
					Var31.imm_5 = 1065353216;
					Var31.imm_9 = 1065353216;
					Var31.imm_10 = 1065353216;
					Var31.imm_14 = 1065353216;
					Var31.imm_15 = 1065353216;
					Var31.imm_17 = 1040187392;
					Var31.imm_18 = 1040187392;
					Var31.imm_19 = -1;
					Var32.imm_4 = 1065353216;
					Var32.imm_5 = 1065353216;
					Var32.imm_9 = 1065353216;
					Var32.imm_10 = 1065353216;
					Var32.imm_14 = 1065353216;
					Var32.imm_15 = 1065353216;
					Var32.imm_17 = 1040187392;
					Var32.imm_18 = 1040187392;
					Var32.imm_19 = -1;
					Var31 = 1;
					Var31.imm_1 = "weapons@misc@jerrycan@mp_male";
					Var31.imm_2 = "idle";
					Var31.imm_20 = 1048633;
					Var31.imm_4 = 0.5f;
					Var31.imm_16 = get_hash_key("BONEMASK_ARMONLY_R");
					task_scripted_animation(iParam0, &amp;Var31, &amp;Var32, &amp;Var32, 0f, 0.25f);
					set_model_as_no_longer_needed(joaat("prop_ld_case_01"));
					remove_anim_dict("anim@heists@biolab@");
</summary>
	]]

native "PLAY_ENTITY_SCRIPTED_ANIM"
	hash "0x77A1EEC547E7FCF1"
	jhash (0x02F72AE5)
	arguments {
		Any "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",

		float "p4",

		float "p5",
	}
	ns "BRAIN"
	returns	"void"

native "STOP_ANIM_PLAYBACK"
	hash "0xEE08C992D238C5D1"
	jhash (0xE5F16398)
	arguments {
		Ped "ped",

		int "p1",

		BOOL "p2",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		From re_drunkdriver:
		• AI::STOP_ANIM_PLAYBACK(l_5B[0/*1*/], 0, 0);

		Looks like p1 may be a flag, still need to do some research, though.
</summary>
	]]

native "SET_ANIM_WEIGHT"
	hash "0x207F1A47C0342F48"
	jhash (0x17229D98)
	arguments {
		Any "p0",

		float "p1",

		Any "p2",

		Any "p3",

		BOOL "p4",
	}
	ns "BRAIN"
	returns	"void"

native "SET_ANIM_RATE"
	hash "0x032D49C5E359C847"
	jhash (0x6DB46584)
	arguments {
		Any "p0",

		float "p1",

		Any "p2",

		BOOL "p3",
	}
	ns "BRAIN"
	returns	"void"

native "SET_ANIM_LOOPED"
	hash "0x70033C3CC29A1FF4"
	jhash (0x095D61A4)
	arguments {
		Any "p0",

		BOOL "p1",

		Any "p2",

		BOOL "p3",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_PLAY_PHONE_GESTURE_ANIMATION"
	hash "0x8FBB6758B3B3E9EC"
	jhash (0x1582162C)
	arguments {
		Ped "ped",

		charPtr "animDict",

		charPtr "animation",

		charPtr "boneMaskType",

		float "p4",

		float "p5",

		BOOL "p6",

		BOOL "p7",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Example from the scripts:
		AI::TASK_PLAY_PHONE_GESTURE_ANIMATION(PLAYER::PLAYER_PED_ID(), v_3, v_2, v_4, 0.25, 0.25, 0, 0);

		=========================================================
		^^ No offense, but Idk how that would really help anyone.

		As for the animDict &amp; animation, they're both store in a global in all 5 scripts. So if anyone would be so kind as to read that global and comment what strings they use. Thanks.

		Known boneMaskTypes'
		"BONEMASK_HEADONLY"
		"BONEMASK_HEAD_NECK_AND_ARMS"
		"BONEMASK_HEAD_NECK_AND_L_ARM"
		"BONEMASK_HEAD_NECK_AND_R_ARM"

		p4 known args - 0.0f, 0.5f, 0.25f
		p5 known args - 0.0f, 0.25f
		p6 known args - 1 if a global if check is passed.
		p7 known args - 1 if a global if check is passed.

		The values found above, I found within the 5 scripts this is ever called in. (fmmc_launcher, fm_deathmatch_controller, fm_impromptu_dm_controller, fm_mission_controller, and freemode).
		=========================================================
</summary>
	]]

native "_TASK_STOP_PHONE_GESTURE_ANIMATION"
	hash "0x3FA00D4F4641BFAE"
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		TODO: add hash from x360
		^^^
		I got you, x360 Hash: 0x5A32D4B4. 
		Note: Whoever named this I just compared it and the hash matches, it was the correct name thanks. 

		Note: Alexander Blade, needs to fix this site or his code one, as when we do find the right name the server throws an error saying the name is already in use. AB is a legend coder, so I'm sure this is a simple fix for him.
</summary>
	]]

native "IS_PLAYING_PHONE_GESTURE_ANIM"
	hash "0xB8EBB1E9D3588C10"
	jhash (0x500B6805)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "GET_PHONE_GESTURE_ANIM_CURRENT_TIME"
	hash "0x47619ABE8B268C60"
	jhash (0x7B72AFD1)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"float"

native "GET_PHONE_GESTURE_ANIM_TOTAL_TIME"
	hash "0x1EE0F68A7C25DEC6"
	jhash (0xEF8C3959)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"float"

native "TASK_VEHICLE_PLAY_ANIM"
	hash "0x69F5C3BD0F3EBD89"
	jhash (0x2B28F598)
	arguments {
		Vehicle "vehicle",

		charPtr "animation_set",

		charPtr "animation_name",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Most probably plays a specific animation on vehicle. For example getting chop out of van etc...

		Here's how its used - 

		AI::TASK_VEHICLE_PLAY_ANIM(l_325, "rcmnigel1b", "idle_speedo");

		AI::TASK_VEHICLE_PLAY_ANIM(l_556[0/*1*/], "missfra0_chop_drhome", "InCar_GetOutofBack_Speedo");

		FYI : Speedo is the name of van in which chop was put in the mission.


		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "TASK_LOOK_AT_COORD"
	hash "0x6FA46612594F7973"
	jhash (0x7B784DD8)
	arguments {
		Entity "entity",

		float "x",

		float "y",

		float "z",

		float "duration",

		Any "p5",

		Any "p6",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		p5 = 0, p6 = 2
</summary>
	]]

native "TASK_LOOK_AT_ENTITY"
	hash "0x69F4BE8C8CC4796C"
	jhash (0x991D6619)
	arguments {
		Ped "ped",

		Entity "lookAt",

		int "duration",

		int "unknown1",

		int "unknown2",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		param3: duration in ms, use -1 to look forever
		param4: using 2048 is fine
		param5: using 3 is fine
</summary>
	]]

native "TASK_CLEAR_LOOK_AT"
	hash "0x0F804F1DB19B9689"
	jhash (0x60EB4054)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Not clear what it actually does, but here's how script uses it - 

		if (OBJECT::HAS_PICKUP_BEEN_COLLECTED(...) 
		{
			if(ENTITY::DOES_ENTITY_EXIST(PLAYER::PLAYER_PED_ID()))
			{
				AI::TASK_CLEAR_LOOK_AT(PLAYER::PLAYER_PED_ID());
			}
			...
		}

		Another one where it doesn't "look" at current player - 

		AI::TASK_PLAY_ANIM(l_3ED, "missheist_agency2aig_2", "look_at_phone_a", 1000.0, -2.0, -1, 48, v_2, 0, 0, 0);
		PED::_2208438012482A1A(l_3ED, 0, 0);
		AI::TASK_CLEAR_LOOK_AT(l_3ED);
</summary>
	]]

native "OPEN_SEQUENCE_TASK"
	hash "0xE8854A4326B9E12B"
	jhash (0xABA6923E)
	arguments {
		ObjectPtr "taskSequence",
	}
	ns "BRAIN"
	returns	"Any"

native "CLOSE_SEQUENCE_TASK"
	hash "0x39E72BC99E6360CB"
	jhash (0x1A7CEBD0)
	arguments {
		Object "taskSequence",
	}
	ns "BRAIN"
	returns	"Any"

native "TASK_PERFORM_SEQUENCE"
	hash "0x5ABA3986D90D8A3B"
	jhash (0x4D9FBD11)
	arguments {
		Ped "ped",

		Object "taskSequence",
	}
	ns "BRAIN"
	returns	"Any"

native "CLEAR_SEQUENCE_TASK"
	hash "0x3841422E9C488D8C"
	jhash (0x47ED03CE)
	arguments {
		ObjectPtr "taskSequence",
	}
	ns "BRAIN"
	returns	"Any"

native "SET_SEQUENCE_TO_REPEAT"
	hash "0x58C70CF3A41E4AE7"
	jhash (0xCDDF1508)
	arguments {
		Object "taskSequence",

		BOOL "repeat",
	}
	ns "BRAIN"
	returns	"void"

native "GET_SEQUENCE_PROGRESS"
	hash "0x00A9010CFE1E3533"
	jhash (0xA3419909)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"int"
	doc [[!
<summary>
		returned values:
		0 to 7 = task that's currently in progress, 0 meaning the first one.
</summary>
	]]

native "GET_IS_TASK_ACTIVE"
	hash "0xB0760331C7AA4155"
	jhash (0x86FDDF55)
	arguments {
		Ped "ped",

		int "taskNumber",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		from docks_heistb.c4:
		AI::GET_IS_TASK_ACTIVE(PLAYER::PLAYER_PED_ID(), 2))

		Known Tasks: pastebin.com/2gFqJ3Px
</summary>
	]]

native "GET_SCRIPT_TASK_STATUS"
	hash "0x77F1BEB8863288D5"
	jhash (0xB2477B23)
	arguments {
		Ped "targetPed",

		Hash "taskHash",
	}
	ns "BRAIN"
	returns	"int"
	doc [[!
<summary>
		Gets the status of a script-assigned task. The hash does not seem to match the actual native name, but is assigned hardcoded from the executable during task creation.

		Statuses are specific to tasks, in addition '7' means the specified task is not assigned to the ped.

		A few hashes found in the executable (although not a complete list) can be found at pastebin.com/R9iK6M9W as it was too long for this wiki.
</summary>
	]]

native "GET_ACTIVE_VEHICLE_MISSION_TYPE"
	hash "0x534AEBA6E5ED4CAB"
	jhash (0xAFA914EF)
	arguments {
		Vehicle "veh",
	}
	ns "BRAIN"
	returns	"int"

native "TASK_LEAVE_ANY_VEHICLE"
	hash "0x504D54DF3F6F2247"
	jhash (0xDBDD79FA)
	arguments {
		Ped "ped",

		int "p1",

		int "p2",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_AIM_GUN_SCRIPTED"
	hash "0x7A192BE16D373D00"
	jhash (0x9D296BCD)
	arguments {
		Ped "ped",

		Hash "scriptTask",

		BOOL "p2",

		BOOL "p3",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_AIM_GUN_SCRIPTED_WITH_TARGET"
	hash "0x8605AF0DE8B3A5AC"
	jhash (0xFD517CE3)
	arguments {
		Any "p0",

		Any "p1",

		float "p2",

		float "p3",

		float "p4",

		Any "p5",

		BOOL "p6",

		BOOL "p7",
	}
	ns "BRAIN"
	returns	"void"

native "UPDATE_TASK_AIM_GUN_SCRIPTED_TARGET"
	hash "0x9724FB59A3E72AD0"
	jhash (0x67E73525)
	arguments {
		Ped "p0",

		Ped "p1",

		float "p2",

		float "p3",

		float "p4",

		BOOL "p5",
	}
	ns "BRAIN"
	returns	"void"

native "GET_CLIP_SET_FOR_SCRIPTED_GUN_TASK"
	hash "0x3A8CADC7D37AACC5"
	jhash (0x249EB4EB)
	arguments {
		int "p0",
	}
	ns "BRAIN"
	returns	"charPtr"

native "TASK_AIM_GUN_AT_ENTITY"
	hash "0x9B53BB6E8943AF53"
	jhash (0xBE32B3B6)
	arguments {
		Ped "ped",

		Entity "entity",

		int "duration",

		BOOL "p3",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		duration: the amount of time in milliseconds to do the task.  -1 will keep the task going until either another task is applied, or CLEAR_ALL_TASKS() is called with the ped
</summary>
	]]

native "TASK_TURN_PED_TO_FACE_ENTITY"
	hash "0x5AD23D40115353AC"
	jhash (0x3C37C767)
	arguments {
		Ped "ped",

		Entity "entity",

		int "duration",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		duration: the amount of time in milliseconds to do the task. -1 will keep the task going until either another task is applied, or CLEAR_ALL_TASKS() is called with the ped
</summary>
	]]

native "TASK_AIM_GUN_AT_COORD"
	hash "0x6671F3EEC681BDA1"
	jhash (0xFBF44AD3)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		int "time",

		BOOL "p5",

		BOOL "p6",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>


</summary>
	]]

native "TASK_SHOOT_AT_COORD"
	hash "0x46A6CC01E0826106"
	jhash (0x601C22E3)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		int "duration",

		Hash "firingPattern",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_SHUFFLE_TO_NEXT_VEHICLE_SEAT"
	hash "0x7AA80209BDA643EB"
	jhash (0xBEAF8F67)
	arguments {
		Ped "ped",

		Vehicle "vehicle",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes the specified ped shuffle to the next vehicle seat.
		The ped MUST be in a vehicle and the vehicle parameter MUST be the ped's current vehicle.
</summary>
	]]

native "CLEAR_PED_TASKS"
	hash "0xE1EF3C1216AFF2CD"
	jhash (0xDE3316AB)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"

native "CLEAR_PED_SECONDARY_TASK"
	hash "0x176CECF6F920D707"
	jhash (0xA635F451)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_EVERYONE_LEAVE_VEHICLE"
	hash "0x7F93691AB4B92272"
	jhash (0xC1971F30)
	arguments {
		Vehicle "vehicle",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_GOTO_ENTITY_OFFSET"
	hash "0xE39B4FF4FDEBDE27"
	jhash (0x1A17A85E)
	arguments {
		Ped "ped",

		Any "p1",

		Any "p2",

		float "x",

		float "y",

		float "z",

		int "duration",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_GOTO_ENTITY_OFFSET_XY"
	hash "0x338E7EF52B6095A9"
	jhash (0xBC1E3D0A)
	arguments {
		Ped "ped",

		Entity "entity",

		int "duration",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		float "moveBlendRatio",

		BOOL "useNavmesh",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_TURN_PED_TO_FACE_COORD"
	hash "0x1DDA930A0AC38571"
	jhash (0x30463D73)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		int "duration",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		duration in milliseconds
</summary>
	]]

native "TASK_VEHICLE_TEMP_ACTION"
	hash "0xC429DCEEB339E129"
	jhash (0x0679DFB8)
	arguments {
		Ped "driver",

		Vehicle "vehicle",

		int "action",

		int "time",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		'1 
		'3 - brake + reverse
		'4 - turn left 90 + braking
		'5 - turn right 90 + braking
		'6 - brake strong (handbrake?) until time ends
		'7 - turn left + accelerate
		'7 - turn right + accelerate
		'9 - weak acceleration
		'10 - turn left + restore wheel pos to center in the end
		'11 - turn right + restore wheel pos to center in the end
		'13 - turn left + go reverse
		'14 - turn left + go reverse
		'16 - crash the game after like 2 seconds :)
		'17 - keep actual state, game crashed after few tries
		'18 - game crash
		'19 - strong brake + turn left/right
		'20 - weak brake + turn left then turn right
		'21 - weak brake + turn right then turn left
		'22 - brake + reverse
		'23 - accelerate fast
		'24 
		'25 - brake turning left then when almost stopping it turns left more
		'26 - brake turning right then when almost stopping it turns right more
		'27 - brake until car stop or until time ends
		'28 - brake + strong reverse acceleration
		'30 - performs a burnout (brake until stop + brake and accelerate)
		'31 - accelerate + handbrake
		'32 - accelerate very strong

		Seems to be this:
		Works on NPCs, but overrides their current task. If inside a task sequence (and not being the last task), "time" will work, otherwise the task will be performed forever until tasked with something else
</summary>
	]]

native "TASK_VEHICLE_MISSION"
	hash "0x659427E0EF36BCDE"
	jhash (0x20609E56)
	arguments {
		int "p0",

		int "p1",

		Vehicle "veh",

		Any "p3",

		float "p4",

		Any "p5",

		float "p6",

		float "p7",

		BOOL "p8",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_VEHICLE_MISSION_PED_TARGET"
	hash "0x9454528DF15D657A"
	jhash (0xC81C4677)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		Ped "pedTarget",

		int "mode",

		float "maxSpeed",

		int "drivingStyle",

		float "minDistance",

		float "p7",

		BOOL "p8",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Modes:
		8= flees
		1=drives around the ped
		4=drives and stops near
		7=follows
		10=follows to the left
		11=follows to the  right
		12 = follows behind
		13=follows ahead
		14=follows, stop when near
</summary>
	]]

native "TASK_VEHICLE_MISSION_COORS_TARGET"
	hash "0xF0AF20AA7731F8C3"
	jhash (0x6719C109)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		float "x",

		float "y",

		float "z",

		int "p5",

		int "p6",

		int "p7",

		float "p8",

		float "p9",

		BOOL "p10",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Example from fm_mission_controller.c4:
		AI::TASK_VEHICLE_MISSION_COORS_TARGET(l_65E1, l_65E2, 324.84588623046875, 325.09619140625, 104.3525, 4, 15.0, 802987, 5.0, 5.0, 0);

</summary>
	]]

native "TASK_VEHICLE_ESCORT"
	hash "0x0FA6E4B75F302400"
	jhash (0x9FDCB250)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		Vehicle "targetVehicle",

		int "mode",

		float "speed",

		int "drivingStyle",

		float "minDistance",

		int "p7",

		float "noRoadsDistance",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes a ped follow the targetVehicle with &lt;minDistance&gt; in between.

		note: minDistance is ignored if drivingstyle is avoiding traffic, but Rushed is fine.

		Mode: The mode defines the relative position to the targetVehicle. The ped will try to position its vehicle there.
		-1 = behind
		0 = ahead
		1 = left
		2 = right
		3 = back left
		4 = back right

		if the target is closer than noRoadsDistance, the driver will ignore pathing/roads and follow you directly.

		Driving Styles guide: gtaforums.com/topic/822314-guide-driving-styles/
</summary>
	]]

native "_TASK_VEHICLE_FOLLOW"
	hash "0xFC545A9F0626E3B6"
	arguments {
		Ped "driver",

		Vehicle "vehicle",

		Entity "targetEntity",

		float "speed",

		int "drivingStyle",

		int "minDistance",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes a ped in a vehicle follow an entity (ped, vehicle, etc.)

		Driving Styles guide: gtaforums.com/topic/822314-guide-driving-styles/

		Console Hash: 0xA8B917D7

		AI::_TASK_VEHICLE_FOLLOW(l_244[3/*1*/], l_268[3/*1*/], l_278, 40.0, 262144, 10);

		What is this known as in the decompiled scripts ffs. I need more examples. I've searched in all scripts for keywords suchas,
		TASK_VEHICLE_FOLLOW, FC545A9F0626E3B6, 0xFC545A9F0626E3B6, all the parameters in the above example even just search the last few params '40.0, 262144, 10' and couldnt find where this native is used in scripts at all unless whoever decompiled the scripts gave it a whack a.. name.
</summary>
	]]

native "TASK_VEHICLE_CHASE"
	hash "0x3C08A8E30363B353"
	jhash (0x55634798)
	arguments {
		Ped "driver",

		Entity "targetEnt",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		chases targetEnt fast and aggressively
		--
		Makes ped (needs to be in vehicle) chase targetEnt.
</summary>
	]]

native "TASK_VEHICLE_HELI_PROTECT"
	hash "0x1E09C32048FEFD1C"
	jhash (0x0CB415EE)
	arguments {
		Ped "pilot",

		Vehicle "vehicle",

		Entity "entityToFollow",

		float "targetSpeed",

		int "p4",

		float "radius",

		int "altitude",

		int "p7",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		pilot, vehicle and altitude are rather self-explanatory.

		p4: is unused variable in the function.

		entityToFollow: you can provide a Vehicle entity or a Ped entity, the heli will protect them.

		'targetSpeed':  The pilot will dip the nose AS MUCH AS POSSIBLE so as to reach this value AS FAST AS POSSIBLE.  As such, you'll want to modulate it as opposed to calling it via a hard-wired, constant #.

		'radius' isn't just "stop within radius of X of target" like with ground vehicles.  In this case, the pilot will fly an entire circle around 'radius' and continue to do so.

		NOT CONFIRMED:  p7 appears to be a FlyingStyle enum.  Still investigating it as of this writing, but playing around with values here appears to result in different -behavior- as opposed to offsetting coordinates, altitude, target speed, etc.

		NOTE: If the pilot finds enemies, it will engage them until it kills them, but will return to protect the ped/vehicle given shortly thereafter.
</summary>
	]]

native "SET_TASK_VEHICLE_CHASE_BEHAVIOR_FLAG"
	hash "0xCC665AAC360D31E7"
	jhash (0x2A83083F)
	arguments {
		Ped "ped",

		int "flag",

		BOOL "set",
	}
	ns "BRAIN"
	returns	"void"

native "SET_TASK_VEHICLE_CHASE_IDEAL_PURSUIT_DISTANCE"
	hash "0x639B642FACBE4EDD"
	jhash (0x04FD3EE7)
	arguments {
		Ped "ped",

		float "distance",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_HELI_CHASE"
	hash "0xAC83B1DB38D0ADA0"
	jhash (0xAC290A21)
	arguments {
		Ped "pilot",

		Entity "entityToFollow",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Ped pilot should be in a heli.
		EntityToFollow can be a vehicle or Ped.

		x,y,z appear to be how close to the EntityToFollow the heli should be. Scripts use 0.0, 0.0, 80.0. Then the heli tries to position itself 80 units above the EntityToFollow. If you reduce it to -5.0, it tries to go below (if the EntityToFollow is a heli or plane)


		NOTE: If the pilot finds enemies, it will engage them, then remain there idle, not continuing to chase the Entity given.
</summary>
	]]

native "TASK_PLANE_CHASE"
	hash "0x2D2386F273FF7A25"
	jhash (0x12FA1C28)
	arguments {
		Ped "pilot",

		Entity "entityToFollow",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_PLANE_LAND"
	hash "0xBF19721FA34D32C0"
	jhash (0x5F7E23EA)
	arguments {
		Ped "pilot",

		Vehicle "plane",

		float "runwayStartX",

		float "runwayStartY",

		float "runwayStartZ",

		float "runwayEndX",

		float "runwayEndY",

		float "runwayEndZ",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		 Function.Call(Hash.TASK_PLANE_LAND, pilot, selectedAirplane, runwayStartPoint.X, runwayStartPoint.Y, runwayStartPoint.Z, runwayEndPoint.X, runwayEndPoint.Y, runwayEndPoint.Z); 
</summary>
	]]

native "TASK_HELI_MISSION"
	hash "0xDAD029E187A2BEB4"
	jhash (0x0C143E97)
	arguments {
		Ped "pilot",

		Vehicle "aircraft",

		Vehicle "targetVehicle",

		Ped "targetPed",

		float "destinationX",

		float "destinationY",

		float "destinationZ",

		int "missionFlag",

		float "maxSpeed",

		float "landingRadius",

		float "targetHeading",

		int "unk1",

		int "unk2",

		Hash "unk3",

		int "landingFlags",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		EDITED (8/16/2017)

		DESCRIPTION:
		Allow a ped to fly to a specific destination.

		USAGE:
		-- REQUIRED --
		• pilot = The ped flying the aircraft.
		• aircraft = The aircraft the pilot is flying.

		-- OPTIONAL -- [atleast 1 must be assigned]
		• targetVehicle = The vehicle the pilot will target.
		• targetPed = The ped the pilot will target.
		• destinationX, destinationY, destinationZ = The location the pilot will target.

		-- LOGIC --
		• missionFlag = The type of mission.
		• maxSpeed = The speed in mph that the pilot will limit his/her self to while flying.
		• landingRadius = The distance from the destination that the pilot must be to land.
		• targetHeading = The heading that the pilot will try to achieve while flying.
		• unk1, unk2 = Set to -1 and it will be okay.
		• unk3 = I'm almost sure this is a vehicle record/waypoint recording hash. A value of -1 is for none. Maybe it's a float? Idk.
		• landingFlags = Bit flags used for landing. All I know is:
		0 = Hover over the destination.
		32 = Land on destination.
		1024 = Erratic, crash into nearby obstacles.
		4096 = Rushed movement + Hover over destination

		Known Mission Types:
		4 = FlyToCoord
		8 = FleeFromPed
		9 = CircleAroundTarget
		10 = CopyTargetHeading
		20 = LandNearPed
		21 = Crash

		Example C#:
		Function.Call(Hash.TASK_HELI_MISSION, driver, heli, 0, 0, position.X, position.Y, position.Z, 4, 50.0, 10.0, (position - heli.Position).ToHeading(), -1, -1, -1, 32);

		OLD USAGE: pastebin.com/ndkSjaaW
</summary>
	]]

native "TASK_PLANE_MISSION"
	hash "0x23703CD154E83B88"
	jhash (0x1D007E65)
	arguments {
		Ped "pilot",

		Vehicle "aircraft",

		Vehicle "targetVehicle",

		Ped "targetPed",

		float "destinationX",

		float "destinationY",

		float "destinationZ",

		int "missionFlag",

		float "angularDrag",

		float "unk",

		float "targetHeading",

		float "maxZ",

		float "minZ",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		EDITED (7/13/2017)

		NOTE: If you want air combat, AI::TASK_COMBAT_PED (while your pilot is in an aircraft) also does the same thing as this native.

		DESCRIPTION:
		Ever wish your buddy could shoot down one of your enemies for you? Ever wanted an auto-pilot? Well look no further! This is the native for you! (Ped intelligence may vary)

		USAGE:
		-- REQUIRED --
		• pilot = The ped flying the aircraft.
		• aircraft = The aircraft the pilot is flying

		-- OPTIONAL -- [atleast 1 must be assigned]
		• targetVehicle = The vehicle the pilot will target.
		• targetPed = The ped the pilot will target.
		• destinationX, destinationY, destinationZ = The location the pilot will target.

		-- LOGIC --
		• missionFlag = The type of mission. pastebin.com/R8x73dbv
		• angularDrag = The higher the value, the slower the plane will rotate. Value ranges from 0 - Infinity.
		• unk = Set to 0, and you'll be fine.
		• targetHeading = The target angle (from world space north) that the pilot will try to acheive before executing an attack/landing.
		• maxZ = Maximum Z coordinate height for flying.
		• minZ = Minimum Z coordinate height for flying.

		Z: 2,700 is the default max height a pilot will be able to fly. Anything greater and he will fly downward until reaching 2,700 again.


		Mission Types (incase you don't like links..):
		0 = None
		1 = Unk
		2 = CTaskVehicleRam
		3 = CTaskVehicleBlock
		4 = CTaskVehicleGoToPlane
		5 = CTaskVehicleStop
		6 = CTaskVehicleAttack
		7 = CTaskVehicleFollow
		8 = CTaskVehicleFleeAirborne
		9 = CTaskVehicleCircle
		10 = CTaskVehicleEscort
		15 = CTaskVehicleFollowRecording
		16 = CTaskVehiclePoliceBehaviour
		17 = CTaskVehicleCrash

		Example C#:
		Function.Call(Hash.TASK_PLANE_MISSION, pilot, vehicle, 0, Game.Player.Character, 0, 0, 0, 6, 0f, 0f, 0f, 2500.0f, -1500f);

		Example C++
		AI::TASK_PLANE_MISSION(pilot, vehicle, 0, PLAYER::GET_PLAYER_PED(PLAYER::GET_PLAYER_INDEX()), 0, 0, 0, 6, 0.0, 0.0, 0.0, 2500.0, -1500.0);


		[DEPRECATED] EXAMPLE USAGE:
		pastebin.com/gx7Finsk
</summary>
	]]

native "TASK_BOAT_MISSION"
	hash "0x15C86013127CE63F"
	jhash (0x5865B031)
	arguments {
		Ped "pedDriver",

		Vehicle "boat",

		Any "p2",

		Any "p3",

		float "x",

		float "y",

		float "z",

		Any "p7",

		float "maxSpeed",

		int "drivingStyle",

		float "p10",

		Any "p11",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		You need to call PED::SET_BLOCKING_OF_NON_TEMPORARY_EVENTS after TASK_BOAT_MISSION in order for the task to execute.

		Working example
		float vehicleMaxSpeed = VEHICLE::_GET_VEHICLE_MAX_SPEED(ENTITY::GET_ENTITY_MODEL(pedVehicle));
		AI::TASK_BOAT_MISSION(pedDriver, pedVehicle, 0, 0, waypointCoord.x, waypointCoord.y, waypointCoord.z, 4, vehicleMaxSpeed, 786469, -1.0, 7);
		PED::SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pedDriver, 1);

		P8 appears to be driving style flag - see gtaforums.com/topic/822314-guide-driving-styles/ for documentation
</summary>
	]]

native "TASK_DRIVE_BY"
	hash "0x2F8AF0E82773A171"
	jhash (0x2B84D1C4)
	arguments {
		Ped "driverPed",

		Ped "targetPed",

		Vehicle "targetVehicle",

		float "targetX",

		float "targetY",

		float "targetZ",

		float "distanceToShoot",

		int "pedAccuracy",

		BOOL "p8",

		Hash "firingPattern",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Example:

		AI::TASK_DRIVE_BY(l_467[1/*22*/], PLAYER::PLAYER_PED_ID(), 0, 0.0, 0.0, 2.0, 300.0, 100, 0, ${firing_pattern_burst_fire_driveby});




		Needs working example. Doesn't seem to do anything.

		I marked p2 as targetVehicle as all these shooting related tasks seem to have that in common.
		I marked p6 as distanceToShoot as if you think of GTA's Logic with the native SET_VEHICLE_SHOOT natives, it won't shoot till it gets within a certain distance of the target.
		I marked p7 as pedAccuracy as it seems it's mostly 100 (Completely Accurate), 75, 90, etc. Although this could be the ammo count within the gun, but I highly doubt it. I will change this comment once I find out if it's ammo count or not.
</summary>
	]]

native "SET_DRIVEBY_TASK_TARGET"
	hash "0xE5B302114D8162EE"
	jhash (0xDA6A6FC1)
	arguments {
		Ped "shootingPed",

		Ped "targetPed",

		Vehicle "targetVehicle",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		For p1 &amp; p2 (Ped, Vehicle). I could be wrong, as the only time this native is called in scripts is once and both are 0, but I assume this native will work like SET_MOUNTED_WEAPON_TARGET in which has the same exact amount of parameters and the 1st and last 3 parameters are right and the same for both natives.
</summary>
	]]

native "CLEAR_DRIVEBY_TASK_UNDERNEATH_DRIVING_TASK"
	hash "0xC35B5CDB2824CF69"
	jhash (0x9B76F7E6)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"

native "IS_DRIVEBY_TASK_UNDERNEATH_DRIVING_TASK"
	hash "0x8785E6E40C7A8818"
	jhash (0xB23F46E6)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "CONTROL_MOUNTED_WEAPON"
	hash "0xDCFE42068FE0135A"
	jhash (0x500D9244)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		Forces the ped to use the mounted weapon.
		Returns false if task is not possible.
</summary>
	]]

native "SET_MOUNTED_WEAPON_TARGET"
	hash "0xCCD892192C6D2BB9"
	jhash (0x98713C68)
	arguments {
		Ped "shootingPed",

		Ped "targetPed",

		Vehicle "targetVehicle",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Note: Look in decompiled scripts and the times that p1 and p2 aren't 0. They are filled with vars. If you look through out that script what other natives those vars are used in, you can tell p1 is a ped and p2 is a vehicle. Which most likely means if you want the mounted weapon to target a ped set targetVehicle to 0 or vice-versa.
</summary>
	]]

native "IS_MOUNTED_WEAPON_TASK_UNDERNEATH_DRIVING_TASK"
	hash "0xA320EF046186FA3B"
	jhash (0x291E938C)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "TASK_USE_MOBILE_PHONE"
	hash "0xBD2A8EC3AF4DE7DB"
	jhash (0x225A38C8)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Actually has 3 params, not 2.

		p0: Ped
		p1: int (or bool?)
		p2: int
</summary>
	]]

native "TASK_USE_MOBILE_PHONE_TIMED"
	hash "0x5EE02954A14C69DB"
	jhash (0xC99C19F5)
	arguments {
		Ped "ped",

		int "duration",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_CHAT_TO_PED"
	hash "0x8C338E0263E4FD19"
	jhash (0xA2BE1821)
	arguments {
		Ped "ped",

		Ped "target",

		Any "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		p2 tend to be 16, 17 or 1
		p3 to p7 tend to be 0.0
</summary>
	]]

native "TASK_WARP_PED_INTO_VEHICLE"
	hash "0x9A7D091411C5F684"
	jhash (0x65D4A35D)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		int "seat",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Seat Numbers
		-------------------------------
		Driver = -1
		Any = -2
		Left-Rear = 1
		Right-Front = 0
		Right-Rear = 2
		Extra seats = 3-14(This may differ from vehicle type e.g. Firetruck Rear Stand, Ambulance Rear)
</summary>
	]]

native "TASK_SHOOT_AT_ENTITY"
	hash "0x08DA95E8298AE772"
	jhash (0xAC0631C9)
	arguments {
		Entity "entity",

		Entity "target",

		int "duration",

		Hash "firingPattern",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		//this part of the code is to determine at which entity the player is aiming, for example if you want to create a mod where you give orders to peds
		Entity aimedentity;
		Player player = PLAYER::PLAYER_ID();
		PLAYER::_GET_AIMED_ENTITY(player, &amp;aimedentity);

		//bg is an array of peds
		AI::TASK_SHOOT_AT_ENTITY(bg[i], aimedentity, 5000, GAMEPLAY::GET_HASH_KEY("FIRING_PATTERN_FULL_AUTO"));

		in practical usage, getting the entity the player is aiming at and then task the peds to shoot at the entity, at a button press event would be better.
</summary>
	]]

native "TASK_CLIMB"
	hash "0x89D9FCC2435112F1"
	jhash (0x90847790)
	arguments {
		Ped "ped",

		BOOL "unused",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Climbs or vaults the nearest thing.
</summary>
	]]

native "TASK_CLIMB_LADDER"
	hash "0xB6C987F9285A3814"
	jhash (0x35BB4EE0)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "BRAIN"
	returns	"void"

native "CLEAR_PED_TASKS_IMMEDIATELY"
	hash "0xAAA34F8A7CB32098"
	jhash (0xBC045625)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Immediately stops the pedestrian from whatever it's doing. They stop fighting, animations, etc. they forget what they were doing.
</summary>
	]]

native "TASK_PERFORM_SEQUENCE_FROM_PROGRESS"
	hash "0x89221B16730234F0"
	jhash (0xFA60601B)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "BRAIN"
	returns	"void"

native "SET_NEXT_DESIRED_MOVE_STATE"
	hash "0xF1B9F16E89E2C93A"
	jhash (0x4E937D57)
	arguments {
		float "p0",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Not used in the scripts.

		Bullshit! It's used in spawn_activities
</summary>
	]]

native "SET_PED_DESIRED_MOVE_BLEND_RATIO"
	hash "0x1E982AC8716912C5"
	jhash (0xC65FC712)
	arguments {
		Ped "ped",

		float "p1",
	}
	ns "BRAIN"
	returns	"void"

native "GET_PED_DESIRED_MOVE_BLEND_RATIO"
	hash "0x8517D4A6CA8513ED"
	jhash (0x5FEFAB72)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"float"

native "TASK_GOTO_ENTITY_AIMING"
	hash "0xA9DA48FAB8A76C12"
	jhash (0xF1C493CF)
	arguments {
		Ped "ped",

		Entity "target",

		float "distanceToStopAt",

		float "StartAimingDist",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		eg

		 AI::TASK_GOTO_ENTITY_AIMING(v_2, PLAYER::PLAYER_PED_ID(), 5.0, 25.0);

		ped = Ped you want to perform this task.
		target = the Entity they should aim at.
		distanceToStopAt = distance from the target, where the ped should stop to aim.
		StartAimingDist = distance where the ped should start to aim.
</summary>
	]]

native "TASK_SET_DECISION_MAKER"
	hash "0xEB8517DDA73720DA"
	jhash (0x830AD50C)
	arguments {
		Ped "p0",

		Hash "p1",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		p1 is always GET_HASH_KEY("empty") in scripts, for the rare times this is used
</summary>
	]]

native "TASK_SET_SPHERE_DEFENSIVE_AREA"
	hash "0x933C06518B52A9A4"
	jhash (0x9F3C5D6A)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_CLEAR_DEFENSIVE_AREA"
	hash "0x95A6C46A31D1917D"
	jhash (0x7A05BF0D)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_PED_SLIDE_TO_COORD"
	hash "0xD04FE6765D990A06"
	jhash (0x225380EF)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "heading",

		float "duration",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_PED_SLIDE_TO_COORD_HDG_RATE"
	hash "0x5A4A6A6D3DC64F52"
	jhash (0x38A995C1)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "heading",

		float "p5",

		float "p6",
	}
	ns "BRAIN"
	returns	"void"

native "ADD_COVER_POINT"
	hash "0xD5C12A75C7B9497F"
	jhash (0xA0AF0B98)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		Any "p4",

		Any "p5",

		Any "p6",

		BOOL "p7",
	}
	ns "BRAIN"
	returns	"ScrHandle"

native "REMOVE_COVER_POINT"
	hash "0xAE287C923D891715"
	jhash (0x0776888B)
	arguments {
		ScrHandle "coverpoint",
	}
	ns "BRAIN"
	returns	"void"

native "DOES_SCRIPTED_COVER_POINT_EXIST_AT_COORDS"
	hash "0xA98B8E3C088E5A31"
	jhash (0x29F97A71)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if there is a cover point at position
</summary>
	]]

native "GET_SCRIPTED_COVER_POINT_COORDS"
	hash "0x594A1028FC2A3E85"
	jhash (0xC6B6CCC1)
	arguments {
		ScrHandle "coverpoint",
	}
	ns "BRAIN"
	returns	"Vector3"

native "TASK_COMBAT_PED"
	hash "0xF166E48407BAC484"
	jhash (0xCB0D8932)
	arguments {
		Ped "ped",

		Ped "targetPed",

		int "p2",

		int "p3",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes the specified ped attack the target ped.
		p2 should be 0
		p3 should be 16
</summary>
	]]

native "TASK_COMBAT_PED_TIMED"
	hash "0x944F30DCB7096BDE"
	jhash (0xF5CA2A45)
	arguments {
		Any "p0",

		Ped "ped",

		int "p2",

		Any "p3",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_SEEK_COVER_FROM_POS"
	hash "0x75AC2B60386D89F2"
	jhash (0x83F18EE9)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		int "duration",

		BOOL "p5",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_SEEK_COVER_FROM_PED"
	hash "0x84D32B3BEC531324"
	jhash (0xC1EC907E)
	arguments {
		Ped "ped",

		Ped "target",

		int "duration",

		BOOL "p3",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_SEEK_COVER_TO_COVER_POINT"
	hash "0xD43D95C7A869447F"
	jhash (0x3D026B29)
	arguments {
		Any "p0",

		Any "p1",

		float "p2",

		float "p3",

		float "p4",

		Any "p5",

		BOOL "p6",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_SEEK_COVER_TO_COORDS"
	hash "0x39246A6958EF072C"
	jhash (0xFFFE754E)
	arguments {
		Ped "ped",

		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		Any "p7",

		BOOL "p8",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		from michael2:
		AI::TASK_SEEK_COVER_TO_COORDS(ped, 967.5164794921875, -2121.603515625, 30.479299545288086, 978.94677734375, -2125.84130859375, 29.4752, -1, 1);


		appears to be shorter variation
		from michael3:
		AI::TASK_SEEK_COVER_TO_COORDS(ped, -2231.011474609375, 263.6326599121094, 173.60195922851562, -1, 0);
</summary>
	]]

native "TASK_PUT_PED_DIRECTLY_INTO_COVER"
	hash "0x4172393E6BE1FECE"
	jhash (0xC9F00E68)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		Any "timeout",

		BOOL "p5",

		float "p6",

		BOOL "p7",

		BOOL "p8",

		Any "p9",

		BOOL "p10",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_EXIT_COVER"
	hash "0x79B258E397854D29"
	jhash (0xC829FAC9)
	arguments {
		Any "p0",

		Any "p1",

		float "p2",

		float "p3",

		float "p4",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_PUT_PED_DIRECTLY_INTO_MELEE"
	hash "0x1C6CD14A876FFE39"
	jhash (0x79E1D27D)
	arguments {
		Ped "ped",

		Ped "meleeTarget",

		float "p2",

		float "p3",

		float "p4",

		BOOL "p5",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		from armenian3.c4

		AI::TASK_PUT_PED_DIRECTLY_INTO_MELEE(PlayerPed, armenianPed, 0.0, -1.0, 0.0, 0);

</summary>
	]]

native "TASK_TOGGLE_DUCK"
	hash "0xAC96609B9995EDF8"
	jhash (0x61CFBCBF)
	arguments {
		BOOL "p0",

		BOOL "p1",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		used in sequence task

		both parameters seems to be always 0
</summary>
	]]

native "TASK_GUARD_CURRENT_POSITION"
	hash "0x4A58A47A72E3FCB4"
	jhash (0x2FB099E9)
	arguments {
		Ped "p0",

		float "p1",

		float "p2",

		BOOL "p3",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		From re_prisonvanbreak:

		AI::TASK_GUARD_CURRENT_POSITION(l_DD, 35.0, 35.0, 1);
</summary>
	]]

native "TASK_GUARD_ASSIGNED_DEFENSIVE_AREA"
	hash "0xD2A207EEBDF9889B"
	jhash (0x7AF0133D)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		Any "p6",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_GUARD_SPHERE_DEFENSIVE_AREA"
	hash "0xC946FE14BE0EB5E2"
	jhash (0x86B76CB7)
	arguments {
		Ped "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		Any "p6",

		float "p7",

		float "p8",

		float "p9",

		float "p10",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		p0 - Guessing PedID
		p1, p2, p3 - XYZ?
		p4 - ???
		p5 - Maybe the size of sphere from XYZ?
		p6 - ???
		p7, p8, p9 - XYZ again?
		p10 - Maybe the size of sphere from second XYZ?
</summary>
	]]

native "TASK_STAND_GUARD"
	hash "0xAE032F8BBA959E90"
	jhash (0xD130F636)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "heading",

		charPtr "scenarioName",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		scenarioName example: "WORLD_HUMAN_GUARD_STAND"
</summary>
	]]

native "SET_DRIVE_TASK_CRUISE_SPEED"
	hash "0x5C9B84BD7D31D908"
	jhash (0x3CEC07B1)
	arguments {
		Ped "driver",

		float "cruiseSpeed",
	}
	ns "BRAIN"
	returns	"void"

native "SET_DRIVE_TASK_MAX_CRUISE_SPEED"
	hash "0x404A5AA9B9F0B746"
	jhash (0x7FDF6131)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "BRAIN"
	returns	"void"

native "SET_DRIVE_TASK_DRIVING_STYLE"
	hash "0xDACE1BE37D88AF67"
	jhash (0x59C5FAD7)
	arguments {
		Ped "ped",

		int "drivingStyle",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		This native is used to set the driving style for specific ped.

		Driving styles id seems to be:
		786468
		262144
		786469

		http://gtaforums.com/topic/822314-guide-driving-styles/
</summary>
	]]

native "ADD_COVER_BLOCKING_AREA"
	hash "0x45C597097DD7CB81"
	jhash (0x3536946F)
	arguments {
		float "playerX",

		float "playerY",

		float "playerZ",

		float "radiusX",

		float "radiusY",

		float "radiusZ",

		BOOL "p6",

		BOOL "p7",

		BOOL "p8",

		BOOL "p9",
	}
	ns "BRAIN"
	returns	"void"

native "REMOVE_ALL_COVER_BLOCKING_AREAS"
	hash "0xDB6708C0B46F56D8"
	jhash (0xCF9221A7)
	ns "BRAIN"
	returns	"void"

native "TASK_START_SCENARIO_IN_PLACE"
	hash "0x142A02425FF02BD9"
	jhash (0xE50D6DDE)
	arguments {
		Ped "ped",

		charPtr "scenarioName",

		int "unkDelay",

		BOOL "playEnterAnim",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Plays a scenario on a Ped at their current location.

		unkDelay - Usually 0 or -1, doesn't seem to have any effect. Might be a delay between sequences.
		playEnterAnim - Plays the "Enter" anim if true, otherwise plays the "Exit" anim. Scenarios that don't have any "Enter" anims won't play if this is set to true.

		----

		From "am_hold_up.ysc.c4" at line 339:

		AI::TASK_START_SCENARIO_IN_PLACE(NETWORK::NET_TO_PED(l_8D._f4), sub_adf(), 0, 1);

		I'm unsure of what the last two parameters are, however sub_adf() randomly returns 1 of 3 scenarios, those being:
		WORLD_HUMAN_SMOKING
		WORLD_HUMAN_HANG_OUT_STREET
		WORLD_HUMAN_STAND_MOBILE

		This makes sense, as these are what I commonly see when going by a liquor store.
		-------------------------
		List of scenarioNames: pastebin.com/6mrYTdQv
		(^ Thank you so fucking much for this)

		Also these:
		WORLD_FISH_FLEE
		DRIVE
		WORLD_HUMAN_HIKER
		WORLD_VEHICLE_ATTRACTOR
		WORLD_VEHICLE_BICYCLE_MOUNTAIN
		WORLD_VEHICLE_BIKE_OFF_ROAD_RACE
		WORLD_VEHICLE_BIKER
		WORLD_VEHICLE_CONSTRUCTION_PASSENGERS
		WORLD_VEHICLE_CONSTRUCTION_SOLO
		WORLD_VEHICLE_DRIVE_PASSENGERS
		WORLD_VEHICLE_DRIVE_SOLO
		WORLD_VEHICLE_EMPTY
		WORLD_VEHICLE_PARK_PARALLEL
		WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN
		WORLD_VEHICLE_POLICE_BIKE
		WORLD_VEHICLE_POLICE_CAR
		WORLD_VEHICLE_POLICE_NEXT_TO_CAR
		WORLD_VEHICLE_SALTON_DIRT_BIKE
		WORLD_VEHICLE_TRUCK_LOGS
</summary>
	]]

native "TASK_START_SCENARIO_AT_POSITION"
	hash "0xFA4EFC79F69D4F07"
	jhash (0xAA2C4AC2)
	arguments {
		Ped "ped",

		charPtr "scenarioName",

		float "x",

		float "y",

		float "z",

		float "heading",

		int "duration",

		BOOL "sittingScenario",

		BOOL "teleport",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		List of scenarioNames: pastebin.com/6mrYTdQv

		Also a few more listed at AI::TASK_START_SCENARIO_IN_PLACE just above.
		---------------
		The first parameter in every scenario has always been a Ped of some sort. The second like TASK_START_SCENARIO_IN_PLACE is the name of the scenario. 

		The next 4 parameters were harder to decipher. After viewing "hairdo_shop_mp.ysc.c4", and being confused from seeing the case in other scripts, they passed the first three of the arguments as one array from a function, and it looked like it was obviously x, y, and z.

		I haven't seen the sixth parameter go to or over 360, making me believe that it is rotation, but I really can't confirm anything.

		I have no idea what the last 3 parameters are, but I'll try to find out.

		-going on the last 3 parameters, they appear to always be "0, 0, 1"

		p6 -1 also used in scrips

		p7 used for sitting scenarios

		p8 teleports ped to position
</summary>
	]]

native "TASK_USE_NEAREST_SCENARIO_TO_COORD"
	hash "0x277F471BA9DB000B"
	jhash (0x9C50FBF0)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "distance",

		int "duration",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Updated variables

		An alternative to AI::TASK_USE_NEAREST_SCENARIO_TO_COORD_WARP. Makes the ped walk to the scenario instead.
</summary>
	]]

native "TASK_USE_NEAREST_SCENARIO_TO_COORD_WARP"
	hash "0x58E2E0F23F6B76C3"
	jhash (0x1BE9D65C)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "radius",

		Any "p5",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_USE_NEAREST_SCENARIO_CHAIN_TO_COORD"
	hash "0x9FDA1B3D7E7028B3"
	jhash (0xE32FFB22)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		Any "p5",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_USE_NEAREST_SCENARIO_CHAIN_TO_COORD_WARP"
	hash "0x97A28E63F0BA5631"
	jhash (0xBAB4C0AE)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		Any "p5",
	}
	ns "BRAIN"
	returns	"void"

native "DOES_SCENARIO_EXIST_IN_AREA"
	hash "0x5A59271FFADD33C1"
	jhash (0xFA7F5047)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		BOOL "b",
	}
	ns "BRAIN"
	returns	"BOOL"

native "DOES_SCENARIO_OF_TYPE_EXIST_IN_AREA"
	hash "0x0A9D0C2A3BBC86C1"
	jhash (0x0FB138A5)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		AnyPtr "p3",

		float "p4",

		BOOL "p5",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_SCENARIO_OCCUPIED"
	hash "0x788756D73AC2E07C"
	jhash (0x697FC008)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		BOOL "p4",
	}
	ns "BRAIN"
	returns	"BOOL"

native "PED_HAS_USE_SCENARIO_TASK"
	hash "0x295E3CCEC879CCD7"
	jhash (0x9BE9C691)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "PLAY_ANIM_ON_RUNNING_SCENARIO"
	hash "0x748040460F8DF5DC"
	jhash (0x1984A5D1)
	arguments {
		Ped "ped",

		charPtr "animDict",

		charPtr "animName",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>


		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "DOES_SCENARIO_GROUP_EXIST"
	hash "0xF9034C136C9E00D3"
	jhash (0x5F072EB9)
	arguments {
		charPtr "scenarioGroup",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		Occurrences in the b617d scripts:

		"ARMY_GUARD",
		"ARMY_HELI",
		"Cinema_Downtown",
		"Cinema_Morningwood",
		"Cinema_Textile",
		"City_Banks",
		"Countryside_Banks",
		"DEALERSHIP",
		"GRAPESEED_PLANES",
		"KORTZ_SECURITY",
		"LOST_BIKERS",
		"LSA_Planes",
		"LSA_Planes",
		"MP_POLICE",
		"Observatory_Bikers", 
		"POLICE_POUND1",
		"POLICE_POUND2",
		"POLICE_POUND3",
		"POLICE_POUND4",
		"POLICE_POUND5"
		"QUARRY",
		"SANDY_PLANES",
		"SCRAP_SECURITY",
		"SEW_MACHINE",
		"SOLOMON_GATE",
		"Triathlon_1_Start", 
		"Triathlon_2_Start", 
		"Triathlon_3_Start"

		Sometimes used with IS_SCENARIO_GROUP_ENABLED:
		if (AI::DOES_SCENARIO_GROUP_EXIST("Observatory_Bikers") &amp;&amp; (!AI::IS_SCENARIO_GROUP_ENABLED("Observatory_Bikers"))) {
		else if (AI::IS_SCENARIO_GROUP_ENABLED("BLIMP")) {

</summary>
	]]

native "IS_SCENARIO_GROUP_ENABLED"
	hash "0x367A09DED4E05B99"
	jhash (0x90991122)
	arguments {
		charPtr "scenarioGroup",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		 Occurrences in the b617d scripts: 

		 "ARMY_GUARD",
		 "ARMY_HELI",
		 "BLIMP",
		 "Cinema_Downtown",
		 "Cinema_Morningwood",
		 "Cinema_Textile",
		 "City_Banks",
		 "Countryside_Banks",
		 "DEALERSHIP",
		 "KORTZ_SECURITY",
		 "LSA_Planes",
		 "MP_POLICE",
		 "Observatory_Bikers",
		 "POLICE_POUND1",
		 "POLICE_POUND2",
		 "POLICE_POUND3",
		 "POLICE_POUND4",
		 "POLICE_POUND5",
		 "Rampage1",
		 "SANDY_PLANES",
		 "SCRAP_SECURITY",
		 "SEW_MACHINE",
		 "SOLOMON_GATE"

		Sometimes used with DOES_SCENARIO_GROUP_EXIST:
		if (AI::DOES_SCENARIO_GROUP_EXIST("Observatory_Bikers") &amp;&amp;   (!AI::IS_SCENARIO_GROUP_ENABLED("Observatory_Bikers"))) {
		else if (AI::IS_SCENARIO_GROUP_ENABLED("BLIMP")) {
</summary>
	]]

native "SET_SCENARIO_GROUP_ENABLED"
	hash "0x02C8E5B49848664E"
	jhash (0x116997B1)
	arguments {
		charPtr "scenarioGroup",

		BOOL "p1",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Occurrences in the b617d scripts: pastebin.com/Tvg2PRHU
</summary>
	]]

native "RESET_SCENARIO_GROUPS_ENABLED"
	hash "0xDD902D0349AFAD3A"
	jhash (0xBF55025D)
	ns "BRAIN"
	returns	"void"

native "SET_EXCLUSIVE_SCENARIO_GROUP"
	hash "0x535E97E1F7FC0C6A"
	jhash (0x59DB8F26)
	arguments {
		charPtr "scenarioGroup",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Groups found in the scripts used with this native:

		"AMMUNATION",
		"QUARRY",
		"Triathlon_1",
		"Triathlon_2",
		"Triathlon_3"
</summary>
	]]

native "RESET_EXCLUSIVE_SCENARIO_GROUP"
	hash "0x4202BBCB8684563D"
	jhash (0x17F9DFE8)
	ns "BRAIN"
	returns	"void"

native "IS_SCENARIO_TYPE_ENABLED"
	hash "0x3A815DB3EA088722"
	jhash (0xAE37E969)
	arguments {
		charPtr "scenarioType",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		Occurrences in the b617d scripts:
		"PROP_HUMAN_SEAT_CHAIR",
		"WORLD_HUMAN_DRINKING",
		"WORLD_HUMAN_HANG_OUT_STREET",
		"WORLD_HUMAN_SMOKING",
		"WORLD_MOUNTAIN_LION_WANDER",
		"WORLD_HUMAN_DRINKING"

		Sometimes used together with GAMEPLAY::IS_STRING_NULL_OR_EMPTY in the scripts.

		scenarioType could be the same as scenarioName, used in for example AI::TASK_START_SCENARIO_AT_POSITION.

</summary>
	]]

native "SET_SCENARIO_TYPE_ENABLED"
	hash "0xEB47EC4E34FB7EE1"
	jhash (0xDB18E5DE)
	arguments {
		charPtr "scenarioType",

		BOOL "toggle",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		seems to enable/disable specific scenario-types from happening in the game world.

		Here are some scenario types from the scripts:
		"WORLD_MOUNTAIN_LION_REST"                                             
		"WORLD_MOUNTAIN_LION_WANDER"                                            
		"DRIVE"                                                                  
		"WORLD_VEHICLE_POLICE_BIKE"                                             
		"WORLD_VEHICLE_POLICE_CAR"                                             
		"WORLD_VEHICLE_POLICE_NEXT_TO_CAR"                                        
		"WORLD_VEHICLE_DRIVE_SOLO"                                                 
		"WORLD_VEHICLE_BIKER"                                                      
		"WORLD_VEHICLE_DRIVE_PASSENGERS"                                           
		"WORLD_VEHICLE_SALTON_DIRT_BIKE"                                           
		"WORLD_VEHICLE_BICYCLE_MOUNTAIN"                                           
		"PROP_HUMAN_SEAT_CHAIR"                                             
		"WORLD_VEHICLE_ATTRACTOR"                                             
		"WORLD_HUMAN_LEANING"                                                 
		"WORLD_HUMAN_HANG_OUT_STREET"                                        
		"WORLD_HUMAN_DRINKING"                                                
		"WORLD_HUMAN_SMOKING"                                                
		"WORLD_HUMAN_GUARD_STAND"                                            
		"WORLD_HUMAN_CLIPBOARD"                                              
		"WORLD_HUMAN_HIKER"                                                  
		"WORLD_VEHICLE_EMPTY"                                                      
		"WORLD_VEHICLE_BIKE_OFF_ROAD_RACE"                                      
		"WORLD_HUMAN_PAPARAZZI"                                               
		"WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN"                            
		"WORLD_VEHICLE_PARK_PARALLEL"                                              
		"WORLD_VEHICLE_CONSTRUCTION_SOLO"                               
		"WORLD_VEHICLE_CONSTRUCTION_PASSENGERS"                                                                    
		"WORLD_VEHICLE_TRUCK_LOGS" 
		-alphazolam

		scenarioType could be the same as scenarioName, used in for example AI::TASK_START_SCENARIO_AT_POSITION.
</summary>
	]]

native "RESET_SCENARIO_TYPES_ENABLED"
	hash "0x0D40EE2A7F2B2D6D"
	jhash (0xF58FDEB4)
	ns "BRAIN"
	returns	"void"

native "IS_PED_ACTIVE_IN_SCENARIO"
	hash "0xAA135F9482C82CC3"
	jhash (0x05038F1A)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "0x621C6E4729388E41"
	hash "0x621C6E4729388E41"
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		Used only once (am_mp_property_int)

		ped was PLAYER_PED_ID()
</summary>
	]]

native "0x8FD89A6240813FD0"
	hash "0x8FD89A6240813FD0"
	arguments {
		Ped "ped",

		BOOL "p1",

		BOOL "p2",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Appears only in fm_mission_controller and used only 3 times.

		ped was always PLAYER_PED_ID()
		p1 was always true
		p2 was always true
</summary>
	]]

native "TASK_COMBAT_HATED_TARGETS_IN_AREA"
	hash "0x4CF5F55DAC3280A0"
	jhash (0xDF099E18)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "radius",

		Any "p5",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Despite its name, it only attacks ONE hated target. The one closest to the specified position.
</summary>
	]]

native "TASK_COMBAT_HATED_TARGETS_AROUND_PED"
	hash "0x7BF835BB9E2698C8"
	jhash (0x2E7064E4)
	arguments {
		Ped "ped",

		float "radius",

		int "p2",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Despite its name, it only attacks ONE hated target. The one closest hated target.

		p2 seems to be always 0
</summary>
	]]

native "TASK_COMBAT_HATED_TARGETS_AROUND_PED_TIMED"
	hash "0x2BBA30B854534A0C"
	jhash (0xF127AD6A)
	arguments {
		Any "p0",

		float "p1",

		Any "p2",

		Any "p3",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_THROW_PROJECTILE"
	hash "0x7285951DBF6B5A51"
	jhash (0xF65C20A7)
	arguments {
		int "ped",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		In every case of this native, I've only seen the first parameter passed as 0, although I believe it's a Ped after seeing tasks around it using 0. That's because it's used in a Sequence Task.

		The last 3 parameters are definitely coordinates after seeing them passed in other scripts, and even being used straight from the player's coordinates.
		---
		It seems that - in the decompiled scripts - this native was used on a ped who was in a vehicle to throw a projectile out the window at the player. This is something any ped will naturally do if they have a throwable and they are doing driveby-combat (although not very accurately).
		It is possible, however, that this is how SWAT throws smoke grenades at the player when in cover.
		----------------------------------------------------
		The first comment is right it definately is the ped as if you look in script finale_heist2b.c line 59628 in Xbox Scripts atleast you will see task_throw_projectile and the first param is Local_559[2 &lt;14&gt;] if you look above it a little bit line 59622 give_weapon_to_ped uses the same exact param Local_559[2 &lt;14&gt;] and we all know the first param of that native is ped. So it guaranteed has to be ped. 0 just may mean to use your ped by default for some reason.
</summary>
	]]

native "TASK_SWAP_WEAPON"
	hash "0xA21C51255B205245"
	jhash (0xDAF4F8FC)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_RELOAD_WEAPON"
	hash "0x62D2916F56B9CD2D"
	jhash (0xCA6E91FD)
	arguments {
		Ped "ped",

		BOOL "unused",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		The 2nd param (unused) is not implemented.

		-----------------------------------------------------------------------

		The only occurrence I found in a R* script ("assassin_construction.ysc.c4"):

		            if (((v_3 &lt; v_4) &amp;&amp; (AI::GET_SCRIPT_TASK_STATUS(PLAYER::PLAYER_PED_ID(), 0x6a67a5cc) != 1)) &amp;&amp; (v_5 &gt; v_3)) {
		                AI::TASK_RELOAD_WEAPON(PLAYER::PLAYER_PED_ID(), 1);
		            }
</summary>
	]]

native "IS_PED_GETTING_UP"
	hash "0x2A74E1D5F2F00EEC"
	jhash (0x320813E6)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "TASK_WRITHE"
	hash "0xCDDC2B77CE54AC6E"
	jhash (0x0FDC54FC)
	arguments {
		Ped "ped",

		Ped "target",

		int "time",

		int "p3",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		EX: Function.Call(Ped1, Ped2, Time, 0);

		The last parameter is always 0 for some reason I do not know. The first parameter is the pedestrian who will writhe to the pedestrian in the other parameter. The third paremeter is how long until the Writhe task ends. When the task ends, the ped will die. If set to -1, he will not die automatically, and the task will continue until something causes it to end. This can be being touched by an entity, being shot, explosion, going into ragdoll, having task cleared. Anything that ends the current task will kill the ped at this point.



		MulleDK19: Third parameter does not appear to be time. The last parameter is not implemented (It's not used, regardless of value).
</summary>
	]]

native "IS_PED_IN_WRITHE"
	hash "0xDEB6D52126E7D640"
	jhash (0x09E61921)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		returns true is the ped is on the ground whining like a little female dog from a gunshot wound
</summary>
	]]

native "OPEN_PATROL_ROUTE"
	hash "0xA36BFB5EE89F3D82"
	jhash (0xF33F83CA)
	arguments {
		charPtr "patrolRoute",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		 patrolRoutes found in the b617d scripts:
		 "miss_Ass0",
		 "miss_Ass1",
		 "miss_Ass2",
		 "miss_Ass3",
		 "miss_Ass4",
		 "miss_Ass5",
		 "miss_Ass6",
		 "MISS_PATROL_6",
		 "MISS_PATROL_7",
		 "MISS_PATROL_8",
		 "MISS_PATROL_9",
		 "miss_Tower_01",
		 "miss_Tower_02",
		 "miss_Tower_03",
		 "miss_Tower_04",
		 "miss_Tower_05",
		 "miss_Tower_06",
		 "miss_Tower_07",
		 "miss_Tower_08",
		 "miss_Tower_10"
</summary>
	]]

native "CLOSE_PATROL_ROUTE"
	hash "0xB043ECA801B8CBC1"
	jhash (0x67305E59)
	ns "BRAIN"
	returns	"void"

native "ADD_PATROL_ROUTE_NODE"
	hash "0x8EDF950167586B7C"
	jhash (0x21B48F10)
	arguments {
		int "p0",

		charPtr "p1",

		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "p8",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Example: 
		AI::ADD_PATROL_ROUTE_NODE(2, "WORLD_HUMAN_GUARD_STAND", -193.4915, -2378.864990234375, 10.9719, -193.4915, -2378.864990234375, 10.9719, 3000);

		p0 is between 0 and 4 in the scripts.

		p1 is "WORLD_HUMAN_GUARD_STAND" or "StandGuard".

		p2, p3 and p4 is only one parameter sometimes in the scripts. Most likely a Vector3 hence p2, p3 and p4 are coordinates. 
		Examples: 
		AI::ADD_PATROL_ROUTE_NODE(1, "WORLD_HUMAN_GUARD_STAND", l_739[7/*3*/], 0.0, 0.0, 0.0, 0);

		AI::ADD_PATROL_ROUTE_NODE(1, "WORLD_HUMAN_GUARD_STAND", l_B0[17/*44*/]._f3, l_B0[17/*44*/]._f3, 2000);

		p5, p6 and p7 are for example set to: 1599.0406494140625, 2713.392578125, 44.4309.

		p8 is an int, often random set to for example: GAMEPLAY::GET_RANDOM_INT_IN_RANGE(5000, 10000).
</summary>
	]]

native "ADD_PATROL_ROUTE_LINK"
	hash "0x23083260DEC3A551"
	jhash (0xD8761BB3)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "BRAIN"
	returns	"void"

native "CREATE_PATROL_ROUTE"
	hash "0xAF8A443CCC8018DC"
	jhash (0x0A6C7864)
	ns "BRAIN"
	returns	"void"

native "DELETE_PATROL_ROUTE"
	hash "0x7767DD9D65E91319"
	jhash (0x2A4E6706)
	arguments {
		charPtr "patrolRoute",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		From the b617d scripts:

		AI::DELETE_PATROL_ROUTE("miss_merc0");
		AI::DELETE_PATROL_ROUTE("miss_merc1");
		AI::DELETE_PATROL_ROUTE("miss_merc2");
		AI::DELETE_PATROL_ROUTE("miss_dock");
</summary>
	]]

native "TASK_PATROL"
	hash "0xBDA5DF49D080FE4E"
	jhash (0xB92E5AF6)
	arguments {
		Ped "ped",

		charPtr "p1",

		Any "p2",

		BOOL "p3",

		BOOL "p4",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		After looking at some scripts the second parameter seems to be an id of some kind. Here are some I found from some R* scripts:

		"miss_Tower_01" (this went from 01 - 10)
		"miss_Ass0" (0, 4, 6, 3)
		"MISS_PATROL_8"

		I think they're patrol routes, but I'm not sure. And I believe the 3rd parameter is a BOOL, but I can't confirm other than only seeing 0 and 1 being passed.


		As far as I can see the patrol routes names such as "miss_Ass0" have been defined earlier in the scripts. This leads me to believe we can defined our own new patrol routes by following the same approach. 
		From the scripts

		    AI::OPEN_PATROL_ROUTE("miss_Ass0");
		    AI::ADD_PATROL_ROUTE_NODE(0, "WORLD_HUMAN_GUARD_STAND", l_738[0/*3*/], -139.4076690673828, -993.4732055664062, 26.2754, GAMEPLAY::GET_RANDOM_INT_IN_RANGE(5000, 10000));
		    AI::ADD_PATROL_ROUTE_NODE(1, "WORLD_HUMAN_GUARD_STAND", l_738[1/*3*/], -116.1391830444336, -987.4984130859375, 26.38541030883789, GAMEPLAY::GET_RANDOM_INT_IN_RANGE(5000, 10000));
		    AI::ADD_PATROL_ROUTE_NODE(2, "WORLD_HUMAN_GUARD_STAND", l_738[2/*3*/], -128.46847534179688, -979.0340576171875, 26.2754, GAMEPLAY::GET_RANDOM_INT_IN_RANGE(5000, 10000));
		    AI::ADD_PATROL_ROUTE_LINK(0, 1);
		    AI::ADD_PATROL_ROUTE_LINK(1, 2);
		    AI::ADD_PATROL_ROUTE_LINK(2, 0);
		    AI::CLOSE_PATROL_ROUTE();
		    AI::CREATE_PATROL_ROUTE();


</summary>
	]]

native "TASK_STAY_IN_COVER"
	hash "0xE5DA8615A6180789"
	jhash (0xA27A9413)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes the ped run to take cover
</summary>
	]]

native "ADD_VEHICLE_SUBTASK_ATTACK_COORD"
	hash "0x5CF0D8F9BBA0DD75"
	jhash (0x50779A2C)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		x, y, z: offset in world coords from some entity.
</summary>
	]]

native "ADD_VEHICLE_SUBTASK_ATTACK_PED"
	hash "0x85F462BADC7DA47F"
	jhash (0x80461113)
	arguments {
		Ped "ped",

		Ped "ped2",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_VEHICLE_SHOOT_AT_PED"
	hash "0x10AB107B887214D8"
	jhash (0x59677BA0)
	arguments {
		Ped "ped",

		Ped "target",

		float "p2",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_VEHICLE_AIM_AT_PED"
	hash "0xE41885592B08B097"
	jhash (0x920AE6DB)
	arguments {
		Ped "ped",

		Ped "target",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_VEHICLE_SHOOT_AT_COORD"
	hash "0x5190796ED39C9B6D"
	jhash (0xA7AAA4D6)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "p4",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_VEHICLE_AIM_AT_COORD"
	hash "0x447C1E9EF844BC0F"
	jhash (0x010F47CE)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_VEHICLE_GOTO_NAVMESH"
	hash "0x195AEEB13CEFE2EE"
	jhash (0x55CF3BCD)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		float "x",

		float "y",

		float "z",

		float "speed",

		int "behaviorFlag",

		float "stoppingRange",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Differs from TASK_VEHICLE_DRIVE_TO_COORDS in that it will pick the shortest possible road route without taking one-way streets and other "road laws" into consideration.

		WARNING:
		A behaviorFlag value of 0 will result in a clunky, stupid driver!

		Recommended settings:
		speed = 30.0f,
		behaviorFlag = 156, 
		stoppingRange = 5.0f;

		If you simply want to have your driver move to a fixed location, call it only once, or, when necessary in the event of interruption. 

		If using this to continually follow a Ped who is on foot:  You will need to run this in a tick loop.  Call it in with the Ped's updated coordinates every 20 ticks or so and you will have one hell of a smart, fast-reacting NPC driver -- provided he doesn't get stuck.  If your update frequency is too fast, the Ped may not have enough time to figure his way out of being stuck, and thus, remain stuck.  One way around this would be to implement an "anti-stuck" mechanism, which allows the driver to realize he's stuck, temporarily pause the tick, unstuck, then resume the tick.

		EDIT:  This is being discussed in more detail at http://gtaforums.com/topic/818504-any-idea-on-how-to-make-peds-clever-and-insanely-fast-c/  
</summary>
	]]

native "TASK_GO_TO_COORD_WHILE_AIMING_AT_COORD"
	hash "0x11315AB3385B8AC0"
	jhash (0x1552DC91)
	arguments {
		Ped "ped",

		float "x",

		float "y",

		float "z",

		float "aimAtX",

		float "aimAtY",

		float "aimAtZ",

		float "moveSpeed",

		BOOL "p8",

		float "p9",

		float "p10",

		BOOL "p11",

		Any "flags",

		BOOL "p13",

		Hash "firingPattern",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		movement_speed: mostly 2f, but also 1/1.2f, etc.
		p8: always false
		p9: 2f
		p10: 0.5f
		p11: true
		p12: 0 / 512 / 513, etc.
		p13: 0
		firing_pattern: ${firing_pattern_full_auto}, 0xC6EE6B4C
</summary>
	]]

native "TASK_GO_TO_COORD_WHILE_AIMING_AT_ENTITY"
	hash "0xB2A16444EAD9AE47"
	jhash (0x9BD52ABD)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		Any "p4",

		float "p5",

		BOOL "p6",

		float "p7",

		float "p8",

		BOOL "p9",

		Any "p10",

		BOOL "p11",

		Any "p12",

		Any "p13",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_GO_TO_COORD_AND_AIM_AT_HATED_ENTITIES_NEAR_COORD"
	hash "0xA55547801EB331FC"
	jhash (0x3F91358E)
	arguments {
		Ped "pedHandle",

		float "goToLocationX",

		float "goToLocationY",

		float "goToLocationZ",

		float "focusLocationX",

		float "focusLocationY",

		float "focusLocationZ",

		float "speed",

		BOOL "shootAtEnemies",

		float "distanceToStopAt",

		float "noRoadsDistance",

		BOOL "unkTrue",

		int "unkFlag",

		int "aimingFlag",

		Hash "firingPattern",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		The ped will walk or run towards goToLocation, aiming towards goToLocation or focusLocation (depending on the aimingFlag) and shooting if shootAtEnemies = true to any enemy in his path.

		If the ped is closer than noRoadsDistance, the ped will ignore pathing/navmesh and go towards goToLocation directly. This could cause the ped to get stuck behind tall walls if the goToLocation is on the other side. To avoid this, use 0.0f and the ped will always use pathing/navmesh to reach his destination.

		If the speed is set to 0.0f, the ped will just stand there while aiming, if set to 1.0f he will walk while aiming, 2.0f will run while aiming.

		The ped will stop aiming when he is closer than distanceToStopAt to goToLocation.

		I still can't figure out what unkTrue is used for. I don't notice any difference if I set it to false but in the decompiled scripts is always true.

		I think that unkFlag, like the driving styles, could be a flag that "work as a list of 32 bits converted to a decimal integer. Each bit acts as a flag, and enables or disables a function". What leads me to this conclusion is the fact that in the decompiled scripts, unkFlag takes values like: 0, 1, 5 (101 in binary) and 4097 (4096 + 1 or 1000000000001 in binary). For now, I don't know what behavior enable or disable this possible flag so I leave it at 0.

		Note: After some testing, using unkFlag = 16 (0x10) enables the use of sidewalks while moving towards goToLocation.

		The aimingFlag takes 2 values: 0 to aim at the focusLocation, 1 to aim at where the ped is heading (goToLocation).

		Example:

		enum AimFlag
		{
		   AimAtFocusLocation,
		   AimAtGoToLocation
		};

		Vector3 goToLocation1 = { 996.2867f, 0, -2143.044f, 0, 28.4763f, 0 }; // remember the padding.

		Vector3 goToLocation2 = { 990.2867f, 0, -2140.044f, 0, 28.4763f, 0 }; // remember the padding.

		Vector3 focusLocation = { 994.3478f, 0, -2136.118f, 0, 29.2463f, 0 }; // the coord z should be a little higher, around +1.0f to avoid aiming at the ground

		// 1st example
		AI::TASK_GO_TO_COORD_AND_AIM_AT_HATED_ENTITIES_NEAR_COORD(pedHandle, goToLocation1.x, goToLocation1.y, goToLocation1.z, focusLocation.x, focusLocation.y, focusLocation.z, 2.0f /*run*/, true /*shoot*/, 3.0f /*stop at*/, 0.0f /*noRoadsDistance*/, true /*always true*/, 0 /*possible flag*/, AimFlag::AimAtGoToLocation, -957453492 /*FullAuto pattern*/);

		// 2nd example
		AI::TASK_GO_TO_COORD_AND_AIM_AT_HATED_ENTITIES_NEAR_COORD(pedHandle, goToLocation2.x, goToLocation2.y, goToLocation2.z, focusLocation.x, focusLocation.y, focusLocation.z, 1.0f /*walk*/, false /*don't shoot*/, 3.0f /*stop at*/, 0.0f /*noRoadsDistance*/, true /*always true*/, 0 /*possible flag*/, AimFlag::AimAtFocusLocation, -957453492 /*FullAuto pattern*/);


		1st example: The ped (pedhandle) will run towards goToLocation1. While running and aiming towards goToLocation1, the ped will shoot on sight to any enemy in his path, using "FullAuto" firing pattern. The ped will stop once he is closer than distanceToStopAt to goToLocation1.

		2nd example: The ped will walk towards goToLocation2. This time, while walking towards goToLocation2 and aiming at focusLocation, the ped will point his weapon on sight to any enemy in his path without shooting. The ped will stop once he is closer than distanceToStopAt to goToLocation2.
</summary>
	]]

native "TASK_GO_TO_ENTITY_WHILE_AIMING_AT_COORD"
	hash "0x04701832B739DCE5"
	jhash (0xD896CD82)
	arguments {
		Any "p0",

		Any "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		BOOL "p6",

		float "p7",

		float "p8",

		BOOL "p9",

		BOOL "p10",

		Any "p11",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_GO_TO_ENTITY_WHILE_AIMING_AT_ENTITY"
	hash "0x97465886D35210E9"
	jhash (0x68E36B7A)
	arguments {
		Ped "ped",

		Entity "entityToWalkTo",

		Entity "entityToAimAt",

		float "speed",

		BOOL "shootatEntity",

		float "p5",

		float "p6",

		BOOL "p7",

		BOOL "p8",

		Hash "firingPattern",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		shootatEntity:
		If true, peds will shoot at Entity till it is dead.
		If false, peds will just walk till they reach the entity and will cease shooting.
</summary>
	]]

native "SET_HIGH_FALL_TASK"
	hash "0x8C825BDC7741D37C"
	jhash (0xBBB26172)
	arguments {
		Ped "ped",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Makes the ped ragdoll like when falling from a great height
</summary>
	]]

native "REQUEST_WAYPOINT_RECORDING"
	hash "0x9EEFB62EB27B5792"
	jhash (0xAFABFB5D)
	arguments {
		charPtr "name",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/Tp0XpBMN
		For a full list of the points, see here: goo.gl/wIH0vn

		Max number of loaded recordings is 32.
</summary>
	]]

native "GET_IS_WAYPOINT_RECORDING_LOADED"
	hash "0xCB4E8BE8A0063C5D"
	jhash (0x87125F5D)
	arguments {
		charPtr "name",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/Tp0XpBMN
</summary>
	]]

native "REMOVE_WAYPOINT_RECORDING"
	hash "0xFF1B8B4AA1C25DC8"
	jhash (0x624530B0)
	arguments {
		charPtr "name",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/Tp0XpBMN
</summary>
	]]

native "WAYPOINT_RECORDING_GET_NUM_POINTS"
	hash "0x5343532C01A07234"
	jhash (0xF5F9B71E)
	arguments {
		charPtr "name",

		intPtr "points",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/Tp0XpBMN
		For a full list of the points, see here: goo.gl/wIH0vn
</summary>
	]]

native "WAYPOINT_RECORDING_GET_COORD"
	hash "0x2FB897405C90B361"
	jhash (0x19266913)
	arguments {
		charPtr "name",

		int "point",

		Vector3Ptr "coord",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/Tp0XpBMN
		For a full list of the points, see here: goo.gl/wIH0vn
</summary>
	]]

native "WAYPOINT_RECORDING_GET_SPEED_AT_POINT"
	hash "0x005622AEBC33ACA9"
	jhash (0xC765633A)
	arguments {
		charPtr "name",

		int "point",
	}
	ns "BRAIN"
	returns	"float"

native "WAYPOINT_RECORDING_GET_CLOSEST_WAYPOINT"
	hash "0xB629A298081F876F"
	jhash (0xC4CD35AF)
	arguments {
		charPtr "name",

		float "x",

		float "y",

		float "z",

		intPtr "point",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/Tp0XpBMN
		For a full list of the points, see here: goo.gl/wIH0vn
</summary>
	]]

native "TASK_FOLLOW_WAYPOINT_RECORDING"
	hash "0x0759591819534F7B"
	jhash (0xADF9904D)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",
	}
	ns "BRAIN"
	returns	"void"

native "IS_WAYPOINT_PLAYBACK_GOING_ON_FOR_PED"
	hash "0xE03B3F2D3DC59B64"
	jhash (0x85B7725F)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"BOOL"

native "GET_PED_WAYPOINT_PROGRESS"
	hash "0x2720AAA75001E094"
	jhash (0x3595B104)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"int"
	doc [[!
<summary>
		Returns the progress percent to current waypoint.
</summary>
	]]

native "GET_PED_WAYPOINT_DISTANCE"
	hash "0xE6A877C64CAF1BC5"
	jhash (0x084B35B0)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"float"

native "SET_PED_WAYPOINT_ROUTE_OFFSET"
	hash "0xED98E10B0AFCE4B4"
	jhash (0xF867F747)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "BRAIN"
	returns	"Any"

native "GET_WAYPOINT_DISTANCE_ALONG_ROUTE"
	hash "0xA5B769058763E497"
	jhash (0xE8422AC4)
	arguments {
		charPtr "p0",

		int "p1",
	}
	ns "BRAIN"
	returns	"float"

native "WAYPOINT_PLAYBACK_GET_IS_PAUSED"
	hash "0x701375A7D43F01CB"
	jhash (0xA6BB5717)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"BOOL"

native "WAYPOINT_PLAYBACK_PAUSE"
	hash "0x0F342546AA06FED5"
	jhash (0xFE39ECF8)
	arguments {
		Any "p0",

		BOOL "p1",

		BOOL "p2",
	}
	ns "BRAIN"
	returns	"void"

native "WAYPOINT_PLAYBACK_RESUME"
	hash "0x244F70C84C547D2D"
	jhash (0x50F392EF)
	arguments {
		Any "p0",

		BOOL "p1",

		Any "p2",

		Any "p3",
	}
	ns "BRAIN"
	returns	"void"

native "WAYPOINT_PLAYBACK_OVERRIDE_SPEED"
	hash "0x7D7D2B47FA788E85"
	jhash (0x23E6BA96)
	arguments {
		Any "p0",

		float "p1",

		BOOL "p2",
	}
	ns "BRAIN"
	returns	"void"

native "WAYPOINT_PLAYBACK_USE_DEFAULT_SPEED"
	hash "0x6599D834B12D0800"
	jhash (0x1BBB2CAC)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"void"

native "USE_WAYPOINT_RECORDING_AS_ASSISTED_MOVEMENT_ROUTE"
	hash "0x5A353B8E6B1095B5"
	jhash (0x4DFD5FEC)
	arguments {
		AnyPtr "p0",

		BOOL "p1",

		float "p2",

		float "p3",
	}
	ns "BRAIN"
	returns	"void"

native "WAYPOINT_PLAYBACK_START_AIMING_AT_PED"
	hash "0x20E330937C399D29"
	jhash (0x75E60CF6)
	arguments {
		Any "p0",

		Any "p1",

		BOOL "p2",
	}
	ns "BRAIN"
	returns	"void"

native "WAYPOINT_PLAYBACK_START_AIMING_AT_COORD"
	hash "0x8968400D900ED8B3"
	jhash (0xF120A34E)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		BOOL "p4",
	}
	ns "BRAIN"
	returns	"void"

native "0xE70BA7B90F8390DC"
	hash "0xE70BA7B90F8390DC"
	arguments {
		Any "p0",

		Any "p1",

		BOOL "p2",

		Any "p3",
	}
	ns "BRAIN"
	returns	"void"

native "WAYPOINT_PLAYBACK_START_SHOOTING_AT_COORD"
	hash "0x057A25CFCC9DB671"
	jhash (0xCDDB44D5)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		BOOL "p4",

		Any "p5",
	}
	ns "BRAIN"
	returns	"void"

native "WAYPOINT_PLAYBACK_STOP_AIMING_OR_SHOOTING"
	hash "0x47EFA040EBB8E2EA"
	jhash (0x6D7CF40C)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"void"

native "ASSISTED_MOVEMENT_REQUEST_ROUTE"
	hash "0x817268968605947A"
	jhash (0x48262EDA)
	arguments {
		charPtr "route",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Routes: "1_FIBStairs", "2_FIBStairs", "3_FIBStairs", "4_FIBStairs", "5_FIBStairs", "5_TowardsFire", "6a_FIBStairs", "7_FIBStairs", "8_FIBStairs", "Aprtmnt_1", "AssAfterLift", "ATM_1", "coroner2", "coroner_stairs", "f5_jimmy1", "fame1", "family5b", "family5c", "Family5d", "family5d", "FIB_Glass1", "FIB_Glass2", "FIB_Glass3", "finaBroute1A", "finalb1st", "finalB1sta", "finalbround", "finalbroute2", "Hairdresser1", "jan_foyet_ft_door", "Jo_3", "Lemar1", "Lemar2", "mansion_1", "Mansion_1", "pols_1", "pols_2", "pols_3", "pols_4", "pols_5", "pols_6", "pols_7", "pols_8", "Pro_S1", "Pro_S1a", "Pro_S2", "Towards_case", "trev_steps", "tunrs1", "tunrs2", "tunrs3", "Wave01457s"
</summary>
	]]

native "ASSISTED_MOVEMENT_REMOVE_ROUTE"
	hash "0x3548536485DD792B"
	jhash (0xB3CEC06F)
	arguments {
		charPtr "route",
	}
	ns "BRAIN"
	returns	"void"

native "ASSISTED_MOVEMENT_IS_ROUTE_LOADED"
	hash "0x60F9A4393A21F741"
	jhash (0x79B067AF)
	arguments {
		charPtr "route",
	}
	ns "BRAIN"
	returns	"BOOL"

native "ASSISTED_MOVEMENT_SET_ROUTE_PROPERTIES"
	hash "0xD5002D78B7162E1B"
	jhash (0x01CAAFCC)
	arguments {
		charPtr "route",

		int "props",
	}
	ns "BRAIN"
	returns	"void"

native "ASSISTED_MOVEMENT_OVERRIDE_LOAD_DISTANCE_THIS_FRAME"
	hash "0x13945951E16EF912"
	jhash (0x8FB923EC)
	arguments {
		float "dist",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_VEHICLE_FOLLOW_WAYPOINT_RECORDING"
	hash "0x3123FAA6DB1CF7ED"
	jhash (0x959818B6)
	arguments {
		Ped "ped",

		Vehicle "vehicle",

		charPtr "WPRecording",

		int "p3",

		int "p4",

		int "p5",

		int "p6",

		float "p7",

		BOOL "p8",

		float "p9",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		task_vehicle_follow_waypoint_recording(Ped p0, Vehicle p1, string p2, int p3, int p4, int p5, int p6, float.x p7, float.Y p8, float.Z p9, bool p10, int p11)

		p2 = Waypoint recording string (found in update\update.rpf\x64\levels\gta5\waypointrec.rpf
		p3 = 786468
		p4 = 0
		p5 = 16
		p6 = -1 (angle?)
		p7/8/9 = usually v3.zero
		p10 = bool (repeat?)
		p11 = 1073741824
</summary>
	]]

native "IS_WAYPOINT_PLAYBACK_GOING_ON_FOR_VEHICLE"
	hash "0xF5134943EA29868C"
	jhash (0x80DD15DB)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"BOOL"

native "GET_VEHICLE_WAYPOINT_PROGRESS"
	hash "0x9824CFF8FC66E159"
	jhash (0xD3CCF64E)
	arguments {
		Vehicle "vehicle",
	}
	ns "BRAIN"
	returns	"int"

native "GET_VEHICLE_WAYPOINT_TARGET_POINT"
	hash "0x416B62AC8B9E5BBD"
	jhash (0x81049608)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"Any"

native "VEHICLE_WAYPOINT_PLAYBACK_PAUSE"
	hash "0x8A4E6AC373666BC5"
	jhash (0x7C00B415)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"void"

native "VEHICLE_WAYPOINT_PLAYBACK_RESUME"
	hash "0xDC04FCAA7839D492"
	jhash (0xBEB14C82)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"void"

native "VEHICLE_WAYPOINT_PLAYBACK_USE_DEFAULT_SPEED"
	hash "0x5CEB25A7D2848963"
	jhash (0x923C3AA4)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"void"

native "VEHICLE_WAYPOINT_PLAYBACK_OVERRIDE_SPEED"
	hash "0x121F0593E0A431D7"
	jhash (0xBE1E7BB4)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS"
	hash "0x90D2156198831D69"
	jhash (0x1B54FB6B)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		I cant believe I have to define this, this is one of the best natives.

		It makes the ped ignore basically all shocking events around it. Occasionally the ped may comment or gesture, but other than that they just continue their daily activities. This includes shooting and wounding the ped. And - most importantly - they do not flee.

		Since it is a task, every time the native is called the ped will stop for a moment. 
</summary>
	]]

native "TASK_FORCE_MOTION_STATE"
	hash "0x4F056E1AFFEF17AB"
	jhash (0xCAD2EF77)
	arguments {
		Ped "ped",

		Hash "state",

		BOOL "p2",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		p2 always false

		[30/03/2017] ins1de :

		See dev-c.com/nativedb/func/info/f28965d04f570dca


</summary>
	]]

native "_TASK_MOVE_NETWORK"
	hash "0x2D537BA194896636"
	jhash (0x6F5D215F)
	arguments {
		Ped "ped",

		charPtr "task",

		float "multiplier",

		BOOL "p3",

		charPtr "animDict",

		int "flags",
	}
	alias "0x2D537BA194896636"
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Example:
		AI::_2D537BA194896636(PLAYER::PLAYER_PED_ID(), "arm_wrestling_sweep_paired_a_rev3", 0.0, 1, "mini@arm_wrestling", 0);
</summary>
	]]

native "_TASK_MOVE_NETWORK_ADVANCED"
	hash "0xD5B35BEA41919ACB"
	jhash (0x71A5C5DB)
	arguments {
		Ped "ped",

		charPtr "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		Any "p8",

		float "p9",

		BOOL "p10",

		charPtr "animDict",

		int "flags",
	}
	alias "0xD5B35BEA41919ACB"
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Example:
		AI::_D5B35BEA41919ACB(PLAYER::PLAYER_PED_ID(), "minigame_tattoo_michael_parts", 324.13, 181.29, 102.6, 0.0, 0.0, 22.32, 2, 0, 0, 0, 0);
</summary>
	]]

native "0x921CE12C489C4C41"
	hash "0x921CE12C489C4C41"
	jhash (0x902656EB)
	arguments {
		int "PlayerID",
	}
	ns "BRAIN"
	returns	"BOOL"

native "0x30ED88D5E0C56A37"
	hash "0x30ED88D5E0C56A37"
	jhash (0x92FDBAE6)
	arguments {
		Any "p0",
	}
	ns "BRAIN"
	returns	"BOOL"

native "0xD01015C7316AE176"
	hash "0xD01015C7316AE176"
	jhash (0x885724DE)
	arguments {
		Ped "ped",

		charPtr "p1",
	}
	ns "BRAIN"
	returns	"Any"

native "0xAB13A5565480B6D9"
	hash "0xAB13A5565480B6D9"
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "BRAIN"
	returns	"Any"

native "0x717E4D1F2048376D"
	hash "0x717E4D1F2048376D"
	jhash (0x96C0277B)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"charPtr"
	doc [[!
<summary>
		If the function fails, returns "Unknown".

		Could be task (sequence) name. Needs more research.
</summary>
	]]

native "0xD5BB4025AE449A4E"
	hash "0xD5BB4025AE449A4E"
	jhash (0xA79BE783)
	arguments {
		Ped "ped",

		charPtr "p1",

		float "p2",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		p0 - PLAYER::PLAYER_PED_ID();
		p1 - "Phase", "Wobble", "x_axis","y_axis","introphase","speed".
		p2 - From what i can see it goes up to 1f (maybe).

		-LcGamingHD

		Example: AI::_D5BB4025AE449A4E(PLAYER::PLAYER_PED_ID(), "Phase", 0.5);
</summary>
	]]

native "0xB0A6CFD2C69C1088"
	hash "0xB0A6CFD2C69C1088"
	jhash (0xF3538041)
	arguments {
		Ped "ped",

		charPtr "p1",

		BOOL "p2",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Examples:
		AI::_B0A6CFD2C69C1088(PLAYER::PLAYER_PED_ID(), "isFirstPerson", 0);
		AI::_B0A6CFD2C69C1088(PLAYER::PLAYER_PED_ID(), "isFirstPerson", 1);
		AI::_B0A6CFD2C69C1088(PLAYER::PLAYER_PED_ID(), "isBlocked", sub_179027());
</summary>
	]]

native "0xA7FFBA498E4AAF67"
	hash "0xA7FFBA498E4AAF67"
	jhash (0x1EBB6F3D)
	arguments {
		Ped "ped",

		charPtr "p1",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		Found in scripts:

		if (AI::_A7FFBA498E4AAF67(l_9BC, "Run")) {
		if (AI::_A7FFBA498E4AAF67(l_9BC, "Escape")) {
</summary>
	]]

native "0xB4F47213DF45A64C"
	hash "0xB4F47213DF45A64C"
	jhash (0x72FA5EF2)
	arguments {
		Ped "ped",

		charPtr "p1",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_MOVE_BLEND_RATIO_STILL"
	hash "0x349CE7B56DAFD95C"
	jhash (0xE9DAF877)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_MOVE_BLEND_RATIO_WALKING"
	hash "0xF133BBBE91E1691F"
	jhash (0xD21639A8)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_MOVE_BLEND_RATIO_RUNNING"
	hash "0xD4D8636C0199A939"
	jhash (0xE76A2353)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_MOVE_BLEND_RATIO_SPRINTING"
	hash "0x24A2AD74FA9814E2"
	jhash (0xDD616893)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_PED_STILL"
	hash "0xAC29253EEF8F0180"
	jhash (0x09E3418D)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_PED_WALKING"
	hash "0xDE4C184B2B9B071A"
	jhash (0x4B865C4A)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_PED_RUNNING"
	hash "0xC5286FFC176F28A2"
	jhash (0xE9A5578F)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_PED_SPRINTING"
	hash "0x57E457CD2C0FC168"
	jhash (0x4F3E0633)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_PED_STRAFING"
	hash "0xE45B7F222DE47E09"
	jhash (0xEFEED13C)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		What's strafing?
</summary>
	]]

native "TASK_SYNCHRONIZED_SCENE"
	hash "0xEEA929141F699854"
	jhash (0x4F217E7B)
	arguments {
		Ped "ped",

		int "scene",

		charPtr "animDictionary",

		charPtr "animationName",

		float "speed",

		float "speedMultiplier",

		int "duration",

		int "flag",

		float "playbackRate",

		Any "p9",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		 AI::TASK_SYNCHRONIZED_SCENE(ped, scene, "creatures@rottweiler@in_vehicle@std_car", "get_in", 1000.0, -8.0, 4, 0, 0x447a0000, 0);

		Animations List : www.ls-multiplayer.com/dev/index.php?section=3
</summary>
	]]

native "TASK_SWEEP_AIM_ENTITY"
	hash "0x2047C02158D6405A"
	jhash (0x4D210467)
	arguments {
		Ped "ped",

		charPtr "anim",

		charPtr "p2",

		charPtr "p3",

		charPtr "p4",

		int "p5",

		Vehicle "vehicle",

		float "p7",

		float "p8",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		This function is called on peds in vehicles.

		anim: animation name
		p2, p3, p4: "sweep_low", "sweep_med" or "sweep_high"
		p5: no idea what it does but is usually -1
</summary>
	]]

native "UPDATE_TASK_SWEEP_AIM_ENTITY"
	hash "0xE4973DBDBE6E44B3"
	jhash (0xF65F0F4F)
	arguments {
		Ped "ped",

		Entity "entity",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_SWEEP_AIM_POSITION"
	hash "0x7AFE8FDC10BC07D2"
	jhash (0x1683FE66)
	arguments {
		Any "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",

		AnyPtr "p4",

		Any "p5",

		float "p6",

		float "p7",

		float "p8",

		float "p9",

		float "p10",
	}
	ns "BRAIN"
	returns	"void"

native "UPDATE_TASK_SWEEP_AIM_POSITION"
	hash "0xBB106883F5201FC4"
	jhash (0x6345EC80)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "BRAIN"
	returns	"void"

native "TASK_ARREST_PED"
	hash "0xF3B9A78A178572B1"
	jhash (0xBC0F153D)
	arguments {
		Ped "ped",

		Ped "target",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Example from "me_amanda1.ysc.c4":
		AI::TASK_ARREST_PED(l_19F /* This is a Ped */ , PLAYER::PLAYER_PED_ID());

		Example from "armenian1.ysc.c4":
		if (!PED::IS_PED_INJURED(l_B18[0/*1*/])) {
		    AI::TASK_ARREST_PED(l_B18[0/*1*/], PLAYER::PLAYER_PED_ID());
		}

		I would love to have time to experiment to see if a player Ped can arrest another Ped. Might make for a good cop mod.


		Looks like only the player can be arrested this way. Peds react and try to arrest you if you task them, but the player charater doesn't do anything if tasked to arrest another ped.
</summary>
	]]

native "IS_PED_RUNNING_ARREST_TASK"
	hash "0x3DC52677769B4AE0"
	jhash (0x6942DB7A)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"

native "IS_PED_BEING_ARRESTED"
	hash "0x90A09F3A45FED688"
	jhash (0x5FF6C2ED)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		This function is hard-coded to always return 0.
</summary>
	]]

native "UNCUFF_PED"
	hash "0x67406F2C8F87FC4F"
	jhash (0xA23A1D61)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"void"

native "IS_PED_CUFFED"
	hash "0x74E559B3BC910685"
	jhash (0x511CE741)
	arguments {
		Ped "ped",
	}
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		l
</summary>
	]]

native "ADD_SCRIPT_TO_RANDOM_PED"
	hash "0x4EE5367468A65CCC"
	jhash (0xECC76C3D)
	arguments {
		charPtr "name",

		Hash "model",

		float "p2",

		float "p3",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		BRAIN::ADD_SCRIPT_TO_RANDOM_PED("pb_prostitute", ${s_f_y_hooker_01}, 100, 0);



		-----

		Hardcoded to not work in Multiplayer.
		------
		Which I'm sure can easily be bypassed by nop'ing the branch preventing it from working if you are in multiplayer lol. Which would still be pointless since you don't need this to make peds do what you wish.
</summary>
	]]

native "REGISTER_OBJECT_SCRIPT_BRAIN"
	hash "0x0BE84C318BA6EC22"
	jhash (0xB6BCC608)
	arguments {
		charPtr "scriptName",

		Hash "objectName",

		int "p2",

		float "p3",

		int "p4",

		int "p5",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Registers a script for any object with a specific model hash.

		BRAIN::REGISTER_OBJECT_SCRIPT_BRAIN("ob_telescope", ${prop_telescope_01}, 100, 4.0, -1, 9);


</summary>
	]]

native "IS_OBJECT_WITHIN_BRAIN_ACTIVATION_RANGE"
	hash "0xCCBA154209823057"
	jhash (0xBA4CAA56)
	arguments {
		Object "object",
	}
	ns "BRAIN"
	returns	"BOOL"

native "REGISTER_WORLD_POINT_SCRIPT_BRAIN"
	hash "0x3CDC7136613284BD"
	jhash (0x725D91F7)
	arguments {
		AnyPtr "p0",

		float "p1",

		Any "p2",
	}
	ns "BRAIN"
	returns	"void"

native "IS_WORLD_POINT_WITHIN_BRAIN_ACTIVATION_RANGE"
	hash "0xC5042CC6F5E3D450"
	jhash (0x2CF305A0)
	ns "BRAIN"
	returns	"BOOL"
	doc [[!
<summary>
		Gets whether the world point the calling script is registered to is within desired range of the player.
</summary>
	]]

native "ENABLE_SCRIPT_BRAIN_SET"
	hash "0x67AA4D73F0CFA86B"
	jhash (0x2765919F)
	arguments {
		int "brainSet",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		#4
</summary>
	]]

native "DISABLE_SCRIPT_BRAIN_SET"
	hash "0x14D8518E9760F08F"
	jhash (0xFBD13FAD)
	arguments {
		int "brainSet",
	}
	ns "BRAIN"
	returns	"void"

native "0x0B40ED49D7D6FF84"
	hash "0x0B40ED49D7D6FF84"
	jhash (0x19B27825)
	ns "BRAIN"
	returns	"void"

native "0x4D953DF78EBF8158"
	hash "0x4D953DF78EBF8158"
	jhash (0xF3A3AB08)
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Something like flush_all_scripts 

		Most of time comes after NETWORK_END_TUTORIAL_SESSION() or before TERMINATE_THIS_THREAD()
</summary>
	]]

native "0x6D6840CEE8845831"
	hash "0x6D6840CEE8845831"
	jhash (0x949FE53E)
	arguments {
		charPtr "action",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Possible values:

		act_cinema
		am_mp_carwash_launch
		am_mp_carwash_control
		am_mp_property_ext
		chop
		fairgroundHub
		launcher_BasejumpHeli
		launcher_BasejumpPack
		launcher_CarWash
		launcher_golf
		launcher_Hunting_Ambient
		launcher_MrsPhilips
		launcher_OffroadRacing
		launcher_pilotschool
		launcher_Racing
		launcher_rampage
		launcher_rampage
		launcher_range
		launcher_stunts
		launcher_stunts
		launcher_tennis
		launcher_Tonya
		launcher_Triathlon
		launcher_Yoga
		ob_mp_bed_low
		ob_mp_bed_med
</summary>
	]]

native "0x6E91B04E08773030"
	hash "0x6E91B04E08773030"
	jhash (0x29CE8BAA)
	arguments {
		charPtr "action",
	}
	ns "BRAIN"
	returns	"void"
	doc [[!
<summary>
		Looks like a cousin of above function _6D6840CEE8845831 as it was found among them. Must be similar

		Here are possible values of argument - 

		"ob_tv"
		"launcher_Darts"
</summary>
	]]

native "GET_ALLOCATED_STACK_SIZE"
	hash "0x8B3CA62B1EF19B62"
	jhash (0x4E9CA30A)
	ns "MISC"
	returns	"int"

native "_GET_FREE_STACK_SLOTS_COUNT"
	hash "0xFEAD16FC8F9DFC0F"
	jhash (0x11A178B8)
	arguments {
		int "threadId",
	}
	ns "MISC"
	returns	"int"

native "SET_RANDOM_SEED"
	hash "0x444D98F98C11F3EC"
	jhash (0xDB3FEB5C)
	arguments {
		int "time",
	}
	ns "MISC"
	returns	"void"

native "SET_TIME_SCALE"
	hash "0x1D408577D440E81E"
	jhash (0xA7F84694)
	arguments {
		float "time",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Maximum value is 1.
		At a value of 0 the game will still run at a minimum time scale.

		Slow Motion 1: 0.6
		Slow Motion 2: 0.4
		Slow Motion 3: 0.2
</summary>
	]]

native "SET_MISSION_FLAG"
	hash "0xC4301E5121A0ED73"
	jhash (0x57592D52)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		If true, the player can't save the game. 


		If the parameter is true, sets the mission flag to true, if the parameter is false, the function does nothing at all.

		^ also, if the mission flag is already set, the function does nothing at all
</summary>
	]]

native "GET_MISSION_FLAG"
	hash "0xA33CDCCDA663159E"
	jhash (0x95115F97)
	ns "MISC"
	returns	"BOOL"

native "SET_RANDOM_EVENT_FLAG"
	hash "0x971927086CFD2158"
	jhash (0xA77F31E8)
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		If the parameter is true, sets the random event flag to true, if the parameter is false, the function does nothing at all.
		Does nothing if the mission flag is set.
</summary>
	]]

native "GET_RANDOM_EVENT_FLAG"
	hash "0xD2D57F1D764117B1"
	jhash (0x794CC92C)
	ns "MISC"
	returns	"Any"

native "_GET_GLOBAL_CHAR_BUFFER"
	hash "0x24DA7D7667FD7B09"
	alias "0x24DA7D7667FD7B09"
	ns "MISC"
	returns	"charPtr"
	doc [[!
<summary>
		it returns a reference to an empty string, the same empty string that's used by 1687 internal gta functions.   if it was used in a script (and i cannot find an instance of it being used), it would be as the source for a StringCopy or somesuch.
</summary>
	]]

native "0x4DCDF92BF64236CD"
	hash "0x4DCDF92BF64236CD"
	arguments {
		charPtr "p0",

		charPtr "p1",
	}
	ns "MISC"
	returns	"void"

native "0x31125FD509D9043F"
	hash "0x31125FD509D9043F"
	arguments {
		AnyPtr "p0",
	}
	ns "MISC"
	returns	"void"

native "0xEBD3205A207939ED"
	hash "0xEBD3205A207939ED"
	arguments {
		AnyPtr "p0",
	}
	ns "MISC"
	returns	"void"

native "0x97E7E2C04245115B"
	hash "0x97E7E2C04245115B"
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"void"

native "0xEB078CA2B5E82ADD"
	hash "0xEB078CA2B5E82ADD"
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "MISC"
	returns	"void"

native "0x703CC7F60CBB2B57"
	hash "0x703CC7F60CBB2B57"
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"void"

native "0x8951EB9C6906D3C8"
	hash "0x8951EB9C6906D3C8"
	ns "MISC"
	returns	"void"

native "0xBA4B8D83BDC75551"
	hash "0xBA4B8D83BDC75551"
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"void"

native "0xE8B9C0EC9E183F35"
	hash "0xE8B9C0EC9E183F35"
	ns "MISC"
	returns	"BOOL"

native "0x65D2EBB47E1CEC21"
	hash "0x65D2EBB47E1CEC21"
	arguments {
		BOOL "p0",
	}
	ns "MISC"
	returns	"void"

native "0x6F2135B6129620C1"
	hash "0x6F2135B6129620C1"
	jhash (0x8B2DE971)
	arguments {
		BOOL "p0",
	}
	ns "MISC"
	returns	"void"

native "0x8D74E26F54B4E5C3"
	hash "0x8D74E26F54B4E5C3"
	jhash (0xE77199F7)
	arguments {
		charPtr "p0",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		GAMEPLAY::_8D74E26F54B4E5C3("");
</summary>
	]]

native "0xB335F761606DB47C"
	hash "0xB335F761606DB47C"
	arguments {
		AnyPtr "p1",

		AnyPtr "p2",

		Any "p3",

		BOOL "p4",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		This line found 48 times in the scripts:

		GAMEPLAY::_B335F761606DB47C(&amp;v_4, &amp;v_7, a_0, v_A);
</summary>
	]]

native "GET_PREV_WEATHER_TYPE_HASH_NAME"
	hash "0x564B884A05EC45A3"
	jhash (0xA8171E9E)
	alias "_GET_PREV_WEATHER_TYPE"
	ns "MISC"
	returns	"Hash"
	doc [[!
<summary>
		Returns current weather name hash
</summary>
	]]

native "GET_NEXT_WEATHER_TYPE_HASH_NAME"
	hash "0x711327CD09C8F162"
	jhash (0x353E8056)
	alias "_GET_NEXT_WEATHER_TYPE"
	ns "MISC"
	returns	"Hash"
	doc [[!
<summary>
		Returns weather name hash
</summary>
	]]

native "IS_PREV_WEATHER_TYPE"
	hash "0x44F28F86433B10A9"
	jhash (0x250ADA61)
	arguments {
		charPtr "weatherType",
	}
	ns "MISC"
	returns	"BOOL"

native "IS_NEXT_WEATHER_TYPE"
	hash "0x2FAA3A30BEC0F25D"
	jhash (0x99CB167F)
	arguments {
		charPtr "weatherType",
	}
	ns "MISC"
	returns	"BOOL"

native "SET_WEATHER_TYPE_PERSIST"
	hash "0x704983DF373B198F"
	jhash (0xC6C04C75)
	arguments {
		charPtr "weatherType",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		The following weatherTypes are used in the scripts:
		"CLEAR"
		"EXTRASUNNY"
		"CLOUDS"
		"OVERCAST"
		"RAIN"
		"CLEARING"
		"THUNDER"
		"SMOG"
		"FOGGY"
		"XMAS"
		"SNOWLIGHT"
		"BLIZZARD"
</summary>
	]]

native "SET_WEATHER_TYPE_NOW_PERSIST"
	hash "0xED712CA327900C8A"
	jhash (0xC869FE97)
	arguments {
		charPtr "weatherType",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		The following weatherTypes are used in the scripts:
		"CLEAR"
		"EXTRASUNNY"
		"CLOUDS"
		"OVERCAST"
		"RAIN"
		"CLEARING"
		"THUNDER"
		"SMOG"
		"FOGGY"
		"XMAS"
		"SNOWLIGHT"
		"BLIZZARD"
</summary>
	]]

native "SET_WEATHER_TYPE_NOW"
	hash "0x29B487C359E19889"
	jhash (0x361E9EAC)
	arguments {
		charPtr "weatherType",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		The following weatherTypes are used in the scripts:
		"CLEAR"
		"EXTRASUNNY"
		"CLOUDS"
		"OVERCAST"
		"RAIN"
		"CLEARING"
		"THUNDER"
		"SMOG"
		"FOGGY"
		"XMAS"
		"SNOWLIGHT"
		"BLIZZARD"
</summary>
	]]

native "_SET_WEATHER_TYPE_OVER_TIME"
	hash "0xFB5045B7C42B75BF"
	jhash (0x386F0D25)
	arguments {
		charPtr "weatherType",

		float "time",
	}
	ns "MISC"
	returns	"void"

native "SET_RANDOM_WEATHER_TYPE"
	hash "0x8B05F884CF7E8020"
	jhash (0xE7AA1BC9)
	ns "MISC"
	returns	"void"

native "CLEAR_WEATHER_TYPE_PERSIST"
	hash "0xCCC39339BEF76CF5"
	jhash (0x6AB757D8)
	ns "MISC"
	returns	"void"

native "_GET_WEATHER_TYPE_TRANSITION"
	hash "0xF3BBE884A14BB413"
	jhash (0x9A5C1D56)
	arguments {
		HashPtr "weatherType1",

		HashPtr "weatherType2",

		floatPtr "percentWeather2",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		changed any --&gt; hash
		progress_or_time --&gt; percentWeather2, is not time but percent of the 2nd weather (0-1).
		weatherType1 is same as GAMEPLAY::GET_PREV_WEATHER_TYPE_HASH_NAME()
		and weatherType 2 GAMEPLAY::GET_NEXT_WEATHER_TYPE_HASH_NAME()
		-QuantFC


</summary>
	]]

native "_SET_WEATHER_TYPE_TRANSITION"
	hash "0x578C752848ECFA0C"
	jhash (0x5CA74040)
	arguments {
		Hash "weatherType1",

		Hash "weatherType2",

		float "percentWeather2",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Mixes two weather types. If percentWeather2 is set to 0.0f, then the weather will be entirely of weatherType1, if it is set to 1.0f it will be entirely of weatherType2. If it's set somewhere in between, there will be a mixture of weather behaviors. To test, try this in the RPH console, and change the float to different values between 0 and 1:

		execute "NativeFunction.Natives.x578C752848ECFA0C(Game.GetHashKey(""RAIN""), Game.GetHashKey(""SMOG""), 0.50f);

		Note that unlike most of the other weather natives, this native takes the hash of the weather name, not the plain string. These are the weather names and their hashes:

		CLEAR	0x36A83D84
		EXTRASUNNY	0x97AA0A79
		CLOUDS	0x30FDAF5C
		OVERCAST	0xBB898D2D
		RAIN	0x54A69840
		CLEARING	0x6DB1A50D
		THUNDER	0xB677829F
		SMOG	0x10DCF4B5
		FOGGY	0xAE737644
		XMAS	0xAAC9C895
		SNOWLIGHT	0x23FB812B
		BLIZZARD	0x27EA2814





		/* OLD INVALID INFO BELOW */
		Not tested. Based purely on disassembly. Instantly sets the weather to sourceWeather, then transitions to targetWeather over the specified transitionTime in seconds.

		If an invalid hash is specified for sourceWeather, the current weather type will be used.
		If an invalid hash is specified for targetWeather, the next weather type will be used.
		If an invalid hash is specified for both sourceWeather and targetWeather, the function just changes the transition time of the current transition.
</summary>
	]]

native "SET_OVERRIDE_WEATHER"
	hash "0xA43D5C6FE51ADBEF"
	jhash (0xD9082BB5)
	arguments {
		charPtr "weatherType",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Appears to have an optional bool parameter that is unused in the scripts.

		If you pass true, something will be set to zero.
</summary>
	]]

native "CLEAR_OVERRIDE_WEATHER"
	hash "0x338D2E3477711050"
	jhash (0x7740EA4E)
	ns "MISC"
	returns	"void"

native "0xB8F87EAD7533B176"
	hash "0xB8F87EAD7533B176"
	jhash (0x625181DC)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0xC3EAD29AB273ECE8"
	hash "0xC3EAD29AB273ECE8"
	jhash (0xBEBBFDC8)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0xA7A1127490312C36"
	hash "0xA7A1127490312C36"
	jhash (0x6926AB03)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0x31727907B2C43C55"
	hash "0x31727907B2C43C55"
	jhash (0xD447439D)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0x405591EC8FD9096D"
	hash "0x405591EC8FD9096D"
	jhash (0x584E9C59)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0xF751B16FB32ABC1D"
	hash "0xF751B16FB32ABC1D"
	jhash (0x5656D578)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0xB3E6360DDE733E82"
	hash "0xB3E6360DDE733E82"
	jhash (0x0DE40C28)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0x7C9C0B1EEB1F9072"
	hash "0x7C9C0B1EEB1F9072"
	jhash (0x98C9138B)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0x6216B116083A7CB4"
	hash "0x6216B116083A7CB4"
	jhash (0xFB1A9CDE)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0x9F5E6BB6B34540DA"
	hash "0x9F5E6BB6B34540DA"
	jhash (0x1C0CAE89)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0xB9854DFDE0D833D6"
	hash "0xB9854DFDE0D833D6"
	jhash (0x4671AC2E)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0xC54A08C85AE4D410"
	hash "0xC54A08C85AE4D410"
	jhash (0xDA02F415)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		This seems to edit the water wave, intensity around your current location.

		0.0f = Normal
		1.0f = So Calm and Smooth, a boat will stay still.
		3.0f = Really Intense.
</summary>
	]]

native "0xA8434F1DFF41D6E7"
	hash "0xA8434F1DFF41D6E7"
	jhash (0x5F3DDEC0)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "0xC3C221ADDDE31A11"
	hash "0xC3C221ADDDE31A11"
	jhash (0x63A89684)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "SET_WIND"
	hash "0xAC3A74E8384A9919"
	jhash (0xC6294698)
	arguments {
		float "speed",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Sets the the raw wind speed value.
</summary>
	]]

native "SET_WIND_SPEED"
	hash "0xEE09ECEDBABE47FC"
	jhash (0x45705F94)
	arguments {
		float "speed",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Using this native will clamp the wind speed value to a range of 0.0- 12.0. Using SET_WIND sets the same value but without the restriction.
</summary>
	]]

native "GET_WIND_SPEED"
	hash "0xA8CF1CC0AFCD3F12"
	jhash (0x098F0F3C)
	ns "MISC"
	returns	"float"

native "SET_WIND_DIRECTION"
	hash "0xEB0F4468467B4528"
	jhash (0x381AEEE9)
	arguments {
		float "direction",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		This is NOT a heading. It's a FLOAT value from 0.0-7.0. Look at this image:
		i.imgur.com/FwVpGS6.png



		----------------------------

		This appears to be a heading, in radians (0-2*pi) -PNWParksFan
</summary>
	]]

native "GET_WIND_DIRECTION"
	hash "0x1F400FEF721170DA"
	jhash (0x89499A0D)
	ns "MISC"
	returns	"Vector3"

native "_SET_RAIN_FX_INTENSITY"
	hash "0x643E26EA6E024D92"
	arguments {
		float "intensity",
	}
	ns "MISC"
	returns	"void"

native "GET_RAIN_LEVEL"
	hash "0x96695E368AD855F3"
	jhash (0xC9F67F28)
	ns "MISC"
	returns	"AnyPtr"

native "GET_SNOW_LEVEL"
	hash "0xC5868A966E5BE3AE"
	jhash (0x1B09184F)
	ns "MISC"
	returns	"Any"

native "_CREATE_LIGHTNING_THUNDER"
	hash "0xF6062E089251C898"
	jhash (0xDF38165E)
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		creates single lightning+thunder at random position
</summary>
	]]

native "0x02DEAAC8F8EA7FE7"
	hash "0x02DEAAC8F8EA7FE7"
	arguments {
		charPtr "p0",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Found in the scripts:

		GAMEPLAY::_02DEAAC8F8EA7FE7("");
</summary>
	]]

native "0x11B56FBBF7224868"
	hash "0x11B56FBBF7224868"
	jhash (0x8727A4C5)
	arguments {
		charPtr "p0",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Found in the scripts:

		GAMEPLAY::_11B56FBBF7224868("CONTRAILS");
</summary>
	]]

native "_SET_CLOUD_HAT_TRANSITION"
	hash "0xFC4842A34657BFCB"
	jhash (0xED88FC61)
	arguments {
		charPtr "type",

		float "transitionTime",
	}
	ns "MISC"
	returns	"void"

native "0xA74802FB8D0B7814"
	hash "0xA74802FB8D0B7814"
	jhash (0xC9FA6E07)
	arguments {
		charPtr "p0",

		float "p1",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Called 4 times in the b617d scripts:
		GAMEPLAY::_A74802FB8D0B7814("CONTRAILS", 0);
</summary>
	]]

native "_CLEAR_CLOUD_HAT"
	hash "0x957E790EA1727B64"
	jhash (0x2D7787BC)
	ns "MISC"
	returns	"void"

native "_SET_CLOUD_HAT_OPACITY"
	hash "0xF36199225D6D8C86"
	arguments {
		float "opacity",
	}
	alias "0xF36199225D6D8C86"
	ns "MISC"
	returns	"void"

native "_GET_CLOUD_HAT_OPACITY"
	hash "0x20AC25E781AE4A84"
	alias "0x20AC25E781AE4A84"
	ns "MISC"
	returns	"float"

native "GET_GAME_TIMER"
	hash "0x9CD27B0045628463"
	jhash (0xA4EA0691)
	ns "MISC"
	returns	"int"

native "GET_FRAME_TIME"
	hash "0x15C40837039FFAF7"
	jhash (0x96374262)
	ns "MISC"
	returns	"float"

native "_GET_BENCHMARK_TIME"
	hash "0xE599A503B3837E1B"
	alias "0xE599A503B3837E1B"
	ns "MISC"
	returns	"float"

native "GET_FRAME_COUNT"
	hash "0xFC8202EFC642E6F2"
	jhash (0xB477A015)
	ns "MISC"
	returns	"int"

native "GET_RANDOM_FLOAT_IN_RANGE"
	hash "0x313CE5879CEB6FCD"
	jhash (0x0562C4D0)
	arguments {
		float "startRange",

		float "endRange",
	}
	ns "MISC"
	returns	"float"

native "GET_RANDOM_INT_IN_RANGE"
	hash "0xD53343AA4FB7DD28"
	jhash (0x4051115B)
	arguments {
		int "startRange",

		int "endRange",
	}
	ns "MISC"
	returns	"int"
	doc [[!
<summary>
		Another extremely useful native.

		You can use it simply like:
		if (GAMEPLAY::GET_RANDOM_INT_IN_RANGE(0, 2))


</summary>
	]]

native "GET_GROUND_Z_FOR_3D_COORD"
	hash "0xC906A7DAB05C8D2B"
	jhash (0xA1BFD5E0)
	arguments {
		float "x",

		float "y",

		float "z",

		floatPtr "groundZ",

		BOOL "unk",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Gets the ground elevation at the specified position. Note that if the specified position is below ground level, the function will output zero!

		x: Position on the X-axis to get ground elevation at.
		y: Position on the Y-axis to get ground elevation at.
		z: Position on the Z-axis to get ground elevation at.
		groundZ: The ground elevation at the specified position.
		unk: Nearly always 0, very rarely 1 in the scripts.
</summary>
	]]

native "_GET_GROUND_Z_COORD_WITH_OFFSETS"
	hash "0x8BDC7BFC57A81E76"
	jhash (0x64D91CED)
	arguments {
		float "x",

		float "y",

		float "z",

		floatPtr "groundZ",

		Vector3Ptr "offsets",
	}
	alias "0x8BDC7BFC57A81E76"
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		only documented to be continued...
</summary>
	]]

native "ASIN"
	hash "0xC843060B5765DCE7"
	jhash (0x998E5CAD)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"float"
	doc [[!
<summary>
		Returns arcsin value of p0.
</summary>
	]]

native "ACOS"
	hash "0x1D08B970013C34B6"
	jhash (0xF4038776)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"float"
	doc [[!
<summary>
		Returns arccos value of p0.
</summary>
	]]

native "TAN"
	hash "0x632106CC96E82E91"
	jhash (0xD320CE5E)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"float"
	doc [[!
<summary>
		Returns tangent value of p0.
</summary>
	]]

native "ATAN"
	hash "0xA9D1795CD5043663"
	jhash (0x7A03CC8E)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"float"
	doc [[!
<summary>
		Returns arctan value of p0.
</summary>
	]]

native "ATAN2"
	hash "0x8927CBF9D22261A4"
	jhash (0x2508AC81)
	arguments {
		float "p0",

		float "p1",
	}
	ns "MISC"
	returns	"float"

native "GET_DISTANCE_BETWEEN_COORDS"
	hash "0xF1B760881820C952"
	jhash (0xF698765E)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		BOOL "useZ",
	}
	ns "MISC"
	returns	"float"
	doc [[!
<summary>
		If useZ is false, only the 2D plane (X-Y) will be considered for calculating the distance.

		Consider using this faster native instead: SYSTEM::VDIST - DVIST always takes in consideration the 3D coordinates.
</summary>
	]]

native "GET_ANGLE_BETWEEN_2D_VECTORS"
	hash "0x186FC4BE848E1C92"
	jhash (0xDBF75E58)
	arguments {
		float "x1",

		float "y1",

		float "x2",

		float "y2",
	}
	ns "MISC"
	returns	"float"
	doc [[!
<summary>
		Returns the degree of angle between (x1, y1) and (x2, y2) lines in 2D coordinate system.
</summary>
	]]

native "GET_HEADING_FROM_VECTOR_2D"
	hash "0x2FFB6B224F4B2926"
	jhash (0xD209D52B)
	arguments {
		float "dx",

		float "dy",
	}
	ns "MISC"
	returns	"float"
	doc [[!
<summary>
		dx = x1 
		dy = y1 
</summary>
	]]

native "0x7F8F6405F4777AF6"
	hash "0x7F8F6405F4777AF6"
	jhash (0x89459F0A)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		BOOL "p9",
	}
	ns "MISC"
	returns	"float"

native "0x21C235BC64831E5A"
	hash "0x21C235BC64831E5A"
	jhash (0xCAECF37E)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		BOOL "p9",
	}
	ns "MISC"
	returns	"Vector3"

native "0xF56DFB7B61BE7276"
	hash "0xF56DFB7B61BE7276"
	jhash (0xC6CC812C)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		float "p9",

		float "p10",

		float "p11",

		AnyPtr "p12",
	}
	ns "MISC"
	returns	"BOOL"

native "SET_BIT"
	hash "0x933D6A9EEC1BACD0"
	jhash (0x4EFE7E6B)
	arguments {
		intPtr "address",

		int "offset",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		This sets bit [offset] of [address] to on.

		The offsets used are different bits to be toggled on and off, typically there is only one address used in a script.

		Example:
		GAMEPLAY::SET_BIT(&amp;bitAddress, 1);

		To check if this bit has been enabled:
		GAMEPLAY::IS_BIT_SET(bitAddress, 1); // will return 1 afterwards

		Please note, this method may assign a value to [address] when used.
</summary>
	]]

native "CLEAR_BIT"
	hash "0xE80492A9AC099A93"
	jhash (0x8BC9E618)
	arguments {
		intPtr "address",

		int "offset",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		This sets bit [offset] of [address] to off.

		Example:
		GAMEPLAY::CLEAR_BIT(&amp;bitAddress, 1);

		To check if this bit has been enabled:
		GAMEPLAY::IS_BIT_SET(bitAddress, 1); // will return 0 afterwards
</summary>
	]]

native "GET_HASH_KEY"
	hash "0xD24D37CC275948CC"
	jhash (0x98EFF6F1)
	arguments {
		charPtr "string",
	}
	ns "MISC"
	returns	"Hash"
	doc [[!
<summary>
		This native converts its past string to hash. It is hashed using jenkins one at a time method.
		----------
		The string is first converted to lowercase before feeding it to joaat.
		As a result, it makes this native case-insensitive.
		For example: "zentorno", "ZENTORNO" and "Zentorno" produce the same hash.
</summary>
	]]

native "0xF2F6A2FA49278625"
	hash "0xF2F6A2FA49278625"
	jhash (0x87B92190)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		AnyPtr "p9",

		AnyPtr "p10",

		AnyPtr "p11",

		AnyPtr "p12",
	}
	ns "MISC"
	returns	"void"

native "IS_AREA_OCCUPIED"
	hash "0xA61B4DF533DCB56E"
	jhash (0xC013972F)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		BOOL "p6",

		BOOL "p7",

		BOOL "p8",

		BOOL "p9",

		BOOL "p10",

		Any "p11",

		BOOL "p12",
	}
	ns "MISC"
	returns	"BOOL"

native "IS_POSITION_OCCUPIED"
	hash "0xADCDE75E1C60F32D"
	jhash (0x452E8D9E)
	arguments {
		float "x",

		float "y",

		float "z",

		float "range",

		BOOL "p4",

		BOOL "p5",

		BOOL "p6",

		BOOL "p7",

		BOOL "p8",

		Any "p9",

		BOOL "p10",
	}
	ns "MISC"
	returns	"BOOL"

native "IS_POINT_OBSCURED_BY_A_MISSION_ENTITY"
	hash "0xE54E209C35FFA18D"
	jhash (0xC161558D)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		Any "p6",
	}
	ns "MISC"
	returns	"BOOL"

native "CLEAR_AREA"
	hash "0xA56F01F3765B93A0"
	jhash (0x854E9AB8)
	arguments {
		float "X",

		float "Y",

		float "Z",

		float "radius",

		BOOL "p4",

		BOOL "ignoreCopCars",

		BOOL "ignoreObjects",

		BOOL "p7",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Example: CLEAR_AREA(0, 0, 0, 30, true, false, false, false);
</summary>
	]]

native "_CLEAR_AREA_OF_EVERYTHING"
	hash "0x957838AAF91BD12D"
	jhash (0x20E4FFD9)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		BOOL "p4",

		BOOL "p5",

		BOOL "p6",

		BOOL "p7",
	}
	alias "0x957838AAF91BD12D"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		GAMEPLAY::_0x957838AAF91BD12D(x, y, z, radius, false, false, false, false); seem to make all objects go away, peds, vehicles etc. All booleans set to true doesn't seem to change anything. 
</summary>
	]]

native "CLEAR_AREA_OF_VEHICLES"
	hash "0x01C7B9B38428AEB6"
	jhash (0x63320F3C)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		BOOL "p4",

		BOOL "p5",

		BOOL "p6",

		BOOL "p7",

		BOOL "p8",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Example: 		CLEAR_AREA_OF_VEHICLES(0, 0, 0, 10000, false, false, false, false, false);
</summary>
	]]

native "CLEAR_ANGLED_AREA_OF_VEHICLES"
	hash "0x11DB3500F042A8AA"
	jhash (0xF11A3018)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		BOOL "p7",

		BOOL "p8",

		BOOL "p9",

		BOOL "p10",

		BOOL "p11",
	}
	ns "MISC"
	returns	"void"

native "CLEAR_AREA_OF_OBJECTS"
	hash "0xDD9B9B385AAC7F5B"
	jhash (0xBB720FE7)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		int "flags",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		I looked through the PC scripts that this site provides you with a link to find. It shows the last param mainly uses, (0, 2, 6, 16, and 17) so I am going to assume it is a type of flag. 
</summary>
	]]

native "CLEAR_AREA_OF_PEDS"
	hash "0xBE31FD6CE464AC59"
	jhash (0x25BE7FA8)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		int "flags",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Example: 		CLEAR_AREA_OF_PEDS(0, 0, 0, 10000, 1);
</summary>
	]]

native "CLEAR_AREA_OF_COPS"
	hash "0x04F8FC8FCF58F88D"
	jhash (0x95C53824)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		int "flags",
	}
	ns "MISC"
	returns	"void"

native "CLEAR_AREA_OF_PROJECTILES"
	hash "0x0A1CB9094635D1A6"
	jhash (0x18DB5434)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		BOOL "isNetworkGame",
	}
	ns "MISC"
	returns	"void"

native "0x7EC6F9A478A6A512"
	hash "0x7EC6F9A478A6A512"
	ns "MISC"
	returns	"void"

native "SET_SAVE_MENU_ACTIVE"
	hash "0xC9BF75D28165FF77"
	jhash (0xF5CCF164)
	arguments {
		BOOL "unk",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		The bool is not a toggle!!!
</summary>
	]]

native "0x397BAA01068BAA96"
	hash "0x397BAA01068BAA96"
	jhash (0x39771F21)
	ns "MISC"
	returns	"int"

native "SET_CREDITS_ACTIVE"
	hash "0xB938B7E6D3C0620C"
	jhash (0xEC2A0ECF)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"

native "0xB51B9AB9EF81868C"
	hash "0xB51B9AB9EF81868C"
	jhash (0x75B06B5A)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"

native "0x075F1D57402C93BA"
	hash "0x075F1D57402C93BA"
	jhash (0x2569C9A7)
	ns "MISC"
	returns	"Any"

native "TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME"
	hash "0x9DC711BC69C548DF"
	jhash (0x9F861FD4)
	arguments {
		charPtr "scriptName",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/yLNWicUi
</summary>
	]]

native "NETWORK_SET_SCRIPT_IS_SAFE_FOR_NETWORK_GAME"
	hash "0x9243BAC96D64C050"
	jhash (0x878486CE)
	ns "MISC"
	returns	"void"

native "ADD_HOSPITAL_RESTART"
	hash "0x1F464EF988465A81"
	jhash (0x4F3E3104)
	arguments {
		float "x",

		float "y",

		float "z",

		float "p3",

		Any "p4",
	}
	ns "MISC"
	returns	"int"
	doc [[!
<summary>
		Returns the index of the newly created hospital spawn point.

		p3 might be radius?
</summary>
	]]

native "DISABLE_HOSPITAL_RESTART"
	hash "0xC8535819C450EBA8"
	jhash (0x09F49C72)
	arguments {
		int "hospitalIndex",

		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		The game by default has 5 hospital respawn points. Disabling them all will cause the player to respawn at the last position they were.


		Doesn't work....
</summary>
	]]

native "ADD_POLICE_RESTART"
	hash "0x452736765B31FC4B"
	jhash (0xE96C29FE)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		Any "p4",
	}
	ns "MISC"
	returns	"Any"

native "DISABLE_POLICE_RESTART"
	hash "0x23285DED6EBD7EA3"
	jhash (0x0A280324)
	arguments {
		int "policeIndex",

		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Disables the spawn point at the police house on the specified index.

		policeIndex: The police house index.
		toggle: true to enable the spawn point, false to disable.


</summary>
	]]

native "_SET_CUSTOM_RESPAWN_POSITION"
	hash "0x706B5EDCAA7FA663"
	arguments {
		float "x",

		float "y",

		float "z",

		float "heading",
	}
	alias "0x706B5EDCAA7FA663"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Specifies a custom respawn position to be used in conjunction with _SET_NEXT_RESPAWN_TO_CUSTOM
</summary>
	]]

native "_SET_NEXT_RESPAWN_TO_CUSTOM"
	hash "0xA2716D40842EAF79"
	alias "0xA2716D40842EAF79"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Sets the next spawn location to the position supplied to _SET_CUSTOM_RESPAWN_POSITION. 
</summary>
	]]

native "_DISABLE_AUTOMATIC_RESPAWN"
	hash "0x2C2B3493FBF51C71"
	jhash (0x296574AE)
	arguments {
		BOOL "disableRespawn",
	}
	ns "MISC"
	returns	"void"

native "IGNORE_NEXT_RESTART"
	hash "0x21FFB63D8C615361"
	jhash (0xDA13A4B6)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"

native "SET_FADE_OUT_AFTER_DEATH"
	hash "0x4A18E01DF2C87B86"
	jhash (0xC9F6F0BC)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Sets whether the game should fade out after the player dies.
</summary>
	]]

native "SET_FADE_OUT_AFTER_ARREST"
	hash "0x1E0B4DC0D990A4E7"
	jhash (0xCB074B9D)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Sets whether the game should fade out after the player is arrested.
</summary>
	]]

native "SET_FADE_IN_AFTER_DEATH_ARREST"
	hash "0xDA66D2796BA33F12"
	jhash (0xACDE6985)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Sets whether the game should fade in after the player dies or is arrested.
</summary>
	]]

native "SET_FADE_IN_AFTER_LOAD"
	hash "0xF3D78F59DFE18D79"
	jhash (0x6E00EB0B)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"

native "REGISTER_SAVE_HOUSE"
	hash "0xC0714D0A7EEECA54"
	jhash (0x39C1849A)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		AnyPtr "p4",

		Any "p5",

		Any "p6",
	}
	ns "MISC"
	returns	"Any"

native "SET_SAVE_HOUSE"
	hash "0x4F548CABEAE553BC"
	jhash (0xC3240BB4)
	arguments {
		Any "p0",

		BOOL "p1",

		BOOL "p2",
	}
	ns "MISC"
	returns	"void"

native "OVERRIDE_SAVE_HOUSE"
	hash "0x1162EA8AE9D24EEA"
	jhash (0x47436C12)
	arguments {
		BOOL "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		BOOL "p5",

		float "p6",

		float "p7",
	}
	ns "MISC"
	returns	"BOOL"

native "0xA4A0065E39C9F25C"
	hash "0xA4A0065E39C9F25C"
	jhash (0xC4D71AB4)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "MISC"
	returns	"Any"

native "DO_AUTO_SAVE"
	hash "0x50EEAAD86232EE55"
	jhash (0x54C44B1A)
	ns "MISC"
	returns	"void"

native "0x6E04F06094C87047"
	hash "0x6E04F06094C87047"
	jhash (0xA8546914)
	ns "MISC"
	returns	"Any"

native "IS_AUTO_SAVE_IN_PROGRESS"
	hash "0x69240733738C19A0"
	jhash (0x36F75399)
	ns "MISC"
	returns	"BOOL"

native "0x2107A3773771186D"
	hash "0x2107A3773771186D"
	jhash (0x78350773)
	ns "MISC"
	returns	"Any"

native "0x06462A961E94B67C"
	hash "0x06462A961E94B67C"
	jhash (0x5A45B11A)
	ns "MISC"
	returns	"void"

native "BEGIN_REPLAY_STATS"
	hash "0xE0E500246FF73D66"
	jhash (0x17F4F44D)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "MISC"
	returns	"void"

native "0x69FE6DC87BD2A5E9"
	hash "0x69FE6DC87BD2A5E9"
	jhash (0x81216EE0)
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"void"

native "END_REPLAY_STATS"
	hash "0xA23E821FBDF8A5F2"
	jhash (0xCB570185)
	ns "MISC"
	returns	"void"

native "0xD642319C54AADEB6"
	hash "0xD642319C54AADEB6"
	jhash (0xC58250F1)
	ns "MISC"
	returns	"Any"

native "0x5B1F2E327B6B6FE1"
	hash "0x5B1F2E327B6B6FE1"
	jhash (0x50C39926)
	ns "MISC"
	returns	"Any"

native "0x2B626A0150E4D449"
	hash "0x2B626A0150E4D449"
	jhash (0x710E5D1E)
	ns "MISC"
	returns	"Any"

native "0xDC9274A7EF6B2867"
	hash "0xDC9274A7EF6B2867"
	jhash (0xC7BD1AF0)
	ns "MISC"
	returns	"Any"

native "0x8098C8D6597AAE18"
	hash "0x8098C8D6597AAE18"
	jhash (0x22BE2423)
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"Any"

native "CLEAR_REPLAY_STATS"
	hash "0x1B1AB132A16FDA55"
	jhash (0xC47DFF02)
	ns "MISC"
	returns	"void"

native "0x72DE52178C291CB5"
	hash "0x72DE52178C291CB5"
	jhash (0xF62B3C48)
	ns "MISC"
	returns	"Any"

native "0x44A0BDC559B35F6E"
	hash "0x44A0BDC559B35F6E"
	jhash (0x3589452B)
	ns "MISC"
	returns	"Any"

native "0xEB2104E905C6F2E9"
	hash "0xEB2104E905C6F2E9"
	ns "MISC"
	returns	"Any"

native "0x2B5E102E4A42F2BF"
	hash "0x2B5E102E4A42F2BF"
	jhash (0x144AAF22)
	ns "MISC"
	returns	"Any"

native "IS_MEMORY_CARD_IN_USE"
	hash "0x8A75CE2956274ADD"
	jhash (0x40CE4DFD)
	ns "MISC"
	returns	"BOOL"

native "SHOOT_SINGLE_BULLET_BETWEEN_COORDS"
	hash "0x867654CBC7606F2C"
	jhash (0xCB7415AC)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "damage",

		BOOL "p7",

		Hash "weaponHash",

		Ped "ownerPed",

		BOOL "isAudible",

		BOOL "isInvisible",

		float "speed",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		this is what p7 does in disassembly

		__int8 var = 32;
		if (isInvisible)
		{
		   var = 16;
		}
		int v110 = var | 2 * p7;
</summary>
	]]

native "_SHOOT_SINGLE_BULLET_BETWEEN_COORDS_PRESET_PARAMS"
	hash "0xE3A7742E0B7A2F8B"
	jhash (0x52ACCB7B)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "damage",

		BOOL "p7",

		Hash "weaponHash",

		Ped "ownerPed",

		BOOL "isAudible",

		BOOL "isInvisible",

		float "speed",

		Entity "entity",
	}
	alias "0xE3A7742E0B7A2F8B"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		entity - entity to ignore
</summary>
	]]

native "_SHOOT_SINGLE_BULLET_BETWEEN_COORDS_WITH_EXTRA_PARAMS"
	hash "0xBFE5756E7407064A"
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "damage",

		BOOL "p7",

		Hash "weaponHash",

		Ped "ownerPed",

		BOOL "isAudible",

		BOOL "isInvisible",

		float "speed",

		Entity "entity",

		BOOL "p14",

		BOOL "p15",

		BOOL "p16",

		BOOL "p17",
	}
	alias "0xBFE5756E7407064A"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Since latest patches has 18 parameters.

		Console Hash: 0xCCDC33CC

		entity - entity to ignore
</summary>
	]]

native "GET_MODEL_DIMENSIONS"
	hash "0x03E8D3D5F549087A"
	jhash (0x91ABB8E0)
	arguments {
		Hash "modelHash",

		Vector3Ptr "minimum",

		Vector3Ptr "maximum",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Gets the dimensions of a model.

		Calculate (maximum - minimum) to get the size, in which case, Y will be how long the model is.

		Vector3 GetDimensions(Hash model)
		{
			Vector3 right, left;
			GET_MODEL_DIMENSIONS(model, &amp;right, &amp;left);
			return Vector3::Subtract(left, right);
		}


		Example from the scripts: GAMEPLAY::GET_MODEL_DIMENSIONS(ENTITY::GET_ENTITY_MODEL(PLAYER::PLAYER_PED_ID()), &amp;v_1A, &amp;v_17);
</summary>
	]]

native "SET_FAKE_WANTED_LEVEL"
	hash "0x1454F2448DE30163"
	jhash (0x85B1C9FA)
	arguments {
		int "fakeWantedLevel",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Sets a visually fake wanted level on the user interface. Used by Rockstar's scripts to "override" regular wanted levels and make custom ones while the real wanted level and multipliers are ignored.

		Max is 6. Also the mini-map gets the red &amp; blue flashing effect.
</summary>
	]]

native "GET_FAKE_WANTED_LEVEL"
	hash "0x4C9296CBCD1B971E"
	jhash (0x0022A430)
	alias "0x4C9296CBCD1B971E"
	ns "MISC"
	returns	"int"

native "IS_BIT_SET"
	hash "0xA921AA820C25702F"
	jhash (0x902E26AC)
	arguments {
		int "address",

		int "offset",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Returns bit's boolean state from [offset] of [address].

		Example:
		GAMEPLAY::IS_BIT_SET(bitAddress, 1);

		To enable and disable bits, see:
		GAMEPLAY::SET_BIT(&amp;bitAddress, 1);   // enable
		GAMEPLAY::CLEAR_BIT(&amp;bitAddress, 1); // disable
</summary>
	]]

native "USING_MISSION_CREATOR"
	hash "0xF14878FC50BEC6EE"
	jhash (0x20AB0B6B)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Hash collision

		If this is a hash collision, it's a very lucky one. It does seem strangely named but it is used to toggle the mission creator mode.
</summary>
	]]

native "0xDEA36202FC3382DF"
	hash "0xDEA36202FC3382DF"
	jhash (0x082BA6F2)
	arguments {
		BOOL "p0",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Most references of this native come from the creator scripts. (creator, fm_capture_creator, fm_deathmatch_creator, fm_lts_creator, fm_race_creator).
		Seems to have something to do with initializing/destroying creator shit.
</summary>
	]]

native "SET_MINIGAME_IN_PROGRESS"
	hash "0x19E00D7322C6F85B"
	jhash (0x348B9046)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"

native "IS_MINIGAME_IN_PROGRESS"
	hash "0x2B4A15E44DE0F478"
	jhash (0x53A95E13)
	ns "MISC"
	returns	"BOOL"

native "IS_THIS_A_MINIGAME_SCRIPT"
	hash "0x7B30F65D7B710098"
	jhash (0x7605EF6F)
	ns "MISC"
	returns	"BOOL"

native "IS_SNIPER_INVERTED"
	hash "0x61A23B7EDA9BDA24"
	jhash (0x5C3BF51B)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		This function is hard-coded to always return 0.
</summary>
	]]

native "0xD3D15555431AB793"
	hash "0xD3D15555431AB793"
	jhash (0xBAF17315)
	ns "MISC"
	returns	"BOOL"

native "GET_PROFILE_SETTING"
	hash "0xC488FF2356EA7791"
	jhash (0xD374BEBC)
	arguments {
		int "profileSetting",
	}
	ns "MISC"
	returns	"int"
	doc [[!
<summary>
		gtaforums.com/topic/799843-stats-profile-settings/
</summary>
	]]

native "ARE_STRINGS_EQUAL"
	hash "0x0C515FAB3FF9EA92"
	jhash (0x877C0BC5)
	arguments {
		charPtr "string1",

		charPtr "string2",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		is this like strcmp??
</summary>
	]]

native "COMPARE_STRINGS"
	hash "0x1E34710ECD4AB0EB"
	jhash (0xFE25A58F)
	arguments {
		charPtr "str1",

		charPtr "str2",

		BOOL "matchCase",

		int "maxLength",
	}
	ns "MISC"
	returns	"int"
	doc [[!
<summary>
		Compares two strings up to a specified number of characters.

		Parameters:
		str1 - String to be compared.
		str2 - String to be compared.
		matchCase - Comparison will be case-sensitive.
		maxLength - Maximum number of characters to compare. A value of -1 indicates an infinite length.

		Returns:
		A value indicating the relationship between the strings:
		&lt;0 - The first non-matching character in 'str1' is less than the one in 'str2'. (e.g. 'A' &lt; 'B', so result = -1)
		0 - The contents of both strings are equal.
		&gt;0 - The first non-matching character in 'str1' is less than the one in 'str2'. (e.g. 'B' &gt; 'A', so result = 1)

		Examples:
		GAMEPLAY::COMPARE_STRINGS("STRING", "string", false, -1); // 0; equal
		GAMEPLAY::COMPARE_STRINGS("TESTING", "test", false, 4); // 0; equal
		GAMEPLAY::COMPARE_STRINGS("R2D2", "R2xx", false, 2); // 0; equal
		GAMEPLAY::COMPARE_STRINGS("foo", "bar", false, -1); // 4; 'f' &gt; 'b'
		GAMEPLAY::COMPARE_STRINGS("A", "A", true, 1); // 0; equal

		When comparing case-sensitive strings, lower-case characters are greater than upper-case characters:
		GAMEPLAY::COMPARE_STRINGS("A", "a", true, 1); // -1; 'A' &lt; 'a'
		GAMEPLAY::COMPARE_STRINGS("a", "A", true, 1); // 1; 'a' &gt; 'A'
</summary>
	]]

native "ABSI"
	hash "0xF0D31AD191A74F87"
	jhash (0xB44677C5)
	arguments {
		int "value",
	}
	ns "MISC"
	returns	"int"

native "ABSF"
	hash "0x73D57CFFDD12C355"
	jhash (0xAF6F6E0B)
	arguments {
		float "value",
	}
	ns "MISC"
	returns	"float"

native "IS_SNIPER_BULLET_IN_AREA"
	hash "0xFEFCF11B01287125"
	jhash (0x0483715C)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Determines whether there is a sniper bullet within the specified coordinates. The coordinates form a rectangle.


</summary>
	]]

native "IS_PROJECTILE_IN_AREA"
	hash "0x5270A8FBC098C3F8"
	jhash (0x78E1A557)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		BOOL "ownedByPlayer",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Determines whether there is a projectile within the specified coordinates. The coordinates form a rectangle.




		ownedByPlayer = only projectiles fired by the player will be detected.
</summary>
	]]

native "IS_PROJECTILE_TYPE_IN_AREA"
	hash "0x2E0DC353342C4A6D"
	jhash (0x2B73BCF6)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "type",

		BOOL "p7",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Determines whether there is a projectile of a specific type within the specified coordinates. The coordinates form a rectangle.

		Note: This native hasn't been tested yet.


</summary>
	]]

native "IS_PROJECTILE_TYPE_IN_ANGLED_AREA"
	hash "0xF0BC12401061DEA0"
	jhash (0xD1AE2681)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		Any "p7",

		BOOL "p8",
	}
	ns "MISC"
	returns	"BOOL"

native "_IS_PROJECTILE_TYPE_IN_RADIUS"
	hash "0x34318593248C8FB2"
	jhash (0xBE81F1E2)
	arguments {
		float "x",

		float "y",

		float "z",

		Hash "projHash",

		float "radius",

		BOOL "ownedByPlayer",
	}
	alias "0x34318593248C8FB2"
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Checks if the projectile is in the radius around that point.

		p6 is (most likely) ownedByPlayer. (see IS_PROJECTILE_IN_AREA for info)
</summary>
	]]

native "_GET_IS_PROJECTILE_TYPE_IN_AREA"
	hash "0x8D7A43EC6A5FEA45"
	jhash (0x1A40454B)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		Hash "projHash",

		Vector3Ptr "projPos",

		BOOL "ownedByPlayer",
	}
	alias "0x8D7A43EC6A5FEA45"
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Works exactly like IS_PROJECTILE_TYPE_IN_AREA, but it puts the position of the projectile in the vector.

		p8 is probably ownedByPlayer, but not known for sure. (see IS_PROJECTILE_IN_AREA for info)

		Unsure of the hash name, could someone confirm this?
</summary>
	]]

native "_GET_PROJECTILE_NEAR_PED_COORDS"
	hash "0xDFB4138EEFED7B81"
	jhash (0x6BDE5CE4)
	arguments {
		Ped "ped",

		Hash "projHash",

		float "radius",

		Vector3Ptr "projPos",

		BOOL "ownedByPlayer",
	}
	alias "0xDFB4138EEFED7B81"
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		From a quick disassembly I can say that this has something to do with weapons.

		Added params according to what I could see in IDA.

		Dr. Underscore (1/6/18):
		Returns if any projectiles of projHash type are in a radius around this ped. If true, projPos is filled with the position of that entity.

		This native was only ever used with projectiles, but may not be limited to.

		p4 isn't an Entity*, it's actually a Vector3*, which outputs the position of the found entity.

		p5 is (most likely) ownedByPlayer. (see IS_PROJECTILE_IN_AREA for info)
</summary>
	]]

native "_GET_PROJECTILE_NEAR_PED"
	hash "0x82FDE6A57EE4EE44"
	jhash (0x507BC6F7)
	arguments {
		Ped "ped",

		Hash "projHash",

		float "radius",

		Vector3Ptr "projPos",

		EntityPtr "projEnt",

		BOOL "ownedByPlayer",
	}
	alias "0x82FDE6A57EE4EE44"
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		only documented to be continued...

		Dr. Underscore (1/6/18):
		Exactly like _GET_PROJECTILE_NEAR_PED_COORDS (_0xDFB4138EEFED7B81), but it gives us the Entity that was found aswell.

		p6 is (most likely) ownedByPlayer. (see IS_PROJECTILE_IN_AREA for info)
</summary>
	]]

native "IS_BULLET_IN_ANGLED_AREA"
	hash "0x1A8B5F3C01E2B477"
	jhash (0xE2DB58F7)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		BOOL "p7",
	}
	ns "MISC"
	returns	"BOOL"

native "IS_BULLET_IN_AREA"
	hash "0x3F2023999AD51C1F"
	jhash (0xB54F46CA)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		BOOL "p4",
	}
	ns "MISC"
	returns	"BOOL"

native "IS_BULLET_IN_BOX"
	hash "0xDE0F6D7450D37351"
	jhash (0xAB73ED26)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		BOOL "p6",
	}
	ns "MISC"
	returns	"BOOL"

native "HAS_BULLET_IMPACTED_IN_AREA"
	hash "0x9870ACFB89A90995"
	jhash (0x902BC7D9)
	arguments {
		float "x",

		float "y",

		float "z",

		float "p3",

		BOOL "p4",

		BOOL "p5",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		p3 - possibly radius?
</summary>
	]]

native "HAS_BULLET_IMPACTED_IN_BOX"
	hash "0xDC8C5D7CFEAB8394"
	jhash (0x2C2618CC)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		BOOL "p6",

		BOOL "p7",
	}
	ns "MISC"
	returns	"BOOL"

native "IS_ORBIS_VERSION"
	hash "0xA72BC0B675B1519E"
	jhash (0x40282018)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		PS4

		MulleDK19: This function is hard-coded to always return 0.

		Force67: I patched return result and got this : i.imgur.com/hUn7zSj.jpg

		translate please?
</summary>
	]]

native "IS_DURANGO_VERSION"
	hash "0x4D982ADB1978442D"
	jhash (0x46FB06A5)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		XBOX ONE

		MulleDK19: This function is hard-coded to always return 0.
</summary>
	]]

native "IS_XBOX360_VERSION"
	hash "0xF6201B4DAF662A9D"
	jhash (0x24005CC8)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		MulleDK19: This function is hard-coded to always return 0.
</summary>
	]]

native "IS_PS3_VERSION"
	hash "0xCCA1072C29D096C2"
	jhash (0x4C0D5303)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		MulleDK19: This function is hard-coded to always return 0.
</summary>
	]]

native "IS_PC_VERSION"
	hash "0x48AF36444B965238"
	jhash (0x4D5D9EE3)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		MulleDK19: This function is hard-coded to always return 1.
</summary>
	]]

native "IS_AUSSIE_VERSION"
	hash "0x9F1935CA1F724008"
	jhash (0x944BA1DC)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		if (GAMEPLAY::IS_AUSSIE_VERSION()) {
		    sub_127a9(&amp;l_31, 1024); // l_31 |= 1024
		    l_129 = 3;
		    sub_129d2("AUSSIE VERSION IS TRUE!?!?!"); // DEBUG
		}

		Used to block some of the prostitute stuff due to laws in Australia.
</summary>
	]]

native "IS_STRING_NULL"
	hash "0xF22B6C47C6EAB066"
	jhash (0x8E71E00F)
	arguments {
		charPtr "string",
	}
	ns "MISC"
	returns	"BOOL"

native "IS_STRING_NULL_OR_EMPTY"
	hash "0xCA042B6957743895"
	jhash (0x42E9F2CA)
	arguments {
		charPtr "string",
	}
	ns "MISC"
	returns	"BOOL"

native "STRING_TO_INT"
	hash "0x5A5F40FE637EB584"
	jhash (0x590A8160)
	arguments {
		charPtr "string",

		intPtr "outInteger",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Returns false if it's a null or empty string or if the string is too long. outInteger will be set to -999 in that case.

		If all checks have passed successfully, the return value will be set to whatever strtol(string, 0i64, 10); returns.
</summary>
	]]

native "SET_BITS_IN_RANGE"
	hash "0x8EF07E15701D61ED"
	jhash (0x32094719)
	arguments {
		intPtr "var",

		int "rangeStart",

		int "rangeEnd",

		int "p3",
	}
	ns "MISC"
	returns	"void"

native "GET_BITS_IN_RANGE"
	hash "0x53158863FCC0893A"
	jhash (0xCA03A1E5)
	arguments {
		int "var",

		int "rangeStart",

		int "rangeEnd",
	}
	ns "MISC"
	returns	"int"

native "ADD_STUNT_JUMP"
	hash "0x1A992DA297A4630C"
	jhash (0xB630E5FF)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		float "p9",

		float "p10",

		float "p11",

		float "p12",

		float "p13",

		float "p14",

		Any "p15",

		Any "p16",
	}
	ns "MISC"
	returns	"int"

native "ADD_STUNT_JUMP_ANGLED"
	hash "0xBBE5D803A5360CBF"
	jhash (0xB9B7E777)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		float "p9",

		float "p10",

		float "p11",

		float "p12",

		float "p13",

		float "p14",

		float "p15",

		float "p16",

		Any "p17",

		Any "p18",
	}
	ns "MISC"
	returns	"int"

native "DELETE_STUNT_JUMP"
	hash "0xDC518000E39DAE1F"
	jhash (0x840CB5DA)
	arguments {
		int "p0",
	}
	ns "MISC"
	returns	"void"

native "ENABLE_STUNT_JUMP_SET"
	hash "0xE369A5783B866016"
	jhash (0x9D1E7785)
	arguments {
		int "p0",
	}
	ns "MISC"
	returns	"void"

native "DISABLE_STUNT_JUMP_SET"
	hash "0xA5272EBEDD4747F6"
	jhash (0x644C9FA4)
	arguments {
		int "p0",
	}
	ns "MISC"
	returns	"void"

native "0xD79185689F8FD5DF"
	hash "0xD79185689F8FD5DF"
	jhash (0x3C806A2D)
	arguments {
		BOOL "p0",
	}
	ns "MISC"
	returns	"void"

native "IS_STUNT_JUMP_IN_PROGRESS"
	hash "0x7A3F19700A4D0525"
	jhash (0xF477D0B1)
	ns "MISC"
	returns	"BOOL"

native "IS_STUNT_JUMP_MESSAGE_SHOWING"
	hash "0x2272B0A1343129F4"
	jhash (0x021636EE)
	alias "0x2272B0A1343129F4"
	ns "MISC"
	returns	"BOOL"

native "0x996DD1E1E02F1008"
	hash "0x996DD1E1E02F1008"
	jhash (0x006F9BA2)
	ns "MISC"
	returns	"int"

native "0x6856EC3D35C81EA4"
	hash "0x6856EC3D35C81EA4"
	ns "MISC"
	returns	"int"

native "CANCEL_STUNT_JUMP"
	hash "0xE6B7B0ACD4E4B75E"
	jhash (0xF43D9821)
	ns "MISC"
	returns	"void"

native "SET_GAME_PAUSED"
	hash "0x577D1284D6873711"
	jhash (0x8230FF6C)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Make sure to call this from the correct thread if you're using multiple threads because all other threads except the one which is calling SET_GAME_PAUSED will be paused which means you will lose control and the game remains in paused mode until you exit GTA5.exe
</summary>
	]]

native "SET_THIS_SCRIPT_CAN_BE_PAUSED"
	hash "0xAA391C728106F7AF"
	jhash (0xA0C3CE29)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"

native "SET_THIS_SCRIPT_CAN_REMOVE_BLIPS_CREATED_BY_ANY_SCRIPT"
	hash "0xB98236CAAECEF897"
	jhash (0xD06F1720)
	arguments {
		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"

native "_HAS_BUTTON_COMBINATION_JUST_BEEN_ENTERED"
	hash "0x071E2A839DE82D90"
	jhash (0xFF6191E1)
	arguments {
		Hash "hash",

		int "amount",
	}
	alias "0x071E2A839DE82D90"
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		This native appears on the cheat_controller script and tracks a combination of buttons, which may be used to toggle cheats in-game. Credits to ThreeSocks for the info. The hash contains the combination, while the "amount" represents the amount of buttons used in a combination. The following page can be used to make a button combination: gta5offset.com/ts/hash/

		INT_SCORES_SCORTED was a hash collision
</summary>
	]]

native "_HAS_CHEAT_STRING_JUST_BEEN_ENTERED"
	hash "0x557E43C447E700A8"
	arguments {
		Hash "hash",
	}
	alias "0x557E43C447E700A8"
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Get inputted "Cheat code", for example:

		while (TRUE)
		{
		    if (GAMEPLAY::_557E43C447E700A8(${fugitive}))
		    {
		       // Do something.
		    }
		    SYSTEM::WAIT(0);
		}

		Calling this will also set the last saved string hash to zero.

</summary>
	]]

native "_USE_FREEMODE_MAP_BEHAVIOR"
	hash "0x9BAE5AD2508DF078"
	jhash (0x721B2492)
	arguments {
		BOOL "toggle",
	}
	alias "_ENABLE_MP_DLC_MAPS"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Formerly known as _LOWER_MAP_PROP_DENSITY and wrongly due to idiots as _ENABLE_MP_DLC_MAPS.
		Sets the maximum prop density and changes a loading screen flag from 'loading story mode' to 'loading GTA Online'. Does not touch DLC map data at all.

		In fact, I doubt this changes the flag whatsoever, that's the OTHER native idiots use together with this that does so, this one only causes a loading screen to show as it reloads map data.


		------------------------
		While you're going on your rant about other "idiots" can you please supply the name of the "other native" for us "idiots" who'd like to actually learn about loading IPL's? Thank, you.
</summary>
	]]

native "_SET_UNK_MAP_FLAG"
	hash "0xC5F0A8EBD3F361CE"
	jhash (0xE202879D)
	arguments {
		int "flag",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Sets an unknown flag used by CScene in determining which entities from CMapData scene nodes to draw, similar to 9BAE5AD2508DF078.

		Documented by NTAuthority (http://fivem.net/).
</summary>
	]]

native "IS_FRONTEND_FADING"
	hash "0x7EA2B6AF97ECA6ED"
	jhash (0x8FF6232C)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		This function is hard-coded to always return 0.
</summary>
	]]

native "POPULATE_NOW"
	hash "0x7472BB270D7B4F3E"
	jhash (0x72C20700)
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		spawns a few distant/out-of-sight peds, vehicles, animals etc each time it is called
</summary>
	]]

native "GET_INDEX_OF_CURRENT_LEVEL"
	hash "0xCBAD6729F7B1F4FC"
	jhash (0x6F203C6E)
	ns "MISC"
	returns	"int"

native "SET_GRAVITY_LEVEL"
	hash "0x740E14FAD5842351"
	jhash (0x2D833F4A)
	arguments {
		int "level",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		level can be from 0 to 3
		0: 9.8 
		1: 2.4 
		2: 0.1 - very low
		3: 0.0 
</summary>
	]]

native "START_SAVE_DATA"
	hash "0xA9575F812C6A7997"
	jhash (0x881A694D)
	arguments {
		AnyPtr "p0",

		Any "p1",

		BOOL "p2",
	}
	ns "MISC"
	returns	"void"

native "STOP_SAVE_DATA"
	hash "0x74E20C9145FB66FD"
	jhash (0x3B1C07C8)
	ns "MISC"
	returns	"void"

native "0xA09F896CE912481F"
	hash "0xA09F896CE912481F"
	jhash (0x9EF0BC64)
	arguments {
		BOOL "p0",
	}
	ns "MISC"
	returns	"int"

native "REGISTER_INT_TO_SAVE"
	hash "0x34C9EE5986258415"
	jhash (0xB930956F)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"

native "0xA735353C77334EA0"
	hash "0xA735353C77334EA0"
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",
	}
	ns "MISC"
	returns	"void"

native "REGISTER_ENUM_TO_SAVE"
	hash "0x10C2FA78D0E128A1"
	jhash (0x9B38374A)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"

native "REGISTER_FLOAT_TO_SAVE"
	hash "0x7CAEC29ECB5DFEBB"
	jhash (0xDB06F7AD)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"

native "REGISTER_BOOL_TO_SAVE"
	hash "0xC8F4131414C835A1"
	jhash (0x5417E0E0)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"

native "REGISTER_TEXT_LABEL_TO_SAVE"
	hash "0xEDB1232C5BEAE62F"
	jhash (0x284352C4)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"

native "0x6F7794F28C6B2535"
	hash "0x6F7794F28C6B2535"
	jhash (0xE2089749)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Seems to have the same functionality as REGISTER_TEXT_LABEL_TO_SAVE?

		GAMEPLAY::_6F7794F28C6B2535(&amp;a_0._f1, "tlPlateText");
		GAMEPLAY::_6F7794F28C6B2535(&amp;a_0._f1C, "tlPlateText_pending");
		GAMEPLAY::_6F7794F28C6B2535(&amp;a_0._f10B, "tlCarAppPlateText");

		"tl" prefix sounds like "Text Label"
</summary>
	]]

native "0x48F069265A0E4BEC"
	hash "0x48F069265A0E4BEC"
	jhash (0xF91B8C33)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Only found 3 times in decompiled scripts. Not a whole lot to go off of.

		GAMEPLAY::_48F069265A0E4BEC(a_0, "Movie_Name_For_This_Player");
		GAMEPLAY::_48F069265A0E4BEC(&amp;a_0._fB, "Ringtone_For_This_Player");
		GAMEPLAY::_48F069265A0E4BEC(&amp;a_0._f1EC4._f12[v_A/*6*/], &amp;v_13); // where v_13 is "MPATMLOGSCRS0" thru "MPATMLOGSCRS15"
</summary>
	]]

native "0x8269816F6CFD40F8"
	hash "0x8269816F6CFD40F8"
	jhash (0x74E8FAD9)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Only found 2 times in decompiled scripts. Not a whole lot to go off of.

		GAMEPLAY::_8269816F6CFD40F8(&amp;a_0._f1F5A._f6[0/*8*/], "TEMPSTAT_LABEL"); // gets saved in a struct called "g_SaveData_STRING_ScriptSaves"
		GAMEPLAY::_8269816F6CFD40F8(&amp;a_0._f4B4[v_1A/*8*/], &amp;v_5); // where v_5 is "Name0" thru "Name9", gets saved in a struct called "OUTFIT_Name"
</summary>
	]]

native "0xFAA457EF263E8763"
	hash "0xFAA457EF263E8763"
	jhash (0x6B4335DD)
	arguments {
		AnyPtr "p0",

		charPtr "name",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Another unknown label type...

		GAMEPLAY::_FAA457EF263E8763(a_0, "Thumb_label");
		GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f10, "Photo_label");
		GAMEPLAY::_FAA457EF263E8763(a_0, "GXTlabel");
		GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f21, "StringComp");
		GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f43, "SecondStringComp");
		GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f53, "ThirdStringComp");
		GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f32, "SenderStringComp");
		GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f726[v_1A/*16*/], &amp;v_20); // where v_20 is "LastJobTL_0_1" thru "LastJobTL_2_1", gets saved in a struct called "LAST_JobGamer_TL"
		GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f4B, "PAID_PLAYER");
		GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f5B, "RADIO_STATION");
</summary>
	]]

native "_START_SAVE_STRUCT"
	hash "0xBF737600CDDBEADD"
	jhash (0xFB45728E)
	arguments {
		AnyPtr "p0",

		int "p1",

		charPtr "structName",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Second parameter might be length.
</summary>
	]]

native "STOP_SAVE_STRUCT"
	hash "0xEB1774DF12BB9F12"
	jhash (0xC2624A28)
	ns "MISC"
	returns	"void"

native "_START_SAVE_ARRAY"
	hash "0x60FE567DF1B1AF9D"
	jhash (0x893A342C)
	arguments {
		AnyPtr "p0",

		int "p1",

		charPtr "arrayName",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Second parameter might be length.
</summary>
	]]

native "STOP_SAVE_ARRAY"
	hash "0x04456F95153C6BE4"
	jhash (0x0CAD8217)
	ns "MISC"
	returns	"void"

native "ENABLE_DISPATCH_SERVICE"
	hash "0xDC0F817884CDD856"
	jhash (0x0B710A51)
	arguments {
		int "dispatchService",

		BOOL "toggle",
	}
	alias "0xDC0F817884CDD856"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Directly from R*:
		enum eDispatchType : UINT16
		{
		    DT_PoliceAutomobile = 1,
		    DT_PoliceHelicopter = 2,
		    DT_FireDepartment = 3,
		    DT_SwatAutomobile = 4,
		    DT_AmbulanceDepartment = 5,
		    DT_PoliceRiders = 6,
		    DT_PoliceVehicleRequest = 7,
		    DT_PoliceRoadBlock = 8,
		    DT_PoliceAutomobileWaitPulledOver = 9,
		    DT_PoliceAutomobileWaitCruising = 10,
		    DT_Gangs = 11,
		    DT_SwatHelicopter = 12,
		    DT_PoliceBoat = 13,
		    DT_ArmyVehicle = 14,
		    DT_BikerBackup = 15
		};

		By making toggle false it disables the dispatch.

		curious if this is what they used when you toggled on and off cops in a GTA IV freemode you hosted. Sad they got rid of the option to make a private session without cops.
		Also on x360 seems with or without neverWanted on, setting these to all false in SP of course doesn't seem to work. I would understand getting stars, but cops are still dispatched and combat you.
</summary>
	]]

native "0x9B2BD3773123EA2F"
	hash "0x9B2BD3773123EA2F"
	jhash (0xE0F0684F)
	arguments {
		int "type",

		BOOL "toggle",
	}
	ns "MISC"
	returns	"void"

native "_GET_NUMBER_OF_DISPATCHED_UNITS_FOR_PLAYER"
	hash "0xEB4A0C2D56441717"
	jhash (0x3CE5BF6B)
	arguments {
		int "dispatchService",
	}
	alias "0xEB4A0C2D56441717"
	ns "MISC"
	returns	"int"

native "CREATE_INCIDENT"
	hash "0x3F892CAF67444AE7"
	jhash (0xFC5FF7B3)
	arguments {
		int "incidentType",

		float "x",

		float "y",

		float "z",

		int "p5",

		float "radius",

		intPtr "outIncidentID",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		enum IncidentTypes
		{
		    FireDepartment = 3,
		    Paramedics = 5,
		    Police = 7,
		    PedsInCavalcades = 11, 
		    Merryweather = 14
		};

		As for the 'police' incident, it will call police cars to you, but unlike PedsInCavalcades &amp; Merryweather they won't start shooting at you unless you shoot first or shoot at them. The top 2 however seem to cancel theirselves if there is noone dead around you or a fire. I only figured them out as I found out the 3rd param is definately the amountOfPeople and they called incident 3 in scripts with 4 people (which the firetruck has) and incident 5 with 2 people (which the ambulence has). The 4 param I cant say is radius, but for the pedsInCavalcades and Merryweather R* uses 0.0f and for the top 3 (Emergency Services) they use 3.0f. 

		Side Note: It seems calling the pedsInCavalcades or Merryweather then removing it seems to break you from calling the EmergencyEvents and I also believe pedsInCavalcades. (The V cavalcades of course not IV).

		Side Note 2: I say it breaks as if you call this proper,
		if(CREATE_INCIDENT) etc it will return false if you do as I said above.
		=====================================================
</summary>
	]]

native "CREATE_INCIDENT_WITH_ENTITY"
	hash "0x05983472F0494E60"
	jhash (0xBBC35B03)
	arguments {
		int "incidentType",

		Ped "ped",

		int "amountOfPeople",

		float "radius",

		intPtr "outIncidentID",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		p0 could be type (valueused in scripts: 14, 7, 5, 3, 11)
		p1 is a return from get_player_ped() in am_gang_call.c, but player_ped_id() in other (non am) scripts.
		p3 is usually 0f or 3f

		=====================================================
		enum IncidentTypes
		{
		    FireDepartment = 3,
		    Paramedics = 5,
		    Police = 7,
		    PedsInCavalcades = 11, 
		    Merryweather = 14
		};

		As for the 'police' incident, it will call police cars to you, but unlike PedsInCavalcades &amp; Merryweather they won't start shooting at you unless you shoot first or shoot at them. The top 2 however seem to cancel theirselves if there is noone dead around you or a fire. I only figured them out as I found out the 3rd param is definately the amountOfPeople and they called incident 3 in scripts with 4 people (which the firetruck has) and incident 5 with 2 people (which the ambulence has). The 4 param I cant say is radius, but for the pedsInCavalcades and Merryweather R* uses 0.0f and for the top 3 (Emergency Services) they use 3.0f. 

		Side Note: It seems calling the pedsInCavalcades or Merryweather then removing it seems to break you from calling the EmergencyEvents and I also believe pedsInCavalcades. (The V cavalcades of course not IV).

		Side Note 2: I say it breaks as if you call this proper,
		if(CREATE_INCIDENT) etc it will return false if you do as I said above.
		=====================================================
</summary>
	]]

native "DELETE_INCIDENT"
	hash "0x556C1AA270D5A207"
	jhash (0x212BD0DC)
	arguments {
		int "incidentId",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Delete an incident with a given id.

		=======================================================
		Correction, I have change this to int, instead of int*
		as it doesn't use a pointer to the createdIncident.
		If you try it you will crash (or) freeze.
		=======================================================
</summary>
	]]

native "IS_INCIDENT_VALID"
	hash "0xC8BC6461E629BEAA"
	jhash (0x31FD0BA4)
	arguments {
		int "incidentId",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		=======================================================
		Correction, I have change this to int, instead of int*
		as it doesn't use a pointer to the createdIncident.
		If you try it you will crash (or) freeze.
		=======================================================
</summary>
	]]

native "0xB08B85D860E7BA3C"
	hash "0xB08B85D860E7BA3C"
	jhash (0x0242D88E)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",
	}
	ns "MISC"
	returns	"void"

native "0xD261BA3E7E998072"
	hash "0xD261BA3E7E998072"
	jhash (0x1F38102E)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "MISC"
	returns	"void"

native "FIND_SPAWN_POINT_IN_DIRECTION"
	hash "0x6874E2190B0C1972"
	jhash (0x71AEFD77)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		float "distance",

		Vector3Ptr "spawnPoint",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Finds a position ahead of the player by predicting the players next actions.
		The positions match path finding node positions.
		When roads diverge, the position may rapidly change between two or more positions. This is due to the engine not being certain of which path the player will take.

		=======================================================
		I may sort this with alter research, but if someone
		already knows please tell what the difference in 
		X2, Y2, Z2 is. I doubt it's rotation. Is it like 
		checkpoints where X1, Y1, Z1 is your/a position and
		X2, Y2, Z2 is a given position ahead of that position?
		=======================================================
</summary>
	]]

native "0x67F6413D3220E18D"
	hash "0x67F6413D3220E18D"
	jhash (0x42BF09B3)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",

		Any "p5",

		Any "p6",

		Any "p7",

		Any "p8",
	}
	ns "MISC"
	returns	"Any"

native "0x1327E2FE9746BAEE"
	hash "0x1327E2FE9746BAEE"
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"BOOL"

native "0xB129E447A2EDA4BF"
	hash "0xB129E447A2EDA4BF"
	jhash (0xFBDBE374)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "MISC"
	returns	"void"

native "0x32C7A7E8C43A1F80"
	hash "0x32C7A7E8C43A1F80"
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		BOOL "p6",

		BOOL "p7",
	}
	ns "MISC"
	returns	"Any"

native "0xE6869BECDD8F2403"
	hash "0xE6869BECDD8F2403"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "MISC"
	returns	"void"

native "ENABLE_TENNIS_MODE"
	hash "0x28A04B411933F8A6"
	jhash (0x0BD3F9EC)
	arguments {
		Ped "ped",

		BOOL "toggle",

		BOOL "p2",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Makes the ped jump around like they're in a tennis match
</summary>
	]]

native "IS_TENNIS_MODE"
	hash "0x5D5479D115290C3F"
	jhash (0x04A947BA)
	arguments {
		Ped "ped",
	}
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		Return whether tennis mode is active or not.
</summary>
	]]

native "0xE266ED23311F24D4"
	hash "0xE266ED23311F24D4"
	jhash (0xC20A7D2B)
	arguments {
		Any "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		float "p3",

		float "p4",

		BOOL "p5",
	}
	ns "MISC"
	returns	"void"

native "0x17DF68D720AA77F8"
	hash "0x17DF68D720AA77F8"
	jhash (0x8501E727)
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"BOOL"

native "0x19BFED045C647C49"
	hash "0x19BFED045C647C49"
	jhash (0x1A332D2D)
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"BOOL"

native "0xE95B0C7D5BA3B96B"
	hash "0xE95B0C7D5BA3B96B"
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"BOOL"

native "0x8FA9C42FC5D7C64B"
	hash "0x8FA9C42FC5D7C64B"
	jhash (0x0C8865DF)
	arguments {
		Any "p0",

		Any "p1",

		float "p2",

		float "p3",

		float "p4",

		BOOL "p5",
	}
	ns "MISC"
	returns	"void"

native "0x54F157E0336A3822"
	hash "0x54F157E0336A3822"
	jhash (0x49F977A9)
	arguments {
		Any "p0",

		charPtr "p1",

		float "p2",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		From the scripts:

		GAMEPLAY::_54F157E0336A3822(sub_aa49(a_0), "ForcedStopDirection", v_E);
</summary>
	]]

native "0xD10F442036302D50"
	hash "0xD10F442036302D50"
	jhash (0x6F009E33)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",
	}
	ns "MISC"
	returns	"void"

native "RESET_DISPATCH_IDEAL_SPAWN_DISTANCE"
	hash "0x77A84429DD9F0A15"
	jhash (0xDA65ECAA)
	ns "MISC"
	returns	"void"

native "SET_DISPATCH_IDEAL_SPAWN_DISTANCE"
	hash "0x6FE601A64180D423"
	jhash (0x6283BE32)
	arguments {
		float "p0",
	}
	ns "MISC"
	returns	"void"

native "SET_DISPATCH_TIME_BETWEEN_SPAWN_ATTEMPTS"
	hash "0x44F7CBC1BEB3327D"
	jhash (0xABADB709)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "MISC"
	returns	"void"

native "SET_DISPATCH_TIME_BETWEEN_SPAWN_ATTEMPTS_MULTIPLIER"
	hash "0x48838ED9937A15D1"
	jhash (0x1C996BCD)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "MISC"
	returns	"void"

native "0x918C7B2D2FF3928B"
	hash "0x918C7B2D2FF3928B"
	jhash (0xF557BAF9)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",
	}
	ns "MISC"
	returns	"Any"

native "0x2D4259F1FEB81DA9"
	hash "0x2D4259F1FEB81DA9"
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "MISC"
	returns	"Any"

native "REMOVE_DISPATCH_SPAWN_BLOCKING_AREA"
	hash "0x264AC28B01B353A5"
	jhash (0xA8D2FB92)
	arguments {
		Any "p0",
	}
	ns "MISC"
	returns	"void"

native "RESET_DISPATCH_SPAWN_BLOCKING_AREAS"
	hash "0xAC7BFD5C1D83EA75"
	jhash (0x9A17F835)
	ns "MISC"
	returns	"void"

native "0xD9F692D349249528"
	hash "0xD9F692D349249528"
	jhash (0xE0C9307E)
	ns "MISC"
	returns	"void"

native "0xE532EC1A63231B4F"
	hash "0xE532EC1A63231B4F"
	jhash (0xA0D8C749)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "MISC"
	returns	"void"

native "0xB8721407EE9C3FF6"
	hash "0xB8721407EE9C3FF6"
	jhash (0x24A4E0B2)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",
	}
	ns "MISC"
	returns	"void"

native "0xB3CD58CCA6CDA852"
	hash "0xB3CD58CCA6CDA852"
	jhash (0x66C3C59C)
	ns "MISC"
	returns	"void"

native "0x2587A48BC88DFADF"
	hash "0x2587A48BC88DFADF"
	jhash (0xD9660339)
	arguments {
		BOOL "p0",
	}
	ns "MISC"
	returns	"void"

native "_DISPLAY_ONSCREEN_KEYBOARD_2"
	hash "0xCA78CFA0366592FE"
	jhash (0xD2688412)
	arguments {
		int "p0",

		charPtr "windowTitle",

		AnyPtr "p2",

		charPtr "defaultText",

		charPtr "defaultConcat1",

		charPtr "defaultConcat2",

		charPtr "defaultConcat3",

		charPtr "defaultConcat4",

		charPtr "defaultConcat5",

		charPtr "defaultConcat6",

		charPtr "defaultConcat7",

		int "maxInputLength",
	}
	alias "0xCA78CFA0366592FE"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		only documented to be continued...
</summary>
	]]

native "DISPLAY_ONSCREEN_KEYBOARD"
	hash "0x00DC833F2568DBF6"
	jhash (0xAD99F2CE)
	arguments {
		int "p0",

		charPtr "windowTitle",

		charPtr "p2",

		charPtr "defaultText",

		charPtr "defaultConcat1",

		charPtr "defaultConcat2",

		charPtr "defaultConcat3",

		int "maxInputLength",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		note, p0 is set to 6 for PC platform in at least 1 script, or to `unk::_get_ui_language_id() == 0` otherwise.

		NOTE: windowTitle uses text labels, and an invalid value will display nothing.

		Dr. Underscore: `UNK::_GET_UI_LANGUAGE_ID()` is now `UNK::_GET_CURRENT_LANGUAGE_ID()`

		www.gtaforums.com/topic/788343-vrel-script-hook-v/?p=1067380474

		windowTitle's
		-----------------
		CELL_EMAIL_BOD	=	"Enter your Eyefind message"
		CELL_EMAIL_BODE	=	"Message too long. Try again"
		CELL_EMAIL_BODF	=	"Forbidden message. Try again"
		CELL_EMAIL_SOD	=	"Enter your Eyefind subject"
		CELL_EMAIL_SODE	=	"Subject too long. Try again"
		CELL_EMAIL_SODF	=	"Forbidden text. Try again"
		CELL_EMASH_BOD	=	"Enter your Eyefind message"
		CELL_EMASH_BODE	=	"Message too long. Try again"
		CELL_EMASH_BODF	=	"Forbidden message. Try again"
		CELL_EMASH_SOD	=	"Enter your Eyefind subject"
		CELL_EMASH_SODE	=	"Subject too long. Try again"
		CELL_EMASH_SODF	=	"Forbidden Text. Try again"
		FMMC_KEY_TIP10	=	"Enter Synopsis"
		FMMC_KEY_TIP12	=	"Enter Custom Team Name"
		FMMC_KEY_TIP12F	=	"Forbidden Text. Try again"
		FMMC_KEY_TIP12N	=	"Custom Team Name"
		FMMC_KEY_TIP8	=	"Enter Message"
		FMMC_KEY_TIP8F	=	"Forbidden Text. Try again"
		FMMC_KEY_TIP8FS	=	"Invalid Message. Try again"
		FMMC_KEY_TIP8S	=	"Enter Message"
		FMMC_KEY_TIP9	=	"Enter Outfit Name"
		FMMC_KEY_TIP9F	=	"Invalid Outfit Name. Try again"
		FMMC_KEY_TIP9N	=	"Outfit Name"
		PM_NAME_CHALL	=	"Enter Challenge Name"
</summary>
	]]

native "UPDATE_ONSCREEN_KEYBOARD"
	hash "0x0CF2B696BBF945AE"
	jhash (0x23D0A1CE)
	ns "MISC"
	returns	"int"
	doc [[!
<summary>
		Returns the current status of the onscreen keyboard, and updates the output.

		Status Codes:

		0 - User still editing
		1 - User has finished editing
		2 - User has canceled editing
		3 - Keyboard isn't active
</summary>
	]]

native "GET_ONSCREEN_KEYBOARD_RESULT"
	hash "0x8362B09B91893647"
	jhash (0x44828FB3)
	ns "MISC"
	returns	"charPtr"
	doc [[!
<summary>
		Returns NULL unless UPDATE_ONSCREEN_KEYBOARD() returns 1 in the same tick.
</summary>
	]]

native "0x3ED1438C1F5C6612"
	hash "0x3ED1438C1F5C6612"
	jhash (0x3301EA47)
	arguments {
		int "p0",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		p0 was always 2 in R* scripts.
		Called before calling DISPLAY_ONSCREEN_KEYBOARD if the input needs to be saved.
</summary>
	]]

native "_REMOVE_STEALTH_KILL"
	hash "0xA6A12939F16D85BE"
	jhash (0x42B484ED)
	arguments {
		Hash "hash",

		BOOL "p1",
	}
	alias "0xA6A12939F16D85BE"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Appears to remove stealth kill action from memory.
		------------------------------------
		I agree with the above statement.
		p1 is unknown, my best guess would be if false it marks the stealth kill for immediate deletion, or if true marks it for deletion later.

</summary>
	]]

native "0x1EAE0A6E978894A2"
	hash "0x1EAE0A6E978894A2"
	jhash (0x8F60366E)
	arguments {
		int "p0",

		BOOL "p1",
	}
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Unsure about the use of this native but here's an example:

		void sub_8709() {
		    GAMEPLAY::_1EAE0A6E978894A2(0, 1);
		    GAMEPLAY::_1EAE0A6E978894A2(1, 1);
		    GAMEPLAY::_1EAE0A6E978894A2(2, 1);
		    GAMEPLAY::_1EAE0A6E978894A2(3, 1);
		    GAMEPLAY::_1EAE0A6E978894A2(4, 1);
		    GAMEPLAY::_1EAE0A6E978894A2(5, 1);
		    GAMEPLAY::_1EAE0A6E978894A2(6, 1);
		    GAMEPLAY::_1EAE0A6E978894A2(7, 1);
		    GAMEPLAY::_1EAE0A6E978894A2(8, 1);
		}

		So it appears that p0 ranges from 0 to 8.

		ENABLE_DISPATCH_SERVICE, seems to have a similar layout.
</summary>
	]]

native "SET_EXPLOSIVE_AMMO_THIS_FRAME"
	hash "0xA66C71C98D5F2CFB"
	jhash (0x2EAFA1D1)
	arguments {
		Player "player",
	}
	ns "MISC"
	returns	"void"

native "SET_FIRE_AMMO_THIS_FRAME"
	hash "0x11879CDD803D30F4"
	jhash (0x7C18FC8A)
	arguments {
		Player "player",
	}
	ns "MISC"
	returns	"Any"

native "SET_EXPLOSIVE_MELEE_THIS_FRAME"
	hash "0xFF1BED81BFDC0FE0"
	jhash (0x96663D56)
	arguments {
		Player "player",
	}
	ns "MISC"
	returns	"Any"

native "SET_SUPER_JUMP_THIS_FRAME"
	hash "0x57FFF03E423A4C0B"
	jhash (0x86745EF3)
	arguments {
		Player "player",
	}
	ns "MISC"
	returns	"int"

native "0x6FDDF453C0C756EC"
	hash "0x6FDDF453C0C756EC"
	jhash (0xC3C10FCC)
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		- if (GAMEPLAY::_6FDDF453C0C756EC() || GAMEPLAY::IS_PC_VERSION()) {

</summary>
	]]

native "0xFB00CA71DA386228"
	hash "0xFB00CA71DA386228"
	jhash (0x054EC103)
	ns "MISC"
	returns	"void"

native "0x5AA3BEFA29F03AD4"
	hash "0x5AA3BEFA29F03AD4"
	jhash (0x46B5A15C)
	ns "MISC"
	returns	"Any"

native "0xE3D969D2785FFB5E"
	hash "0xE3D969D2785FFB5E"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		sets something to 1
</summary>
	]]

native "_RESET_LOCALPLAYER_STATE"
	hash "0xC0AA53F866B3134D"
	jhash (0x5D209F25)
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Sets the localplayer playerinfo state back to playing (State 0)

		States are:
		-1: "Invalid"
		0: "Playing"
		1: "Died"
		2: "Arrested"
		3: "Failed Mission"
		4: "Left Game"
		5: "Respawn"
		6: "In MP Cutscene"
</summary>
	]]

native "0x0A60017F841A54F2"
	hash "0x0A60017F841A54F2"
	jhash (0x2D33F15A)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "MISC"
	returns	"void"

native "0x1FF6BF9A63E5757F"
	hash "0x1FF6BF9A63E5757F"
	jhash (0xDF99925C)
	ns "MISC"
	returns	"void"

native "0x1BB299305C3E8C13"
	hash "0x1BB299305C3E8C13"
	jhash (0xA27F4472)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "MISC"
	returns	"void"

native "0x8EF5573A1F801A5C"
	hash "0x8EF5573A1F801A5C"
	jhash (0x07FF553F)
	arguments {
		Any "p0",

		AnyPtr "p1",

		AnyPtr "p2",
	}
	ns "MISC"
	returns	"BOOL"

native "0x92790862E36C2ADA"
	hash "0x92790862E36C2ADA"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		I can 100% confirm this is some kind of START_* native.

		Next character in the name is either C, D or E.

		Used only once in the scripts (benchmark.ysc).
</summary>
	]]

native "0xC7DB36C24634F52B"
	hash "0xC7DB36C24634F52B"
	ns "MISC"
	returns	"void"

native "0x437138B6A830166A"
	hash "0x437138B6A830166A"
	ns "MISC"
	returns	"void"

native "0x37DEB0AA183FB6D8"
	hash "0x37DEB0AA183FB6D8"
	ns "MISC"
	returns	"void"

native "0xEA2F2061875EED90"
	hash "0xEA2F2061875EED90"
	ns "MISC"
	returns	"Any"

native "0x3BBBD13E5041A79E"
	hash "0x3BBBD13E5041A79E"
	ns "MISC"
	returns	"Any"

native "0xA049A5BE0F04F2F8"
	hash "0xA049A5BE0F04F2F8"
	ns "MISC"
	returns	"BOOL"

native "0x4750FC27570311EC"
	hash "0x4750FC27570311EC"
	ns "MISC"
	returns	"Any"

native "0x1B2366C3F2A5C8DF"
	hash "0x1B2366C3F2A5C8DF"
	ns "MISC"
	returns	"Any"

native "_FORCE_SOCIAL_CLUB_UPDATE"
	hash "0xEB6891F03362FB12"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		Exits the game and downloads a fresh social club update on next restart.
</summary>
	]]

native "0x14832BF2ABA53FC5"
	hash "0x14832BF2ABA53FC5"
	ns "MISC"
	returns	"Any"

native "0xC79AE21974B01FB2"
	hash "0xC79AE21974B01FB2"
	ns "MISC"
	returns	"void"

native "0x684A41975F077262"
	hash "0x684A41975F077262"
	ns "MISC"
	returns	"BOOL"
	doc [[!
<summary>
		example:

		 if (GAMEPLAY::_684A41975F077262()) {
		        (a_0) = GAMEPLAY::_ABB2FA71C83A1B72();
		    } else { 
		        (a_0) = -1;
		    }
</summary>
	]]

native "0xABB2FA71C83A1B72"
	hash "0xABB2FA71C83A1B72"
	ns "MISC"
	returns	"Any"

native "_SHOW_PED_IN_PAUSE_MENU"
	hash "0x4EBB7E87AA0DBED4"
	arguments {
		BOOL "toggle",
	}
	alias "0x4EBB7E87AA0DBED4"
	ns "MISC"
	returns	"void"
	doc [[!
<summary>
		If toggle is true, the ped's head is shown in the pause menu
		If toggle is false, the ped's head is not shown in the pause menu
</summary>
	]]

native "0x9689123E3F213AA5"
	hash "0x9689123E3F213AA5"
	ns "MISC"
	returns	"BOOL"

native "0x9D8D44ADBBA61EF2"
	hash "0x9D8D44ADBBA61EF2"
	arguments {
		BOOL "p0",
	}
	ns "MISC"
	returns	"void"

native "0x23227DF0B2115469"
	hash "0x23227DF0B2115469"
	ns "MISC"
	returns	"void"

native "0xD10282B6E3751BA0"
	hash "0xD10282B6E3751BA0"
	ns "MISC"
	returns	"Any"

native "PLAY_PED_RINGTONE"
	hash "0xF9E56683CA8E11A5"
	jhash (0x1D530E47)
	arguments {
		charPtr "ringtoneName",

		Ped "ped",

		BOOL "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/RFb4GTny

		AUDIO::PLAY_PED_RINGTONE("Remote_Ring", PLAYER::PLAYER_PED_ID(), 1);
		AUDIO::PLAY_PED_RINGTONE("Dial_and_Remote_Ring", PLAYER::PLAYER_PED_ID(), 1);

</summary>
	]]

native "IS_PED_RINGTONE_PLAYING"
	hash "0x1E8E5E20937E3137"
	jhash (0xFE576EE4)
	arguments {
		Ped "ped",
	}
	ns "AUDIO"
	returns	"BOOL"

native "STOP_PED_RINGTONE"
	hash "0x6C5AE23EFA885092"
	jhash (0xFEEA107C)
	arguments {
		Ped "ped",
	}
	ns "AUDIO"
	returns	"void"

native "IS_MOBILE_PHONE_CALL_ONGOING"
	hash "0x7497D2CE2C30D24C"
	jhash (0x4ED1400A)
	ns "AUDIO"
	returns	"BOOL"

native "0xC8B1B2425604CDD0"
	hash "0xC8B1B2425604CDD0"
	jhash (0x16FB88B5)
	ns "AUDIO"
	returns	"Any"

native "CREATE_NEW_SCRIPTED_CONVERSATION"
	hash "0xD2C91A0B572AAE56"
	jhash (0xB2BC25F8)
	ns "AUDIO"
	returns	"void"

native "ADD_LINE_TO_CONVERSATION"
	hash "0xC5EF963405593646"
	jhash (0x96CD0513)
	arguments {
		int "p0",

		charPtr "p1",

		charPtr "p2",

		int "p3",

		int "p4",

		BOOL "p5",

		BOOL "p6",

		BOOL "p7",

		BOOL "p8",

		int "p9",

		BOOL "p10",

		BOOL "p11",

		BOOL "p12",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		NOTE: ones that are -1, 0 - 35 are determined by a function where it gets a TextLabel from a global then runs,
		_GET_TEXT_SUBSTRING and depending on what the result is it goes in check order of 0 - 9 then A - Z then z (lowercase). So it will then return 0 - 35 or -1 if it's 'z'. The func to handle that ^^ is func_67 in dialog_handler.c atleast in TU27 Xbox360 scripts.

		p0 is -1, 0 
		p1 is a char or string (whatever you wanna call it)
		p2 is Global 10597 + i * 6. 'i' is a while(i &lt; 70) loop
		p3 is again -1, 0 - 35 
		p4 is again -1, 0 - 35 
		p5 is either 0 or 1 (bool ?)
		p6 is either 0 or 1 (The func to determine this is bool)
		p7 is either 0 or 1 (The func to determine this is bool)
		p8 is either 0 or 1 (The func to determine this is bool)
		p9 is 0 - 3 (Determined by func_60 in dialogue_handler.c)
		p10 is either 0 or 1 (The func to determine this is bool)
		p11 is either 0 or 1 (The func to determine this is bool)
		p12 is unknown as in TU27 X360 scripts it only goes to p11.
</summary>
	]]

native "ADD_PED_TO_CONVERSATION"
	hash "0x95D9F4BC443956E7"
	jhash (0xF8D5EB86)
	arguments {
		Any "p0",

		Any "ped",

		charPtr "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		4 calls in the b617d scripts. The only one with p0 and p2 in clear text:

		AUDIO::ADD_PED_TO_CONVERSATION(5, l_AF, "DINAPOLI");

		=================================================
		One of the 2 calls in dialogue_handler.c p0 is in a while-loop, and so is determined to also possibly be 0 - 15.
		Based on it asking if does_entity_exist for the global I have determined that p1 is, in fact, the ped, but could be wrong.
</summary>
	]]

native "0x33E3C6C6F2F0B506"
	hash "0x33E3C6C6F2F0B506"
	jhash (0x73C6F979)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "AUDIO"
	returns	"void"

native "0x892B6AB8F33606F5"
	hash "0x892B6AB8F33606F5"
	jhash (0x88203DDA)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "AUDIO"
	returns	"void"

native "SET_MICROPHONE_POSITION"
	hash "0xB6AE90EDDE95C762"
	jhash (0xAD7BB191)
	arguments {
		BOOL "p0",

		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		float "x3",

		float "y3",

		float "z3",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		If this is the correct name, what microphone? I know your TV isn't going to reach out and adjust your headset so..
</summary>
	]]

native "0x0B568201DD99F0EB"
	hash "0x0B568201DD99F0EB"
	jhash (0x1193ED6E)
	arguments {
		BOOL "p0",
	}
	ns "AUDIO"
	returns	"void"

native "0x61631F5DF50D1C34"
	hash "0x61631F5DF50D1C34"
	arguments {
		BOOL "p0",
	}
	ns "AUDIO"
	returns	"void"

native "START_SCRIPT_PHONE_CONVERSATION"
	hash "0x252E5F915EABB675"
	jhash (0x38E42D07)
	arguments {
		BOOL "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "PRELOAD_SCRIPT_PHONE_CONVERSATION"
	hash "0x6004BCB0E226AAEA"
	jhash (0x9ACB213A)
	arguments {
		BOOL "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "START_SCRIPT_CONVERSATION"
	hash "0x6B17C62C9635D2DC"
	jhash (0xE5DE7D9D)
	arguments {
		BOOL "p0",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",
	}
	ns "AUDIO"
	returns	"void"

native "PRELOAD_SCRIPT_CONVERSATION"
	hash "0x3B3CAD6166916D87"
	jhash (0xDDF5C579)
	arguments {
		BOOL "p0",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",
	}
	ns "AUDIO"
	returns	"void"

native "START_PRELOADED_CONVERSATION"
	hash "0x23641AFE870AF385"
	jhash (0xA170261B)
	ns "AUDIO"
	returns	"void"

native "0xE73364DB90778FFA"
	hash "0xE73364DB90778FFA"
	jhash (0x336F3D35)
	ns "AUDIO"
	returns	"Any"

native "IS_SCRIPTED_CONVERSATION_ONGOING"
	hash "0x16754C556D2EDE3D"
	jhash (0xCB8FD96F)
	ns "AUDIO"
	returns	"BOOL"

native "IS_SCRIPTED_CONVERSATION_LOADED"
	hash "0xDF0D54BE7A776737"
	jhash (0xE1870EA9)
	ns "AUDIO"
	returns	"BOOL"

native "GET_CURRENT_SCRIPTED_CONVERSATION_LINE"
	hash "0x480357EE890C295A"
	jhash (0x9620E41F)
	ns "AUDIO"
	returns	"Any"

native "PAUSE_SCRIPTED_CONVERSATION"
	hash "0x8530AD776CD72B12"
	jhash (0xE2C9C6F8)
	arguments {
		BOOL "p0",
	}
	ns "AUDIO"
	returns	"void"

native "RESTART_SCRIPTED_CONVERSATION"
	hash "0x9AEB285D1818C9AC"
	jhash (0x6CB24B56)
	ns "AUDIO"
	returns	"void"

native "STOP_SCRIPTED_CONVERSATION"
	hash "0xD79DEEFB53455EBA"
	jhash (0xAB77DA7D)
	arguments {
		BOOL "p0",
	}
	ns "AUDIO"
	returns	"Any"

native "SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE"
	hash "0x9663FE6B7A61EB00"
	jhash (0x85C98304)
	ns "AUDIO"
	returns	"void"

native "INTERRUPT_CONVERSATION"
	hash "0xA018A12E5C5C2FA6"
	jhash (0xF3A67AF3)
	arguments {
		Any "p0",

		AnyPtr "p1",

		AnyPtr "p2",
	}
	ns "AUDIO"
	returns	"void"

native "0x8A694D7A68F8DC38"
	hash "0x8A694D7A68F8DC38"
	arguments {
		Ped "p0",

		charPtr "p1",

		charPtr "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		One call found in the b617d scripts:

		AUDIO::_8A694D7A68F8DC38(NETWORK::NET_TO_PED(l_3989._f26F[0/*1*/]), "CONV_INTERRUPT_QUIT_IT", "LESTER");
</summary>
	]]

native "0xAA19F5572C38B564"
	hash "0xAA19F5572C38B564"
	jhash (0xB58B8FF3)
	arguments {
		AnyPtr "p0",
	}
	ns "AUDIO"
	returns	"Any"

native "0xB542DE8C3D1CB210"
	hash "0xB542DE8C3D1CB210"
	jhash (0x789D8C6C)
	arguments {
		BOOL "p0",
	}
	ns "AUDIO"
	returns	"void"

native "REGISTER_SCRIPT_WITH_AUDIO"
	hash "0xC6ED9D5092438D91"
	jhash (0xA6203643)
	arguments {
		int "p0",
	}
	ns "AUDIO"
	returns	"void"

native "UNREGISTER_SCRIPT_WITH_AUDIO"
	hash "0xA8638BE228D4751A"
	jhash (0x66728EFE)
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		On last-gen this just runs blr and this func is called by several other functions other then the native's table.
</summary>
	]]

native "REQUEST_MISSION_AUDIO_BANK"
	hash "0x7345BDD95E62E0F2"
	jhash (0x916E37CA)
	arguments {
		charPtr "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		 All occurrences and usages found in b617d: pastebin.com/NzZZ2Tmm

</summary>
	]]

native "REQUEST_AMBIENT_AUDIO_BANK"
	hash "0xFE02FFBED8CA9D99"
	jhash (0x23C88BC7)
	arguments {
		charPtr "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		All occurrences and usages found in b617d, sorted alphabetically and identical lines removed: pastebin.com/XZ1tmGEz
</summary>
	]]

native "REQUEST_SCRIPT_AUDIO_BANK"
	hash "0x2F844A8B08D76685"
	jhash (0x21322887)
	arguments {
		charPtr "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		All occurrences and usages found in b617d, sorted alphabetically and identical lines removed: pastebin.com/AkmDAVn6
</summary>
	]]

native "HINT_AMBIENT_AUDIO_BANK"
	hash "0x8F8C0E370AE62F5C"
	jhash (0xF1850DDC)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "AUDIO"
	returns	"Any"

native "HINT_SCRIPT_AUDIO_BANK"
	hash "0xFB380A29641EC31A"
	jhash (0x41FA0E51)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "AUDIO"
	returns	"Any"

native "RELEASE_MISSION_AUDIO_BANK"
	hash "0x0EC92A1BF0857187"
	jhash (0x8E8824C7)
	ns "AUDIO"
	returns	"void"

native "RELEASE_AMBIENT_AUDIO_BANK"
	hash "0x65475A218FFAA93D"
	jhash (0x8C938784)
	ns "AUDIO"
	returns	"void"

native "RELEASE_NAMED_SCRIPT_AUDIO_BANK"
	hash "0x77ED170667F50170"
	jhash (0x16707ABC)
	arguments {
		charPtr "audioBank",
	}
	ns "AUDIO"
	returns	"void"

native "RELEASE_SCRIPT_AUDIO_BANK"
	hash "0x7A2D8AD0A9EB9C3F"
	jhash (0x22F865E5)
	ns "AUDIO"
	returns	"void"

native "0x19AF7ED9B9D23058"
	hash "0x19AF7ED9B9D23058"
	jhash (0xA58BBF4F)
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		RELEASE_???

		I say RELEASE_???, as in IDA this native calls the same function as 

		-'RELEASE_MISSION_AUDIO_BANK()'.
		-'RELEASE_AMBIENT_AUDIO_BANK()'.
		-'RELEASE_SCRIPT_AUDIO_BANK()'.

		However 'RELEASE_NAMED_SCRIPT_AUDIO_BANK' does not use the same function. So may be, 'RELEASE_???_AUDIO_BANK()'? Doubt it.
</summary>
	]]

native "0x9AC92EED5E4793AB"
	hash "0x9AC92EED5E4793AB"
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		RELEASE_???

		I say RELEASE_???, as in IDA this native calls the same function as 

		-'RELEASE_MISSION_AUDIO_BANK()'.
		-'RELEASE_AMBIENT_AUDIO_BANK()'.
		-'RELEASE_SCRIPT_AUDIO_BANK()'.

		However 'RELEASE_NAMED_SCRIPT_AUDIO_BANK' does not use the same function. So may be, 'RELEASE_???_AUDIO_BANK()'? Doubt it.

		Console Hash: 0xE67446E9
</summary>
	]]

native "GET_SOUND_ID"
	hash "0x430386FE9BF80B45"
	jhash (0x6AE0AD56)
	ns "AUDIO"
	returns	"int"

native "RELEASE_SOUND_ID"
	hash "0x353FC880830B88FA"
	jhash (0x9C080899)
	arguments {
		int "soundId",
	}
	ns "AUDIO"
	returns	"void"

native "PLAY_SOUND"
	hash "0x7FF4944CC209192D"
	jhash (0xB6E1917F)
	arguments {
		Player "soundId",

		charPtr "audioName",

		charPtr "audioRef",

		BOOL "p3",

		Any "p4",

		BOOL "p5",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/A8Ny8AHZ
</summary>
	]]

native "PLAY_SOUND_FRONTEND"
	hash "0x67C540AA08E4A6F5"
	jhash (0x2E458F74)
	arguments {
		int "soundId",

		charPtr "audioName",

		charPtr "audioRef",

		BOOL "p3",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		list: pastebin.com/DCeRiaLJ

		All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/0neZdsZ5
</summary>
	]]

native "0xCADA5A0D0702381E"
	hash "0xCADA5A0D0702381E"
	jhash (0xC70E6CFA)
	arguments {
		charPtr "p0",

		charPtr "soundset",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Only call found in the b617d scripts:

		AUDIO::_CADA5A0D0702381E("BACK", "HUD_FREEMODE_SOUNDSET");
</summary>
	]]

native "PLAY_SOUND_FROM_ENTITY"
	hash "0xE65F427EB70AB1ED"
	jhash (0x95AE00F8)
	arguments {
		int "soundId",

		charPtr "audioName",

		Entity "entity",

		charPtr "audioRef",

		BOOL "p4",

		Any "p5",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/f2A7vTj0 
		No changes made in b678d.

		gtaforums.com/topic/795622-audio-for-mods

</summary>
	]]

native "PLAY_SOUND_FROM_COORD"
	hash "0x8D8686B622B88120"
	jhash (0xCAD3E2D5)
	arguments {
		int "soundId",

		charPtr "audioName",

		float "x",

		float "y",

		float "z",

		charPtr "audioRef",

		BOOL "p6",

		int "range",

		BOOL "p8",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/eeFc5DiW

		gtaforums.com/topic/795622-audio-for-mods
</summary>
	]]

native "STOP_SOUND"
	hash "0xA3B0C41BA5CC0BB5"
	jhash (0xCD7F4030)
	arguments {
		int "soundId",
	}
	ns "AUDIO"
	returns	"void"

native "GET_NETWORK_ID_FROM_SOUND_ID"
	hash "0x2DE3F0A134FFBC0D"
	jhash (0x2576F610)
	arguments {
		int "soundId",
	}
	ns "AUDIO"
	returns	"int"
	doc [[!
<summary>
		Could this be used alongside either, 
		SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES or _SET_NETWORK_ID_SYNC_TO_PLAYER to make it so other players can hear the sound while online? It'd be a bit troll-fun to be able to play the Zancudo UFO creepy sounds globally.
</summary>
	]]

native "GET_SOUND_ID_FROM_NETWORK_ID"
	hash "0x75262FD12D0A1C84"
	jhash (0xD064D4DC)
	arguments {
		int "netId",
	}
	alias "0x75262FD12D0A1C84"
	ns "AUDIO"
	returns	"int"

native "SET_VARIABLE_ON_SOUND"
	hash "0xAD6B3148A78AE9B6"
	jhash (0x606EE5FA)
	arguments {
		int "soundId",

		charPtr "variableName",

		float "value",
	}
	ns "AUDIO"
	returns	"void"

native "SET_VARIABLE_ON_STREAM"
	hash "0x2F9D3834AEB9EF79"
	jhash (0xF67BB44C)
	arguments {
		charPtr "p0",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		From the scripts, p0:

		"ArmWrestlingIntensity",
		"INOUT",
		"Monkey_Stream",
		"ZoomLevel"
</summary>
	]]

native "OVERRIDE_UNDERWATER_STREAM"
	hash "0xF2A9CDABCEA04BD6"
	jhash (0x9A083B7E)
	arguments {
		AnyPtr "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x733ADF241531E5C2"
	hash "0x733ADF241531E5C2"
	jhash (0x62D026BE)
	arguments {
		charPtr "name",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		AUDIO::_733ADF241531E5C2("inTunnel", 1.0);
		AUDIO::_733ADF241531E5C2("inTunnel", 0.0);

		I do not know as of yet what this does, but this was found in the scripts.
</summary>
	]]

native "HAS_SOUND_FINISHED"
	hash "0xFCBDCE714A7C88E5"
	jhash (0xE85AEC2E)
	arguments {
		int "soundId",
	}
	ns "AUDIO"
	returns	"BOOL"

native "_PLAY_AMBIENT_SPEECH1"
	hash "0x8E04FEDD28D42462"
	jhash (0x5C57B85D)
	arguments {
		Ped "ped",

		charPtr "speechName",

		charPtr "speechParam",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Plays ambient speech. See also _0x444180DB.

		ped: The ped to play the ambient speech.
		speechName: Name of the speech to play, eg. "GENERIC_HI".
		speechParam: Can be one of the following:
		SPEECH_PARAMS_STANDARD
		SPEECH_PARAMS_ALLOW_REPEAT
		SPEECH_PARAMS_BEAT
		SPEECH_PARAMS_FORCE
		SPEECH_PARAMS_FORCE_FRONTEND
		SPEECH_PARAMS_FORCE_NO_REPEAT_FRONTEND
		SPEECH_PARAMS_FORCE_NORMAL
		SPEECH_PARAMS_FORCE_NORMAL_CLEAR
		SPEECH_PARAMS_FORCE_NORMAL_CRITICAL
		SPEECH_PARAMS_FORCE_SHOUTED
		SPEECH_PARAMS_FORCE_SHOUTED_CLEAR
		SPEECH_PARAMS_FORCE_SHOUTED_CRITICAL
		SPEECH_PARAMS_FORCE_PRELOAD_ONLY
		SPEECH_PARAMS_MEGAPHONE
		SPEECH_PARAMS_HELI
		SPEECH_PARAMS_FORCE_MEGAPHONE
		SPEECH_PARAMS_FORCE_HELI
		SPEECH_PARAMS_INTERRUPT
		SPEECH_PARAMS_INTERRUPT_SHOUTED
		SPEECH_PARAMS_INTERRUPT_SHOUTED_CLEAR
		SPEECH_PARAMS_INTERRUPT_SHOUTED_CRITICAL
		SPEECH_PARAMS_INTERRUPT_NO_FORCE
		SPEECH_PARAMS_INTERRUPT_FRONTEND
		SPEECH_PARAMS_INTERRUPT_NO_FORCE_FRONTEND
		SPEECH_PARAMS_ADD_BLIP
		SPEECH_PARAMS_ADD_BLIP_ALLOW_REPEAT
		SPEECH_PARAMS_ADD_BLIP_FORCE
		SPEECH_PARAMS_ADD_BLIP_SHOUTED
		SPEECH_PARAMS_ADD_BLIP_SHOUTED_FORCE
		SPEECH_PARAMS_ADD_BLIP_INTERRUPT
		SPEECH_PARAMS_ADD_BLIP_INTERRUPT_FORCE
		SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED
		SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CLEAR
		SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CRITICAL
		SPEECH_PARAMS_SHOUTED
		SPEECH_PARAMS_SHOUTED_CLEAR
		SPEECH_PARAMS_SHOUTED_CRITICAL

		Note: A list of Name and Parameters can be found here pastebin.com/1GZS5dCL

		Full list of speeches and voices names by some spanish shitbag: gist.github.com/alexguirre/0af600eb3d4c91ad4f900120a63b8992
</summary>
	]]

native "_PLAY_AMBIENT_SPEECH2"
	hash "0xC6941B4A3A8FBBB9"
	jhash (0x444180DB)
	arguments {
		Ped "ped",

		charPtr "speechName",

		charPtr "speechParam",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Plays ambient speech. See also _0x5C57B85D.

		See _PLAY_AMBIENT_SPEECH1 for parameter specifications.

		Full list of speeches and voices names: gist.github.com/alexguirre/0af600eb3d4c91ad4f900120a63b8992
</summary>
	]]

native "_PLAY_AMBIENT_SPEECH_WITH_VOICE"
	hash "0x3523634255FC3318"
	jhash (0x8386AE28)
	arguments {
		Ped "p0",

		charPtr "speechName",

		charPtr "voiceName",

		charPtr "speechParam",

		BOOL "p4",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		This is the same as _PLAY_AMBIENT_SPEECH1 and _PLAY_AMBIENT_SPEECH2 but it will allow you to play a speech file from a specific voice file. It works on players and all peds, even animals.

		EX (C#):
		GTA.Native.Function.Call(Hash._0x3523634255FC3318, Game.Player.Character, "GENERIC_INSULT_HIGH", "s_m_y_sheriff_01_white_full_01", "SPEECH_PARAMS_FORCE_SHOUTED", 0);

		The first param is the ped you want to play it on, the second is the speech name, the third is the voice name, the fourth is the speech param, and the last param is usually always 0.

		Full list of speeches and voices names: gist.github.com/alexguirre/0af600eb3d4c91ad4f900120a63b8992
</summary>
	]]

native "_PLAY_AMBIENT_SPEECH_AT_COORDS"
	hash "0xED640017ED337E45"
	jhash (0xA1A1402E)
	arguments {
		charPtr "p0",

		charPtr "p1",

		float "p2",

		float "p3",

		float "p4",

		charPtr "p5",
	}
	alias "0xED640017ED337E45"
	ns "AUDIO"
	returns	"void"

native "OVERRIDE_TREVOR_RAGE"
	hash "0x13AD665062541A7E"
	jhash (0x05B9B5CF)
	arguments {
		AnyPtr "p0",
	}
	ns "AUDIO"
	returns	"void"

native "RESET_TREVOR_RAGE"
	hash "0xE78503B10C4314E0"
	jhash (0xE80CF0D4)
	ns "AUDIO"
	returns	"void"

native "SET_PLAYER_ANGRY"
	hash "0xEA241BB04110F091"
	jhash (0x782CA58D)
	arguments {
		Ped "playerPed",

		BOOL "disabled",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Hash collision! Disables speech.
</summary>
	]]

native "PLAY_PAIN"
	hash "0xBC9AE166038A5CEC"
	jhash (0x874BD6CB)
	arguments {
		Ped "ped",

		int "painID",

		int "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Needs another parameter [int p2]. The signature is PED::PLAY_PAIN(Ped ped, int painID, int p1, int p2);

		Last 2 parameters always seem to be 0.

		EX: Function.Call(Hash.PLAY_PAIN, TestPed, 6, 0, 0);

		Known Pain IDs
		________________________

		1 - Doesn't seem to do anything. Does NOT crash the game like previously said. (Latest patch)
		6 - Scream (Short)
		7 - Scared Scream (Kinda Long)
		8 - On Fire

</summary>
	]]

native "0xD01005D2BA2EB778"
	hash "0xD01005D2BA2EB778"
	jhash (0x59A3A17D)
	arguments {
		charPtr "p0",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Similar to 0xDDC635D5B3262C56. Enable?
</summary>
	]]

native "0xDDC635D5B3262C56"
	hash "0xDDC635D5B3262C56"
	jhash (0x0E387BFE)
	arguments {
		charPtr "p0",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Similar to 0xD01005D2BA2EB778. Disable?
</summary>
	]]

native "SET_AMBIENT_VOICE_NAME"
	hash "0x6C8065A3B780185B"
	jhash (0xBD2EA1A1)
	arguments {
		Ped "ped",

		charPtr "name",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Audio List
		gtaforums.com/topic/795622-audio-for-mods/

		All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/FTeAj4yZ

		Yes
</summary>
	]]

native "_SET_PED_SCREAM"
	hash "0x40CF0D12D142A9E8"
	arguments {
		Ped "ped",
	}
	alias "0x40CF0D12D142A9E8"
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Assigns some ambient voice to the ped.
</summary>
	]]

native "0x7CDC8C3B89F661B3"
	hash "0x7CDC8C3B89F661B3"
	arguments {
		Ped "playerPed",

		Hash "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		From the scripts:

		AUDIO::_7CDC8C3B89F661B3(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("PAIGE_PVG"));
		                AUDIO::_7CDC8C3B89F661B3(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("TALINA_PVG"));
		            AUDIO::_7CDC8C3B89F661B3(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("FEMALE_LOST_BLACK_PVG"));
		            AUDIO::_7CDC8C3B89F661B3(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("FEMALE_LOST_WHITE_PVG"));

</summary>
	]]

native "0xA5342D390CDA41D6"
	hash "0xA5342D390CDA41D6"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "_SET_PED_MUTE"
	hash "0x7A73D05A607734C7"
	arguments {
		Ped "ped",
	}
	alias "0x7A73D05A607734C7"
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Stops speech.
</summary>
	]]

native "STOP_CURRENT_PLAYING_AMBIENT_SPEECH"
	hash "0xB8BEC0CA6F0EDB0F"
	jhash (0xBB8E64BF)
	arguments {
		Ped "ped",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Needs to be called every frame. 
</summary>
	]]

native "IS_AMBIENT_SPEECH_PLAYING"
	hash "0x9072C8B49907BFAD"
	jhash (0x1972E8AA)
	arguments {
		Ped "p0",
	}
	ns "AUDIO"
	returns	"BOOL"

native "IS_SCRIPTED_SPEECH_PLAYING"
	hash "0xCC9AA18DCC7084F4"
	jhash (0x2C653904)
	arguments {
		Any "p0",
	}
	ns "AUDIO"
	returns	"BOOL"

native "IS_ANY_SPEECH_PLAYING"
	hash "0x729072355FA39EC9"
	jhash (0x2B74A6D6)
	arguments {
		Ped "ped",
	}
	ns "AUDIO"
	returns	"BOOL"

native "_CAN_PED_SPEAK"
	hash "0x49B99BF3FDA89A7A"
	jhash (0x8BD5F11E)
	arguments {
		Ped "ped",

		charPtr "speechName",

		BOOL "unk",
	}
	alias "0x49B99BF3FDA89A7A"
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if the ped can play the speech or has the speech file, last parameter is usually 0
</summary>
	]]

native "IS_PED_IN_CURRENT_CONVERSATION"
	hash "0x049E937F18F4020C"
	jhash (0x7B2F0743)
	arguments {
		Ped "ped",
	}
	ns "AUDIO"
	returns	"BOOL"

native "SET_PED_IS_DRUNK"
	hash "0x95D2D383D5396B8A"
	jhash (0xD2EA77A3)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Sets the ped drunk sounds.  Only works with PLAYER_PED_ID

		====================================================

		As mentioned above, this only sets the drunk sound to ped/player.

		To give the Ped a drunk effect with drunk walking animation try using SET_PED_MOVEMENT_CLIPSET

		Below is an example

		if (!Function.Call&lt;bool&gt;(Hash.HAS_ANIM_SET_LOADED, "move_m@drunk@verydrunk"))
		                {
		                    Function.Call(Hash.REQUEST_ANIM_SET, "move_m@drunk@verydrunk");
		                }
		                Function.Call(Hash.SET_PED_MOVEMENT_CLIPSET, Ped.Handle, "move_m@drunk@verydrunk", 0x3E800000);



		And to stop the effect use
		RESET_PED_MOVEMENT_CLIPSET
</summary>
	]]

native "0xEE066C7006C49C0A"
	hash "0xEE066C7006C49C0A"
	jhash (0x498849F3)
	arguments {
		Any "p0",

		Any "p1",

		AnyPtr "p2",
	}
	ns "AUDIO"
	returns	"void"

native "0xC265DF9FB44A9FBD"
	hash "0xC265DF9FB44A9FBD"
	jhash (0x0CBAF2EF)
	arguments {
		Any "p0",
	}
	ns "AUDIO"
	returns	"BOOL"

native "SET_ANIMAL_MOOD"
	hash "0xCC97B29285B1DC3B"
	jhash (0x3EA7C6CB)
	arguments {
		Ped "animal",

		int "mood",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		mood can be 0 or 1 (it's not a boolean value!). Effects audio of the animal.
</summary>
	]]

native "IS_MOBILE_PHONE_RADIO_ACTIVE"
	hash "0xB35CE999E8EF317E"
	jhash (0x6E502A5B)
	ns "AUDIO"
	returns	"BOOL"

native "SET_MOBILE_PHONE_RADIO_STATE"
	hash "0xBF286C554784F3DF"
	jhash (0xE1E0ED34)
	arguments {
		BOOL "state",
	}
	ns "AUDIO"
	returns	"void"

native "GET_PLAYER_RADIO_STATION_INDEX"
	hash "0xE8AF77C4C06ADC93"
	jhash (0x1C4946AC)
	ns "AUDIO"
	returns	"int"
	doc [[!
<summary>
		Returns 255 (radio off index) if the function fails.
</summary>
	]]

native "GET_PLAYER_RADIO_STATION_NAME"
	hash "0xF6D733C32076AD03"
	jhash (0xD909C107)
	ns "AUDIO"
	returns	"charPtr"
	doc [[!
<summary>
		Returns active radio station name
</summary>
	]]

native "GET_RADIO_STATION_NAME"
	hash "0xB28ECA15046CA8B9"
	jhash (0x3DF493BC)
	arguments {
		int "radioStation",
	}
	ns "AUDIO"
	returns	"charPtr"
	doc [[!
<summary>
		Returns String with radio station name.
</summary>
	]]

native "GET_PLAYER_RADIO_STATION_GENRE"
	hash "0xA571991A7FE6CCEB"
	jhash (0x872CF0EA)
	ns "AUDIO"
	returns	"Any"

native "IS_RADIO_RETUNING"
	hash "0xA151A7394A214E65"
	jhash (0xCF29097B)
	ns "AUDIO"
	returns	"BOOL"

native "0x0626A247D2405330"
	hash "0x0626A247D2405330"
	ns "AUDIO"
	returns	"Any"

native "0xFF266D1D0EB1195D"
	hash "0xFF266D1D0EB1195D"
	jhash (0x53DB6994)
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Tune Forward... ?
</summary>
	]]

native "0xDD6BCF9E94425DF9"
	hash "0xDD6BCF9E94425DF9"
	jhash (0xD70ECC80)
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Tune Backwards... ?
</summary>
	]]

native "SET_RADIO_TO_STATION_NAME"
	hash "0xC69EDA28699D5107"
	jhash (0x7B36E35E)
	arguments {
		charPtr "stationName",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/Kj9t38KF
</summary>
	]]

native "SET_VEH_RADIO_STATION"
	hash "0x1B9C0099CB942AC6"
	jhash (0xE391F55F)
	arguments {
		Vehicle "vehicle",

		charPtr "radioStation",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/Kj9t38KF
</summary>
	]]

native "0xC1805D05E6D4FE10"
	hash "0xC1805D05E6D4FE10"
	jhash (0x7ABB89D2)
	arguments {
		Vehicle "vehicle",
	}
	ns "AUDIO"
	returns	"void"

native "SET_EMITTER_RADIO_STATION"
	hash "0xACF57305B12AF907"
	jhash (0x87431585)
	arguments {
		charPtr "emitterName",

		charPtr "radioStation",
	}
	ns "AUDIO"
	returns	"void"

native "SET_STATIC_EMITTER_ENABLED"
	hash "0x399D2D3B33F1B8EB"
	jhash (0x91F72E92)
	arguments {
		charPtr "emitterName",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Example:
		AUDIO::SET_STATIC_EMITTER_ENABLED((Any*)"LOS_SANTOS_VANILLA_UNICORN_01_STAGE", false);	AUDIO::SET_STATIC_EMITTER_ENABLED((Any*)"LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM", false);	AUDIO::SET_STATIC_EMITTER_ENABLED((Any*)"LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM", false);

		This turns off surrounding sounds not connected directly to peds. 


</summary>
	]]

native "SET_RADIO_TO_STATION_INDEX"
	hash "0xA619B168B8A8570F"
	jhash (0x1D82766D)
	arguments {
		int "radioStation",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Sets radio station by index.
</summary>
	]]

native "SET_FRONTEND_RADIO_ACTIVE"
	hash "0xF7F26C6E9CC9EBB8"
	jhash (0xB1172075)
	arguments {
		BOOL "active",
	}
	ns "AUDIO"
	returns	"void"

native "UNLOCK_MISSION_NEWS_STORY"
	hash "0xB165AB7C248B2DC1"
	jhash (0xCCD9ABE4)
	arguments {
		int "newsStory",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		I see this as a native that would of been used back in GTA III when you finally unlocked the bridge to the next island and such.
</summary>
	]]

native "GET_NUMBER_OF_PASSENGER_VOICE_VARIATIONS"
	hash "0x66E49BF55B4B1874"
	jhash (0x27305D37)
	arguments {
		Any "p0",
	}
	ns "AUDIO"
	returns	"int"

native "GET_AUDIBLE_MUSIC_TRACK_TEXT_ID"
	hash "0x50B196FC9ED6545B"
	jhash (0xA2B88CA7)
	ns "AUDIO"
	returns	"int"

native "PLAY_END_CREDITS_MUSIC"
	hash "0xCD536C4D33DCC900"
	jhash (0x8E88B3CC)
	arguments {
		BOOL "play",
	}
	ns "AUDIO"
	returns	"void"

native "SKIP_RADIO_FORWARD"
	hash "0x6DDBBDD98E2E9C25"
	jhash (0x10D36630)
	ns "AUDIO"
	returns	"void"

native "FREEZE_RADIO_STATION"
	hash "0x344F393B027E38C3"
	jhash (0x286BF543)
	arguments {
		charPtr "radioStation",
	}
	ns "AUDIO"
	returns	"void"

native "UNFREEZE_RADIO_STATION"
	hash "0xFC00454CF60B91DD"
	jhash (0x4D46202C)
	arguments {
		charPtr "radioStation",
	}
	ns "AUDIO"
	returns	"void"

native "SET_RADIO_AUTO_UNFREEZE"
	hash "0xC1AA9F53CE982990"
	jhash (0xA40196BF)
	arguments {
		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"

native "SET_INITIAL_PLAYER_STATION"
	hash "0x88795F13FACDA88D"
	jhash (0x9B069233)
	arguments {
		charPtr "radioStation",
	}
	ns "AUDIO"
	returns	"void"

native "SET_USER_RADIO_CONTROL_ENABLED"
	hash "0x19F21E63AE6EAE4E"
	jhash (0x52E054CE)
	arguments {
		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"

native "SET_RADIO_TRACK"
	hash "0xB39786F201FEE30B"
	jhash (0x76E96212)
	arguments {
		charPtr "radioStation",

		charPtr "radioTrack",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Only found this one in the decompiled scripts:

		AUDIO::SET_RADIO_TRACK("RADIO_03_HIPHOP_NEW", "ARM1_RADIO_STARTS");

</summary>
	]]

native "SET_VEHICLE_RADIO_LOUD"
	hash "0xBB6F1CAEC68B0BCE"
	jhash (0x8D9EDD99)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"

native "_IS_VEHICLE_RADIO_LOUD"
	hash "0x032A116663A4D5AC"
	jhash (0xCBA99F4A)
	arguments {
		Vehicle "vehicle",
	}
	ns "AUDIO"
	returns	"BOOL"

native "SET_MOBILE_RADIO_ENABLED_DURING_GAMEPLAY"
	hash "0x1098355A16064BB3"
	jhash (0x990085F0)
	arguments {
		BOOL "Toggle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Enables Radio on phone.
</summary>
	]]

native "0x109697E2FFBAC8A1"
	hash "0x109697E2FFBAC8A1"
	jhash (0x46B0C696)
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Not sure what this function does, but it's related to the audio of the local player's vehicle (Considering the surrounding natives, it's probably radio related).
</summary>
	]]

native "_IS_PLAYER_VEHICLE_RADIO_ENABLED"
	hash "0x5F43D83FD6738741"
	jhash (0x2A3E5E8B)
	alias "0x5F43D83FD6738741"
	ns "AUDIO"
	returns	"BOOL"

native "SET_VEHICLE_RADIO_ENABLED"
	hash "0x3B988190C0AA6C0B"
	jhash (0x6F812CAB)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		can't seem to enable radio on cop cars etc
</summary>
	]]

native "0x4E404A9361F75BB2"
	hash "0x4E404A9361F75BB2"
	jhash (0x128C3873)
	arguments {
		charPtr "radioStation",

		charPtr "p1",

		BOOL "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Examples:

		AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_MICHAEL", 1);
		AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_MICHAEL", 1);
		AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_TREVOR", 1);
		AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "END_CREDITS_SAVE_MICHAEL_TREVOR", 1);
		AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "OFF_ROAD_RADIO_ROCK_LIST", 1);
		AUDIO::_4E404A9361F75BB2("RADIO_06_COUNTRY", "MAGDEMO2_RADIO_DINGHY", 1);
		AUDIO::_4E404A9361F75BB2("RADIO_16_SILVERLAKE", "SEA_RACE_RADIO_PLAYLIST", 1);
		AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "OFF_ROAD_RADIO_ROCK_LIST", 1);
</summary>
	]]

native "0x1654F24A88A8E3FE"
	hash "0x1654F24A88A8E3FE"
	jhash (0x1D766976)
	arguments {
		charPtr "radioStation",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		3 calls in the b617d scripts, removed duplicate.

		AUDIO::_1654F24A88A8E3FE("RADIO_16_SILVERLAKE");
		AUDIO::_1654F24A88A8E3FE("RADIO_01_CLASS_ROCK");
</summary>
	]]

native "_MAX_RADIO_STATION_INDEX"
	hash "0xF1620ECB50E01DE7"
	jhash (0xCC91FCF5)
	ns "AUDIO"
	returns	"int"

native "FIND_RADIO_STATION_INDEX"
	hash "0x8D67489793FF428B"
	jhash (0xECA1512F)
	arguments {
		int "station",
	}
	ns "AUDIO"
	returns	"int"

native "0x774BD811F656A122"
	hash "0x774BD811F656A122"
	jhash (0xB1FF7137)
	arguments {
		charPtr "radioStation",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		6 calls in the b617d scripts, removed identical lines:

		AUDIO::_774BD811F656A122("RADIO_01_CLASS_ROCK", 1);
		AUDIO::_774BD811F656A122(AUDIO::GET_RADIO_STATION_NAME(10), 0);
		AUDIO::_774BD811F656A122(AUDIO::GET_RADIO_STATION_NAME(10), 1);
</summary>
	]]

native "0x2C96CDB04FCA358E"
	hash "0x2C96CDB04FCA358E"
	jhash (0xC8B514E2)
	arguments {
		float "p0",
	}
	ns "AUDIO"
	returns	"void"

native "0x031ACB6ABA18C729"
	hash "0x031ACB6ABA18C729"
	jhash (0xBE998184)
	arguments {
		charPtr "radioStation",

		charPtr "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		2 calls in the b617d scripts. This line is called 2 times:
		AUDIO::_031ACB6ABA18C729("RADIO_16_SILVERLAKE", "MIRRORPARK_LOCKED");

		Note: Another name for RADIO_16_SILVERLAKE is RADIO MIRROR PARK
</summary>
	]]

native "0xF3365489E0DD50F9"
	hash "0xF3365489E0DD50F9"
	jhash (0x8AFC488D)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "SET_AMBIENT_ZONE_STATE"
	hash "0xBDA07E5950085E46"
	jhash (0x2849CAC9)
	arguments {
		AnyPtr "p0",

		BOOL "p1",

		BOOL "p2",
	}
	ns "AUDIO"
	returns	"void"

native "CLEAR_AMBIENT_ZONE_STATE"
	hash "0x218DD44AAAC964FF"
	jhash (0xCDFF3C82)
	arguments {
		charPtr "zoneName",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		This function also has a p2, unknown. Signature AUDIO::CLEAR_AMBIENT_ZONE_STATE(char* zoneName, bool p1, Any p2);

		Still needs more research. 

		Here are the names I've found: pastebin.com/AfA0Qjyv

		New Ambient Zone List (Combind with old): pastebin.com/h8BsKgUD -DasChaos
</summary>
	]]

native "SET_AMBIENT_ZONE_LIST_STATE"
	hash "0x9748FA4DE50CCE3E"
	jhash (0xBF80B412)
	arguments {
		charPtr "p0",

		BOOL "p1",

		BOOL "p2",
	}
	ns "AUDIO"
	returns	"void"

native "CLEAR_AMBIENT_ZONE_LIST_STATE"
	hash "0x120C48C614909FA4"
	jhash (0x38B9B8D4)
	arguments {
		AnyPtr "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "SET_AMBIENT_ZONE_STATE_PERSISTENT"
	hash "0x1D6650420CEC9D3B"
	jhash (0xC1FFB672)
	arguments {
		charPtr "ambientZone",

		BOOL "p1",

		BOOL "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		 All occurrences found in b617d, sorted alphabetically and identical lines removed: pastebin.com/jYvw7N1S

		New Ambient Zone List (Combind with old): pastebin.com/h8BsKgUD -DasChaos
</summary>
	]]

native "SET_AMBIENT_ZONE_LIST_STATE_PERSISTENT"
	hash "0xF3638DAE8C4045E1"
	jhash (0x5F5A2605)
	arguments {
		charPtr "ambientZone",

		BOOL "p1",

		BOOL "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		All occurrences found in b617d, sorted alphabetically and identical lines removed: pastebin.com/WkXDGgQL

		New Ambient Zone List (Combind with old): pastebin.com/h8BsKgUD -DasChaos
</summary>
	]]

native "IS_AMBIENT_ZONE_ENABLED"
	hash "0x01E2817A479A7F9B"
	jhash (0xBFABD872)
	arguments {
		charPtr "ambientZone",
	}
	ns "AUDIO"
	returns	"BOOL"

native "SET_CUTSCENE_AUDIO_OVERRIDE"
	hash "0x3B4BF5F0859204D9"
	jhash (0xCE1332B7)
	arguments {
		charPtr "p0",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		All occurrences found in b617d, sorted alphabetically and identical lines removed: 

		AUDIO::SET_CUTSCENE_AUDIO_OVERRIDE("_AK");
		AUDIO::SET_CUTSCENE_AUDIO_OVERRIDE("_CUSTOM");
		AUDIO::SET_CUTSCENE_AUDIO_OVERRIDE("_TOOTHLESS");
</summary>
	]]

native "GET_PLAYER_HEADSET_SOUND_ALTERNATE"
	hash "0xBCC29F935ED07688"
	jhash (0xD63CF33A)
	arguments {
		charPtr "p0",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Called 5 times in the scripts. All occurrences found in b617d, sorted alphabetically and identical lines removed: 

		AUDIO::GET_PLAYER_HEADSET_SOUND_ALTERNATE("INOUT", 0.0);
		AUDIO::GET_PLAYER_HEADSET_SOUND_ALTERNATE("INOUT", 1.0);
</summary>
	]]

native "PLAY_POLICE_REPORT"
	hash "0xDFEBD56D9BD1EB16"
	jhash (0x3F277B62)
	arguments {
		charPtr "name",

		float "p1",
	}
	ns "AUDIO"
	returns	"Any"
	doc [[!
<summary>
		Please change to void. (Does not return anything!)

		Plays the given police radio message.

		All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/GBnsQ5hr
</summary>
	]]

native "_DISABLE_POLICE_REPORTS"
	hash "0xB4F90FAF7670B16F"
	alias "0xB4F90FAF7670B16F"
	ns "AUDIO"
	returns	"void"

native "BLIP_SIREN"
	hash "0x1B9025BDA76822B6"
	jhash (0xC0EB6924)
	arguments {
		Vehicle "vehicle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Plays the siren sound of a vehicle which is otherwise activated when fastly double-pressing the horn key.
		Only works on vehicles with a police siren.
</summary>
	]]

native "OVERRIDE_VEH_HORN"
	hash "0x3CDC1E622CCE0356"
	jhash (0x2ACAB783)
	arguments {
		Vehicle "vehicle",

		BOOL "mute",

		int "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		vehicle - the vehicle whose horn should be overwritten
		mute - p1 seems to be an option for muting the horn
		p2 - maybe a horn id, since the function AUDIO::GET_VEHICLE_DEFAULT_HORN(veh) exists?
</summary>
	]]

native "IS_HORN_ACTIVE"
	hash "0x9D6BFC12B05C6121"
	jhash (0x20E2BDD0)
	arguments {
		Vehicle "vehicle",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Checks whether the horn of a vehicle is currently played.
</summary>
	]]

native "SET_AGGRESSIVE_HORNS"
	hash "0x395BF71085D1B1D9"
	jhash (0x01D6EABE)
	arguments {
		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Makes pedestrians sound their horn longer, faster and more agressive when they use their horn.
</summary>
	]]

native "0x02E93C796ABD3A97"
	hash "0x02E93C796ABD3A97"
	jhash (0x3C395AEE)
	arguments {
		BOOL "p0",
	}
	ns "AUDIO"
	returns	"void"

native "0x58BB377BEC7CD5F4"
	hash "0x58BB377BEC7CD5F4"
	jhash (0x8CE63FA1)
	arguments {
		BOOL "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "IS_STREAM_PLAYING"
	hash "0xD11FA52EB849D978"
	jhash (0xF1F51A14)
	ns "AUDIO"
	returns	"BOOL"

native "GET_STREAM_PLAY_TIME"
	hash "0x4E72BBDBCA58A3DB"
	jhash (0xB4F0AD56)
	ns "AUDIO"
	returns	"int"

native "LOAD_STREAM"
	hash "0x1F1F957154EC51DF"
	jhash (0x0D89599D)
	arguments {
		charPtr "streamName",

		charPtr "soundSet",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Example:
		AUDIO::LOAD_STREAM("CAR_STEAL_1_PASSBY", "CAR_STEAL_1_SOUNDSET");

		All found occurrences in the b678d decompiled scripts: pastebin.com/3rma6w5w

		Stream names often ends with "_MASTER", "_SMALL" or "_STREAM". Also "_IN", "_OUT" and numbers.   

		soundSet is often set to 0 in the scripts. These are common to end the soundSets: "_SOUNDS", "_SOUNDSET" and numbers. 
</summary>
	]]

native "LOAD_STREAM_WITH_START_OFFSET"
	hash "0x59C16B79F53B3712"
	jhash (0xE5B5745C)
	arguments {
		charPtr "streamName",

		int "startOffset",

		charPtr "soundSet",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Example:
		AUDIO::LOAD_STREAM_WITH_START_OFFSET("STASH_TOXIN_STREAM", 2400, "FBI_05_SOUNDS");

		Only called a few times in the scripts. 
</summary>
	]]

native "PLAY_STREAM_FROM_PED"
	hash "0x89049DD63C08B5D1"
	jhash (0xA1D7FABE)
	arguments {
		Ped "ped",
	}
	alias "0x89049DD63C08B5D1"
	ns "AUDIO"
	returns	"void"

native "PLAY_STREAM_FROM_VEHICLE"
	hash "0xB70374A758007DFA"
	jhash (0xF8E4BDA2)
	arguments {
		Vehicle "vehicle",
	}
	ns "AUDIO"
	returns	"void"

native "PLAY_STREAM_FROM_OBJECT"
	hash "0xEBAA9B64D76356FD"
	jhash (0xC5266BF7)
	arguments {
		Object "object",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Used with AUDIO::LOAD_STREAM

		Example from finale_heist2b.c4:
		AI::TASK_SYNCHRONIZED_SCENE(l_4C8[2/*14*/], l_4C8[2/*14*/]._f7, l_30A, "push_out_vault_l", 4.0, -1.5, 5, 713, 4.0, 0);
		                    PED::SET_SYNCHRONIZED_SCENE_PHASE(l_4C8[2/*14*/]._f7, 0.0);
		                    PED::_2208438012482A1A(l_4C8[2/*14*/], 0, 0);
		                    PED::SET_PED_COMBAT_ATTRIBUTES(l_4C8[2/*14*/], 38, 1);
		                    PED::SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(l_4C8[2/*14*/], 1);
		                    if (AUDIO::LOAD_STREAM("Gold_Cart_Push_Anim_01", "BIG_SCORE_3B_SOUNDS")) {
		                        AUDIO::PLAY_STREAM_FROM_OBJECT(l_36F[0/*1*/]);
		                    }
</summary>
	]]

native "PLAY_STREAM_FRONTEND"
	hash "0x58FCE43488F9F5F4"
	jhash (0x2C2A16BC)
	ns "AUDIO"
	returns	"void"

native "SPECIAL_FRONTEND_EQUAL"
	hash "0x21442F412E8DE56B"
	jhash (0x6FE5D865)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Hash collision!!! PLAY_STREAM_FROM_POSITION is the correct name!
</summary>
	]]

native "STOP_STREAM"
	hash "0xA4718A1419D18151"
	jhash (0xD1E364DE)
	ns "AUDIO"
	returns	"void"

native "STOP_PED_SPEAKING"
	hash "0x9D64D7405520E3D3"
	jhash (0xFF92B49D)
	arguments {
		Ped "ped",

		BOOL "shaking",
	}
	ns "AUDIO"
	returns	"void"

native "DISABLE_PED_PAIN_AUDIO"
	hash "0xA9A41C1E940FB0E8"
	jhash (0x3B8E2D5F)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"

native "IS_AMBIENT_SPEECH_DISABLED"
	hash "0x932C2D096A2C3FFF"
	jhash (0x109D1F89)
	arguments {
		Ped "ped",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Common in the scripts:
		AUDIO::IS_AMBIENT_SPEECH_DISABLED(PLAYER::PLAYER_PED_ID());
</summary>
	]]

native "SET_SIREN_WITH_NO_DRIVER"
	hash "0x1FEF0683B96EBCF2"
	jhash (0x77182D58)
	arguments {
		ObjectPtr "vehicle",

		ScrHandlePtr "toggle",
	}
	ns "AUDIO"
	returns	"void"

native "_SOUND_VEHICLE_HORN_THIS_FRAME"
	hash "0x9C11908013EA4715"
	jhash (0xDE8BA3CD)
	arguments {
		Vehicle "vehicle",
	}
	alias "0x9C11908013EA4715"
	ns "AUDIO"
	returns	"void"

native "SET_HORN_ENABLED"
	hash "0x76D683C108594D0E"
	jhash (0x6EB92D05)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"

native "SET_AUDIO_VEHICLE_PRIORITY"
	hash "0xE5564483E407F914"
	jhash (0x271A9766)
	arguments {
		Vehicle "vehicle",

		Any "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x9D3AF56E94C9AE98"
	hash "0x9D3AF56E94C9AE98"
	jhash (0x2F0A16D1)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"

native "USE_SIREN_AS_HORN"
	hash "0xFA932DE350266EF8"
	jhash (0xC6BC16F3)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"

native "_FORCE_VEHICLE_ENGINE_AUDIO"
	hash "0x4F0C413926060B38"
	jhash (0x33B0B007)
	arguments {
		Vehicle "vehicle",

		charPtr "audioName",
	}
	alias "0x4F0C413926060B38"
	alias "_SET_VEHICLE_AUDIO"
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		This native sets the audio of the specified vehicle to audioName (p1).

		Use the audioNameHash found in vehicles.meta

		Example:
		_FORCE_VEHICLE_ENGINE_SOUND(veh, "ADDER");
		The selected vehicle will now have the audio of the Adder.

		FORCE_VEHICLE_???
</summary>
	]]

native "0xF1F8157B8C3F171C"
	hash "0xF1F8157B8C3F171C"
	jhash (0x1C0C5E4C)
	arguments {
		Any "p0",

		charPtr "p1",

		charPtr "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		2 calls found in the b617d scripts:

		AUDIO::_F1F8157B8C3F171C(l_A42, "Franklin_Bike_Rev", "BIG_SCORE_3A_SOUNDS");
		AUDIO::_F1F8157B8C3F171C(l_166, "Trevor_Revs_Off", "PALETO_SCORE_SETUP_SOUNDS");
</summary>
	]]

native "0xD2DCCD8E16E20997"
	hash "0xD2DCCD8E16E20997"
	arguments {
		Any "p0",
	}
	ns "AUDIO"
	returns	"void"

native "0x5DB8010EE71FDEF2"
	hash "0x5DB8010EE71FDEF2"
	jhash (0x6E660D3F)
	arguments {
		Vehicle "vehicle",
	}
	ns "AUDIO"
	returns	"BOOL"

native "0x59E7B488451F4D3A"
	hash "0x59E7B488451F4D3A"
	jhash (0x23BE6432)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x01BB4D577D38BD9E"
	hash "0x01BB4D577D38BD9E"
	jhash (0xE81FAC68)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x1C073274E065C6D2"
	hash "0x1C073274E065C6D2"
	jhash (0x9365E042)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x2BE4BC731D039D5A"
	hash "0x2BE4BC731D039D5A"
	jhash (0x2A60A90E)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "SET_VEHICLE_BOOST_ACTIVE"
	hash "0x4A04DE7CAB2739A1"
	jhash (0x072F15F2)
	arguments {
		Vehicle "vehicle",

		BOOL "Toggle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		SET_VEHICLE_BOOST_ACTIVE(vehicle, 1, 0);
		SET_VEHICLE_BOOST_ACTIVE(vehicle, 0, 0); 

		Will give a boost-soundeffect.
</summary>
	]]

native "0x6FDDAD856E36988A"
	hash "0x6FDDAD856E36988A"
	jhash (0x934BE749)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x06C0023BED16DD6B"
	hash "0x06C0023BED16DD6B"
	jhash (0xE61110A2)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "PLAY_VEHICLE_DOOR_OPEN_SOUND"
	hash "0x3A539D52857EA82D"
	jhash (0x84930330)
	arguments {
		Vehicle "vehicle",

		int "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		p1 appears to only be "0" or "3". I personally use "0" as p1.
</summary>
	]]

native "PLAY_VEHICLE_DOOR_CLOSE_SOUND"
	hash "0x62A456AA4769EF34"
	jhash (0xBA2CF407)
	arguments {
		Vehicle "vehicle",

		int "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		This native only comes up once. And in that one instance, p1 is "1".
</summary>
	]]

native "0xC15907D667F7CFB2"
	hash "0xC15907D667F7CFB2"
	jhash (0x563B635D)
	arguments {
		Vehicle "vehicle",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"

native "IS_GAME_IN_CONTROL_OF_MUSIC"
	hash "0x6D28DC1671E334FD"
	jhash (0x7643170D)
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Hardcoded to return 1
</summary>
	]]

native "SET_GPS_ACTIVE"
	hash "0x3BD3F52BA9B1E4E8"
	jhash (0x0FC3379A)
	arguments {
		BOOL "active",
	}
	ns "AUDIO"
	returns	"void"

native "PLAY_MISSION_COMPLETE_AUDIO"
	hash "0xB138AAB8A70D3C69"
	jhash (0x3033EA1D)
	arguments {
		charPtr "audioName",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		 Called 38 times in the scripts. There are 5 different audioNames used. 
		 One unknown removed below. 

		 AUDIO::PLAY_MISSION_COMPLETE_AUDIO("DEAD");
		 AUDIO::PLAY_MISSION_COMPLETE_AUDIO("FRANKLIN_BIG_01");
		 AUDIO::PLAY_MISSION_COMPLETE_AUDIO("GENERIC_FAILED");
		 AUDIO::PLAY_MISSION_COMPLETE_AUDIO("TREVOR_SMALL_01");
</summary>
	]]

native "IS_MISSION_COMPLETE_PLAYING"
	hash "0x19A30C23F5827F8A"
	jhash (0x939982A1)
	ns "AUDIO"
	returns	"BOOL"

native "0x6F259F82D873B8B8"
	hash "0x6F259F82D873B8B8"
	jhash (0xCBE09AEC)
	ns "AUDIO"
	returns	"Any"

native "0xF154B8D1775B2DEC"
	hash "0xF154B8D1775B2DEC"
	jhash (0xD2858D8A)
	arguments {
		BOOL "p0",
	}
	ns "AUDIO"
	returns	"void"

native "START_AUDIO_SCENE"
	hash "0x013A80FC08F6E4F2"
	jhash (0xE48D757B)
	arguments {
		charPtr "scene",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Used to prepare a scene where the surrounding sound is muted or a bit changed. This does not play any sound.

		List of all usable scene names found in b617d. Sorted alphabetically and identical names removed: pastebin.com/MtM9N9CC
</summary>
	]]

native "STOP_AUDIO_SCENE"
	hash "0xDFE8422B3B94E688"
	jhash (0xA08D8C58)
	arguments {
		charPtr "scene",
	}
	ns "AUDIO"
	returns	"void"

native "STOP_AUDIO_SCENES"
	hash "0xBAC7FC81A75EC1A1"
	jhash (0xF6C7342A)
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		??
</summary>
	]]

native "IS_AUDIO_SCENE_ACTIVE"
	hash "0xB65B60556E2A9225"
	jhash (0xACBED05C)
	arguments {
		charPtr "scene",
	}
	ns "AUDIO"
	returns	"BOOL"

native "SET_AUDIO_SCENE_VARIABLE"
	hash "0xEF21A9EF089A2668"
	jhash (0x19BB3CE8)
	arguments {
		charPtr "scene",

		charPtr "variable",

		float "value",
	}
	ns "AUDIO"
	returns	"void"

native "0xA5F377B175A699C5"
	hash "0xA5F377B175A699C5"
	jhash (0xE812925D)
	arguments {
		Any "p0",
	}
	ns "AUDIO"
	returns	"void"

native "_DYNAMIC_MIXER_RELATED_FN"
	hash "0x153973AB99FE8980"
	jhash (0x2BC93264)
	arguments {
		Entity "p0",

		charPtr "p1",

		float "p2",
	}
	alias "0x153973AB99FE8980"
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		ADD_E* (most likely ADD_ENTITY_*)

		All found occurrences in b678d:
		pastebin.com/ceu67jz8

		Still not sure on the functionality of this native but it has something to do with dynamic mixer groups defined in dynamix.dat15
</summary>
	]]

native "0x18EB48CFC41F2EA0"
	hash "0x18EB48CFC41F2EA0"
	jhash (0x308ED0EC)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"

native "AUDIO_IS_SCRIPTED_MUSIC_PLAYING"
	hash "0x845FFC3A4FEEFA3E"
	jhash (0x86E995D1)
	ns "AUDIO"
	returns	"Any"

native "PREPARE_MUSIC_EVENT"
	hash "0x1E5185B72EF5158A"
	jhash (0x534A5C1C)
	arguments {
		charPtr "eventName",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		All music event names found in the b617d scripts: pastebin.com/GnYt0R3P
</summary>
	]]

native "CANCEL_MUSIC_EVENT"
	hash "0x5B17A90291133DA5"
	jhash (0x89FF942D)
	arguments {
		charPtr "eventName",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		All music event names found in the b617d scripts: pastebin.com/GnYt0R3P
</summary>
	]]

native "TRIGGER_MUSIC_EVENT"
	hash "0x706D57B0F50DA710"
	jhash (0xB6094948)
	arguments {
		charPtr "eventName",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		List of all usable event names found in b617d used with this native. Sorted alphabetically and identical names removed: pastebin.com/RzDFmB1W

		All music event names found in the b617d scripts: pastebin.com/GnYt0R3P
</summary>
	]]

native "0xA097AB275061FB21"
	hash "0xA097AB275061FB21"
	jhash (0x2705C4D5)
	ns "AUDIO"
	returns	"Any"

native "GET_MUSIC_PLAYTIME"
	hash "0xE7A0D23DC414507B"
	jhash (0xD633C809)
	ns "AUDIO"
	returns	"Any"

native "0xFBE20329593DEC9D"
	hash "0xFBE20329593DEC9D"
	jhash (0x53FC3FEC)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "AUDIO"
	returns	"void"

native "CLEAR_ALL_BROKEN_GLASS"
	hash "0xB32209EFFDC04913"
	jhash (0xE6B033BF)
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Removes broken glass particles.
</summary>
	]]

native "0x70B8EC8FC108A634"
	hash "0x70B8EC8FC108A634"
	jhash (0x95050CAD)
	arguments {
		BOOL "p0",

		Any "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x149AEE66F0CB3A99"
	hash "0x149AEE66F0CB3A99"
	jhash (0xE64F97A0)
	arguments {
		float "p0",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x8BF907833BE275DE"
	hash "0x8BF907833BE275DE"
	arguments {
		float "p0",

		float "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0x062D5EAD4DA2FA6A"
	hash "0x062D5EAD4DA2FA6A"
	jhash (0xD87AF337)
	ns "AUDIO"
	returns	"void"

native "PREPARE_ALARM"
	hash "0x9D74AE343DB65533"
	jhash (0x084932E8)
	arguments {
		charPtr "alarmName",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Example:

		bool prepareAlarm = AUDIO::PREPARE_ALARM("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS");
</summary>
	]]

native "START_ALARM"
	hash "0x0355EF116C4C97B2"
	jhash (0x703F524B)
	arguments {
		charPtr "alarmName",

		BOOL "p2",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Example:

		This will start the alarm at Fort Zancudo.

		AUDIO::START_ALARM("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS", 1);

		First parameter (char) is the name of the alarm.
		Second parameter (bool) is unknown, it does not seem to make a difference if this one is 0 or 1.

		----------

		It DOES make a difference but it has to do with the duration or something I dunno yet

		----------

		 Found in the b617d scripts:

		 AUDIO::START_ALARM("AGENCY_HEIST_FIB_TOWER_ALARMS", 0);
		 AUDIO::START_ALARM("AGENCY_HEIST_FIB_TOWER_ALARMS_UPPER", 1);
		 AUDIO::START_ALARM("AGENCY_HEIST_FIB_TOWER_ALARMS_UPPER_B", 0);
		 AUDIO::START_ALARM("BIG_SCORE_HEIST_VAULT_ALARMS", a_0);
		 AUDIO::START_ALARM("FBI_01_MORGUE_ALARMS", 1);
		 AUDIO::START_ALARM("FIB_05_BIOTECH_LAB_ALARMS", 0);
		 AUDIO::START_ALARM("JEWEL_STORE_HEIST_ALARMS", 0);
		 AUDIO::START_ALARM("PALETO_BAY_SCORE_ALARM", 1);
		 AUDIO::START_ALARM("PALETO_BAY_SCORE_CHICKEN_FACTORY_ALARM", 0);
		 AUDIO::START_ALARM("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS", 1);
		 AUDIO::START_ALARM("PORT_OF_LS_HEIST_SHIP_ALARMS", 0);
		 AUDIO::START_ALARM("PRISON_ALARMS", 0);
		 AUDIO::START_ALARM("PROLOGUE_VAULT_ALARMS", 0);
</summary>
	]]

native "STOP_ALARM"
	hash "0xA1CADDCD98415A41"
	jhash (0xF987BE8C)
	arguments {
		charPtr "alarmName",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Example:

		This will stop the alarm at Fort Zancudo.

		AUDIO::STOP_ALARM("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS", 1);

		First parameter (char) is the name of the alarm.
		Second parameter (bool) has to be true (1) to have any effect.
</summary>
	]]

native "STOP_ALL_ALARMS"
	hash "0x2F794A877ADD4C92"
	jhash (0xC3CB9DC6)
	arguments {
		BOOL "stop",
	}
	ns "AUDIO"
	returns	"void"

native "IS_ALARM_PLAYING"
	hash "0x226435CB96CCFC8C"
	jhash (0x9D8E1D23)
	arguments {
		charPtr "alarmName",
	}
	ns "AUDIO"
	returns	"BOOL"
	doc [[!
<summary>
		Example:

		bool playing = AUDIO::IS_ALARM_PLAYING("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS");
</summary>
	]]

native "GET_VEHICLE_DEFAULT_HORN"
	hash "0x02165D55000219AC"
	jhash (0xE84ABC19)
	arguments {
		Vehicle "vehicle",
	}
	ns "AUDIO"
	returns	"Hash"
	doc [[!
<summary>
		Returns hash of default vehicle horn

		Hash is stored in audVehicleAudioEntity
</summary>
	]]

native "_GET_VEHICLE_HORN_HASH"
	hash "0xACB5DCCA1EC76840"
	jhash (0xFD4B5B3B)
	arguments {
		Vehicle "vehicle",
	}
	alias "0xACB5DCCA1EC76840"
	ns "AUDIO"
	returns	"Hash"
	doc [[!
<summary>
		Seems to get the hash of the vehicle's currently installed horn? 
</summary>
	]]

native "RESET_PED_AUDIO_FLAGS"
	hash "0xF54BB7B61036F335"
	jhash (0xDF720C86)
	arguments {
		Ped "ped",
	}
	ns "AUDIO"
	returns	"void"

native "0xD2CC78CD3D0B50F9"
	hash "0xD2CC78CD3D0B50F9"
	jhash (0xC307D531)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0xBF4DC1784BE94DFA"
	hash "0xBF4DC1784BE94DFA"
	arguments {
		Any "p0",

		BOOL "p1",

		Any "p2",
	}
	ns "AUDIO"
	returns	"void"

native "0x75773E11BA459E90"
	hash "0x75773E11BA459E90"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "0xD57AAAE0E2214D11"
	hash "0xD57AAAE0E2214D11"
	ns "AUDIO"
	returns	"void"

native "_FORCE_AMBIENT_SIREN"
	hash "0x552369F549563AD5"
	jhash (0x13EB5861)
	arguments {
		BOOL "value",
	}
	alias "0x552369F549563AD5"
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		if value is set to true, and ambient siren sound will be played.

		-------------------------------------------------------------------------

		Appears to enable/disable an audio flag.
</summary>
	]]

native "0x43FA0DFC5DF87815"
	hash "0x43FA0DFC5DF87815"
	jhash (0x7BED1872)
	arguments {
		Vehicle "vehicle",

		BOOL "p1",
	}
	ns "AUDIO"
	returns	"void"

native "SET_AUDIO_FLAG"
	hash "0xB9EFD5C25018725A"
	jhash (0x1C09C9E0)
	arguments {
		charPtr "flagName",

		BOOL "toggle",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Possible flag names:
		"ActivateSwitchWheelAudio"
		"AllowAmbientSpeechInSlowMo"
		"AllowCutsceneOverScreenFade"
		"AllowForceRadioAfterRetune"
		"AllowPainAndAmbientSpeechToPlayDuringCutscene"
		"AllowPlayerAIOnMission"
		"AllowPoliceScannerWhenPlayerHasNoControl"
		"AllowRadioDuringSwitch"
		"AllowRadioOverScreenFade"
		"AllowScoreAndRadio"
		"AllowScriptedSpeechInSlowMo"
		"AvoidMissionCompleteDelay"
		"DisableAbortConversationForDeathAndInjury"
		"DisableAbortConversationForRagdoll"
		"DisableBarks"
		"DisableFlightMusic"
		"DisableReplayScriptStreamRecording"
		"EnableHeadsetBeep"
		"ForceConversationInterrupt"
		"ForceSeamlessRadioSwitch"
		"ForceSniperAudio"
		"FrontendRadioDisabled"
		"HoldMissionCompleteWhenPrepared"
		"IsDirectorModeActive"
		"IsPlayerOnMissionForSpeech"
		"ListenerReverbDisabled"
		"LoadMPData"
		"MobileRadioInGame"
		"OnlyAllowScriptTriggerPoliceScanner"
		"PlayMenuMusic"
		"PoliceScannerDisabled"
		"ScriptedConvListenerMaySpeak"
		"SpeechDucksScore"
		"SuppressPlayerScubaBreathing"
		"WantedMusicDisabled"
		"WantedMusicOnMission"

		-------------------------------
		No added flag names between b393d and b573d, including b573d.

		#######################################################################

		"IsDirectorModeActive" is an audio flag which will allow you to play speech infinitely without any pauses like in Director Mode.

		-----------------------------------------------------------------------

		All flag IDs and hashes:

		ID: 01 | Hash: 0x20A7858F
		ID: 02 | Hash: 0xA11C2259
		ID: 03 | Hash: 0x08DE4700
		ID: 04 | Hash: 0x989F652F
		ID: 05 | Hash: 0x3C9E76BA
		ID: 06 | Hash: 0xA805FEB0
		ID: 07 | Hash: 0x4B94EA26
		ID: 08 | Hash: 0x803ACD34
		ID: 09 | Hash: 0x7C741226
		ID: 10 | Hash: 0x31DB9EBD
		ID: 11 | Hash: 0xDF386F18
		ID: 12 | Hash: 0x669CED42
		ID: 13 | Hash: 0x51F22743
		ID: 14 | Hash: 0x2052B35C
		ID: 15 | Hash: 0x071472DC
		ID: 16 | Hash: 0xF9928BCC
		ID: 17 | Hash: 0x7ADBDD48
		ID: 18 | Hash: 0xA959BA1A
		ID: 19 | Hash: 0xBBE89B60
		ID: 20 | Hash: 0x87A08871
		ID: 21 | Hash: 0xED1057CE
		ID: 22 | Hash: 0x1584AD7A
		ID: 23 | Hash: 0x8582CFCB
		ID: 24 | Hash: 0x7E5E2FB0
		ID: 25 | Hash: 0xAE4F72DB
		ID: 26 | Hash: 0x5D16D1FA
		ID: 27 | Hash: 0x06B2F4B8
		ID: 28 | Hash: 0x5D4CDC96
		ID: 29 | Hash: 0x8B5A48BA
		ID: 30 | Hash: 0x98FBD539
		ID: 31 | Hash: 0xD8CB0473
		ID: 32 | Hash: 0x5CBB4874
		ID: 33 | Hash: 0x2E9F93A9
		ID: 34 | Hash: 0xD93BEA86
		ID: 35 | Hash: 0x92109B7D
		ID: 36 | Hash: 0xB7EC9E4D
		ID: 37 | Hash: 0xCABDBB1D
		ID: 38 | Hash: 0xB3FD4A52
		ID: 39 | Hash: 0x370D94E5
		ID: 40 | Hash: 0xA0F7938F
		ID: 41 | Hash: 0xCBE1CE81
		ID: 42 | Hash: 0xC27F1271
		ID: 43 | Hash: 0x9E3258EB
		ID: 44 | Hash: 0x551CDA5B
		ID: 45 | Hash: 0xCB6D663C
		ID: 46 | Hash: 0x7DACE87F
		ID: 47 | Hash: 0xF9DE416F
		ID: 48 | Hash: 0x882E6E9E
		ID: 49 | Hash: 0x16B447E7
		ID: 50 | Hash: 0xBD867739
		ID: 51 | Hash: 0xA3A58604
		ID: 52 | Hash: 0x7E046BBC
		ID: 53 | Hash: 0xD95FDB98
		ID: 54 | Hash: 0x5842C0ED
		ID: 55 | Hash: 0x285FECC6
		ID: 56 | Hash: 0x9351AC43
		ID: 57 | Hash: 0x50032E75
		ID: 58 | Hash: 0xAE6D0D59
		ID: 59 | Hash: 0xD6351785
		ID: 60 | Hash: 0xD25D71BC
		ID: 61 | Hash: 0x1F7F6423
		ID: 62 | Hash: 0xE24C3AA6
		ID: 63 | Hash: 0xBFFDD2B7
</summary>
	]]

native "PREPARE_SYNCHRONIZED_AUDIO_EVENT"
	hash "0xC7ABCACA4985A766"
	jhash (0xE1D91FD0)
	arguments {
		charPtr "p0",

		Any "p1",
	}
	ns "AUDIO"
	returns	"Any"

native "PREPARE_SYNCHRONIZED_AUDIO_EVENT_FOR_SCENE"
	hash "0x029FE7CD1B7E2E75"
	jhash (0x7652DD49)
	arguments {
		Any "p0",

		AnyPtr "p1",
	}
	ns "AUDIO"
	returns	"BOOL"

native "PLAY_SYNCHRONIZED_AUDIO_EVENT"
	hash "0x8B2FD4560E55DD2D"
	jhash (0x507F3241)
	arguments {
		Any "p0",
	}
	ns "AUDIO"
	returns	"BOOL"

native "STOP_SYNCHRONIZED_AUDIO_EVENT"
	hash "0x92D6A88E64A94430"
	jhash (0xADEED2B4)
	arguments {
		Any "p0",
	}
	ns "AUDIO"
	returns	"BOOL"

native "0xC8EDE9BDBCCBA6D4"
	hash "0xC8EDE9BDBCCBA6D4"
	jhash (0x55A21772)
	arguments {
		AnyPtr "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "AUDIO"
	returns	"void"

native "_SET_SYNCHRONIZED_AUDIO_EVENT_POSITION_THIS_FRAME"
	hash "0x950A154B8DAB6185"
	jhash (0xA17F9AB0)
	arguments {
		charPtr "p0",

		Entity "p1",
	}
	alias "0x950A154B8DAB6185"
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Sets the position of the audio event to the entity's position for one frame(?)

		if (l_8C3 == 0) {
		    sub_27fd1(0, -1, 1);
		    if (PED::IS_SYNCHRONIZED_SCENE_RUNNING(l_87D)) {
		        AUDIO::STOP_SYNCHRONIZED_AUDIO_EVENT(l_87D);
		    }
		    if (sub_7dd(l_A00)) {
		        AUDIO::_950A154B8DAB6185("PAP2_IG1_POPPYSEX", l_A00);
		    }
		    sub_91c("TK************ SETTING SYNCH SCENE AUDIO POSITION THIS FRAME ************TK");
		    l_8C3 = 1;
		}

		--

		Found in the b617d scripts, duplicates removed: 

		AUDIO::_950A154B8DAB6185("CAR_5_IG_6", l_7FE[1/*1*/]);
		AUDIO::_950A154B8DAB6185("EX03_TRAIN_BIKE_LAND",   PLAYER::PLAYER_PED_ID());
		AUDIO::_950A154B8DAB6185("FBI_2_MCS_1_LeadIn", l_40[2/*1*/]);
		AUDIO::_950A154B8DAB6185("FIN_C2_MCS_1", l_24C[0/*1*/]);
		AUDIO::_950A154B8DAB6185("MNT_DNC", l_5F);
		AUDIO::_950A154B8DAB6185("PAP2_IG1_POPPYSEX", l_A00);
</summary>
	]]

native "0x12561FCBB62D5B9C"
	hash "0x12561FCBB62D5B9C"
	jhash (0x62B43677)
	arguments {
		int "p0",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		p0 is usually 0. sometimes 2. Not sure what this does.
</summary>
	]]

native "0x044DBAD7A7FA2BE5"
	hash "0x044DBAD7A7FA2BE5"
	jhash (0x8AD670EC)
	arguments {
		charPtr "p0",

		charPtr "p1",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Found in the b617d scripts, duplicates removed:  

		AUDIO::_044DBAD7A7FA2BE5("V_CARSHOWROOM_PS_WINDOW_UNBROKEN", "V_CARSHOWROOM_PS_WINDOW_BROKEN");

		 AUDIO::_044DBAD7A7FA2BE5("V_CIA_PS_WINDOW_UNBROKEN", "V_CIA_PS_WINDOW_BROKEN");

		 AUDIO::_044DBAD7A7FA2BE5("V_DLC_HEIST_APARTMENT_DOOR_CLOSED", "V_DLC_HEIST_APARTMENT_DOOR_OPEN");

		 AUDIO::_044DBAD7A7FA2BE5("V_FINALEBANK_PS_VAULT_INTACT", "V_FINALEBANK_PS_VAULT_BLOWN");

		 AUDIO::_044DBAD7A7FA2BE5("V_MICHAEL_PS_BATHROOM_WITH_WINDOW", "V_MICHAEL_PS_BATHROOM_WITHOUT_WINDOW");
</summary>
	]]

native "0xB4BBFD9CD8B3922B"
	hash "0xB4BBFD9CD8B3922B"
	jhash (0xD24B4D0C)
	arguments {
		charPtr "p0",
	}
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		 Found in the b617d scripts, duplicates removed: 

		 AUDIO::_B4BBFD9CD8B3922B("V_CARSHOWROOM_PS_WINDOW_UNBROKEN");
		 AUDIO::_B4BBFD9CD8B3922B("V_CIA_PS_WINDOW_UNBROKEN");
		 AUDIO::_B4BBFD9CD8B3922B("V_DLC_HEIST_APARTMENT_DOOR_CLOSED");
		 AUDIO::_B4BBFD9CD8B3922B("V_FINALEBANK_PS_VAULT_INTACT");
		 AUDIO::_B4BBFD9CD8B3922B("V_MICHAEL_PS_BATHROOM_WITH_WINDOW");
</summary>
	]]

native "0xE4E6DD5566D28C82"
	hash "0xE4E6DD5566D28C82"
	jhash (0x7262B5BA)
	ns "AUDIO"
	returns	"void"

native "0x3A48AB4445D499BE"
	hash "0x3A48AB4445D499BE"
	jhash (0x93A44A1F)
	ns "AUDIO"
	returns	"Any"

native "_SET_PED_TALK"
	hash "0x4ADA3F19BE4A6047"
	jhash (0x13777A0B)
	arguments {
		Ped "ped",
	}
	alias "0x4ADA3F19BE4A6047"
	ns "AUDIO"
	returns	"void"
	doc [[!
<summary>
		Speech related.
</summary>
	]]

native "0x0150B6FF25A9E2E5"
	hash "0x0150B6FF25A9E2E5"
	jhash (0x1134F68B)
	ns "AUDIO"
	returns	"void"

native "0xBEF34B1D9624D5DD"
	hash "0xBEF34B1D9624D5DD"
	jhash (0xE0047BFD)
	arguments {
		BOOL "p0",
	}
	ns "AUDIO"
	returns	"void"

native "0x806058BBDC136E06"
	hash "0x806058BBDC136E06"
	ns "AUDIO"
	returns	"void"

native "0x544810ED9DB6BBE6"
	hash "0x544810ED9DB6BBE6"
	ns "AUDIO"
	returns	"Any"

native "0x5B50ABB1FE3746F4"
	hash "0x5B50ABB1FE3746F4"
	ns "AUDIO"
	returns	"Any"

native "REQUEST_CUTSCENE"
	hash "0x7A86743F475D9E09"
	jhash (0xB5977853)
	arguments {
		charPtr "cutsceneName",

		int "p1",
	}
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		p1: usually 8

		Cutscene list: pastebin.com/Bbj7ANpQ
</summary>
	]]

native "_REQUEST_CUTSCENE_EX"
	hash "0xC23DE0E91C30B58C"
	jhash (0xD98F656A)
	arguments {
		charPtr "cutsceneName",

		int "p1",

		int "p2",
	}
	alias "0xC23DE0E91C30B58C"
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		Example:
		CUTSCENE::_0xC23DE0E91C30B58C("JOSH_1_INT_CONCAT", 13, 8);

		Cutscene list: pastebin.com/Bbj7ANpQ
</summary>
	]]

native "REMOVE_CUTSCENE"
	hash "0x440AF51A3462B86F"
	jhash (0x8052F533)
	ns "CUTSCENE"
	returns	"void"

native "HAS_CUTSCENE_LOADED"
	hash "0xC59F528E9AB9F339"
	jhash (0xF9998582)
	ns "CUTSCENE"
	returns	"BOOL"

native "HAS_THIS_CUTSCENE_LOADED"
	hash "0x228D3D94F8A11C3C"
	jhash (0x3C5619F2)
	arguments {
		charPtr "cutsceneName",
	}
	ns "CUTSCENE"
	returns	"BOOL"

native "0x8D9DF6ECA8768583"
	hash "0x8D9DF6ECA8768583"
	jhash (0x25A2CABC)
	arguments {
		int "p0",
	}
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		Example of usage:

		v_2 = SCRIPT::_30B4FA1C82DD4B9F(); // int _GET_ID_OF_NEXT_SCRIPT_IN_ENUMERATION()
		CUTSCENE::_8D9DF6ECA8768583(v_2);
</summary>
	]]

native "0xB56BBBCC2955D9CB"
	hash "0xB56BBBCC2955D9CB"
	jhash (0xDD8878E9)
	ns "CUTSCENE"
	returns	"BOOL"
	doc [[!
<summary>
		"Can request assets for cutscene entity"? (found in decompiled scripts)
</summary>
	]]

native "0x71B74D2AE19338D0"
	hash "0x71B74D2AE19338D0"
	jhash (0x7B93CDAA)
	arguments {
		int "p0",
	}
	ns "CUTSCENE"
	returns	"BOOL"
	doc [[!
<summary>
		It's 100% an IS_CUTSCENE_* native.
</summary>
	]]

native "0x4C61C75BEE8184C2"
	hash "0x4C61C75BEE8184C2"
	jhash (0x47DB08A9)
	arguments {
		charPtr "p0",

		Any "p1",

		Any "p2",
	}
	ns "CUTSCENE"
	returns	"void"

native "0x06A3524161C502BA"
	hash "0x06A3524161C502BA"
	arguments {
		AnyPtr "p0",
	}
	ns "CUTSCENE"
	returns	"void"

native "0xA1C996C2A744262E"
	hash "0xA1C996C2A744262E"
	arguments {
		AnyPtr "p0",
	}
	ns "CUTSCENE"
	returns	"BOOL"

native "0xD00D76A7DFC9D852"
	hash "0xD00D76A7DFC9D852"
	arguments {
		AnyPtr "p0",
	}
	ns "CUTSCENE"
	returns	"void"

native "0x0ABC54DE641DC0FC"
	hash "0x0ABC54DE641DC0FC"
	arguments {
		AnyPtr "p0",
	}
	ns "CUTSCENE"
	returns	"Any"

native "START_CUTSCENE"
	hash "0x186D5CB5E7B0FF7B"
	jhash (0x210106F6)
	arguments {
		int "p0",
	}
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		some kind of flag. Usually 0.
</summary>
	]]

native "START_CUTSCENE_AT_COORDS"
	hash "0x1C9ADDA3244A1FBF"
	jhash (0x58BEA436)
	arguments {
		float "x",

		float "y",

		float "z",

		int "p3",
	}
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		p3: some kind of flag. Usually 0.
</summary>
	]]

native "STOP_CUTSCENE"
	hash "0xC7272775B4DC786E"
	jhash (0x5EE84DC7)
	arguments {
		BOOL "p0",
	}
	ns "CUTSCENE"
	returns	"void"

native "STOP_CUTSCENE_IMMEDIATELY"
	hash "0xD220BDD222AC4A1E"
	jhash (0xF528A2AD)
	ns "CUTSCENE"
	returns	"void"

native "SET_CUTSCENE_ORIGIN"
	hash "0xB812B3FD1C01CF27"
	jhash (0xB0AD7792)
	arguments {
		float "x",

		float "y",

		float "z",

		float "p3",

		int "p4",
	}
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		p3 could be heading. Needs more research.
</summary>
	]]

native "0x011883F41211432A"
	hash "0x011883F41211432A"
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",

		Any "p5",

		Any "p6",
	}
	ns "CUTSCENE"
	returns	"void"

native "GET_CUTSCENE_TIME"
	hash "0xE625BEABBAFFDAB9"
	jhash (0x53F5B5AB)
	ns "CUTSCENE"
	returns	"int"

native "GET_CUTSCENE_TOTAL_DURATION"
	hash "0xEE53B14A19E480D4"
	jhash (0x0824EBE8)
	ns "CUTSCENE"
	returns	"int"

native "WAS_CUTSCENE_SKIPPED"
	hash "0x40C8656EDAEDD569"
	jhash (0xC9B6949D)
	ns "CUTSCENE"
	returns	"BOOL"

native "HAS_CUTSCENE_FINISHED"
	hash "0x7C0A893088881D57"
	jhash (0x5DED14B4)
	ns "CUTSCENE"
	returns	"BOOL"

native "IS_CUTSCENE_ACTIVE"
	hash "0x991251AFC3981F84"
	jhash (0xCCE2FE9D)
	ns "CUTSCENE"
	returns	"BOOL"

native "IS_CUTSCENE_PLAYING"
	hash "0xD3C2E180A40F031E"
	jhash (0xA3A78392)
	ns "CUTSCENE"
	returns	"BOOL"

native "GET_CUTSCENE_SECTION_PLAYING"
	hash "0x49010A6A396553D8"
	jhash (0x1026F0D6)
	ns "CUTSCENE"
	returns	"int"

native "GET_ENTITY_INDEX_OF_CUTSCENE_ENTITY"
	hash "0x0A2E9FDB9A8C62F6"
	jhash (0x1D09ABC7)
	arguments {
		charPtr "cutsceneEntName",

		Hash "modelHash",
	}
	ns "CUTSCENE"
	returns	"Entity"

native "0x583DF8E3D4AFBD98"
	hash "0x583DF8E3D4AFBD98"
	jhash (0x5AE68AE6)
	ns "CUTSCENE"
	returns	"int"

native "0x4CEBC1ED31E8925E"
	hash "0x4CEBC1ED31E8925E"
	arguments {
		charPtr "cutsceneName",
	}
	ns "CUTSCENE"
	returns	"BOOL"
	doc [[!
<summary>
		This function is hard-coded to always return 1.
</summary>
	]]

native "REGISTER_ENTITY_FOR_CUTSCENE"
	hash "0xE40C1C56DF95C2E8"
	jhash (0x7CBC3EC7)
	arguments {
		Ped "cutscenePed",

		charPtr "cutsceneEntName",

		int "p2",

		Hash "modelHash",

		int "p4",
	}
	ns "CUTSCENE"
	returns	"void"

native "GET_ENTITY_INDEX_OF_REGISTERED_ENTITY"
	hash "0xC0741A26499654CD"
	jhash (0x46D18755)
	arguments {
		charPtr "cutsceneEntName",

		Hash "modelHash",
	}
	ns "CUTSCENE"
	returns	"Entity"

native "0x7F96F23FA9B73327"
	hash "0x7F96F23FA9B73327"
	arguments {
		Hash "modelHash",
	}
	ns "CUTSCENE"
	returns	"void"

native "SET_CUTSCENE_TRIGGER_AREA"
	hash "0x9896CE4721BE84BA"
	jhash (0x9D76D9DE)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",
	}
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		Only used twice in R* scripts
</summary>
	]]

native "CAN_SET_ENTER_STATE_FOR_REGISTERED_ENTITY"
	hash "0x645D0B458D8E17B5"
	jhash (0x55C30B26)
	arguments {
		charPtr "cutsceneEntName",

		Hash "modelHash",
	}
	ns "CUTSCENE"
	returns	"BOOL"
	doc [[!
<summary>
		modelHash (p1) was always 0 in R* scripts
</summary>
	]]

native "CAN_SET_EXIT_STATE_FOR_REGISTERED_ENTITY"
	hash "0x4C6A6451C79E4662"
	jhash (0x8FF5D3C4)
	arguments {
		charPtr "cutsceneEntName",

		Hash "modelHash",
	}
	ns "CUTSCENE"
	returns	"BOOL"

native "CAN_SET_EXIT_STATE_FOR_CAMERA"
	hash "0xB2CBCD0930DFB420"
	jhash (0xEDAE6C02)
	arguments {
		BOOL "p0",
	}
	ns "CUTSCENE"
	returns	"BOOL"

native "0xC61B86C9F61EB404"
	hash "0xC61B86C9F61EB404"
	jhash (0x35721A08)
	arguments {
		BOOL "toggle",
	}
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		Toggles a value (bool) for cutscenes.
</summary>
	]]

native "SET_CUTSCENE_FADE_VALUES"
	hash "0x8093F23ABACCC7D4"
	jhash (0xD19EF0DD)
	arguments {
		BOOL "p0",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",
	}
	ns "CUTSCENE"
	returns	"void"

native "0x20746F7B1032A3C7"
	hash "0x20746F7B1032A3C7"
	arguments {
		BOOL "p0",

		BOOL "p1",

		BOOL "p2",

		BOOL "p3",
	}
	ns "CUTSCENE"
	returns	"void"

native "0x06EE9048FD080382"
	hash "0x06EE9048FD080382"
	arguments {
		BOOL "p0",
	}
	ns "CUTSCENE"
	returns	"void"

native "0xA0FE76168A189DDB"
	hash "0xA0FE76168A189DDB"
	ns "CUTSCENE"
	returns	"int"

native "0x2F137B508DE238F2"
	hash "0x2F137B508DE238F2"
	jhash (0x8338DA1D)
	arguments {
		BOOL "p0",
	}
	ns "CUTSCENE"
	returns	"void"

native "0xE36A98D8AB3D3C66"
	hash "0xE36A98D8AB3D3C66"
	jhash (0x04377C10)
	arguments {
		BOOL "p0",
	}
	ns "CUTSCENE"
	returns	"void"

native "0x5EDEF0CF8C1DAB3C"
	hash "0x5EDEF0CF8C1DAB3C"
	jhash (0xDBD88708)
	ns "CUTSCENE"
	returns	"BOOL"

native "0x41FAA8FB2ECE8720"
	hash "0x41FAA8FB2ECE8720"
	jhash (0x28D54A7F)
	arguments {
		BOOL "p0",
	}
	ns "CUTSCENE"
	returns	"void"

native "REGISTER_SYNCHRONISED_SCRIPT_SPEECH"
	hash "0x2131046957F31B04"
	jhash (0xB60CFBB9)
	ns "CUTSCENE"
	returns	"void"

native "SET_CUTSCENE_PED_COMPONENT_VARIATION"
	hash "0xBA01E7B6DEEFBBC9"
	jhash (0x6AF994A1)
	arguments {
		charPtr "cutsceneEntName",

		int "p1",

		int "p2",

		int "p3",

		Hash "modelHash",
	}
	ns "CUTSCENE"
	returns	"void"

native "0x2A56C06EBEF2B0D9"
	hash "0x2A56C06EBEF2B0D9"
	jhash (0x1E7DA95E)
	arguments {
		charPtr "cutsceneEntName",

		Ped "ped",

		Hash "modelHash",
	}
	ns "CUTSCENE"
	returns	"void"

native "DOES_CUTSCENE_ENTITY_EXIST"
	hash "0x499EF20C5DB25C59"
	jhash (0x58E67409)
	arguments {
		charPtr "cutsceneEntName",

		Hash "modelHash",
	}
	ns "CUTSCENE"
	returns	"BOOL"

native "SET_CUTSCENE_PED_PROP_VARIATION"
	hash "0x0546524ADE2E9723"
	jhash (0x22E9A9DE)
	arguments {
		charPtr "cutsceneEntName",

		int "p1",

		int "p2",

		int "p3",

		Hash "modelHash",
	}
	alias "0x0546524ADE2E9723"
	ns "CUTSCENE"
	returns	"void"
	doc [[!
<summary>
		Thanks R*! ;)

		if ((l_161 == 0) || (l_161 == 2)) {
		    sub_2ea27("Trying to set Jimmy prop variation");
		    CUTSCENE::_0546524ADE2E9723("Jimmy_Boston", 1, 0, 0, 0);
		}
</summary>
	]]

native "0x708BDD8CD795B043"
	hash "0x708BDD8CD795B043"
	jhash (0x4315A7C5)
	ns "CUTSCENE"
	returns	"HashPtr"

native "GET_INTERIOR_GROUP_ID"
	hash "0xE4A84ABF135EF91A"
	jhash (0x09D6376F)
	arguments {
		int "interiorID",
	}
	ns "INTERIOR"
	returns	"int"
	doc [[!
<summary>
		Returns the group ID of the specified interior. For example, regular interiors have group 0, subway interiors have group 1. There are a few other groups too.
</summary>
	]]

native "GET_OFFSET_FROM_INTERIOR_IN_WORLD_COORDS"
	hash "0x9E3B3E6D66F6E22F"
	jhash (0x7D8F26A1)
	arguments {
		int "interiorID",

		float "x",

		float "y",

		float "z",
	}
	ns "INTERIOR"
	returns	"Vector3"

native "IS_INTERIOR_SCENE"
	hash "0xBC72B5D7A1CBD54D"
	jhash (0x55226C13)
	ns "INTERIOR"
	returns	"BOOL"

native "IS_VALID_INTERIOR"
	hash "0x26B0E73D7EAAF4D3"
	jhash (0x39C0B635)
	arguments {
		int "interiorID",
	}
	ns "INTERIOR"
	returns	"BOOL"
	doc [[!
<summary>
		Return if interior is valid.
</summary>
	]]

native "CLEAR_ROOM_FOR_ENTITY"
	hash "0xB365FC0C4E27FFA7"
	jhash (0x7DDADB92)
	arguments {
		Entity "entity",
	}
	ns "INTERIOR"
	returns	"void"

native "FORCE_ROOM_FOR_ENTITY"
	hash "0x52923C4710DD9907"
	jhash (0x10BD4435)
	arguments {
		Entity "entity",

		int "interiorID",

		Hash "roomHashKey",
	}
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		Does anyone know what this does? I know online modding isn't generally supported especially by the owner of this db, but I first thought this could be used to force ourselves into someones apartment, but I see now that isn't possible.
</summary>
	]]

native "GET_ROOM_KEY_FROM_ENTITY"
	hash "0x47C2A06D4F5F424B"
	jhash (0xE4ACF8C3)
	arguments {
		Entity "entity",
	}
	ns "INTERIOR"
	returns	"Hash"
	doc [[!
<summary>
		Gets the room hash key from the room that the specified entity is in. Each room in every interior has a unique key. Returns 0 if the entity is outside.
</summary>
	]]

native "GET_KEY_FOR_ENTITY_IN_ROOM"
	hash "0x399685DB942336BC"
	jhash (0x91EA80EF)
	arguments {
		Entity "entity",
	}
	ns "INTERIOR"
	returns	"Hash"
	doc [[!
<summary>
		Seems to do the exact same as INTERIOR::GET_ROOM_KEY_FROM_ENTITY
</summary>
	]]

native "GET_INTERIOR_FROM_ENTITY"
	hash "0x2107BA504071A6BB"
	jhash (0x5C644614)
	arguments {
		Entity "entity",
	}
	ns "INTERIOR"
	returns	"int"
	doc [[!
<summary>
		Returns the handle of the interior that the entity is in. Returns 0 if outside.
</summary>
	]]

native "0x82EBB79E258FA2B7"
	hash "0x82EBB79E258FA2B7"
	jhash (0xE645E162)
	arguments {
		Entity "entity",

		int "interiorID",
	}
	ns "INTERIOR"
	returns	"void"

native "0x920D853F3E17F1DA"
	hash "0x920D853F3E17F1DA"
	jhash (0xD79803B5)
	arguments {
		int "interiorID",

		Hash "roomHashKey",
	}
	ns "INTERIOR"
	returns	"void"

native "0xAF348AFCB575A441"
	hash "0xAF348AFCB575A441"
	jhash (0x1F6B4B13)
	arguments {
		charPtr "roomName",
	}
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		Exemple of use(carmod_shop.c4)
		 INTERIOR::_AF348AFCB575A441("V_CarModRoom");
</summary>
	]]

native "0x405DC2AEF6AF95B9"
	hash "0x405DC2AEF6AF95B9"
	jhash (0x0E9529CC)
	arguments {
		Hash "roomHashKey",
	}
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		Usage: INTERIOR::_0x405DC2AEF6AF95B9(INTERIOR::GET_KEY_FOR_ENTITY_IN_ROOM(PLAYER::PLAYER_PED_ID()));
</summary>
	]]

native "_GET_ROOM_KEY_FROM_GAMEPLAY_CAM"
	hash "0xA6575914D2A0B450"
	jhash (0x4FF3D3F5)
	alias "0xA6575914D2A0B450"
	ns "INTERIOR"
	returns	"Hash"
	doc [[!
<summary>
		Returns the room hash key from the current gameplay cam.
</summary>
	]]

native "0x23B59D8912F94246"
	hash "0x23B59D8912F94246"
	jhash (0x617DC75D)
	ns "INTERIOR"
	returns	"void"

native "GET_INTERIOR_AT_COORDS"
	hash "0xB0F7F8663821D9C3"
	jhash (0xA17FBF37)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "INTERIOR"
	returns	"int"
	doc [[!
<summary>
		Returns interior ID from specified coordinates. If coordinates are outside, then it returns 0.

		Example for VB.NET
		Dim interiorID As Integer = Native.Function.Call(Of Integer)(Hash.GET_INTERIOR_AT_COORDS, X, Y, Z)
</summary>
	]]

native "ADD_PICKUP_TO_INTERIOR_ROOM_BY_NAME"
	hash "0x3F6167F351168730"
	jhash (0xA2A73564)
	arguments {
		Pickup "pickup",

		charPtr "roomName",
	}
	ns "INTERIOR"
	returns	"void"

native "_LOAD_INTERIOR"
	hash "0x2CA429C029CCF247"
	jhash (0x3ADA414E)
	arguments {
		int "interiorID",
	}
	alias "0x2CA429C029CCF247"
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		Load interior
</summary>
	]]

native "UNPIN_INTERIOR"
	hash "0x261CCE7EED010641"
	jhash (0xFCFF792A)
	arguments {
		int "interiorID",
	}
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		Does something similar to INTERIOR::DISABLE_INTERIOR.

		You don't fall through the floor but everything is invisible inside and looks the same as when INTERIOR::DISABLE_INTERIOR is used. Peds behaves normally inside. 
</summary>
	]]

native "IS_INTERIOR_READY"
	hash "0x6726BDCCC1932F0E"
	jhash (0xE1EF6450)
	arguments {
		int "interiorID",
	}
	ns "INTERIOR"
	returns	"BOOL"

native "0x4C2330E61D3DEB56"
	hash "0x4C2330E61D3DEB56"
	arguments {
		int "interiorID",
	}
	ns "INTERIOR"
	returns	"Any"
	doc [[!
<summary>
		Only used once in the entire game scripts, probably useless. Always returns 0.
</summary>
	]]

native "GET_INTERIOR_AT_COORDS_WITH_TYPE"
	hash "0x05B7A89BD78797FC"
	jhash (0x96525B06)
	arguments {
		float "x",

		float "y",

		float "z",

		charPtr "interiorType",
	}
	alias "0x05B7A89BD78797FC"
	ns "INTERIOR"
	returns	"int"
	doc [[!
<summary>
		Returns the interior ID representing the requested interior at that location (if found?). The supplied interior string is not the same as the one used to load the interior.

		Use: INTERIOR::UNPIN_INTERIOR(INTERIOR::GET_INTERIOR_AT_COORDS_WITH_TYPE(x, y, z, interior))

		Interior types include: "V_Michael", "V_Franklins", "V_Franklinshouse", etc.. you can find them in the scripts.

		Not a very useful native as you could just use GET_INTERIOR_AT_COORDS instead and get the same result, without even having to specify the interior type.
</summary>
	]]

native "_UNK_GET_INTERIOR_AT_COORDS"
	hash "0xF0F77ADB9F67E79D"
	arguments {
		float "x",

		float "y",

		float "z",

		int "unk",
	}
	alias "0xF0F77ADB9F67E79D"
	ns "INTERIOR"
	returns	"int"
	doc [[!
<summary>
		Returns the interior ID at the given coords, but only if the unknown variable is set to 0, otherwise it will return 0.
</summary>
	]]

native "_ARE_COORDS_COLLIDING_WITH_EXTERIOR"
	hash "0xEEA5AC2EDA7C33E8"
	jhash (0x7762249C)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	alias "0xEEA5AC2EDA7C33E8"
	ns "INTERIOR"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the coords are colliding with the outdoors, and false if they collide with an interior.
</summary>
	]]

native "GET_INTERIOR_FROM_COLLISION"
	hash "0xEC4CF9FCB29A4424"
	jhash (0x7ED33DC1)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "INTERIOR"
	returns	"int"

native "_ENABLE_INTERIOR_PROP"
	hash "0x55E86AF2712B36A1"
	jhash (0xC80A5DDF)
	arguments {
		int "interiorID",

		charPtr "propName",
	}
	alias "0x55E86AF2712B36A1"
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		More info: http://gtaforums.com/topic/836367-adding-props-to-interiors/
</summary>
	]]

native "_DISABLE_INTERIOR_PROP"
	hash "0x420BD37289EEE162"
	jhash (0xDBA768A1)
	arguments {
		int "interiorID",

		charPtr "propName",
	}
	alias "0x420BD37289EEE162"
	ns "INTERIOR"
	returns	"void"

native "_IS_INTERIOR_PROP_ENABLED"
	hash "0x35F7DD45E8C0A16D"
	jhash (0x39A3CC6F)
	arguments {
		int "interiorID",

		charPtr "propName",
	}
	alias "0x35F7DD45E8C0A16D"
	ns "INTERIOR"
	returns	"BOOL"

native "REFRESH_INTERIOR"
	hash "0x41F37C3427C75AE0"
	jhash (0x9A29ACE6)
	arguments {
		int "interiorID",
	}
	ns "INTERIOR"
	returns	"void"

native "_HIDE_MAP_OBJECT_THIS_FRAME"
	hash "0xA97F257D0151A6AB"
	jhash (0x1F375B4C)
	arguments {
		Hash "mapObjectHash",
	}
	alias "0xA97F257D0151A6AB"
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		This is the native that is used to hide the exterior of GTA Online apartment buildings when you are inside an apartment.

		More info: http://gtaforums.com/topic/836301-hiding-gta-online-apartment-exteriors/
</summary>
	]]

native "DISABLE_INTERIOR"
	hash "0x6170941419D7D8EC"
	jhash (0x093ADEA5)
	arguments {
		int "interiorID",

		BOOL "toggle",
	}
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		Example: 
		This removes the interior from the strip club and when trying to walk inside the player just falls:

		INTERIOR::DISABLE_INTERIOR(118018, true);
</summary>
	]]

native "IS_INTERIOR_DISABLED"
	hash "0xBC5115A5A939DD15"
	jhash (0x81F34C71)
	arguments {
		int "interiorID",
	}
	ns "INTERIOR"
	returns	"BOOL"

native "CAP_INTERIOR"
	hash "0xD9175F941610DB54"
	jhash (0x34E735A6)
	arguments {
		int "interiorID",

		BOOL "toggle",
	}
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		Does something similar to INTERIOR::DISABLE_INTERIOR
</summary>
	]]

native "IS_INTERIOR_CAPPED"
	hash "0x92BAC8ACF88CEC26"
	jhash (0x18B17C80)
	arguments {
		int "interiorID",
	}
	ns "INTERIOR"
	returns	"BOOL"

native "0x9E6542F0CE8E70A3"
	hash "0x9E6542F0CE8E70A3"
	jhash (0x5EF9C5C2)
	arguments {
		BOOL "toggle",
	}
	ns "INTERIOR"
	returns	"void"
	doc [[!
<summary>
		Only found 4 times in Rockstar scripts.
		Clearly has something to do with Cutscenes.
</summary>
	]]

native "RENDER_SCRIPT_CAMS"
	hash "0x07E5B515DB0636FC"
	jhash (0x74337969)
	arguments {
		BOOL "render",

		BOOL "ease",

		int "easeTime",

		BOOL "p3",

		BOOL "p4",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		ease - smooth transition between the camera's positions
		easeTime - Time in milliseconds for the transition to happen

		If you have created a script (rendering) camera, and want to go back to the 
		character (gameplay) camera, call this native with render set to 0.
		Setting ease to 1 will smooth the transition.
</summary>
	]]

native "_RENDER_FIRST_PERSON_CAM"
	hash "0xC819F3CBB62BF692"
	jhash (0xD3C08183)
	arguments {
		BOOL "render",

		float "p1",

		int "p2",
	}
	alias "0xC819F3CBB62BF692"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		This native makes the gameplay camera zoom into first person/third person with a special effect.

		For example, if you were first person in a mission and after the cutscene ends, the camera would then zoom into the first person camera view.

		if (CAM::GET_FOLLOW_PED_CAM_VIEW_MODE() != 4)
		           CAM::_C819F3CBB62BF692(1, 0, 3, 0)

		This makes the camera zoom in to first person.

		--------------------------------------------
		1st Param Options: 0 or 1 (Changes quit often, toggle?)
		2nd Param Options: 0, 0f, 1f, 3.8f, 10f, 20f (Mostly 0) 
		3rd Param Options: 3, 2, 1 (Mostly 3);
		Note for the 2nd param 10f (offroad_race.c) and 3rd param 20f (range_modern.c) are the only times those 2 high floats are called.
		Note for the 3rd param 2 is only ever set in (franklin0.c), but it also sets it as 3. (0, 0, 3) ||(0, 0f, 2) || (0, 0, 3)
</summary>
	]]

native "CREATE_CAM"
	hash "0xC3981DCE61D9E13F"
	jhash (0xE9BF2A7D)
	arguments {
		charPtr "Gippo",

		BOOL "p1",
	}
	ns "CAM"
	returns	"Cam"
	doc [[!
<summary>
		"DEFAULT_SCRIPTED_CAMERA"
		"DEFAULT_ANIMATED_CAMERA"
		"DEFAULT_SPLINE_CAMERA"
		"DEFAULT_SCRIPTED_FLY_CAMERA"
		"TIMED_SPLINE_CAMERA"
</summary>
	]]

native "CREATE_CAM_WITH_PARAMS"
	hash "0xB51194800B257161"
	jhash (0x23B02F15)
	arguments {
		charPtr "camName",

		float "posX",

		float "posY",

		float "posZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "fov",

		BOOL "p8",

		int "p9",
	}
	ns "CAM"
	returns	"Cam"
	doc [[!
<summary>
		camName is always set to "DEFAULT_SCRIPTED_CAMERA" in Rockstar's scripts.
		------------
		Camera names found in the b617d scripts:
		"DEFAULT_ANIMATED_CAMERA"
		"DEFAULT_SCRIPTED_CAMERA"
		"DEFAULT_SCRIPTED_FLY_CAMERA"
		"DEFAULT_SPLINE_CAMERA"
		------------
		Side Note: It seems p8 is basically to represent what would be the bool p1 within CREATE_CAM native. As well as the p9 since it's always 2 in scripts seems to represent what would be the last param within SET_CAM_ROT native which normally would be 2.
</summary>
	]]

native "CREATE_CAMERA"
	hash "0x5E3CF89C6BCCA67D"
	jhash (0x5D6739AE)
	arguments {
		Hash "camHash",

		BOOL "p1",
	}
	ns "CAM"
	returns	"Cam"

native "CREATE_CAMERA_WITH_PARAMS"
	hash "0x6ABFA3E16460F22D"
	jhash (0x0688BE9A)
	arguments {
		Hash "camHash",

		float "posX",

		float "posY",

		float "posZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "fov",

		BOOL "p8",

		Any "p9",
	}
	ns "CAM"
	returns	"Cam"
	doc [[!
<summary>
		CAM::_GET_GAMEPLAY_CAM_COORDS can be used instead of posX,Y,Z
		CAM::_GET_GAMEPLAY_CAM_ROT can be used instead of rotX,Y,Z
		CAM::_80EC114669DAEFF4() can be used instead of p7 (Possible p7 is FOV parameter. )
		p8 ???
		p9 uses 2 by default

</summary>
	]]

native "DESTROY_CAM"
	hash "0x865908C81A2C22E9"
	jhash (0xC39302BD)
	arguments {
		Cam "cam",

		BOOL "thisScriptCheck",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		BOOL param indicates whether the cam should be destroyed if it belongs to the calling script.
</summary>
	]]

native "DESTROY_ALL_CAMS"
	hash "0x8E5FB15663F79120"
	jhash (0x10C151CE)
	arguments {
		BOOL "thisScriptCheck",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		BOOL param indicates whether the cam should be destroyed if it belongs to the calling script.
</summary>
	]]

native "DOES_CAM_EXIST"
	hash "0xA7A932170592B50E"
	jhash (0x1EF89DC0)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether or not the passed camera handle exists.
</summary>
	]]

native "SET_CAM_ACTIVE"
	hash "0x026FB97D0A425F84"
	jhash (0x064659C2)
	arguments {
		Cam "cam",

		BOOL "active",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Set camera as active/inactive.
</summary>
	]]

native "IS_CAM_ACTIVE"
	hash "0xDFB2B516207D3534"
	jhash (0x4B58F177)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether or not the passed camera handle is active.
</summary>
	]]

native "IS_CAM_RENDERING"
	hash "0x02EC0AF5C5A49B7A"
	jhash (0x6EC6B5B2)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"BOOL"

native "GET_RENDERING_CAM"
	hash "0x5234F9F10919EABA"
	jhash (0x0FCF4DF1)
	ns "CAM"
	returns	"Cam"

native "GET_CAM_COORD"
	hash "0xBAC038F7459AE5AE"
	jhash (0x7C40F09C)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"Vector3"

native "GET_CAM_ROT"
	hash "0x7D304C1C955E3E12"
	jhash (0xDAC84C9F)
	arguments {
		Cam "cam",

		int "rotationOrder",
	}
	ns "CAM"
	returns	"Vector3"
	doc [[!
<summary>
		The last parameter, as in other "ROT" methods, is usually 2.
</summary>
	]]

native "GET_CAM_FOV"
	hash "0xC3330A45CCCDB26A"
	jhash (0xD6E9FCF5)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"float"

native "GET_CAM_NEAR_CLIP"
	hash "0xC520A34DAFBF24B1"
	jhash (0xCFCD35EE)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"float"

native "GET_CAM_FAR_CLIP"
	hash "0xB60A9CFEB21CA6AA"
	jhash (0x09F119B8)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"float"

native "GET_CAM_FAR_DOF"
	hash "0x255F8DAFD540D397"
	jhash (0x98C5CCE9)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"float"

native "SET_CAM_PARAMS"
	hash "0xBFD8727AEA3CCEBA"
	jhash (0x2167CEBF)
	arguments {
		Cam "cam",

		float "posX",

		float "posY",

		float "posZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "fieldOfView",

		Any "p8",

		int "p9",

		int "p10",

		int "p11",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_COORD"
	hash "0x4D41783FB745E42E"
	jhash (0x7A8053AF)
	arguments {
		Cam "cam",

		float "posX",

		float "posY",

		float "posZ",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the position of the cam.
</summary>
	]]

native "SET_CAM_ROT"
	hash "0x85973643155D0B07"
	jhash (0xEE38B3C1)
	arguments {
		Cam "cam",

		float "rotX",

		float "rotY",

		float "rotZ",

		int "rotationOrder",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the rotation of the cam.
		Last parameter unknown.

		Last parameter seems to always be set to 2.
</summary>
	]]

native "SET_CAM_FOV"
	hash "0xB13C14F66A00D047"
	jhash (0xD3D5D74F)
	arguments {
		Cam "cam",

		float "fieldOfView",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the field of view of the cam.
		---------------------------------------------
		Min: 1.0f
		Max: 130.0f
</summary>
	]]

native "SET_CAM_NEAR_CLIP"
	hash "0xC7848EFCCC545182"
	jhash (0x46DB13B1)
	arguments {
		Cam "cam",

		float "nearClip",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_FAR_CLIP"
	hash "0xAE306F2A904BF86E"
	jhash (0x0D23E381)
	arguments {
		Cam "cam",

		float "farClip",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_MOTION_BLUR_STRENGTH"
	hash "0x6F0F77FBA9A8F2E6"
	jhash (0xFD6E0D67)
	arguments {
		Cam "cam",

		float "strength",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_NEAR_DOF"
	hash "0x3FA4BF0A7AB7DE2C"
	jhash (0xF28254DF)
	arguments {
		Cam "cam",

		float "nearDOF",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_FAR_DOF"
	hash "0xEDD91296CD01AEE0"
	jhash (0x58515E8E)
	arguments {
		Cam "cam",

		float "farDOF",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_DOF_STRENGTH"
	hash "0x5EE29B4D7D5DF897"
	jhash (0x3CC4EB3F)
	arguments {
		Cam "cam",

		float "dofStrength",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_DOF_PLANES"
	hash "0x3CF48F6F96E749DC"
	jhash (0xAD6C2B8F)
	arguments {
		Cam "cam",

		float "p1",

		float "p2",

		float "p3",

		float "p4",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_USE_SHALLOW_DOF_MODE"
	hash "0x16A96863A17552BB"
	jhash (0x8306C256)
	arguments {
		Cam "cam",

		BOOL "toggle",
	}
	ns "CAM"
	returns	"void"

native "SET_USE_HI_DOF"
	hash "0xA13B0222F3D94A94"
	jhash (0x8BBF2950)
	ns "CAM"
	returns	"void"

native "0xF55E4046F6F831DC"
	hash "0xF55E4046F6F831DC"
	arguments {
		Any "p0",

		float "p1",
	}
	ns "CAM"
	returns	"void"

native "0xE111A7C0D200CBC5"
	hash "0xE111A7C0D200CBC5"
	arguments {
		Any "p0",

		float "p1",
	}
	ns "CAM"
	returns	"void"

native "_SET_CAM_DOF_FNUMBER_OF_LENS"
	hash "0x7DD234D6F3914C5B"
	arguments {
		Cam "camera",

		float "p1",
	}
	alias "0x7DD234D6F3914C5B"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		This native has its name defined inside its codE

</summary>
	]]

native "_SET_CAM_DOF_FOCUS_DISTANCE_BIAS"
	hash "0xC669EEA5D031B7DE"
	arguments {
		Cam "camera",

		float "p1",
	}
	alias "0xC669EEA5D031B7DE"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		This native has a name defined inside its code
</summary>
	]]

native "_SET_CAM_DOF_MAX_NEAR_IN_FOCUS_DISTANCE"
	hash "0xC3654A441402562D"
	arguments {
		Cam "camera",

		float "p1",
	}
	alias "0xC3654A441402562D"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		This native has a name defined inside its code
</summary>
	]]

native "_SET_CAM_DOF_MAX_NEAR_IN_FOCUS_DISTANCE_BLEND_LEVEL"
	hash "0x2C654B4943BDDF7C"
	arguments {
		Cam "camera",

		float "p1",
	}
	alias "0x2C654B4943BDDF7C"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		This native has a name defined inside its code
</summary>
	]]

native "ATTACH_CAM_TO_ENTITY"
	hash "0xFEDB7D269E8C60E3"
	jhash (0xAD7C45F6)
	arguments {
		Cam "cam",

		Entity "entity",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		BOOL "isRelative",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Last param determines if its relative to the Entity
</summary>
	]]

native "ATTACH_CAM_TO_PED_BONE"
	hash "0x61A3DBA14AB7F411"
	jhash (0x506BB35C)
	arguments {
		Cam "cam",

		Ped "ped",

		int "boneIndex",

		float "x",

		float "y",

		float "z",

		BOOL "heading",
	}
	ns "CAM"
	returns	"void"

native "DETACH_CAM"
	hash "0xA2FABBE87F4BAD82"
	jhash (0xF4FBF14A)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_INHERIT_ROLL_VEHICLE"
	hash "0x45F1DE9C34B93AE6"
	jhash (0xE4BD5342)
	arguments {
		Cam "cam",

		BOOL "p1",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		The native seems to only be called once.

		The native is used as so,
		CAM::SET_CAM_INHERIT_ROLL_VEHICLE(l_544, getElem(2, &amp;l_525, 4));
		In the exile1 script.
</summary>
	]]

native "POINT_CAM_AT_COORD"
	hash "0xF75497BB865F0803"
	jhash (0x914BC21A)
	arguments {
		Cam "cam",

		float "x",

		float "y",

		float "z",
	}
	ns "CAM"
	returns	"void"

native "POINT_CAM_AT_ENTITY"
	hash "0x5640BFF86B16E8DC"
	jhash (0x7597A0F7)
	arguments {
		Cam "cam",

		Entity "entity",

		float "p2",

		float "p3",

		float "p4",

		BOOL "p5",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		p5 always seems to be 1 i.e TRUE
</summary>
	]]

native "POINT_CAM_AT_PED_BONE"
	hash "0x68B2B5F33BA63C41"
	jhash (0x09F47049)
	arguments {
		Cam "cam",

		int "ped",

		int "boneIndex",

		float "x",

		float "y",

		float "z",

		BOOL "p6",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Parameters p0-p5 seems correct. The bool p6 is unknown, but through every X360 script it's always 1. Please correct p0-p5 if any prove to be wrong. 
</summary>
	]]

native "STOP_CAM_POINTING"
	hash "0xF33AB75780BA57DE"
	jhash (0x5435F6A5)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_AFFECTS_AIMING"
	hash "0x8C1DC7770C51DC8D"
	jhash (0x0C74F9AF)
	arguments {
		Cam "cam",

		BOOL "toggle",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Allows you to aim and shoot at the direction the camera is facing.
</summary>
	]]

native "0x661B5C8654ADD825"
	hash "0x661B5C8654ADD825"
	jhash (0xE1A0B2F1)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "CAM"
	returns	"void"

native "0xA2767257A320FC82"
	hash "0xA2767257A320FC82"
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "CAM"
	returns	"void"

native "0x271017B9BA825366"
	hash "0x271017B9BA825366"
	jhash (0x43220969)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_DEBUG_NAME"
	hash "0x1B93E0107865DD40"
	jhash (0x9B00DF3F)
	arguments {
		Cam "camera",

		charPtr "name",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "ADD_CAM_SPLINE_NODE"
	hash "0x8609C75EC438FB3B"
	jhash (0xAD3C7EAA)
	arguments {
		Cam "camera",

		float "x",

		float "y",

		float "z",

		float "xRot",

		float "yRot",

		float "zRot",

		int "length",

		int "p8",

		int "transitionType",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		I filled p1-p6 (the floats) as they are as other natives with 6 floats in a row are similar and I see no other method. So if a test from anyone proves them wrong please correct.

		p7 (length) determines the length of the spline, affects camera path and duration of transition between previous node and this one

		p8 big values ~100 will slow down the camera movement before reaching this node

		p9 != 0 seems to override the rotation/pitch (bool?)
</summary>
	]]

native "0x0A9F2A468B328E74"
	hash "0x0A9F2A468B328E74"
	jhash (0x30510511)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "CAM"
	returns	"void"

native "0x0FB82563989CF4FB"
	hash "0x0FB82563989CF4FB"
	jhash (0xBA6C085B)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "CAM"
	returns	"void"

native "0x609278246A29CA34"
	hash "0x609278246A29CA34"
	jhash (0xB4737F03)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",
	}
	ns "CAM"
	returns	"void"

native "SET_CAM_SPLINE_PHASE"
	hash "0x242B5874F0A4E052"
	jhash (0xF0AED233)
	arguments {
		Cam "cam",

		float "p1",
	}
	ns "CAM"
	returns	"void"

native "GET_CAM_SPLINE_PHASE"
	hash "0xB5349E36C546509A"
	jhash (0x39784DD9)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"float"
	doc [[!
<summary>
		Can use this with SET_CAM_SPLINE_PHASE to set the float it this native returns.

		(returns 1.0f when no nodes has been added, reached end of non existing spline)
</summary>
	]]

native "GET_CAM_SPLINE_NODE_PHASE"
	hash "0xD9D0E694C8282C96"
	jhash (0x7B9522F6)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"float"
	doc [[!
<summary>
		I'm pretty sure the parameter is the camera as usual, but I am not certain so I'm going to leave it as is.
</summary>
	]]

native "SET_CAM_SPLINE_DURATION"
	hash "0x1381539FEE034CDA"
	jhash (0x3E91FC8A)
	arguments {
		int "cam",

		int "timeDuration",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		I named p1 as timeDuration as it is obvious. I'm assuming tho it is ran in ms(Milliseconds) as usual.
</summary>
	]]

native "0xD1B0F412F109EA5D"
	hash "0xD1B0F412F109EA5D"
	jhash (0x15E141CE)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "CAM"
	returns	"void"

native "GET_CAM_SPLINE_NODE_INDEX"
	hash "0xB22B17DF858716A6"
	jhash (0xF8AEB6BD)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"int"
	doc [[!
<summary>
		I named the beginning from Any to BOOL as this native is used in an if statement as well. 

		Big surprise it returns an int.
</summary>
	]]

native "0x83B8201ED82A9A2D"
	hash "0x83B8201ED82A9A2D"
	jhash (0x21D275DA)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		float "p3",
	}
	ns "CAM"
	returns	"void"

native "0xA6385DEB180F319F"
	hash "0xA6385DEB180F319F"
	jhash (0xA3BD9E94)
	arguments {
		Any "p0",

		Any "p1",

		float "p2",
	}
	ns "CAM"
	returns	"void"

native "OVERRIDE_CAM_SPLINE_VELOCITY"
	hash "0x40B62FA033EB0346"
	jhash (0x326A17E2)
	arguments {
		Cam "cam",

		int "p1",

		float "p2",

		float "p3",
	}
	ns "CAM"
	returns	"void"

native "OVERRIDE_CAM_SPLINE_MOTION_BLUR"
	hash "0x7DCF7C708D292D55"
	jhash (0x633179E6)
	arguments {
		Cam "cam",

		int "p1",

		float "p2",

		float "p3",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Max value for p1 is 15.
</summary>
	]]

native "0x7BF1A54AE67AC070"
	hash "0x7BF1A54AE67AC070"
	jhash (0xC90B2DDC)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",
	}
	ns "CAM"
	returns	"void"

native "IS_CAM_SPLINE_PAUSED"
	hash "0x0290F35C0AD97864"
	jhash (0x60B34FF5)
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"BOOL"

native "SET_CAM_ACTIVE_WITH_INTERP"
	hash "0x9FBDA379383A52A4"
	jhash (0x7983E7F0)
	arguments {
		Cam "camTo",

		Cam "camFrom",

		int "duration",

		int "easeLocation",

		int "easeRotation",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Previous declaration void SET_CAM_ACTIVE_WITH_INTERP(Cam camTo, Cam camFrom, int duration, BOOL easeLocation, BOOL easeRotation) is completely wrong. The last two params are integers not BOOLs...

</summary>
	]]

native "IS_CAM_INTERPOLATING"
	hash "0x036F97C908C2B52C"
	jhash (0x7159CB5D)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"BOOL"

native "SHAKE_CAM"
	hash "0x6A25241C340D3822"
	jhash (0x1D4211B0)
	arguments {
		Cam "cam",

		charPtr "type",

		float "amplitude",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Possible shake types (updated b617d):

		DEATH_FAIL_IN_EFFECT_SHAKE
		DRUNK_SHAKE
		FAMILY5_DRUG_TRIP_SHAKE
		HAND_SHAKE
		JOLT_SHAKE
		LARGE_EXPLOSION_SHAKE
		MEDIUM_EXPLOSION_SHAKE
		SMALL_EXPLOSION_SHAKE
		ROAD_VIBRATION_SHAKE
		SKY_DIVING_SHAKE
		VIBRATE_SHAKE
</summary>
	]]

native "ANIMATED_SHAKE_CAM"
	hash "0xA2746EEAE3E577CD"
	jhash (0xE1168767)
	arguments {
		Cam "cam",

		charPtr "p1",

		charPtr "p2",

		charPtr "p3",

		float "amplitude",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Example from michael2 script.

		CAM::ANIMATED_SHAKE_CAM(l_5069, "shake_cam_all@", "light", "", 1f);
</summary>
	]]

native "IS_CAM_SHAKING"
	hash "0x6B24BFE83A2BE47B"
	jhash (0x0961FD9B)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"BOOL"

native "SET_CAM_SHAKE_AMPLITUDE"
	hash "0xD93DB43B82BC0D00"
	jhash (0x60FF6382)
	arguments {
		Cam "cam",

		float "amplitude",
	}
	ns "CAM"
	returns	"void"

native "STOP_CAM_SHAKING"
	hash "0xBDECF64367884AC3"
	jhash (0x40D0EB87)
	arguments {
		Cam "cam",

		BOOL "p1",
	}
	ns "CAM"
	returns	"void"

native "0xF4C8CF9E353AFECA"
	hash "0xF4C8CF9E353AFECA"
	jhash (0x2B0F05CD)
	arguments {
		charPtr "p0",

		float "p1",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Something to do with shake:
		CAM::_F4C8CF9E353AFECA("HAND_SHAKE", 0.2);
</summary>
	]]

native "0xC2EAE3FB8CDBED31"
	hash "0xC2EAE3FB8CDBED31"
	jhash (0xCB75BD9C)
	arguments {
		charPtr "p0",

		charPtr "p1",

		charPtr "p2",

		float "p3",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		CAM::_C2EAE3FB8CDBED31("SHAKE_CAM_medium", "medium", "", 0.5f);
</summary>
	]]

native "IS_SCRIPT_GLOBAL_SHAKING"
	hash "0xC912AF078AF19212"
	jhash (0x6AEFE6A5)
	alias "0xC912AF078AF19212"
	ns "CAM"
	returns	"BOOL"
	doc [[!
<summary>
		In drunk_controller.c4, sub_309
		if (CAM::_C912AF078AF19212()) {
		    CAM::_1C9D7949FA533490(0);
		}

		What does "IS_SCRIPT_GLOBAL_SHAKING" mean..? :/ Is this a hash collision?
</summary>
	]]

native "STOP_SCRIPT_GLOBAL_SHAKING"
	hash "0x1C9D7949FA533490"
	jhash (0x26FCFB96)
	arguments {
		BOOL "p0",
	}
	alias "0x1C9D7949FA533490"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		In drunk_controller.c4, sub_309
		if (CAM::_C912AF078AF19212()) {
		    CAM::_1C9D7949FA533490(0);
		}
</summary>
	]]

native "PLAY_CAM_ANIM"
	hash "0x9A2D0FB2E7852392"
	jhash (0xBCEFB87E)
	arguments {
		Cam "cam",

		charPtr "animName",

		charPtr "animDictionary",

		float "x",

		float "y",

		float "z",

		float "xRot",

		float "yRot",

		float "zRot",

		BOOL "p9",

		int "p10",
	}
	ns "CAM"
	returns	"BOOL"
	doc [[!
<summary>
		Atleast one time in a script for the zRot Rockstar uses GET_ENTITY_HEADING to help fill the parameter.

		p9 is unknown at this time.
		p10 throughout all the X360 Scripts is always 2.

		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "IS_CAM_PLAYING_ANIM"
	hash "0xC90621D8A0CEECF2"
	jhash (0xB998CB49)
	arguments {
		Cam "cam",

		charPtr "animName",

		charPtr "animDictionary",
	}
	ns "CAM"
	returns	"BOOL"
	doc [[!
<summary>


		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "SET_CAM_ANIM_CURRENT_PHASE"
	hash "0x4145A4C44FF3B5A6"
	jhash (0x3CB1D17F)
	arguments {
		Cam "cam",

		float "phase",
	}
	ns "CAM"
	returns	"void"

native "GET_CAM_ANIM_CURRENT_PHASE"
	hash "0xA10B2DB49E92A6B0"
	jhash (0x345F72D0)
	arguments {
		Cam "cam",
	}
	ns "CAM"
	returns	"float"

native "PLAY_SYNCHRONIZED_CAM_ANIM"
	hash "0xE32EFE9AB4A9AA0C"
	jhash (0x9458459E)
	arguments {
		Any "p0",

		Any "p1",

		charPtr "animName",

		charPtr "animDictionary",
	}
	ns "CAM"
	returns	"BOOL"
	doc [[!
<summary>
		Examples:

		CAM::PLAY_SYNCHRONIZED_CAM_ANIM(l_2734, NETWORK::_02C40BF885C567B6(l_2739), "PLAYER_EXIT_L_CAM", "mp_doorbell");

		CAM::PLAY_SYNCHRONIZED_CAM_ANIM(l_F0D[7/*1*/], l_F4D[15/*1*/], "ah3b_attackheli_cam2", "missheistfbi3b_helicrash");


		Animations list : www.los-santos-multiplayer.com/dev.airdancer?cxt=anim
</summary>
	]]

native "0x503F5920162365B2"
	hash "0x503F5920162365B2"
	jhash (0x56F9ED27)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "CAM"
	returns	"void"

native "_SET_CAMERA_RANGE"
	hash "0xF9D02130ECDD1D77"
	jhash (0x71570DBA)
	arguments {
		Cam "cam",

		float "range",
	}
	alias "0xF9D02130ECDD1D77"
	ns "CAM"
	returns	"void"

native "0xC91C6C55199308CA"
	hash "0xC91C6C55199308CA"
	jhash (0x60B345DE)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "CAM"
	returns	"void"

native "0xC8B5C4A79CC18B94"
	hash "0xC8B5C4A79CC18B94"
	jhash (0x44473EFC)
	arguments {
		Cam "p0",
	}
	ns "CAM"
	returns	"void"

native "0x5C48A1D6E3B33179"
	hash "0x5C48A1D6E3B33179"
	jhash (0xDA931D65)
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"BOOL"

native "IS_SCREEN_FADED_OUT"
	hash "0xB16FCE9DDC7BA182"
	jhash (0x9CAA05FA)
	ns "CAM"
	returns	"BOOL"

native "IS_SCREEN_FADED_IN"
	hash "0x5A859503B0C08678"
	jhash (0x4F37276D)
	ns "CAM"
	returns	"BOOL"

native "IS_SCREEN_FADING_OUT"
	hash "0x797AC7CB535BA28F"
	jhash (0x79275A57)
	ns "CAM"
	returns	"BOOL"

native "IS_SCREEN_FADING_IN"
	hash "0x5C544BC6C57AC575"
	jhash (0xC7C82800)
	ns "CAM"
	returns	"BOOL"

native "DO_SCREEN_FADE_IN"
	hash "0xD4E8E24955024033"
	jhash (0x66C1BDEE)
	arguments {
		int "duration",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Fades the screen in.

		duration: The time the fade should take, in milliseconds.
</summary>
	]]

native "DO_SCREEN_FADE_OUT"
	hash "0x891B5B39AC6302AF"
	jhash (0x89D01805)
	arguments {
		int "duration",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Fades the screen out.

		duration: The time the fade should take, in milliseconds.
</summary>
	]]

native "SET_WIDESCREEN_BORDERS"
	hash "0xDCD4EA924F42D01A"
	jhash (0x1A75DC9A)
	arguments {
		BOOL "p0",

		int "p1",
	}
	ns "CAM"
	returns	"Any"

native "GET_GAMEPLAY_CAM_COORD"
	hash "0x14D6F5678D8F1B37"
	jhash (0x9388CF79)
	ns "CAM"
	returns	"Vector3"

native "GET_GAMEPLAY_CAM_ROT"
	hash "0x837765A25378F0BB"
	jhash (0x13A010B5)
	arguments {
		int "rotationOrder",
	}
	ns "CAM"
	returns	"Vector3"
	doc [[!
<summary>
		p0 dosen't seem to change much, I tried it with 0, 1, 2:
		0-Pitch(X): -70.000092
		0-Roll(Y): -0.000001
		0-Yaw(Z): -43.886459
		1-Pitch(X): -70.000092
		1-Roll(Y): -0.000001
		1-Yaw(Z): -43.886463
		2-Pitch(X): -70.000092
		2-Roll(Y): -0.000002
		2-Yaw(Z): -43.886467
</summary>
	]]

native "GET_GAMEPLAY_CAM_FOV"
	hash "0x65019750A0324133"
	jhash (0x4D6B3BFA)
	ns "CAM"
	returns	"float"

native "CUSTOM_MENU_COORDINATES"
	hash "0x487A82C650EB7799"
	jhash (0xA6E73135)
	arguments {
		float "p0",
	}
	alias "0x487A82C650EB7799"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		some camera effect that is used in the drunk-cheat, and turned off (by setting it to 0.0) along with the shaking effects once the drunk cheat is disabled.
</summary>
	]]

native "0x0225778816FDC28C"
	hash "0x0225778816FDC28C"
	jhash (0x1126E37C)
	arguments {
		float "p0",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		some camera effect that is (also) used in the drunk-cheat, and turned off (by setting it to 0.0) along with the shaking effects once the drunk cheat is disabled. Possibly a cinematic or script-cam version of _0x487A82C650EB7799
</summary>
	]]

native "GET_GAMEPLAY_CAM_RELATIVE_HEADING"
	hash "0x743607648ADD4587"
	jhash (0xCAF839C2)
	ns "CAM"
	returns	"float"

native "SET_GAMEPLAY_CAM_RELATIVE_HEADING"
	hash "0xB4EC2312F4E5B1F1"
	jhash (0x20C6217C)
	arguments {
		float "heading",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the camera position relative to heading in float from -360 to +360.

		Heading is alwyas 0 in aiming camera.
</summary>
	]]

native "GET_GAMEPLAY_CAM_RELATIVE_PITCH"
	hash "0x3A6867B4845BEDA2"
	jhash (0xFC5A4946)
	ns "CAM"
	returns	"float"

native "SET_GAMEPLAY_CAM_RELATIVE_PITCH"
	hash "0x6D0858B8EDFD2B7D"
	jhash (0x6381B963)
	arguments {
		float "x",

		float "Value2",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the camera pitch.

		Parameters:
		x = pitches the camera on the x axis.
		Value2 = always seems to be hex 0x3F800000 (1.000000 float).
</summary>
	]]

native "_SET_GAMEPLAY_CAM_RAW_YAW"
	hash "0x103991D4A307D472"
	arguments {
		float "yaw",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Does nothing
</summary>
	]]

native "_SET_GAMEPLAY_CAM_RAW_PITCH"
	hash "0x759E13EBC1C15C5A"
	arguments {
		float "pitch",
	}
	ns "CAM"
	returns	"void"

native "0x469F2ECDEC046337"
	hash "0x469F2ECDEC046337"
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "SHAKE_GAMEPLAY_CAM"
	hash "0xFD55E49555E017CF"
	jhash (0xF2EFE660)
	arguments {
		charPtr "shakeName",

		float "intensity",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Possible shake types (updated b617d):

		DEATH_FAIL_IN_EFFECT_SHAKE
		DRUNK_SHAKE
		FAMILY5_DRUG_TRIP_SHAKE
		HAND_SHAKE
		JOLT_SHAKE
		LARGE_EXPLOSION_SHAKE
		MEDIUM_EXPLOSION_SHAKE
		SMALL_EXPLOSION_SHAKE
		ROAD_VIBRATION_SHAKE
		SKY_DIVING_SHAKE
		VIBRATE_SHAKE
</summary>
	]]

native "IS_GAMEPLAY_CAM_SHAKING"
	hash "0x016C090630DF1F89"
	jhash (0x3457D681)
	ns "CAM"
	returns	"BOOL"

native "SET_GAMEPLAY_CAM_SHAKE_AMPLITUDE"
	hash "0xA87E00932DB4D85D"
	jhash (0x9219D44A)
	arguments {
		float "amplitude",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the amplitude for the gameplay (i.e. 3rd or 1st) camera to shake. Used in script "drunk_controller.ysc.c4" to simulate making the player drunk.
</summary>
	]]

native "STOP_GAMEPLAY_CAM_SHAKING"
	hash "0x0EF93E9F3D08C178"
	jhash (0xFD569E4E)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "0x8BBACBF51DA047A8"
	hash "0x8BBACBF51DA047A8"
	jhash (0x7D3007A2)
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"void"

native "IS_GAMEPLAY_CAM_RENDERING"
	hash "0x39B5D1B10383F0C8"
	jhash (0x0EF276DA)
	ns "CAM"
	returns	"BOOL"
	doc [[!
<summary>
		Examples when this function will return 0 are:
		- During busted screen.
		- When player is coming out from a hospital.
		- When player is coming out from a police station.
</summary>
	]]

native "0x3044240D2E0FA842"
	hash "0x3044240D2E0FA842"
	jhash (0xC0B00C20)
	ns "CAM"
	returns	"BOOL"

native "0x705A276EBFF3133D"
	hash "0x705A276EBFF3133D"
	jhash (0x60C23785)
	ns "CAM"
	returns	"BOOL"

native "0xDB90C6CCA48940F1"
	hash "0xDB90C6CCA48940F1"
	jhash (0x20BFF6E5)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "_ENABLE_CROSSHAIR_THIS_FRAME"
	hash "0xEA7F0AD7E9BA676F"
	jhash (0xA61FF9AC)
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Shows the crosshair even if it wouldn't show normally. Only works for one frame, so make sure to call it repeatedly.
</summary>
	]]

native "IS_GAMEPLAY_CAM_LOOKING_BEHIND"
	hash "0x70FDA869F3317EA9"
	jhash (0x33C83F17)
	ns "CAM"
	returns	"BOOL"

native "0x2AED6301F67007D5"
	hash "0x2AED6301F67007D5"
	jhash (0x2701A9AD)
	arguments {
		Entity "entity",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		                if (ENTITY::DOES_ENTITY_EXIST(l_228)) {
		                    CAM::_2AED6301F67007D5(l_228);
</summary>
	]]

native "0x49482F9FCD825AAA"
	hash "0x49482F9FCD825AAA"
	jhash (0xC4736ED3)
	arguments {
		Entity "entity",
	}
	ns "CAM"
	returns	"void"

native "0xFD3151CD37EA2245"
	hash "0xFD3151CD37EA2245"
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"void"

native "0xDD79DF9F4D26E1C9"
	hash "0xDD79DF9F4D26E1C9"
	jhash (0x6B0E9D57)
	ns "CAM"
	returns	"void"

native "IS_SPHERE_VISIBLE"
	hash "0xE33D59DA70B58FDF"
	jhash (0xDD1329E2)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",
	}
	ns "CAM"
	returns	"BOOL"

native "IS_FOLLOW_PED_CAM_ACTIVE"
	hash "0xC6D3D26810C8E0F9"
	jhash (0x9F9E856C)
	ns "CAM"
	returns	"BOOL"

native "SET_FOLLOW_PED_CAM_CUTSCENE_CHAT"
	hash "0x44A113DD6FFC48D1"
	jhash (0x1425F6AC)
	arguments {
		charPtr "p0",

		int "p1",
	}
	ns "CAM"
	returns	"BOOL"
	doc [[!
<summary>
		From the b617d scripts:

		CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_ATTACHED_TO_ROPE_CAMERA", 0);
		 CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_ON_EXILE1_LADDER_CAMERA", 1500);
		 CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_SKY_DIVING_CAMERA", 0);
		 CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_SKY_DIVING_CAMERA", 3000);
		 CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_SKY_DIVING_FAMILY5_CAMERA", 0);
		CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_SKY_DIVING_CAMERA", 0);
</summary>
	]]

native "0x271401846BD26E92"
	hash "0x271401846BD26E92"
	jhash (0x8DC53629)
	arguments {
		BOOL "p0",

		BOOL "p1",
	}
	ns "CAM"
	returns	"void"

native "0xC8391C309684595A"
	hash "0xC8391C309684595A"
	jhash (0x1F9DE6E4)
	ns "CAM"
	returns	"void"

native "_CLAMP_GAMEPLAY_CAM_YAW"
	hash "0x8F993D26E0CA5E8E"
	jhash (0x749909AC)
	arguments {
		float "minimum",

		float "maximum",
	}
	ns "CAM"
	returns	"Any"
	doc [[!
<summary>
		minimum: Degrees between -180f and 180f.
		maximum: Degrees between -180f and 180f.

		Clamps the gameplay camera's current yaw.

		Eg. _CLAMP_GAMEPLAY_CAM_YAW(0.0f, 0.0f) will set the horizontal angle directly behind the player.
</summary>
	]]

native "_CLAMP_GAMEPLAY_CAM_PITCH"
	hash "0xA516C198B7DCA1E1"
	jhash (0xFA3A16E7)
	arguments {
		float "minimum",

		float "maximum",
	}
	ns "CAM"
	returns	"Any"
	doc [[!
<summary>
		minimum: Degrees between -90f and 90f.
		maximum: Degrees between -90f and 90f.

		Clamps the gameplay camera's current pitch.

		Eg. _CLAMP_GAMEPLAY_CAM_PITCH(0.0f, 0.0f) will set the vertical angle directly behind the player.
</summary>
	]]

native "_ANIMATE_GAMEPLAY_CAM_ZOOM"
	hash "0xDF2E1F7742402E81"
	jhash (0x77340650)
	arguments {
		float "p0",

		float "distance",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Seems to animate the gameplay camera zoom.

		Eg. _ANIMATE_GAMEPLAY_CAM_ZOOM(1f, 1000f);
		will animate the camera zooming in from 1000 meters away.

		Game scripts use it like this:

		// Setting this to 1 prevents V key from changing zoom
		PLAYER::SET_PLAYER_FORCED_ZOOM(PLAYER::PLAYER_ID(), 1);

		// These restrict how far you can move cam up/down left/right
		CAM::_CLAMP_GAMEPLAY_CAM_YAW(-20f, 50f);
		CAM::_CLAMP_GAMEPLAY_CAM_PITCH(-60f, 0f);

		CAM::_ANIMATE_GAMEPLAY_CAM_ZOOM(1f, 1f);
</summary>
	]]

native "0xE9EA16D6E54CDCA4"
	hash "0xE9EA16D6E54CDCA4"
	jhash (0x4B22C5CB)
	arguments {
		Vehicle "p0",

		int "p1",
	}
	ns "CAM"
	returns	"Any"

native "_DISABLE_FIRST_PERSON_CAM_THIS_FRAME"
	hash "0xDE2EF5DA284CC8DF"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Disables first person camera for the current frame.

		Found in decompiled scripts:
		GRAPHICS::DRAW_DEBUG_TEXT_2D("Disabling First Person Cam", 0.5, 0.8, 0.0, 0, 0, 255, 255);
		CAM::_DE2EF5DA284CC8DF();
</summary>
	]]

native "0x59424BD75174C9B1"
	hash "0x59424BD75174C9B1"
	ns "CAM"
	returns	"void"

native "GET_FOLLOW_PED_CAM_ZOOM_LEVEL"
	hash "0x33E6C8EFD0CD93E9"
	jhash (0x57583DF1)
	ns "CAM"
	returns	"int"

native "GET_FOLLOW_PED_CAM_VIEW_MODE"
	hash "0x8D4D46230B2C353A"
	jhash (0xA65FF946)
	ns "CAM"
	returns	"int"
	doc [[!
<summary>
		Returns
		0 - Third Person Close
		1 - Third Person Mid
		2 - Third Person Far
		4 - First Person
</summary>
	]]

native "SET_FOLLOW_PED_CAM_VIEW_MODE"
	hash "0x5A4F9EDF1673F704"
	jhash (0x495DBE8D)
	arguments {
		int "viewMode",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the type of Player camera:

		0 - Third Person Close
		1 - Third Person Mid
		2 - Third Person Far
		4 - First Person
</summary>
	]]

native "IS_FOLLOW_VEHICLE_CAM_ACTIVE"
	hash "0xCBBDE6D335D6D496"
	jhash (0x8DD49B77)
	ns "CAM"
	returns	"BOOL"

native "0x91EF6EE6419E5B97"
	hash "0x91EF6EE6419E5B97"
	jhash (0x9DB5D391)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "SET_TIME_IDLE_DROP"
	hash "0x9DFE13ECDC1EC196"
	jhash (0x92302899)
	arguments {
		BOOL "p0",

		BOOL "p1",
	}
	alias "0x9DFE13ECDC1EC196"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		hash collision?
</summary>
	]]

native "GET_FOLLOW_VEHICLE_CAM_ZOOM_LEVEL"
	hash "0xEE82280AB767B690"
	jhash (0x8CD67DE3)
	ns "CAM"
	returns	"int"

native "SET_FOLLOW_VEHICLE_CAM_ZOOM_LEVEL"
	hash "0x19464CB6E4078C8A"
	jhash (0x8F55EBBE)
	arguments {
		int "zoomLevel",
	}
	ns "CAM"
	returns	"void"

native "GET_FOLLOW_VEHICLE_CAM_VIEW_MODE"
	hash "0xA4FF579AC0E3AAAE"
	jhash (0xA4B4DB03)
	ns "CAM"
	returns	"int"
	doc [[!
<summary>
		Returns the type of camera:

		0 - Third Person Close
		1 - Third Person Mid
		2 - Third Person Far
		4 - First Person
</summary>
	]]

native "SET_FOLLOW_VEHICLE_CAM_VIEW_MODE"
	hash "0xAC253D7842768F48"
	jhash (0xC4FBBBD3)
	arguments {
		int "viewMode",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the type of Player camera in vehicles:

		0 - Third Person Close
		1 - Third Person Mid
		2 - Third Person Far
		4 - First Person
</summary>
	]]

native "0xEE778F8C7E1142E2"
	hash "0xEE778F8C7E1142E2"
	jhash (0xF3B148A6)
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"Any"
	doc [[!
<summary>
		interprets the result of CAM::_0x19CAFA3C87F7C2FF()

		example: // checks if you're currently in first person
		if ((CAM::_EE778F8C7E1142E2(CAM::_19CAFA3C87F7C2FF()) == 4) &amp;&amp; (!__463_$28ED382849B17AFC())) {
		UI::_FDEC055AB549E328();
		UI::_SET_NOTIFICATION_TEXT_ENTRY("REC_FEED_WAR");
		l_CE[0/*1*/] = UI::_DRAW_NOTIFICATION(0, 1);
		}

</summary>
	]]

native "0x2A2173E46DAECD12"
	hash "0x2A2173E46DAECD12"
	jhash (0x1DEBCB45)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "CAM"
	returns	"void"

native "0x19CAFA3C87F7C2FF"
	hash "0x19CAFA3C87F7C2FF"
	ns "CAM"
	returns	"Any"
	doc [[!
<summary>
		Seems to return the current type of view
		example: // checks if you're currently in first person
		if ((CAM::_EE778F8C7E1142E2(CAM::_19CAFA3C87F7C2FF()) == 4) &amp;&amp; (!__463_$28ED382849B17AFC())) {
		    UI::_FDEC055AB549E328();
		    UI::_SET_NOTIFICATION_TEXT_ENTRY("REC_FEED_WAR");
		    l_CE[0/*1*/] = UI::_DRAW_NOTIFICATION(0, 1);
		}
</summary>
	]]

native "IS_AIM_CAM_ACTIVE"
	hash "0x68EDDA28A5976D07"
	jhash (0xC24B4F6F)
	ns "CAM"
	returns	"BOOL"

native "0x74BD83EA840F6BC9"
	hash "0x74BD83EA840F6BC9"
	jhash (0x8F320DE4)
	ns "CAM"
	returns	"BOOL"

native "IS_FIRST_PERSON_AIM_CAM_ACTIVE"
	hash "0x5E346D934122613F"
	jhash (0xD6280468)
	ns "CAM"
	returns	"BOOL"

native "DISABLE_AIM_CAM_THIS_UPDATE"
	hash "0x1A31FE0049E542F6"
	jhash (0x1BAA7182)
	alias "0x1A31FE0049E542F6"
	ns "CAM"
	returns	"void"

native "_GET_GAMEPLAY_CAM_ZOOM"
	hash "0x7EC52CC40597D170"
	jhash (0x33951005)
	ns "CAM"
	returns	"float"

native "0x70894BD0915C5BCA"
	hash "0x70894BD0915C5BCA"
	jhash (0x9F4AF763)
	arguments {
		float "p0",
	}
	ns "CAM"
	returns	"Any"

native "0xCED08CBE8EBB97C7"
	hash "0xCED08CBE8EBB97C7"
	jhash (0x68BA0730)
	arguments {
		float "p0",

		float "p1",
	}
	ns "CAM"
	returns	"void"

native "0x2F7F2B26DD3F18EE"
	hash "0x2F7F2B26DD3F18EE"
	jhash (0x2F29F0D5)
	arguments {
		float "p0",

		float "p1",
	}
	ns "CAM"
	returns	"void"

native "_SET_FIRST_PERSON_CAM_PITCH_RANGE"
	hash "0xBCFC632DB7673BF0"
	jhash (0x76DAC96C)
	arguments {
		float "minAngle",

		float "maxAngle",
	}
	alias "0xBCFC632DB7673BF0"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Similar to _CLAMP_GAMEPLAY_CAM_PITCH except this is specifically for the FP camera, and it only lets you clamp the pitch within the normal range.
</summary>
	]]

native "_SET_FIRST_PERSON_CAM_NEAR_CLIP"
	hash "0x0AF7B437918103B3"
	jhash (0x0E21069D)
	arguments {
		float "distance",
	}
	alias "0x0AF7B437918103B3"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the near clipping plane of the first person camera.
</summary>
	]]

native "_SET_THIRD_PERSON_AIM_CAM_NEAR_CLIP"
	hash "0x42156508606DE65E"
	jhash (0x71E9C63E)
	arguments {
		float "distance",
	}
	alias "0x42156508606DE65E"
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Sets the near clipping plane of the third person aim camera.
</summary>
	]]

native "0x4008EDF7D6E48175"
	hash "0x4008EDF7D6E48175"
	jhash (0xD1EEBC45)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "_GET_GAMEPLAY_CAM_COORDS"
	hash "0xA200EB1EE790F448"
	jhash (0x9C84BDA0)
	ns "CAM"
	returns	"Vector3"

native "_GET_GAMEPLAY_CAM_ROT_2"
	hash "0x5B4E4C817FCC2DFB"
	jhash (0x1FFBEFC5)
	arguments {
		int "rotationOrder",
	}
	ns "CAM"
	returns	"Vector3"
	doc [[!
<summary>
		p0 seems to consistently be 2 across scripts

		Function is called faily often by CAM::CREATE_CAM_WITH_PARAMS
</summary>
	]]

native "0x26903D9CD1175F2C"
	hash "0x26903D9CD1175F2C"
	jhash (0xACADF916)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "CAM"
	returns	"int"

native "0x80EC114669DAEFF4"
	hash "0x80EC114669DAEFF4"
	jhash (0x721B763B)
	ns "CAM"
	returns	"float"
	doc [[!
<summary>
		gets some camera fov
</summary>
	]]

native "0x5F35F6732C3FBBA0"
	hash "0x5F35F6732C3FBBA0"
	jhash (0x23E3F106)
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"float"

native "0xD0082607100D7193"
	hash "0xD0082607100D7193"
	jhash (0x457AE195)
	ns "CAM"
	returns	"float"
	doc [[!
<summary>
		Maybe gets gameplay cam near clip?
</summary>
	]]

native "_GET_GAMEPLAY_CAM_FAR_CLIP"
	hash "0xDFC8CBC606FDB0FC"
	jhash (0x46CB3A49)
	alias "0xDFC8CBC606FDB0FC"
	ns "CAM"
	returns	"float"
	doc [[!
<summary>
		Gets the gameplay camera's far clipping plane.
</summary>
	]]

native "_GET_GAMEPLAY_CAM_NEAR_DOF"
	hash "0xA03502FC581F7D9B"
	jhash (0x19297A7A)
	alias "0xA03502FC581F7D9B"
	ns "CAM"
	returns	"float"
	doc [[!
<summary>
		Gets the gameplay camera's near depth of field distance.
</summary>
	]]

native "_GET_GAMEPLAY_CAM_FAR_DOF"
	hash "0x9780F32BCAF72431"
	jhash (0xF24777CA)
	alias "0x9780F32BCAF72431"
	ns "CAM"
	returns	"float"
	doc [[!
<summary>
		Gets the gameplay camera's far depth of field distance.
</summary>
	]]

native "0x162F9D995753DC19"
	hash "0x162F9D995753DC19"
	jhash (0x38992E83)
	ns "CAM"
	returns	"float"
	doc [[!
<summary>
		gets some camera far clip
</summary>
	]]

native "SET_GAMEPLAY_COORD_HINT"
	hash "0xD51ADCD2D8BC0FB3"
	jhash (0xF27483C9)
	arguments {
		float "x",

		float "y",

		float "z",

		int "duration",

		int "blendOutDuration",

		int "blendInDuration",

		int "unk",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Example C#:
		Function.Call(Hash.SET_GAMEPLAY_COORD_HINT, position.X, position.Y, position.Z, hintDuration, 1500, 1000, 0);

		The camera look-at is canceled if the user is already panning the camera around.
</summary>
	]]

native "SET_GAMEPLAY_PED_HINT"
	hash "0x2B486269ACD548D3"
	jhash (0x7C27343E)
	arguments {
		Ped "p0",

		float "x1",

		float "y1",

		float "z1",

		BOOL "p4",

		Any "p5",

		Any "p6",

		Any "p7",
	}
	ns "CAM"
	returns	"void"

native "SET_GAMEPLAY_VEHICLE_HINT"
	hash "0xA2297E18F3E71C2E"
	jhash (0x2C9A11D8)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		BOOL "p4",

		Any "p5",

		Any "p6",

		Any "p7",
	}
	ns "CAM"
	returns	"void"

native "SET_GAMEPLAY_OBJECT_HINT"
	hash "0x83E87508A2CA2AC6"
	jhash (0x2ED5E2F8)
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		BOOL "p4",

		Any "p5",

		Any "p6",

		Any "p7",
	}
	ns "CAM"
	returns	"void"

native "SET_GAMEPLAY_ENTITY_HINT"
	hash "0x189E955A8313E298"
	jhash (0x66C32306)
	arguments {
		Entity "entity",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		BOOL "p4",

		int "p5",

		int "p6",

		int "p7",

		Any "p8",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		p6 &amp; p7 - possibly length or time
</summary>
	]]

native "IS_GAMEPLAY_HINT_ACTIVE"
	hash "0xE520FF1AD2785B40"
	jhash (0xAD8DA205)
	ns "CAM"
	returns	"BOOL"

native "STOP_GAMEPLAY_HINT"
	hash "0xF46C581C61718916"
	jhash (0x1BC28B7B)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "0xCCD078C2665D2973"
	hash "0xCCD078C2665D2973"
	jhash (0xCAFEE798)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "0x247ACBC4ABBC9D1C"
	hash "0x247ACBC4ABBC9D1C"
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "0xBF72910D0F26F025"
	hash "0xBF72910D0F26F025"
	ns "CAM"
	returns	"Any"

native "SET_GAMEPLAY_HINT_FOV"
	hash "0x513403FB9C56211F"
	jhash (0x96FD173B)
	arguments {
		float "FOV",
	}
	ns "CAM"
	returns	"void"

native "0xF8BDBF3D573049A1"
	hash "0xF8BDBF3D573049A1"
	jhash (0x72E8CD3A)
	arguments {
		float "p0",
	}
	ns "CAM"
	returns	"void"

native "0xD1F8363DFAD03848"
	hash "0xD1F8363DFAD03848"
	jhash (0x79472AE3)
	arguments {
		float "p0",
	}
	ns "CAM"
	returns	"void"

native "0x5D7B620DAE436138"
	hash "0x5D7B620DAE436138"
	jhash (0xFC7464A0)
	arguments {
		float "p0",
	}
	ns "CAM"
	returns	"void"

native "0xC92717EF615B6704"
	hash "0xC92717EF615B6704"
	jhash (0x3554AA0E)
	arguments {
		float "p0",
	}
	ns "CAM"
	returns	"void"

native "GET_IS_MULTIPLAYER_BRIEF"
	hash "0xE3433EADAAF7EE40"
	jhash (0x2F0CE859)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Hash collision
</summary>
	]]

native "SET_CINEMATIC_BUTTON_ACTIVE"
	hash "0x51669F7D1FB53D9F"
	jhash (0x3FBC5D00)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "IS_CINEMATIC_CAM_RENDERING"
	hash "0xB15162CB5826E9E8"
	jhash (0x80471AD9)
	ns "CAM"
	returns	"BOOL"

native "SHAKE_CINEMATIC_CAM"
	hash "0xDCE214D9ED58F3CF"
	jhash (0x61815F31)
	arguments {
		charPtr "p0",

		float "p1",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		p0 argument found in the b617d scripts: "DRUNK_SHAKE" 
</summary>
	]]

native "IS_CINEMATIC_CAM_SHAKING"
	hash "0xBBC08F6B4CB8FF0A"
	jhash (0x8376D939)
	ns "CAM"
	returns	"BOOL"

native "SET_CINEMATIC_CAM_SHAKE_AMPLITUDE"
	hash "0xC724C701C30B2FE7"
	jhash (0x67510C4B)
	arguments {
		float "p0",
	}
	ns "CAM"
	returns	"void"

native "STOP_CINEMATIC_CAM_SHAKING"
	hash "0x2238E588E588A6D7"
	jhash (0x71C12904)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "_DISABLE_VEHICLE_FIRST_PERSON_CAM_THIS_FRAME"
	hash "0xADFF1B2A555F5FBA"
	jhash (0x5AC6DAC9)
	ns "CAM"
	returns	"void"

native "0x62ECFCFDEE7885D6"
	hash "0x62ECFCFDEE7885D6"
	jhash (0x837F8581)
	ns "CAM"
	returns	"void"

native "0x9E4CFFF989258472"
	hash "0x9E4CFFF989258472"
	jhash (0x65DDE8AF)
	ns "CAM"
	returns	"void"

native "0xF4F2C0D4EE209E20"
	hash "0xF4F2C0D4EE209E20"
	jhash (0xD75CDD75)
	ns "CAM"
	returns	"void"

native "0xCA9D2AA3E326D720"
	hash "0xCA9D2AA3E326D720"
	jhash (0x96A07066)
	ns "CAM"
	returns	"BOOL"

native "_IS_IN_VEHICLE_CAM_DISABLED"
	hash "0x4F32C0D5A90A9B40"
	alias "0x4F32C0D5A90A9B40"
	ns "CAM"
	returns	"BOOL"

native "CREATE_CINEMATIC_SHOT"
	hash "0x741B0129D4560F31"
	jhash (0xAC494E35)
	arguments {
		Any "p0",

		int "p1",

		Any "p2",

		Entity "entity",
	}
	ns "CAM"
	returns	"void"

native "IS_CINEMATIC_SHOT_ACTIVE"
	hash "0xCC9F3371A7C28BC9"
	jhash (0xA4049042)
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"BOOL"

native "STOP_CINEMATIC_SHOT"
	hash "0x7660C6E75D3A078E"
	jhash (0xD78358C5)
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"void"

native "0xA41BCD7213805AAC"
	hash "0xA41BCD7213805AAC"
	jhash (0xFBB85E02)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"

native "0xDC9DA9E8789F5246"
	hash "0xDC9DA9E8789F5246"
	jhash (0x4938C82F)
	ns "CAM"
	returns	"void"

native "SET_CINEMATIC_MODE_ACTIVE"
	hash "0xDCF0754AC3D6FD4E"
	jhash (0x2009E747)
	arguments {
		BOOL "p0",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		p0 = 0/1 or true/false

		It doesn't seems to work
</summary>
	]]

native "0x1F2300CB7FA7B7F6"
	hash "0x1F2300CB7FA7B7F6"
	jhash (0x6739AD55)
	ns "CAM"
	returns	"Any"

native "0x17FCA7199A530203"
	hash "0x17FCA7199A530203"
	ns "CAM"
	returns	"Any"

native "STOP_CUTSCENE_CAM_SHAKING"
	hash "0xDB629FFD9285FA06"
	jhash (0xF07D603D)
	ns "CAM"
	returns	"void"

native "0x12DED8CA53D47EA5"
	hash "0x12DED8CA53D47EA5"
	jhash (0x067BA6F5)
	arguments {
		float "p0",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		Hardcoded to only work in multiplayer.
</summary>
	]]

native "0x89215EC747DF244A"
	hash "0x89215EC747DF244A"
	jhash (0xFD99BE2B)
	arguments {
		float "p0",

		int "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		int "p7",

		int "p8",
	}
	ns "CAM"
	returns	"Entity"

native "0x5A43C76F7FC7BA5F"
	hash "0x5A43C76F7FC7BA5F"
	jhash (0xE206C450)
	ns "CAM"
	returns	"void"

native "_SET_CAM_EFFECT"
	hash "0x80C8B1846639BB19"
	jhash (0xB06CCD38)
	arguments {
		int "p0",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		if p0 is 0, effect is cancelled

		if p0 is 1, effect zooms in, gradually tilts cam clockwise apx 30 degrees, wobbles slowly. Motion blur is active until cancelled.

		if p0 is 2, effect immediately tilts cam clockwise apx 30 degrees, begins to wobble slowly, then gradually tilts cam back to normal. The wobbling will continue until the effect is cancelled.
</summary>
	]]

native "0x5C41E6BABC9E2112"
	hash "0x5C41E6BABC9E2112"
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"void"

native "0x21E253A7F8DA5DFB"
	hash "0x21E253A7F8DA5DFB"
	arguments {
		charPtr "vehicleName",
	}
	ns "CAM"
	returns	"void"
	doc [[!
<summary>
		From b617 scripts:

		CAM::_21E253A7F8DA5DFB("DINGHY");
		CAM::_21E253A7F8DA5DFB("ISSI2");
		CAM::_21E253A7F8DA5DFB("SPEEDO");
</summary>
	]]

native "0x11FA5D3479C7DD47"
	hash "0x11FA5D3479C7DD47"
	arguments {
		Any "p0",
	}
	ns "CAM"
	returns	"void"

native "0xEAF0FA793D05C592"
	hash "0xEAF0FA793D05C592"
	ns "CAM"
	returns	"Any"

native "0x8BFCEB5EA1B161B6"
	hash "0x8BFCEB5EA1B161B6"
	ns "CAM"
	returns	"Any"

native "ENABLE_LASER_SIGHT_RENDERING"
	hash "0xC8B46D7727D864AA"
	jhash (0xE3438955)
	arguments {
		BOOL "toggle",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		Enables laser sight on any weapon.

		It doesn't work. Neither on tick nor OnKeyDown
</summary>
	]]

native "GET_WEAPON_COMPONENT_TYPE_MODEL"
	hash "0x0DB57B41EC1DB083"
	jhash (0x324FA47A)
	arguments {
		Hash "componentHash",
	}
	ns "WEAPON"
	returns	"Hash"

native "GET_WEAPONTYPE_MODEL"
	hash "0xF46CDC33180FDA94"
	jhash (0x44E1C269)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"Hash"
	doc [[!
<summary>
		Returns the model of any weapon.

		Can also take an ammo hash?
		sub_6663a(&amp;l_115B, WEAPON::GET_WEAPONTYPE_MODEL(${ammo_rpg}));
</summary>
	]]

native "GET_WEAPONTYPE_SLOT"
	hash "0x4215460B9B8B7FA0"
	jhash (0x2E3759AF)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"Hash"

native "GET_WEAPONTYPE_GROUP"
	hash "0xC3287EE3050FB74C"
	jhash (0x5F2DE833)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"Hash"

native "SET_CURRENT_PED_WEAPON"
	hash "0xADF692B254977C0C"
	jhash (0xB8278882)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		BOOL "equipNow",
	}
	ns "WEAPON"
	returns	"void"

native "GET_CURRENT_PED_WEAPON"
	hash "0x3A87E44BB9A01D54"
	jhash (0xB0237302)
	arguments {
		Ped "ped",

		HashPtr "weaponHash",

		BOOL "p2",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		The return value seems to indicate returns true if the hash of the weapon object weapon equals the weapon hash.
		p2 seems to be 1 most of the time.





		p2 is not implemented

		disassembly said that?

		------

		yes on disassembly p2 it seems not implemented i just have:

		bool __fastcall sub_7FF6C56CE684(__int64 a1, _DWORD *a2)

		Found At: 7ff6c56ce684

</summary>
	]]

native "GET_CURRENT_PED_WEAPON_ENTITY_INDEX"
	hash "0x3B390A939AF0B5FC"
	jhash (0x5D73CD20)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"Entity"

native "GET_BEST_PED_WEAPON"
	hash "0x8483E98E8B888AE2"
	jhash (0xB998D444)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "WEAPON"
	returns	"Hash"
	doc [[!
<summary>
		p1 is always 0 in the scripts.
</summary>
	]]

native "SET_CURRENT_PED_VEHICLE_WEAPON"
	hash "0x75C55983C2C39DAA"
	jhash (0x8E6F2AF1)
	arguments {
		Ped "ped",

		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"BOOL"

native "GET_CURRENT_PED_VEHICLE_WEAPON"
	hash "0x1017582BCD3832DC"
	jhash (0xF26C5D65)
	arguments {
		Ped "ped",

		HashPtr "weaponHash",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		Example in VB

		    Public Shared Function GetVehicleCurrentWeapon(Ped As Ped) As Integer
		        Dim arg As New OutputArgument()
		        Native.Function.Call(Hash.GET_CURRENT_PED_VEHICLE_WEAPON, Ped, arg)
		        Return arg.GetResult(Of Integer)()
		    End Function

		Usage:
		If GetVehicleCurrentWeapon(Game.Player.Character) = -821520672 Then ...Do something
		Note: -821520672 = VEHICLE_WEAPON_PLANE_ROCKET
</summary>
	]]

native "IS_PED_ARMED"
	hash "0x475768A975D5AD17"
	jhash (0x0BFC892C)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		p1 is anywhere from 4 to 7 in the scripts. Might be a weapon wheel group?

		^It's kinda like that. 
		7 returns true if you are equipped with any weapon except your fists.
		6 returns true if you are equipped with any weapon except melee weapons.
		5 returns true if you are equipped with any weapon except the Explosives weapon group.
		4 returns true if you are equipped with any weapon except Explosives weapon group AND melee weapons.
		3 returns true if you are equipped with either Explosives or Melee weapons (the exact opposite of 4).
		2 returns true only if you are equipped with any weapon from the Explosives weapon group.
		1 returns true only if you are equipped with any Melee weapon.
		0 never returns true.

		Note: When I say "Explosives weapon group", it does not include the Jerry can and Fire Extinguisher.
</summary>
	]]

native "IS_WEAPON_VALID"
	hash "0x937C71165CF334B3"
	jhash (0x38CA2954)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"BOOL"

native "HAS_PED_GOT_WEAPON"
	hash "0x8DECB02F88F428BC"
	jhash (0x43D2FA82)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		BOOL "p2",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		p2 should be FALSE, otherwise it seems to always return FALSE

		Bool does not check if the weapon is current equipped, unfortunately.
</summary>
	]]

native "IS_PED_WEAPON_READY_TO_SHOOT"
	hash "0xB80CA294F2F26749"
	jhash (0x02A32CB0)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		Probably checks whether the ped has finished reloading or not and if the current weapon is not being switched to another.
</summary>
	]]

native "GET_PED_WEAPONTYPE_IN_SLOT"
	hash "0xEFFED78E9011134D"
	jhash (0x9BC64E16)
	arguments {
		Ped "ped",

		Hash "weaponSlot",
	}
	ns "WEAPON"
	returns	"Hash"

native "GET_AMMO_IN_PED_WEAPON"
	hash "0x015A522136D7F951"
	jhash (0x0C755733)
	arguments {
		Ped "ped",

		Hash "weaponhash",
	}
	ns "WEAPON"
	returns	"int"
	doc [[!
<summary>
		WEAPON::GET_AMMO_IN_PED_WEAPON(PLAYER::PLAYER_PED_ID(), a_0)

		From decompiled scripts
		Returns total ammo in weapon

		GTALua Example :
		natives.WEAPON.GET_AMMO_IN_PED_WEAPON(plyPed, WeaponHash)
</summary>
	]]

native "ADD_AMMO_TO_PED"
	hash "0x78F0424C34306220"
	jhash (0x7F0580C7)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		int "ammo",
	}
	ns "WEAPON"
	returns	"void"

native "SET_PED_AMMO"
	hash "0x14E56BC5B5DB6A19"
	jhash (0xBF90DF1A)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		int "ammo",
	}
	ns "WEAPON"
	returns	"void"

native "SET_PED_INFINITE_AMMO"
	hash "0x3EDCB0505123623B"
	jhash (0x9CB8D278)
	arguments {
		Ped "ped",

		BOOL "toggle",

		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"void"

native "SET_PED_INFINITE_AMMO_CLIP"
	hash "0x183DADC6AA953186"
	jhash (0x5A5E3B67)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "WEAPON"
	returns	"void"

native "GIVE_WEAPON_TO_PED"
	hash "0xBF0FD6E56C964FCB"
	jhash (0xC4D88A85)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		int "ammoCount",

		BOOL "isHidden",

		BOOL "equipNow",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		isHidden - ????

		All weapon names (add to the list if something is missing), use GAMEPLAY::GET_HASH_KEY((char *)weaponNames[i]) to get get the hash:

		static LPCSTR weaponNames[] = {
			"WEAPON_KNIFE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB",
			"WEAPON_CROWBAR", "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50",
			"WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTSMG", "WEAPON_ASSAULTRIFLE",
			"WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_PUMPSHOTGUN",
			"WEAPON_SAWNOFFSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_STUNGUN", "WEAPON_SNIPERRIFLE",
			"WEAPON_HEAVYSNIPER", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_MINIGUN",
			"WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV",
			"WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_FLARE", "WEAPON_SNSPISTOL", "WEAPON_SPECIALCARBINE",
			"WEAPON_HEAVYPISTOL", "WEAPON_BULLPUPRIFLE", "WEAPON_HOMINGLAUNCHER", "WEAPON_PROXMINE", "WEAPON_SNOWBALL",
			"WEAPON_VINTAGEPISTOL", "WEAPON_DAGGER", "WEAPON_FIREWORK", "WEAPON_MUSKET", "WEAPON_MARKSMANRIFLE",
			"WEAPON_HEAVYSHOTGUN", "WEAPON_GUSENBERG", "WEAPON_HATCHET", "WEAPON_RAILGUN", "WEAPON_COMBATPDW",
			"WEAPON_KNUCKLE", "WEAPON_MARKSMANPISTOL", "WEAPON_FLASHLIGHT", "WEAPON_MACHETE", "WEAPON_MACHINEPISTOL",
			"WEAPON_SWITCHBLADE", "WEAPON_REVOLVER", "WEAPON_COMPACTRIFLE", "WEAPON_DBSHOTGUN", "WEAPON_FLAREGUN",
			"WEAPON_AUTOSHOTGUN", "WEAPON_BATTLEAXE", "WEAPON_COMPACTLAUNCHER", "WEAPON_MINISMG", "WEAPON_PIPEBOMB",
			"WEAPON_POOLCUE", "WEAPON_SWEEPER", "WEAPON_WRENCH"
		};
		----------------------------------------------------------------------------------------------------------------------------------------
		Translation table:
		pastebin.com/a39K8Nz8
</summary>
	]]

native "GIVE_DELAYED_WEAPON_TO_PED"
	hash "0xB282DC6EBD803C75"
	jhash (0x5868D20D)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		int "ammoCount",

		BOOL "equipNow",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		Gives a weapon to PED with a delay, example:

		WEAPON::GIVE_DELAYED_WEAPON_TO_PED(PED::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("WEAPON_PISTOL"), 1000, false)
		----------------------------------------------------------------------------------------------------------------------------------------
		Translation table:
		pastebin.com/a39K8Nz8

</summary>
	]]

native "REMOVE_ALL_PED_WEAPONS"
	hash "0xF25DF915FA38C5F3"
	jhash (0xA44CE817)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		setting the last params to false it does that same so I would suggest its not a toggle
</summary>
	]]

native "REMOVE_WEAPON_FROM_PED"
	hash "0x4899CB088EDF59B8"
	jhash (0x9C37F220)
	arguments {
		Ped "ped",

		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		This native removes a specified weapon from your selected ped.
		Weapon Hashes: pastebin.com/0wwDZgkF

		Example:
		C#:
		Function.Call(Hash.REMOVE_WEAPON_FROM_PED, Game.Player.Character, 0x99B507EA);

		C++:
		WEAPON::REMOVE_WEAPON_FROM_PED(PLAYER::PLAYER_PED_ID(), 0x99B507EA);

		The code above removes the knife from the player.
</summary>
	]]

native "HIDE_PED_WEAPON_FOR_SCRIPTED_CUTSCENE"
	hash "0x6F6981D2253C208F"
	jhash (0x00CFD6E9)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		Hides the players weapon during a cutscene.
</summary>
	]]

native "SET_PED_CURRENT_WEAPON_VISIBLE"
	hash "0x0725A4CCFDED9A70"
	jhash (0x00BECD77)
	arguments {
		Ped "ped",

		BOOL "visible",

		BOOL "deselectWeapon",

		BOOL "p3",

		BOOL "p4",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		Has 5 parameters since latest patches.
</summary>
	]]

native "SET_PED_DROPS_WEAPONS_WHEN_DEAD"
	hash "0x476AE72C1D19D1A8"
	jhash (0x8A444056)
	arguments {
		Ped "ped",

		BOOL "toggle",
	}
	ns "WEAPON"
	returns	"void"

native "HAS_PED_BEEN_DAMAGED_BY_WEAPON"
	hash "0x2D343D2219CD027A"
	jhash (0xCDFBBCC6)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		int "weaponType",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		It determines what weapons caused damage:

		If you want to define only a specific weapon, second parameter=weapon hash code, third parameter=0
		If you want to define any melee weapon, second parameter=0, third parameter=1.
		If you want to identify any weapon (firearms, melee, rockets, etc.), second parameter=0, third parameter=2.
</summary>
	]]

native "CLEAR_PED_LAST_WEAPON_DAMAGE"
	hash "0x0E98F88A24C5F4B8"
	jhash (0x52C68832)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"void"

native "HAS_ENTITY_BEEN_DAMAGED_BY_WEAPON"
	hash "0x131D401334815E94"
	jhash (0x6DAABB39)
	arguments {
		Entity "entity",

		Hash "weaponHash",

		int "weaponType",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		It determines what weapons caused damage:

		If youu want to define only a specific weapon, second parameter=weapon hash code, third parameter=0
		If you want to define any melee weapon, second parameter=0, third parameter=1.
		If you want to identify any weapon (firearms, melee, rockets, etc.), second parameter=0, third parameter=2.
</summary>
	]]

native "CLEAR_ENTITY_LAST_WEAPON_DAMAGE"
	hash "0xAC678E40BE7C74D2"
	jhash (0xCEC2732B)
	arguments {
		Entity "entity",
	}
	ns "WEAPON"
	returns	"void"

native "SET_PED_DROPS_WEAPON"
	hash "0x6B7513D9966FBEC0"
	jhash (0x3D3329FA)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"void"

native "SET_PED_DROPS_INVENTORY_WEAPON"
	hash "0x208A1888007FC0E6"
	jhash (0x81FFB874)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		int "ammoCount",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		[16/06/2017 by ins1de] :
		Drops the weapon object from selected peds and turns it into a pickup.
		Offset defines the next position of the weapon, ammo count is the stored ammo in the pickup (if ammoCount == 0, pickup won't be created)

		Default offset values (freemode.c):

		if (is_ped_walking(player_ped_id()))
		        {
		            vVar1 = {0.6f, 4.7f, -0.1f};
		        }
		        else if (is_ped_sprinting(player_ped_id()))
		        {
		            vVar1 = {0.6f, 5.7f, -0.1f};
		        }
		        else if (is_ped_running(player_ped_id()))
		        {
		            vVar1 = {0.6f, 4.7f, -0.1f};
		        }
		        else
		        {
		            vVar1 = {0.4f, 4.7f, -0.1f};
		        }
</summary>
	]]

native "GET_MAX_AMMO_IN_CLIP"
	hash "0xA38DCFFCEA8962FA"
	jhash (0x6961E2A4)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		BOOL "p2",
	}
	ns "WEAPON"
	returns	"int"
	doc [[!
<summary>
		p2 is mostly 1 in the scripts.
</summary>
	]]

native "GET_AMMO_IN_CLIP"
	hash "0x2E1202248937775C"
	jhash (0x73C100C3)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		intPtr "ammo",
	}
	ns "WEAPON"
	returns	"BOOL"

native "SET_AMMO_IN_CLIP"
	hash "0xDCD2A934D65CB497"
	jhash (0xA54B0B10)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		int "ammo",
	}
	ns "WEAPON"
	returns	"BOOL"

native "GET_MAX_AMMO"
	hash "0xDC16122C7A20C933"
	jhash (0x0B294796)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		intPtr "ammo",
	}
	ns "WEAPON"
	returns	"BOOL"

native "SET_PED_AMMO_BY_TYPE"
	hash "0x5FD1E1F011E76D7E"
	jhash (0x311C52BB)
	arguments {
		Ped "ped",

		Any "ammoType",

		int "ammo",
	}
	ns "WEAPON"
	returns	"void"

native "GET_PED_AMMO_BY_TYPE"
	hash "0x39D22031557946C1"
	jhash (0x54077C4D)
	arguments {
		Ped "ped",

		Any "ammoType",
	}
	ns "WEAPON"
	returns	"int"

native "SET_PED_AMMO_TO_DROP"
	hash "0xA4EFEF9440A5B0EF"
	jhash (0x2386A307)
	arguments {
		Any "ammoType",

		int "ammo",
	}
	ns "WEAPON"
	returns	"void"

native "0xE620FD3512A04F18"
	hash "0xE620FD3512A04F18"
	jhash (0xD6460EA2)
	arguments {
		float "p0",
	}
	ns "WEAPON"
	returns	"void"

native "GET_PED_AMMO_TYPE_FROM_WEAPON"
	hash "0x7FEAD38B326B9F74"
	jhash (0x09337863)
	arguments {
		Ped "ped",

		Hash "weaponHash",
	}
	alias "_GET_PED_AMMO_TYPE"
	ns "WEAPON"
	returns	"Hash"
	doc [[!
<summary>
		Returns an ammo type hash, which is defined in AmmoInfo.
</summary>
	]]

native "GET_PED_LAST_WEAPON_IMPACT_COORD"
	hash "0x6C4D0409BA1A2BC2"
	jhash (0x9B266079)
	arguments {
		Ped "ped",

		Vector3Ptr "coords",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		Pass ped. Pass address of Vector3.
		The coord will be put into the Vector3.
		The return will determine whether there was a coord found or not.
</summary>
	]]

native "SET_PED_GADGET"
	hash "0xD0D7B1E680ED4A1A"
	jhash (0x8A256D0A)
	arguments {
		Ped "ped",

		Hash "gadgetHash",

		BOOL "p2",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		p1/gadgetHash was always 0xFBAB5776 ("GADGET_PARACHUTE").
		p2 is always true.
</summary>
	]]

native "GET_IS_PED_GADGET_EQUIPPED"
	hash "0xF731332072F5156C"
	jhash (0x8DDD0B5B)
	arguments {
		Ped "ped",

		Hash "gadgetHash",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		gadgetHash - was always 0xFBAB5776 ("GADGET_PARACHUTE").
</summary>
	]]

native "GET_SELECTED_PED_WEAPON"
	hash "0x0A6DB4965674D243"
	jhash (0xD240123E)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"Hash"
	doc [[!
<summary>
		Returns the hash of the weapon. 

		            var num7 = WEAPON::GET_SELECTED_PED_WEAPON(num4);
		            sub_27D3(num7);
		            switch (num7)
		            {
		                case 0x24B17070:

		Also see WEAPON::GET_CURRENT_PED_WEAPON. Difference?

		-------------------------------------------------------------------------

		The difference is that GET_SELECTED_PED_WEAPON simply returns the ped's current weapon hash but GET_CURRENT_PED_WEAPON also checks the weapon object and returns true if the hash of the weapon object equals the weapon hash
</summary>
	]]

native "EXPLODE_PROJECTILES"
	hash "0xFC4BD125DE7611E4"
	jhash (0x35A0B955)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		BOOL "p2",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
						WEAPON::EXPLODE_PROJECTILES(PLAYER::PLAYER_PED_ID(), func_221(0x00000003), 0x00000001);
</summary>
	]]

native "REMOVE_ALL_PROJECTILES_OF_TYPE"
	hash "0xFC52E0F37E446528"
	jhash (0xA5F89919)
	arguments {
		Hash "weaponHash",

		BOOL "p1",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		p1 seems always to be 0
</summary>
	]]

native "_GET_LOCKON_RANGE_OF_CURRENT_PED_WEAPON"
	hash "0x840F03E9041E2C9C"
	jhash (0x3612110D)
	arguments {
		Ped "ped",
	}
	alias "0x840F03E9041E2C9C"
	ns "WEAPON"
	returns	"float"

native "GET_MAX_RANGE_OF_CURRENT_PED_WEAPON"
	hash "0x814C9D19DFD69679"
	jhash (0xB2B2BBAA)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"float"

native "HAS_VEHICLE_GOT_PROJECTILE_ATTACHED"
	hash "0x717C8481234E3B88"
	jhash (0xA57E2E80)
	arguments {
		Ped "driver",

		Vehicle "vehicle",

		Hash "weaponHash",

		Any "p3",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		Third Parameter = unsure, but pretty sure it is weapon hash
		--&gt; get_hash_key("weapon_stickybomb")

		Fourth Parameter = unsure, almost always -1
</summary>
	]]

native "GIVE_WEAPON_COMPONENT_TO_PED"
	hash "0xD966D51AA5B28BB9"
	jhash (0x3E1E286D)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		Hash "componentHash",
	}
	ns "WEAPON"
	returns	"void"

native "REMOVE_WEAPON_COMPONENT_FROM_PED"
	hash "0x1E8BE90C74FB4C09"
	jhash (0x412AA00D)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		Hash "componentHash",
	}
	ns "WEAPON"
	returns	"void"

native "HAS_PED_GOT_WEAPON_COMPONENT"
	hash "0xC593212475FAE340"
	jhash (0xDC0FC145)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		Hash "componentHash",
	}
	ns "WEAPON"
	returns	"BOOL"

native "IS_PED_WEAPON_COMPONENT_ACTIVE"
	hash "0x0D78DE0572D3969E"
	jhash (0x7565FB19)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		Hash "componentHash",
	}
	ns "WEAPON"
	returns	"BOOL"

native "_PED_SKIP_NEXT_RELOADING"
	hash "0x8C0D57EA686FAD87"
	jhash (0x82EEAF0F)
	arguments {
		Ped "ped",
	}
	alias "_IS_PED_RELOADING"
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		[23.03.2017 19:08] by ins1de :

		"_IS_PED_RELOADING" is totally a wrong name...

		This native actually disables the reloading animation and script for the specified ped. Native renamed.
</summary>
	]]

native "MAKE_PED_RELOAD"
	hash "0x20AE33F3AC9C0033"
	jhash (0x515292C2)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"BOOL"

native "REQUEST_WEAPON_ASSET"
	hash "0x5443438F033E29C3"
	jhash (0x65D139A5)
	arguments {
		Hash "weaponHash",

		int "p1",

		int "p2",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		Nearly every instance of p1 I found was 31. Nearly every instance of p2 I found was 0.

		REQUEST_WEAPON_ASSET(iLocal_1888, 31, 26);
</summary>
	]]

native "HAS_WEAPON_ASSET_LOADED"
	hash "0x36E353271F0E90EE"
	jhash (0x1891D5BB)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"BOOL"

native "REMOVE_WEAPON_ASSET"
	hash "0xAA08EF13F341C8FC"
	jhash (0x2C0DFE3C)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"void"

native "CREATE_WEAPON_OBJECT"
	hash "0x9541D3CF0D398F36"
	jhash (0x62F5987F)
	arguments {
		Hash "weaponHash",

		int "ammoCount",

		float "x",

		float "y",

		float "z",

		BOOL "showWorldModel",

		float "heading",

		Any "p7",
	}
	ns "WEAPON"
	returns	"Object"
	doc [[!
<summary>
		Now has 8 params.
</summary>
	]]

native "GIVE_WEAPON_COMPONENT_TO_WEAPON_OBJECT"
	hash "0x33E179436C0B31DB"
	jhash (0xF7612A37)
	arguments {
		Object "weaponObject",

		Hash "addonHash",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		addonHash:
		(use WEAPON::GET_WEAPON_COMPONENT_TYPE_MODEL() to get hash value)
		^ Wrong.
		AddonHash is NOT a model hash, it's the weapon component hash.

		${component_at_ar_flsh}, ${component_at_ar_supp}, ${component_at_pi_flsh}, ${component_at_scope_large}, ${component_at_ar_supp_02}
</summary>
	]]

native "REMOVE_WEAPON_COMPONENT_FROM_WEAPON_OBJECT"
	hash "0xF7D82B0D66777611"
	jhash (0xA6E7ED3C)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "WEAPON"
	returns	"void"

native "HAS_WEAPON_GOT_WEAPON_COMPONENT"
	hash "0x76A18844E743BF91"
	jhash (0x1D368510)
	arguments {
		Object "weapon",

		Hash "addonHash",
	}
	ns "WEAPON"
	returns	"BOOL"

native "GIVE_WEAPON_OBJECT_TO_PED"
	hash "0xB1FA61371AF7C4B7"
	jhash (0x639AF3EF)
	arguments {
		Object "weaponObject",

		Ped "ped",
	}
	ns "WEAPON"
	returns	"void"

native "DOES_WEAPON_TAKE_WEAPON_COMPONENT"
	hash "0x5CEE3DF569CECAB0"
	jhash (0xB1817BAA)
	arguments {
		Hash "weaponHash",

		Hash "componentHash",
	}
	ns "WEAPON"
	returns	"BOOL"

native "GET_WEAPON_OBJECT_FROM_PED"
	hash "0xCAE1DC9A0E22A16D"
	jhash (0xDF939A38)
	arguments {
		Ped "ped",

		BOOL "p1",
	}
	ns "WEAPON"
	returns	"Object"
	doc [[!
<summary>
		Drops the current weapon and returns the object

		Unknown behavior when unarmed.
</summary>
	]]

native "SET_PED_WEAPON_TINT_INDEX"
	hash "0x50969B9B89ED5738"
	jhash (0xEB2A7B23)
	arguments {
		Ped "ped",

		Hash "weaponHash",

		int "tintIndex",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		tintIndex can be the following:


		1 
		2 
		3 
		4 
		5 
		6 
		7 
</summary>
	]]

native "GET_PED_WEAPON_TINT_INDEX"
	hash "0x2B9EEDC07BD06B9F"
	jhash (0x3F9C90A7)
	arguments {
		Ped "ped",

		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"int"

native "SET_WEAPON_OBJECT_TINT_INDEX"
	hash "0xF827589017D4E4A9"
	jhash (0x44ACC1DA)
	arguments {
		Object "weapon",

		int "tintIndex",
	}
	ns "WEAPON"
	returns	"void"

native "GET_WEAPON_OBJECT_TINT_INDEX"
	hash "0xCD183314F7CD2E57"
	jhash (0xD91D9576)
	arguments {
		Object "weapon",
	}
	ns "WEAPON"
	returns	"int"

native "GET_WEAPON_TINT_COUNT"
	hash "0x5DCF6C5CAB2E9BF7"
	jhash (0x99E4EAAB)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"int"

native "GET_WEAPON_HUD_STATS"
	hash "0xD92C739EE34C9EBA"
	jhash (0xA9AD3D98)
	arguments {
		Hash "weaponHash",

		AnyPtr "outData",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		// members should be aligned to 8 bytes by default but it's best to use alignas here, just to be sure
		struct WeaponHudStatsData
		{
			alignas(8) uint8_t hudDamage; // 0x0000
			alignas(8) uint8_t hudSpeed; // 0x0008
			alignas(8) uint8_t hudCapacity; // 0x0010
			alignas(8) uint8_t hudAccuracy; // 0x0018
			alignas(8) uint8_t hudRange; // 0x0020
		};

		Usage:

		WeaponHudStatsData data;
		if (GET_WEAPON_HUD_STATS(weaponHash, (Any*)&amp;data))
		{
		    // uint8_t damagePercentage = data.hudDamage etc...
		}
</summary>
	]]

native "GET_WEAPON_COMPONENT_HUD_STATS"
	hash "0xB3CAF387AE12E9F8"
	jhash (0xBB5498F4)
	arguments {
		Hash "componentHash",

		intPtr "outData",
	}
	ns "WEAPON"
	returns	"BOOL"

native "0x3133B907D8B32053"
	hash "0x3133B907D8B32053"
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "WEAPON"
	returns	"float"

native "GET_WEAPON_CLIP_SIZE"
	hash "0x583BE370B1EC6EB4"
	jhash (0x8D515E66)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"int"
	doc [[!
<summary>
		// Returns the size of the default weapon component clip.

		Use it like this:

		char cClipSize[32];
		Hash cur;
		if (WEAPON::GET_CURRENT_PED_WEAPON(playerPed, &amp;cur, 1))
		{
		    if (WEAPON::IS_WEAPON_VALID(cur))
		    {
		        int iClipSize = WEAPON::GET_WEAPON_CLIP_SIZE(cur);
		        sprintf_s(cClipSize, "ClipSize: %.d", iClipSize);
		        vDrawString(cClipSize, 0.5f, 0.5f);
		    }
		}

</summary>
	]]

native "SET_PED_CHANCE_OF_FIRING_BLANKS"
	hash "0x8378627201D5497D"
	jhash (0xB4F44C6E)
	arguments {
		Ped "ped",

		float "xBias",

		float "yBias",
	}
	ns "WEAPON"
	returns	"void"

native "0xB4C8D77C80C0421E"
	hash "0xB4C8D77C80C0421E"
	jhash (0xEC2E5304)
	arguments {
		Ped "ped",

		float "p1",
	}
	ns "WEAPON"
	returns	"Entity"
	doc [[!
<summary>
		Only used once in the scripts
		weapon::_0xB4C8D77C80C0421E(Local_888[3 /*33*/], -1082130432);

		The code following this relates to manually triggering an RPG rocket (creating the object, the particle fx and sound)
</summary>
	]]

native "REQUEST_WEAPON_HIGH_DETAIL_MODEL"
	hash "0x48164DBB970AC3F0"
	jhash (0xE3BD00F9)
	arguments {
		Entity "weaponObject",
	}
	ns "WEAPON"
	returns	"void"

native "IS_PED_CURRENT_WEAPON_SILENCED"
	hash "0x65F0C5AE05943EC7"
	jhash (0xBAF7BFBE)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		This native returns a true or false value.

		Ped ped = The ped whose weapon you want to check.
</summary>
	]]

native "SET_WEAPON_SMOKEGRENADE_ASSIGNED"
	hash "0x4B7620C47217126C"
	jhash (0x76876154)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		Hash collision, real name is: IS_FLASH_LIGHT_ON
</summary>
	]]

native "SET_FLASH_LIGHT_FADE_DISTANCE"
	hash "0xCEA66DAD478CD39B"
	jhash (0xB0127EA7)
	arguments {
		float "distance",
	}
	ns "WEAPON"
	returns	"Any"

native "SET_WEAPON_ANIMATION_OVERRIDE"
	hash "0x1055AC3A667F09D9"
	jhash (0xA5DF7484)
	arguments {
		Ped "ped",

		Hash "animStyle",
	}
	ns "WEAPON"
	returns	"void"
	doc [[!
<summary>
		Changes the selected ped aiming animation style. 
		Note : You must use GET_HASH_KEY!

		Strings to use with GET_HASH_KEY :

			"Ballistic",
			"Default",
			"Fat",
			"Female",
			"FirstPerson",
			"FirstPersonAiming",
			"FirstPersonFranklin",
			"FirstPersonFranklinAiming",
			"FirstPersonFranklinRNG",
			"FirstPersonFranklinScope",
			"FirstPersonMPFemale",
			"FirstPersonMichael",
			"FirstPersonMichaelAiming",
			"FirstPersonMichaelRNG",
			"FirstPersonMichaelScope",
			"FirstPersonRNG",
			"FirstPersonScope",
			"FirstPersonTrevor",
			"FirstPersonTrevorAiming",
			"FirstPersonTrevorRNG",
			"FirstPersonTrevorScope",
			"Franklin",
			"Gang",
			"Gang1H",
			"GangFemale",
			"Hillbilly",
			"MP_F_Freemode",
			"Michael",
			"SuperFat",
			"Trevor"
</summary>
	]]

native "GET_WEAPON_DAMAGE_TYPE"
	hash "0x3BE0BB12D25FB305"
	jhash (0x013AFC13)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"int"
	doc [[!
<summary>
		0=unknown (or incorrect weaponHash)
		1= no damage (flare,snowball, petrolcan)
		2=melee
		3=bullet
		4=force ragdoll fall
		5=explosive (RPG, Railgun, grenade)
		6=fire(molotov)
		8=fall(WEAPON_HELI_CRASH)
		10=electric
		11=barbed wire
		12=extinguisher
		13=gas
		14=water cannon(WEAPON_HIT_BY_WATER_CANNON)
</summary>
	]]

native "0xE4DCEC7FD5B739A5"
	hash "0xE4DCEC7FD5B739A5"
	jhash (0x64646F1D)
	arguments {
		Ped "ped",
	}
	ns "WEAPON"
	returns	"void"

native "CAN_USE_WEAPON_ON_PARACHUTE"
	hash "0xBC7BE5ABC0879F74"
	jhash (0x135E7AD4)
	arguments {
		Hash "weaponHash",
	}
	ns "WEAPON"
	returns	"BOOL"
	doc [[!
<summary>
		this returns if you can use the weapon while using a parachute
</summary>
	]]

native "CREATE_ITEMSET"
	hash "0x35AD299F50D91B24"
	jhash (0x0A113B2C)
	arguments {
		Vehicle "distri",
	}
	ns "ITEMSET"
	returns	"Vehicle"

native "DESTROY_ITEMSET"
	hash "0xDE18220B1C183EDA"
	jhash (0x83CE1A4C)
	arguments {
		Any "p0",
	}
	ns "ITEMSET"
	returns	"void"

native "IS_ITEMSET_VALID"
	hash "0xB1B1EA596344DFAB"
	jhash (0xD201FC29)
	arguments {
		Any "p0",
	}
	ns "ITEMSET"
	returns	"BOOL"

native "ADD_TO_ITEMSET"
	hash "0xE3945201F14637DD"
	jhash (0x6B0FE61B)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "ITEMSET"
	returns	"BOOL"

native "REMOVE_FROM_ITEMSET"
	hash "0x25E68244B0177686"
	jhash (0xA9565228)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "ITEMSET"
	returns	"void"

native "GET_ITEMSET_SIZE"
	hash "0xD9127E83ABF7C631"
	jhash (0x2B31F41A)
	arguments {
		ScrHandle "x",
	}
	ns "ITEMSET"
	returns	"Any"

native "GET_INDEXED_ITEM_IN_ITEMSET"
	hash "0x7A197E2521EE2BAB"
	jhash (0x3F712874)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "ITEMSET"
	returns	"Any"

native "IS_IN_ITEMSET"
	hash "0x2D0FC594D1E9C107"
	jhash (0x0D4B9730)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "ITEMSET"
	returns	"BOOL"

native "CLEAN_ITEMSET"
	hash "0x41BC0D722FC04221"
	jhash (0x919A4858)
	arguments {
		Any "p0",
	}
	ns "ITEMSET"
	returns	"void"

native "LOAD_ALL_OBJECTS_NOW"
	hash "0xBD6E84632DD4CB3F"
	jhash (0xC9DBDA90)
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		1
</summary>
	]]

native "LOAD_SCENE"
	hash "0x4448EB75B4904BDB"
	jhash (0xB72403F5)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "STREAMING"
	returns	"void"

native "NETWORK_UPDATE_LOAD_SCENE"
	hash "0xC4582015556D1C46"
	jhash (0xC76E023C)
	ns "STREAMING"
	returns	"Vector3Ptr"

native "NETWORK_STOP_LOAD_SCENE"
	hash "0x64E630FAF5F60F44"
	jhash (0x24857907)
	ns "STREAMING"
	returns	"void"

native "IS_NETWORK_LOADING_SCENE"
	hash "0x41CA5A33160EA4AB"
	jhash (0x6DCFC021)
	ns "STREAMING"
	returns	"BOOL"

native "SET_INTERIOR_ACTIVE"
	hash "0xE37B76C387BE28ED"
	jhash (0xE1013910)
	arguments {
		int "interiorID",

		BOOL "toggle",
	}
	ns "STREAMING"
	returns	"void"

native "REQUEST_MODEL"
	hash "0x963D27A58DF860AC"
	jhash (0xFFF1B500)
	arguments {
		Hash "model",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Request a model to be loaded into memory

		Looking it the disassembly, it seems like it actually returns the model if it's already loaded.

</summary>
	]]

native "REQUEST_MENU_PED_MODEL"
	hash "0xA0261AEF7ACFC51E"
	jhash (0x48CEB6B4)
	arguments {
		Hash "model",
	}
	alias "0xA0261AEF7ACFC51E"
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		streaming::request_menu_ped_model(joaat("player_zero"));

		iVar0 = ped::create_ped(25, joaat("player_zero"), cam::_get_gameplay_cam_coords(), 0f, 0, false);

		entity::freeze_entity_position(iVar0, true);
		ped::_0x4668d80430d6c299(iVar0);
		ui::give_ped_to_pause_menu(iVar0, 1);
</summary>
	]]

native "HAS_MODEL_LOADED"
	hash "0x98A4EB5D89A0C952"
	jhash (0x62BFDB37)
	arguments {
		Hash "model",
	}
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if the specified model has loaded into memory.
</summary>
	]]

native "_REQUEST_INTERIOR_ROOM_BY_NAME"
	hash "0x8A7A40100EDFEC58"
	jhash (0x939243FB)
	arguments {
		int "interiorID",

		charPtr "roomName",
	}
	alias "0x8A7A40100EDFEC58"
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		REQUEST_*

		Something to do with interiors that have been loaded.

		STREAMING::_8A7A40100EDFEC58(l_13BC, "V_FIB01_cur_elev");
		STREAMING::_8A7A40100EDFEC58(l_13BC, "limbo");
		STREAMING::_8A7A40100EDFEC58(l_13BB, "V_Office_gnd_lifts");
		STREAMING::_8A7A40100EDFEC58(l_13BB, "limbo");
		STREAMING::_8A7A40100EDFEC58(l_13BC, "v_fib01_jan_elev");
		STREAMING::_8A7A40100EDFEC58(l_13BC, "limbo");
</summary>
	]]

native "SET_MODEL_AS_NO_LONGER_NEEDED"
	hash "0xE532F5D78798DAAB"
	jhash (0xAE0F069E)
	arguments {
		Hash "model",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Unloads model from memory
</summary>
	]]

native "IS_MODEL_IN_CDIMAGE"
	hash "0x35B9E0803292B641"
	jhash (0x1094782F)
	arguments {
		Hash "model",
	}
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		Check if model is in cdimage(rpf)
</summary>
	]]

native "IS_MODEL_VALID"
	hash "0xC0296A2EDF545E92"
	jhash (0xAF8F8E9D)
	arguments {
		Hash "model",
	}
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether the specified model exists in the game.
</summary>
	]]

native "IS_MODEL_A_VEHICLE"
	hash "0x19AAC8F07BFEC53E"
	jhash (0xFFFC85D4)
	arguments {
		Hash "model",
	}
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether the specified model represents a vehicle.
</summary>
	]]

native "REQUEST_COLLISION_AT_COORD"
	hash "0x07503F7948F491A7"
	jhash (0xCD9805E7)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "STREAMING"
	returns	"Any"

native "REQUEST_COLLISION_FOR_MODEL"
	hash "0x923CB32A3B874FCB"
	jhash (0x3930C042)
	arguments {
		Hash "model",
	}
	ns "STREAMING"
	returns	"void"

native "HAS_COLLISION_FOR_MODEL_LOADED"
	hash "0x22CCA434E368F03A"
	jhash (0x41A094F8)
	arguments {
		Hash "model",
	}
	ns "STREAMING"
	returns	"BOOL"

native "REQUEST_ADDITIONAL_COLLISION_AT_COORD"
	hash "0xC9156DC11411A9EA"
	jhash (0xC2CC1DF2)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		MulleDK19: Alias of REQUEST_COLLISION_AT_COORD.
</summary>
	]]

native "DOES_ANIM_DICT_EXIST"
	hash "0x2DA49C3B79856961"
	jhash (0xCD31C872)
	arguments {
		charPtr "animDict",
	}
	ns "STREAMING"
	returns	"BOOL"

native "REQUEST_ANIM_DICT"
	hash "0xD3BD40951412FEF6"
	jhash (0xDCA96950)
	arguments {
		charPtr "animDict",
	}
	ns "STREAMING"
	returns	"void"

native "HAS_ANIM_DICT_LOADED"
	hash "0xD031A9162D01088C"
	jhash (0x05E6763C)
	arguments {
		charPtr "animDict",
	}
	ns "STREAMING"
	returns	"BOOL"

native "REMOVE_ANIM_DICT"
	hash "0xF66A602F829E2A06"
	jhash (0x0AE050B5)
	arguments {
		charPtr "animDict",
	}
	ns "STREAMING"
	returns	"void"

native "REQUEST_ANIM_SET"
	hash "0x6EA47DAE7FAD0EED"
	jhash (0x2988B3FC)
	arguments {
		charPtr "animSet",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Starts loading the specified animation set. An animation set provides movement animations for a ped. See SET_PED_MOVEMENT_CLIPSET.
</summary>
	]]

native "HAS_ANIM_SET_LOADED"
	hash "0xC4EA073D86FB29B0"
	jhash (0x4FFF397D)
	arguments {
		charPtr "animSet",
	}
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		Gets whether the specified animation set has finished loading. An animation set provides movement animations for a ped. See SET_PED_MOVEMENT_CLIPSET.

		Animation set and clip set are synonymous.
</summary>
	]]

native "REMOVE_ANIM_SET"
	hash "0x16350528F93024B3"
	jhash (0xD04A817A)
	arguments {
		charPtr "animSet",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Unloads the specified animation set. An animation set provides movement animations for a ped. See SET_PED_MOVEMENT_CLIPSET.

		Animation set and clip set are synonymous.
</summary>
	]]

native "REQUEST_CLIP_SET"
	hash "0xD2A71E1A77418A49"
	jhash (0x546C627A)
	arguments {
		charPtr "clipSet",
	}
	ns "STREAMING"
	returns	"void"

native "HAS_CLIP_SET_LOADED"
	hash "0x318234F4F3738AF3"
	jhash (0x230D5455)
	arguments {
		charPtr "clipSet",
	}
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		Alias for HAS_ANIM_SET_LOADED.
</summary>
	]]

native "REMOVE_CLIP_SET"
	hash "0x01F73A131C18CD94"
	jhash (0x1E21F7AA)
	arguments {
		charPtr "clipSet",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Alias for REMOVE_ANIM_SET.
</summary>
	]]

native "REQUEST_IPL"
	hash "0x41B4893843BBDB74"
	jhash (0x3B70D1DB)
	arguments {
		charPtr "iplName",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		IPL list: pastebin.com/iNGLY32D
</summary>
	]]

native "REMOVE_IPL"
	hash "0xEE6C5AD3ECE0A82D"
	jhash (0xDF7CBD36)
	arguments {
		charPtr "iplName",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		IPL list: pastebin.com/iNGLY32D
</summary>
	]]

native "IS_IPL_ACTIVE"
	hash "0x88A741E44A2B3495"
	jhash (0xB2C33714)
	arguments {
		charPtr "iplName",
	}
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		List of all IPLs: pastebin.com/iNGLY32D
</summary>
	]]

native "SET_STREAMING"
	hash "0x6E0C692677008888"
	jhash (0x27EF6CB2)
	arguments {
		BOOL "toggle",
	}
	ns "STREAMING"
	returns	"void"

native "SET_GAME_PAUSES_FOR_STREAMING"
	hash "0x717CD6E6FAEBBEDC"
	jhash (0x9211A28A)
	arguments {
		BOOL "toggle",
	}
	ns "STREAMING"
	returns	"void"

native "SET_REDUCE_PED_MODEL_BUDGET"
	hash "0x77B5F9A36BF96710"
	jhash (0xAFCB2B86)
	arguments {
		BOOL "toggle",
	}
	ns "STREAMING"
	returns	"void"

native "SET_REDUCE_VEHICLE_MODEL_BUDGET"
	hash "0x80C527893080CCF3"
	jhash (0xCDB4FB7E)
	arguments {
		BOOL "toggle",
	}
	ns "STREAMING"
	returns	"void"

native "SET_DITCH_POLICE_MODELS"
	hash "0x42CBE54462D92634"
	jhash (0x3EA7FCE4)
	arguments {
		BOOL "toggle",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		This is a NOP function. It does nothing at all.
</summary>
	]]

native "GET_NUMBER_OF_STREAMING_REQUESTS"
	hash "0x4060057271CEBC89"
	jhash (0xC2EE9A02)
	ns "STREAMING"
	returns	"int"

native "REQUEST_PTFX_ASSET"
	hash "0x944955FB2A3935C8"
	jhash (0x2C649263)
	ns "STREAMING"
	returns	"Any"
	doc [[!
<summary>
		maps script name (thread + 0xD0) by lookup via scriptfx.dat - does nothing when script name is empty
</summary>
	]]

native "HAS_PTFX_ASSET_LOADED"
	hash "0xCA7D9B86ECA7481B"
	jhash (0x3EFF96BE)
	ns "STREAMING"
	returns	"BOOL"

native "REMOVE_PTFX_ASSET"
	hash "0x88C6814073DD4A73"
	jhash (0xC10F178C)
	ns "STREAMING"
	returns	"void"

native "REQUEST_NAMED_PTFX_ASSET"
	hash "0xB80D8756B4668AB6"
	jhash (0xCFEA19A9)
	arguments {
		charPtr "assetName",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		assetName = For example "core" 

		From the b678d decompiled scripts:

		 STREAMING::REQUEST_NAMED_PTFX_ASSET("core_snow");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("fm_mission_controler");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("proj_xmas_firework");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_apartment_mp");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_biolab_heist");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_indep_fireworks");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_indep_parachute");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_indep_wheelsmoke");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_mp_cig_plane");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_mp_creator");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_mp_tankbattle");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_ornate_heist");
		 STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_prison_break_heist_station");
</summary>
	]]

native "HAS_NAMED_PTFX_ASSET_LOADED"
	hash "0x8702416E512EC454"
	jhash (0x9ACC6446)
	arguments {
		charPtr "assetName",
	}
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		assetName = For example "core"
</summary>
	]]

native "_REMOVE_NAMED_PTFX_ASSET"
	hash "0x5F61EBBE1A00F96D"
	arguments {
		charPtr "assetName",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		assetName = For example "core"

		console hash: 0xC44762A1
</summary>
	]]

native "SET_VEHICLE_POPULATION_BUDGET"
	hash "0xCB9E1EB3BE2AF4E9"
	jhash (0x1D56993C)
	arguments {
		int "p0",
	}
	ns "STREAMING"
	returns	"void"

native "SET_PED_POPULATION_BUDGET"
	hash "0x8C95333CFC3340F3"
	jhash (0xD2D026CD)
	arguments {
		int "p0",
	}
	ns "STREAMING"
	returns	"void"

native "CLEAR_FOCUS"
	hash "0x31B73D1EA9F01DA2"
	jhash (0x34D91E7A)
	ns "STREAMING"
	returns	"void"

native "_SET_FOCUS_AREA"
	hash "0xBB7454BAFF08FE25"
	jhash (0x14680A60)
	arguments {
		float "x",

		float "y",

		float "z",

		float "offsetX",

		float "offsetY",

		float "offsetZ",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Override the area where the camera will render the terrain.
		p3, p4 and p5 are usually set to 0.0

</summary>
	]]

native "SET_FOCUS_ENTITY"
	hash "0x198F77705FA0931D"
	jhash (0x18DB04AC)
	arguments {
		Entity "entity",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		It seems to make the entity's coords mark the point from which LOD-distances are measured. In my testing, setting a vehicle as the focus entity and moving that vehicle more than 300 distance units away from the player will make the level of detail around the player go down drastically (shadows disappear, textures go extremely low res, etc). The player seems to be the default focus entity.
</summary>
	]]

native "IS_ENTITY_FOCUS"
	hash "0x2DDFF3FB9075D747"
	jhash (0xB456D707)
	arguments {
		Entity "entity",
	}
	ns "STREAMING"
	returns	"BOOL"

native "0x0811381EF5062FEC"
	hash "0x0811381EF5062FEC"
	arguments {
		Entity "p0",
	}
	ns "STREAMING"
	returns	"void"

native "0xAF12610C644A35C9"
	hash "0xAF12610C644A35C9"
	jhash (0x403CD434)
	arguments {
		charPtr "p0",

		BOOL "p1",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Possible p0 values:

		"prologue"
		"Prologue_Main"
</summary>
	]]

native "0x4E52E752C76E7E7A"
	hash "0x4E52E752C76E7E7A"
	jhash (0xA07BAEB9)
	arguments {
		Any "p0",
	}
	ns "STREAMING"
	returns	"void"

native "FORMAT_FOCUS_HEADING"
	hash "0x219C7B8D53E429FD"
	jhash (0x10B6AB36)
	arguments {
		float "x",

		float "y",

		float "z",

		float "rad",

		Any "p4",

		Any "p5",
	}
	alias "0x219C7B8D53E429FD"
	ns "STREAMING"
	returns	"Any"

native "0x1F3F018BC3AFA77C"
	hash "0x1F3F018BC3AFA77C"
	jhash (0x72344191)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		Any "p7",

		Any "p8",
	}
	ns "STREAMING"
	returns	"Any"

native "0x0AD9710CEE2F590F"
	hash "0x0AD9710CEE2F590F"
	jhash (0xC0157255)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		Any "p6",
	}
	ns "STREAMING"
	returns	"Any"

native "0x1EE7D8DF4425F053"
	hash "0x1EE7D8DF4425F053"
	jhash (0xE80F8ABE)
	arguments {
		Any "p0",
	}
	ns "STREAMING"
	returns	"void"

native "0x7D41E9D2D17C5B2D"
	hash "0x7D41E9D2D17C5B2D"
	jhash (0x1B3521F4)
	arguments {
		Any "p0",
	}
	ns "STREAMING"
	returns	"Any"

native "0x07C313F94746702C"
	hash "0x07C313F94746702C"
	jhash (0x42CFE9C0)
	arguments {
		Any "p0",
	}
	ns "STREAMING"
	returns	"Any"

native "0xBC9823AB80A3DCAC"
	hash "0xBC9823AB80A3DCAC"
	jhash (0x56253356)
	ns "STREAMING"
	returns	"Any"

native "NEW_LOAD_SCENE_START"
	hash "0x212A8D0D2BABFAC2"
	jhash (0xDF9C38B6)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		Any "p7",
	}
	ns "STREAMING"
	returns	"BOOL"

native "NEW_LOAD_SCENE_START_SPHERE"
	hash "0xACCFB4ACF53551B0"
	jhash (0xFA037FEB)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		Any "p4",
	}
	alias "0xACCFB4ACF53551B0"
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		if (!sub_8f12("START LOAD SCENE SAFE")) {
		    if (CUTSCENE::GET_CUTSCENE_TIME() &gt; 4178) {
		        STREAMING::_ACCFB4ACF53551B0(1973.845458984375, 3818.447265625, 32.43629837036133, 15.0, 2);
		        sub_8e9e("START LOAD SCENE SAFE", 1);
		    }
		}

		(Previously known as STREAMING::_NEW_LOAD_SCENE_START_SAFE)
</summary>
	]]

native "NEW_LOAD_SCENE_STOP"
	hash "0xC197616D221FF4A4"
	jhash (0x7C05B1F6)
	ns "STREAMING"
	returns	"void"

native "IS_NEW_LOAD_SCENE_ACTIVE"
	hash "0xA41A05B6CB741B85"
	jhash (0xAD234B7F)
	ns "STREAMING"
	returns	"BOOL"

native "IS_NEW_LOAD_SCENE_LOADED"
	hash "0x01B8247A7A8B9AD1"
	jhash (0x3ECD839F)
	ns "STREAMING"
	returns	"BOOL"

native "0x71E7B2E657449AAD"
	hash "0x71E7B2E657449AAD"
	jhash (0xEAA51103)
	ns "STREAMING"
	returns	"Any"

native "START_PLAYER_SWITCH"
	hash "0xFAA23F2CBA159D67"
	jhash (0x0829E975)
	arguments {
		Ped "from",

		Ped "to",

		int "flags",

		int "switchType",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		// this enum comes directly from R* so don't edit this
		enum ePlayerSwitchType
		{
			SWITCH_TYPE_AUTO,
			SWITCH_TYPE_LONG,
			SWITCH_TYPE_MEDIUM,
			SWITCH_TYPE_SHORT
		};

		Use GET_IDEAL_PLAYER_SWITCH_TYPE for the best switch type. Or just auto, because it calls the same function in executable.

		----------------------------------------------------

		Examples from the decompiled scripts:

		STREAMING::START_PLAYER_SWITCH(l_832._f3, PLAYER::PLAYER_PED_ID(), 0, 3);
		STREAMING::START_PLAYER_SWITCH(l_832._f3, PLAYER::PLAYER_PED_ID(), 2050, 3);
		STREAMING::START_PLAYER_SWITCH(PLAYER::PLAYER_PED_ID(), l_832._f3, 1024, 3);
		STREAMING::START_PLAYER_SWITCH(g_141F27, PLAYER::PLAYER_PED_ID(), 513, v_14);

		Note: DO NOT, use SWITCH_TYPE_LONG with flag 513. It leaves you stuck in the clouds. You'll have to call STOP_PLAYER_SWITCH() to return to your ped.

		Flag 8 w/ SWITCH_TYPE_LONG will zoom out 3 steps, then zoom in 2/3 steps and stop on the 3rd and just hang there.
		Flag 8 w/ SWITCH_TYPE_MEDIUM will zoom out 1 step, and just hang there.
</summary>
	]]

native "STOP_PLAYER_SWITCH"
	hash "0x95C0A5BBDC189AA1"
	jhash (0x2832C010)
	ns "STREAMING"
	returns	"void"

native "IS_PLAYER_SWITCH_IN_PROGRESS"
	hash "0xD9D2CFFF49FAB35F"
	jhash (0x56135ACC)
	alias "0xD9D2CFFF49FAB35F"
	ns "STREAMING"
	returns	"BOOL"
	doc [[!
<summary>
		Returns true if the player is currently switching, false otherwise.
		(When the camera is in the sky moving from Trevor to Franklin for example)
</summary>
	]]

native "GET_PLAYER_SWITCH_TYPE"
	hash "0xB3C94A90D9FC9E62"
	jhash (0x280DC015)
	ns "STREAMING"
	returns	"int"

native "GET_IDEAL_PLAYER_SWITCH_TYPE"
	hash "0xB5D7B26B45720E05"
	jhash (0xD5A450F1)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",
	}
	ns "STREAMING"
	returns	"int"
	doc [[!
<summary>
		x1, y1, z1 -- Coords of your ped model
		x2, y2, z2 -- Coords of the ped you want to switch to
</summary>
	]]

native "GET_PLAYER_SWITCH_STATE"
	hash "0x470555300D10B2A5"
	jhash (0x39A0E1F2)
	ns "STREAMING"
	returns	"int"

native "GET_PLAYER_SHORT_SWITCH_STATE"
	hash "0x20F898A5D9782800"
	jhash (0x9B7BA38F)
	ns "STREAMING"
	returns	"int"

native "0x5F2013F8BC24EE69"
	hash "0x5F2013F8BC24EE69"
	jhash (0xF0BD420D)
	arguments {
		int "p0",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		SET_PLAYERS_*
</summary>
	]]

native "0x78C0D93253149435"
	hash "0x78C0D93253149435"
	jhash (0x02BA7AC2)
	ns "STREAMING"
	returns	"Any"

native "SET_PLAYER_SWITCH_OUTRO"
	hash "0xC208B673CE446B61"
	jhash (0x47352E14)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		Any "p8",
	}
	alias "0xC208B673CE446B61"
	ns "STREAMING"
	returns	"void"

native "0x0FDE9DBFC0A6BC65"
	hash "0x0FDE9DBFC0A6BC65"
	jhash (0x279077B0)
	arguments {
		AnyPtr "p0",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		SET_PLAYERS_*
</summary>
	]]

native "0x43D1680C6D19A8E9"
	hash "0x43D1680C6D19A8E9"
	jhash (0x55CB21F9)
	ns "STREAMING"
	returns	"void"

native "0x74DE2E8739086740"
	hash "0x74DE2E8739086740"
	jhash (0x1084F2F4)
	ns "STREAMING"
	returns	"void"

native "0x8E2A065ABDAE6994"
	hash "0x8E2A065ABDAE6994"
	jhash (0x5B1E995D)
	ns "STREAMING"
	returns	"void"

native "0xAD5FDF34B81BFE79"
	hash "0xAD5FDF34B81BFE79"
	jhash (0x4B4B9A13)
	ns "STREAMING"
	returns	"void"

native "0xDFA80CB25D0A19B3"
	hash "0xDFA80CB25D0A19B3"
	jhash (0x408F7148)
	ns "STREAMING"
	returns	"Any"

native "0xD4793DFF3AF2ABCD"
	hash "0xD4793DFF3AF2ABCD"
	ns "STREAMING"
	returns	"void"

native "0xBD605B8E0E18B3BB"
	hash "0xBD605B8E0E18B3BB"
	ns "STREAMING"
	returns	"void"

native "_SWITCH_OUT_PLAYER"
	hash "0xAAB3200ED59016BC"
	jhash (0xFB4D062D)
	arguments {
		Ped "ped",

		int "flags",

		int "unknown",
	}
	alias "0xAAB3200ED59016BC"
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		fucks up on mount chilliad
</summary>
	]]

native "0xD8295AF639FD9CB8"
	hash "0xD8295AF639FD9CB8"
	jhash (0x2349373B)
	arguments {
		Any "p0",
	}
	ns "STREAMING"
	returns	"void"

native "0x933BBEEB8C61B5F4"
	hash "0x933BBEEB8C61B5F4"
	jhash (0x74C16879)
	ns "STREAMING"
	returns	"Any"

native "SET_PLAYER_INVERTED_UP"
	hash "0x08C2D6C52A3104BB"
	jhash (0x569847E3)
	ns "STREAMING"
	returns	"int"
	doc [[!
<summary>
		Hash collision
</summary>
	]]

native "0x5B48A06DD0E792A5"
	hash "0x5B48A06DD0E792A5"
	jhash (0xC7A3D279)
	ns "STREAMING"
	returns	"Any"

native "DESTROY_PLAYER_IN_PAUSE_MENU"
	hash "0x5B74EA8CFD5E3E7E"
	jhash (0x90F64284)
	ns "STREAMING"
	returns	"Any"
	doc [[!
<summary>
		Hash collision
</summary>
	]]

native "0x1E9057A74FD73E23"
	hash "0x1E9057A74FD73E23"
	ns "STREAMING"
	returns	"void"

native "0x0C15B0E443B2349D"
	hash "0x0C15B0E443B2349D"
	jhash (0x7154B6FD)
	ns "STREAMING"
	returns	"Any"

native "0xA76359FC80B2438E"
	hash "0xA76359FC80B2438E"
	jhash (0xE5612C1A)
	arguments {
		float "p0",
	}
	ns "STREAMING"
	returns	"void"

native "0xBED8CA5FF5E04113"
	hash "0xBED8CA5FF5E04113"
	jhash (0x9CD6A451)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",
	}
	ns "STREAMING"
	returns	"void"

native "0x472397322E92A856"
	hash "0x472397322E92A856"
	jhash (0x4267DA87)
	ns "STREAMING"
	returns	"void"

native "0x40AEFD1A244741F2"
	hash "0x40AEFD1A244741F2"
	jhash (0x9FA4AF99)
	arguments {
		BOOL "p0",
	}
	ns "STREAMING"
	returns	"void"

native "0x03F1A106BDA7DD3E"
	hash "0x03F1A106BDA7DD3E"
	ns "STREAMING"
	returns	"void"

native "0x95A7DABDDBB78AE7"
	hash "0x95A7DABDDBB78AE7"
	jhash (0x9EF0A9CF)
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",
	}
	ns "STREAMING"
	returns	"void"

native "0x63EB2B972A218CAC"
	hash "0x63EB2B972A218CAC"
	jhash (0xF2CDD6A8)
	ns "STREAMING"
	returns	"void"

native "0xFB199266061F820A"
	hash "0xFB199266061F820A"
	jhash (0x17B0A1CD)
	ns "STREAMING"
	returns	"Any"

native "0xF4A0DADB70F57FA6"
	hash "0xF4A0DADB70F57FA6"
	jhash (0x3DA7AA5D)
	ns "STREAMING"
	returns	"void"

native "0x5068F488DDB54DD8"
	hash "0x5068F488DDB54DD8"
	jhash (0xDAB4BAC0)
	ns "STREAMING"
	returns	"Any"

native "PREFETCH_SRL"
	hash "0x3D245789CE12982C"
	jhash (0x37BE2FBB)
	arguments {
		charPtr "srl",
	}
	ns "STREAMING"
	returns	"void"

native "IS_SRL_LOADED"
	hash "0xD0263801A4C5B0BB"
	jhash (0x670FA2A6)
	ns "STREAMING"
	returns	"BOOL"

native "BEGIN_SRL"
	hash "0x9BADDC94EF83B823"
	jhash (0x24F49427)
	ns "STREAMING"
	returns	"void"

native "END_SRL"
	hash "0x0A41540E63C9EE17"
	jhash (0x1977C56A)
	ns "STREAMING"
	returns	"void"

native "SET_SRL_TIME"
	hash "0xA74A541C6884E7B8"
	jhash (0x30F8A487)
	arguments {
		float "p0",
	}
	ns "STREAMING"
	returns	"void"

native "0xEF39EE20C537E98C"
	hash "0xEF39EE20C537E98C"
	jhash (0x814D0752)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",

		Any "p5",
	}
	ns "STREAMING"
	returns	"void"

native "0xBEB2D9A1D9A8F55A"
	hash "0xBEB2D9A1D9A8F55A"
	jhash (0x62F02485)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "STREAMING"
	returns	"void"

native "0x20C6C7E4EB082A7F"
	hash "0x20C6C7E4EB082A7F"
	jhash (0xA6459CAA)
	arguments {
		BOOL "p0",
	}
	ns "STREAMING"
	returns	"void"

native "0xF8155A7F03DDFC8E"
	hash "0xF8155A7F03DDFC8E"
	jhash (0xF8F515E4)
	arguments {
		Any "p0",
	}
	ns "STREAMING"
	returns	"void"

native "SET_HD_AREA"
	hash "0xB85F26619073E775"
	jhash (0x80BAA035)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",
	}
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Harcoded limit for radius is 30.0f
</summary>
	]]

native "CLEAR_HD_AREA"
	hash "0xCE58B1CFB9290813"
	jhash (0x7CAC6FA0)
	ns "STREAMING"
	returns	"void"

native "_LOAD_MISSION_CREATOR_DATA"
	hash "0xB5A4DB34FE89B88A"
	jhash (0xE243B2AF)
	alias "0xB5A4DB34FE89B88A"
	ns "STREAMING"
	returns	"void"
	doc [[!
<summary>
		Loads "common:/data/missioncreatordata" data and sets some values.
</summary>
	]]

native "SHUTDOWN_CREATOR_BUDGET"
	hash "0xCCE26000E9A6FAD7"
	jhash (0x897A510F)
	alias "0xCCE26000E9A6FAD7"
	ns "STREAMING"
	returns	"void"

native "0x0BC3144DEB678666"
	hash "0x0BC3144DEB678666"
	jhash (0xC0E83320)
	arguments {
		Hash "modelHash",
	}
	ns "STREAMING"
	returns	"BOOL"

native "0xF086AD9354FAC3A3"
	hash "0xF086AD9354FAC3A3"
	jhash (0x1C576388)
	arguments {
		Any "p0",
	}
	ns "STREAMING"
	returns	"void"

native "0x3D3D8B3BE5A83D35"
	hash "0x3D3D8B3BE5A83D35"
	jhash (0x3E9C4CBE)
	ns "STREAMING"
	returns	"Any"

native "REQUEST_SCRIPT"
	hash "0x6EB5F71AA68F2E8E"
	jhash (0xE26B2666)
	arguments {
		charPtr "scriptName",
	}
	ns "SCRIPT"
	returns	"void"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/yLNWicUi
</summary>
	]]

native "SET_SCRIPT_AS_NO_LONGER_NEEDED"
	hash "0xC90D2DCACD56184C"
	jhash (0x6FCB7795)
	arguments {
		charPtr "scriptName",
	}
	ns "SCRIPT"
	returns	"void"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/yLNWicUi
</summary>
	]]

native "HAS_SCRIPT_LOADED"
	hash "0xE6CC9F3BA0FB9EF1"
	jhash (0x5D67F751)
	arguments {
		charPtr "scriptName",
	}
	ns "SCRIPT"
	returns	"BOOL"
	doc [[!
<summary>
		Returns if a script has been loaded into the game. Used to see if a script was loaded after requesting.

		For a full list, see here: pastebin.com/yLNWicUi
</summary>
	]]

native "DOES_SCRIPT_EXIST"
	hash "0xFC04745FBE67C19A"
	jhash (0xDEAB87AB)
	arguments {
		charPtr "scriptName",
	}
	ns "SCRIPT"
	returns	"BOOL"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/yLNWicUi
</summary>
	]]

native "REQUEST_SCRIPT_WITH_NAME_HASH"
	hash "0xD62A67D26D9653E6"
	jhash (0x1C68D9DC)
	arguments {
		Hash "scriptHash",
	}
	alias "_REQUEST_STREAMED_SCRIPT"
	ns "SCRIPT"
	returns	"void"
	doc [[!
<summary>
		formerly _REQUEST_STREAMED_SCRIPT
</summary>
	]]

native "SET_SCRIPT_WITH_NAME_HASH_AS_NO_LONGER_NEEDED"
	hash "0xC5BC038960E9DB27"
	jhash (0x96C26F66)
	arguments {
		Hash "scriptHash",
	}
	alias "_SET_STREAMED_SCRIPT_AS_NO_LONGER_NEEDED"
	ns "SCRIPT"
	returns	"void"

native "HAS_SCRIPT_WITH_NAME_HASH_LOADED"
	hash "0x5F0F0C783EB16C04"
	jhash (0x06674818)
	arguments {
		Hash "scriptHash",
	}
	alias "_HAS_STREAMED_SCRIPT_LOADED"
	ns "SCRIPT"
	returns	"BOOL"

native "_DOES_SCRIPT_WITH_NAME_HASH_EXIST"
	hash "0xF86AA3C56BA31381"
	arguments {
		Hash "scriptHash",
	}
	alias "0xF86AA3C56BA31381"
	ns "SCRIPT"
	returns	"BOOL"
	doc [[!
<summary>
		formerly _IS_STREAMED_SCRIPT_RUNNING

		Jenkins hash: 0x19EAE282
</summary>
	]]

native "TERMINATE_THREAD"
	hash "0xC8B189ED9138BCD4"
	jhash (0x253FD520)
	arguments {
		int "threadId",
	}
	ns "SCRIPT"
	returns	"void"

native "IS_THREAD_ACTIVE"
	hash "0x46E9AE36D8FA6417"
	jhash (0x78D7A5A0)
	arguments {
		int "threadId",
	}
	ns "SCRIPT"
	returns	"BOOL"

native "_GET_NAME_OF_THREAD"
	hash "0x05A42BA9FC8DA96B"
	jhash (0xBE7ACD89)
	arguments {
		int "threadId",
	}
	alias "_GET_THREAD_NAME"
	ns "SCRIPT"
	returns	"charPtr"
	doc [[!
<summary>
		The reversed code looks like this (Sasuke78200)

		//
		char g_szScriptName[64];

		char* _0xBE7ACD89(int a_iThreadID)
		{
			scrThread* l_pThread;

			// Get the script thread
			l_pThread = GetThreadByID(a_iThreadID);	

			if(l_pThread == 0 || l_pThread-&gt;m_iThreadState == 2)
			{
				strncpy(g_szScriptName, "", 64);
			}
			else
			{
				strncpy(g_szScriptName, l_pThread-&gt;m_szScriptName, 64);
			}	

			return g_szScriptName;
		}
</summary>
	]]

native "_BEGIN_ENUMERATING_THREADS"
	hash "0xDADFADA5A20143A8"
	jhash (0xBB4E2F66)
	alias "0xDADFADA5A20143A8"
	ns "SCRIPT"
	returns	"void"
	doc [[!
<summary>
		MulleDK19: Starts a new enumeration of the current threads.
		Call this first, then _GET_ID_OF_NEXT_THREAD_IN_ENUMERATION (0x30B4FA1C82DD4B9F)


		see _GET_ID_OF_NEXT_THREAD_IN_ENUMERATION (0x30B4FA1C82DD4B9F) for an example
</summary>
	]]

native "_GET_ID_OF_NEXT_THREAD_IN_ENUMERATION"
	hash "0x30B4FA1C82DD4B9F"
	jhash (0x1E28B28F)
	alias "0x30B4FA1C82DD4B9F"
	ns "SCRIPT"
	returns	"int"
	doc [[!
<summary>
		MulleDK19: Gets the ID of the next active thread.
		First call _BEGIN_ENUMERATE_THREADS (0xDADFADA5A20143A8).
		Any subsequent call to this function will then return the ID of the next active thread.

		If the function returns 0, the end of the enumeration has been reached.

		-----------------------------------------------------------------------
		Here's an example:

			std::vector&lt;int&gt; vecCurrentThreads;
			void update_current_threads_list()
			{
				vecCurrentThreads.clear();

				_BEGIN_ENUMERATING_THREADS();
				int id = _GET_ID_OF_NEXT_THREAD_IN_ENUMERATION();

				while (id != 0)
				{
					id = _GET_ID_OF_NEXT_THREAD_IN_ENUMERATION();
					vecCurrentThreads.push_back(id);
				}
			}
</summary>
	]]

native "GET_ID_OF_THIS_THREAD"
	hash "0xC30338E8088E2E21"
	jhash (0xDE524830)
	ns "SCRIPT"
	returns	"int"

native "TERMINATE_THIS_THREAD"
	hash "0x1090044AD1DA76FA"
	jhash (0x3CD9CBB7)
	ns "SCRIPT"
	returns	"void"

native "_GET_NUMBER_OF_INSTANCES_OF_SCRIPT_WITH_NAME_HASH"
	hash "0x2C83A9DA6BFFC4F9"
	jhash (0x029D3841)
	arguments {
		Hash "scriptHash",
	}
	alias "_GET_NUMBER_OF_INSTANCES_OF_STREAMED_SCRIPT"
	ns "SCRIPT"
	returns	"int"
	doc [[!
<summary>
		Gets the number of instances of the specified script is currently running.

		Actually returns numInstances - 1.
		if (scriptPtr)
		    v3 = GetNumberOfInstancesOfScript(scriptPtr) - 1;
		return v3;
</summary>
	]]

native "GET_THIS_SCRIPT_NAME"
	hash "0x442E0A7EDE4A738A"
	jhash (0xA40FD5D9)
	ns "SCRIPT"
	returns	"charPtr"

native "GET_HASH_OF_THIS_SCRIPT_NAME"
	hash "0x8A1C8B1738FFE87E"
	jhash (0x2BEE1F45)
	alias "_GET_THIS_SCRIPT_HASH"
	ns "SCRIPT"
	returns	"Hash"

native "GET_NUMBER_OF_EVENTS"
	hash "0x5F92A689A06620AA"
	jhash (0xA3525D60)
	arguments {
		int "eventGroup",
	}
	ns "SCRIPT"
	returns	"int"
	doc [[!
<summary>
		eventGroup: 0 = CEventGroupScriptAI, 1 = CEventGroupScriptNetwork
</summary>
	]]

native "GET_EVENT_EXISTS"
	hash "0x936E6168A9BCEDB5"
	jhash (0xA1B447B5)
	arguments {
		int "eventGroup",

		int "eventIndex",
	}
	ns "SCRIPT"
	returns	"BOOL"
	doc [[!
<summary>
		eventGroup: 0 = CEventGroupScriptAI, 1 = CEventGroupScriptNetwork
</summary>
	]]

native "GET_EVENT_AT_INDEX"
	hash "0xD8F66A3A60C62153"
	jhash (0xB49C1442)
	arguments {
		int "eventGroup",

		int "eventIndex",
	}
	ns "SCRIPT"
	returns	"int"
	doc [[!
<summary>
		eventGroup: 0 = CEventGroupScriptAI, 1 = CEventGroupScriptNetwork
</summary>
	]]

native "GET_EVENT_DATA"
	hash "0x2902843FCD2B2D79"
	jhash (0x4280F92F)
	arguments {
		int "eventGroup",

		int "eventIndex",

		intPtr "argStruct",

		int "argStructSize",
	}
	ns "SCRIPT"
	returns	"BOOL"
	doc [[!
<summary>
		eventGroup: 0 = CEventGroupScriptAI, 1 = CEventGroupScriptNetwork
</summary>
	]]

native "TRIGGER_SCRIPT_EVENT"
	hash "0x5AE99C571D5BBE5D"
	jhash (0x54763B35)
	arguments {
		int "eventGroup",

		intPtr "args",

		int "argCount",

		int "bit",
	}
	ns "SCRIPT"
	returns	"void"
	doc [[!
<summary>
		yis

		eventGroup: 0 = CEventGroupScriptAI, 1 = CEventGroupScriptNetwork
		^^ I'm assuming it's like the rest with this parameter.
</summary>
	]]

native "SHUTDOWN_LOADING_SCREEN"
	hash "0x078EBE9809CCD637"
	jhash (0xA2826D17)
	ns "SCRIPT"
	returns	"void"

native "SET_NO_LOADING_SCREEN"
	hash "0x5262CC1995D07E09"
	jhash (0xC8055034)
	arguments {
		BOOL "toggle",
	}
	ns "SCRIPT"
	returns	"void"

native "_GET_NO_LOADING_SCREEN"
	hash "0x18C1270EA7F199BC"
	ns "SCRIPT"
	returns	"BOOL"

native "0xB1577667C3708F9B"
	hash "0xB1577667C3708F9B"
	jhash (0xB03BCCDF)
	ns "SCRIPT"
	returns	"void"

native "_BEGIN_TEXT_COMMAND_BUSY_STRING"
	hash "0xABA17D7CE615ADBF"
	jhash (0xCB7C8994)
	arguments {
		charPtr "string",
	}
	alias "0xABA17D7CE615ADBF"
	alias "_SET_LOADING_PROMPT_TEXT_ENTRY"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Initializes the text entry for the the text next to a loading prompt. All natives for for building UI texts can be used here

		BEGIN_TEXT_COMMAND_PRINT

		e.g
		void StartLoadingMessage(char *text, int spinnerType = 3)
			{
				_SET_LOADING_PROMPT_TEXT_ENTRY("STRING");
				ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
				_SHOW_LOADING_PROMPT(spinnerType);
			}
		/*OR*/
			void ShowLoadingMessage(char *text, int spinnerType = 3, int timeMs = 10000)
			{
				_SET_LOADING_PROMPT_TEXT_ENTRY("STRING");
				ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
				_SHOW_LOADING_PROMPT(spinnerType);
				WAIT(timeMs);
				_REMOVE_LOADING_PROMPT();
			}


		These are some localized strings used in the loading spinner.
		"PM_WAIT"                   = Please Wait
		"CELEB_WPLYRS"              = Waiting For Players.
		"CELL_SPINNER2"             = Scanning storage.
		"ERROR_CHECKYACHTNAME" = Registering your yacht's name. Please wait.
		"ERROR_CHECKPROFANITY"   = Checking your text for profanity. Please wait.
		"FM_COR_AUTOD"                        = Just spinner no text
		"FM_IHELP_WAT2"                        = Waiting for other players
		"FM_JIP_WAITO"                            = Game options are being set
		"FMMC_DOWNLOAD"                    = Downloading
		"FMMC_PLYLOAD"                         = Loading
		"FMMC_STARTTRAN"                    = Launching session
		"HUD_QUITTING"                           =  Quiting session
		"KILL_STRIP_IDM"                         = Waiting for to accept
		"MP_SPINLOADING"                      = Loading
</summary>
	]]

native "_END_TEXT_COMMAND_BUSY_STRING"
	hash "0xBD12F8228410D9B4"
	jhash (0x903F5EE4)
	arguments {
		int "busySpinnerType",
	}
	alias "0xBD12F8228410D9B4"
	alias "_SHOW_LOADING_PROMPT"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		This does NOT get called per frame. Call it once to show, then use UI::_REMOVE_LOADING_PROMPT to remove it

		Changes the the above native's (UI::_SET_LOADING_PROMPT_TEXT_ENTRY) spinning circle type.

		Types:
		enum LoadingPromptTypes
		{
			LOADING_PROMPT_LEFT,
			LOADING_PROMPT_LEFT_2,
			LOADING_PROMPT_LEFT_3,
			SAVE_PROMPT_LEFT,
			LOADING_PROMPT_RIGHT,
		};
</summary>
	]]

native "_REMOVE_LOADING_PROMPT"
	hash "0x10D373323E5B9C0D"
	jhash (0x94119534)
	alias "0x10D373323E5B9C0D"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Removes the loading prompt at the bottom right of the screen, created by the UI::_SHOW_LOADING_PROMPT native.
</summary>
	]]

native "0xC65AB383CD91DF98"
	hash "0xC65AB383CD91DF98"
	jhash (0x71077FBD)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Often called after _REMOVE_LOADING_PROMPT. Unsure what exactly it does, but It references busy_spinner, I can only guess its freeing the busy_spinner scaleform from memory
</summary>
	]]

native "_IS_LOADING_PROMPT_BEING_DISPLAYED"
	hash "0xD422FCC5F239A915"
	jhash (0xB8B3A5D0)
	alias "0xD422FCC5F239A915"
	ns "HUD"
	returns	"BOOL"

native "0xB2A592B04648A9CB"
	hash "0xB2A592B04648A9CB"
	ns "HUD"
	returns	"Pickup"

native "0x9245E81072704B8A"
	hash "0x9245E81072704B8A"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "_SHOW_CURSOR_THIS_FRAME"
	hash "0xAAE7CE1D63167423"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Shows the cursor on screen for the frame its called.
</summary>
	]]

native "_SET_CURSOR_SPRITE"
	hash "0x8DB8CFFD58B62552"
	arguments {
		int "spriteId",
	}
	alias "0x8DB8CFFD58B62552"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Changes the mouse cursor's sprite. 
		public enum CursorType
		{
		    None = 0,
		    Normal = 1,
		    TransparentNormal = 2,
		    PreGrab = 3,
		    Grab = 4,
		    MiddleFinger = 5,
		    LeftArrow = 6,
		    RightArrow = 7,
		    UpArrow = 8,
		    DownArrow = 9,
		    HorizontalExpand = 10,
		    Add = 11,
		    Remove = 12,
		}
</summary>
	]]

native "0x98215325A695E78A"
	hash "0x98215325A695E78A"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0x3D9ACB1EB139E702"
	hash "0x3D9ACB1EB139E702"
	ns "HUD"
	returns	"Any"

native "0x632B2940C67F4EA9"
	hash "0x632B2940C67F4EA9"
	arguments {
		int "scaleformHandle",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",
	}
	ns "HUD"
	returns	"BOOL"

native "0x6F1554B0CC2089FA"
	hash "0x6F1554B0CC2089FA"
	jhash (0xA7C8594B)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "_CLEAR_NOTIFICATIONS_POS"
	hash "0x55598D21339CB998"
	jhash (0x1DA7E41A)
	arguments {
		float "pos",
	}
	alias "0x55598D21339CB998"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		_CLEAR_NOTIFICATIONS_POS(0.5f);
</summary>
	]]

native "0x25F87B30C382FCA7"
	hash "0x25F87B30C382FCA7"
	jhash (0x1E63088A)
	ns "HUD"
	returns	"void"

native "0xA8FDB297A8D25FBA"
	hash "0xA8FDB297A8D25FBA"
	jhash (0x5205C6F5)
	ns "HUD"
	returns	"void"

native "_REMOVE_NOTIFICATION"
	hash "0xBE4390CB40B3E627"
	jhash (0xECA8ACB9)
	arguments {
		int "notificationId",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Removes a notification instantly instead of waiting for it to disappear
</summary>
	]]

native "0xA13C11E1B5C06BFC"
	hash "0xA13C11E1B5C06BFC"
	jhash (0x520FCB6D)
	ns "HUD"
	returns	"void"

native "0x583049884A2EEE3C"
	hash "0x583049884A2EEE3C"
	jhash (0xC8BAB2F2)
	ns "HUD"
	returns	"void"

native "0xFDB423997FA30340"
	hash "0xFDB423997FA30340"
	jhash (0x4D0449C6)
	ns "HUD"
	returns	"void"

native "0xE1CD1E48E025E661"
	hash "0xE1CD1E48E025E661"
	jhash (0xD3F40140)
	ns "HUD"
	returns	"void"

native "0xA9CBFD40B3FA3010"
	hash "0xA9CBFD40B3FA3010"
	jhash (0xC5223796)
	ns "HUD"
	returns	"Any"

native "0xD4438C0564490E63"
	hash "0xD4438C0564490E63"
	jhash (0x709B4BCB)
	ns "HUD"
	returns	"void"

native "0xB695E2CD0A2DA9EE"
	hash "0xB695E2CD0A2DA9EE"
	jhash (0x4A4A40A4)
	ns "HUD"
	returns	"void"

native "_GET_CURRENT_NOTIFICATION"
	hash "0x82352748437638CA"
	jhash (0x294405D4)
	alias "0x82352748437638CA"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Returns the handle for the notification currently displayed on the screen.
</summary>
	]]

native "0x56C8B608CFD49854"
	hash "0x56C8B608CFD49854"
	jhash (0xF881AB87)
	ns "HUD"
	returns	"void"

native "0xADED7F5748ACAFE6"
	hash "0xADED7F5748ACAFE6"
	jhash (0x1D6859CA)
	ns "HUD"
	returns	"void"

native "_SET_NOTIFICATION_BACKGROUND_COLOR"
	hash "0x92F0DA1E27DB96DC"
	arguments {
		int "hudIndex",
	}
	alias "0x92F0DA1E27DB96DC"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		From the decompiled scripts:
		UI::_92F0DA1E27DB96DC(6);
		UI::_92F0DA1E27DB96DC(184);
		UI::_92F0DA1E27DB96DC(190);

		sets background color for the next notification
		6 = red
		184 = green
		190 = yellow

		Here is a list of some colors that can be used: gyazo.com/68bd384455fceb0a85a8729e48216e15

		this seems to set the alpha to 255 automatically, if you have a work around let me know 
</summary>
	]]

native "_SET_NOTIFICATION_FLASH_COLOR"
	hash "0x17430B918701C342"
	jhash (0xCF14D7F2)
	arguments {
		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	alias "0x17430B918701C342"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		sets color for notification flash
</summary>
	]]

native "0x17AD8C9706BDD88A"
	hash "0x17AD8C9706BDD88A"
	jhash (0x24A97AF8)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "0x4A0C7C9BB10ABB36"
	hash "0x4A0C7C9BB10ABB36"
	jhash (0x44018EDB)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0xFDD85225B2DEA55E"
	hash "0xFDD85225B2DEA55E"
	jhash (0xA4524B23)
	ns "HUD"
	returns	"void"

native "0xFDEC055AB549E328"
	hash "0xFDEC055AB549E328"
	jhash (0xAFA1148B)
	ns "HUD"
	returns	"void"

native "0x80FE4F3AB4E1B62A"
	hash "0x80FE4F3AB4E1B62A"
	jhash (0x3CD4307C)
	ns "HUD"
	returns	"void"

native "0xBAE4F9B97CD43B30"
	hash "0xBAE4F9B97CD43B30"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0x317EBA71D7543F52"
	hash "0x317EBA71D7543F52"
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		From the decompiled scripts, called 61 times:
		UI::_317EBA71D7543F52(&amp;v_13, &amp;v_13, &amp;v_3, &amp;v_3);
</summary>
	]]

native "_SET_NOTIFICATION_TEXT_ENTRY"
	hash "0x202709F4C58A0424"
	jhash (0x574EE85C)
	arguments {
		charPtr "text",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Declares the entry type of a notification, for example "STRING".

		int ShowNotification(char *text)
		{
			_SET_NOTIFICATION_TEXT_ENTRY("STRING");
			ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
			return _DRAW_NOTIFICATION(1, 1);
		}
</summary>
	]]

native "_SET_NOTIFICATION_MESSAGE_2"
	hash "0x2B7E9A4EAAA93C89"
	jhash (0xED130FA1)
	arguments {
		charPtr "picName1",

		int "picName2",

		BOOL "flash",

		int "iconType",

		BOOL "p4",

		charPtr "sender",

		charPtr "subject",
	}
	alias "0x2B7E9A4EAAA93C89"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		List of picNames: pastebin.com/XdpJVbHz
</summary>
	]]

native "_SET_NOTIFICATION_MESSAGE"
	hash "0x1CCD9A37359072CF"
	jhash (0xE7E3C98B)
	arguments {
		charPtr "picName1",

		charPtr "picName2",

		BOOL "flash",

		int "iconType",

		charPtr "sender",

		charPtr "subject",
	}
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		List of picNames: pastebin.com/XdpJVbHz


		flash is a bool for fading in.
		iconTypes:
		1 : Chat Box
		2 : Email
		3 : Add Friend Request
		4 : Nothing
		5 : Nothing
		6 : Nothing
		7 : Right Jumping Arrow
		8 : RP Icon
		9 : $ Icon

		"sender" is the very top header. This can be any old string.
		"subject" is the header under the sender.
</summary>
	]]

native "_SET_NOTIFICATION_MESSAGE_3"
	hash "0xC6F580E4C94926AC"
	arguments {
		charPtr "picName1",

		charPtr "picName2",

		BOOL "p2",

		Any "p3",

		charPtr "p4",

		charPtr "p5",
	}
	alias "0xC6F580E4C94926AC"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Needs more research.

		Only one type of usage in the scripts:

		UI::_C6F580E4C94926AC("CHAR_ACTING_UP", "CHAR_ACTING_UP", 0, 0, "DI_FEED_CHAR", a_0);
</summary>
	]]

native "_SET_NOTIFICATION_MESSAGE_4"
	hash "0x1E6611149DB3DB6B"
	jhash (0x0EB382B7)
	arguments {
		charPtr "picName1",

		charPtr "picName2",

		BOOL "flash",

		int "iconType",

		charPtr "sender",

		charPtr "subject",

		float "duration",
	}
	alias "0x1E6611149DB3DB6B"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		NOTE: 'duration' is a multiplier, so 1.0 is normal, 2.0 is twice as long (very slow), and 0.5 is half as long.

		Example, only occurrence in the scripts:
		v_8 = UI::_1E6611149DB3DB6B("CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", 0, 0, &amp;v_9, "", a_5);
</summary>
	]]

native "_SET_NOTIFICATION_MESSAGE_CLAN_TAG"
	hash "0x5CBF7BADE20DB93E"
	jhash (0x3E807FE3)
	arguments {
		charPtr "picName1",

		charPtr "picName2",

		BOOL "flash",

		int "iconType",

		charPtr "sender",

		charPtr "subject",

		float "duration",

		charPtr "clanTag",
	}
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		List of picNames pastebin.com/XdpJVbHz

		flash is a bool for fading in.
		iconTypes:
		1 : Chat Box
		2 : Email
		3 : Add Friend Request
		4 : Nothing
		5 : Nothing
		6 : Nothing
		7 : Right Jumping Arrow
		8 : RP Icon
		9 : $ Icon

		"sender" is the very top header. This can be any old string.
		"subject" is the header under the sender.
		"duration" is a multiplier, so 1.0 is normal, 2.0 is twice as long (very slow), and 0.5 is half as long.
		"clanTag" shows a crew tag in the "sender" header, after the text. You need to use 3 underscores as padding. Maximum length of this field seems to be 7. (e.g. "MK" becomes "___MK", "ACE" becomes "___ACE", etc.)
</summary>
	]]

native "_SET_NOTIFICATION_MESSAGE_CLAN_TAG_2"
	hash "0x531B84E7DA981FB6"
	jhash (0xDEB491C8)
	arguments {
		charPtr "picName1",

		charPtr "picName2",

		BOOL "flash",

		int "iconType1",

		charPtr "sender",

		charPtr "subject",

		float "duration",

		charPtr "clanTag",

		int "iconType2",

		int "p9",
	}
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		List of picNames: pastebin.com/XdpJVbHz

		flash is a bool for fading in.
		iconTypes:
		1 : Chat Box
		2 : Email
		3 : Add Friend Request
		4 : Nothing
		5 : Nothing
		6 : Nothing
		7 : Right Jumping Arrow
		8 : RP Icon
		9 : $ Icon

		"sender" is the very top header. This can be any old string.
		"subject" is the header under the sender.
		"duration" is a multiplier, so 1.0 is normal, 2.0 is twice as long (very slow), and 0.5 is half as long.
		"clanTag" shows a crew tag in the "sender" header, after the text. You need to use 3 underscores as padding. Maximum length of this field seems to be 7. (e.g. "MK" becomes "___MK", "ACE" becomes "___ACE", etc.)
		iconType2 is a mirror of iconType. It shows in the "subject" line, right under the original iconType.


		int IconNotification(char *text, char *text2, char *Subject)
		{
			_SET_NOTIFICATION_TEXT_ENTRY("STRING");
			ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
			_SET_NOTIFICATION_MESSAGE_CLAN_TAG_2("CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", 1, 7, text2, Subject, 1.0f, "__EXAMPLE", 7);
			return _DRAW_NOTIFICATION(1, 1);
		}
</summary>
	]]

native "_DRAW_NOTIFICATION"
	hash "0x2ED7843F8F801023"
	jhash (0x08F7AF78)
	arguments {
		BOOL "blink",

		BOOL "showInBrief",
	}
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Draws a notification above the map and returns the notifications handle

		Color syntax:
		~r~ = Red
		~b~ = Blue
		~g~ = Green
		~y~ = Yellow
		~p~ = Purple
		~o~ = Orange
		~c~ = Grey
		~m~ = Darker Grey
		~u~ = Black
		~n~ = New Line
		~s~ = Default White
		~w~ = White
		~h~ = Bold Text
		~nrt~ = ???

		Special characters:
		¦ = Rockstar Verified Icon (U+00A6:Broken Bar - Alt+0166)
		÷ = Rockstar Icon (U+00F7:Division Sign - Alt+0247)
		∑ = Rockstar Icon 2 (U+2211:N-Ary Summation)

		Example C#:
		            Function.Call(Hash._ADD_TEXT_COMPONENT_STRING3, "Now I need you to bring the ~b~vehicle~w~ back to me!");

		----

		showInBrief==true: the notification will appear in the "Brief/Info" -&gt; "Notifications" tab in the pause menu.
		showInBrief==false: the notification will NOT appear in the pause menu.
</summary>
	]]

native "_DRAW_NOTIFICATION_2"
	hash "0x44FA03975424A0EE"
	jhash (0x57B8D0D4)
	arguments {
		BOOL "blink",

		BOOL "p1",
	}
	ns "HUD"
	returns	"int"

native "_DRAW_NOTIFICATION_3"
	hash "0x378E809BF61EC840"
	jhash (0x02BCAF9B)
	arguments {
		BOOL "blink",

		BOOL "p1",
	}
	ns "HUD"
	returns	"int"

native "_DRAW_NOTIFICATION_AWARD"
	hash "0xAA295B6F28BD587D"
	jhash (0x02DED2B8)
	arguments {
		charPtr "p0",

		charPtr "p1",

		int "p2",

		int "p3",

		charPtr "p4",
	}
	alias "0xAA295B6F28BD587D"
	alias "_DRAW_NOTIFICATION_ICON"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Example:

		UI::_SET_NOTIFICATION_TEXT_ENTRY("HUNT");
		UI::_0xAA295B6F28BD587D("Hunting", "Hunting_Gold_128", 0, 109, "HUD_MED_UNLKED");
</summary>
	]]

native "_DRAW_NOTIFICATION_APARTMENT_INVITE"
	hash "0x97C9E4E7024A8F2C"
	jhash (0xA9CCEF66)
	arguments {
		BOOL "p0",

		BOOL "p1",

		intPtr "p2",

		int "p3",

		BOOL "isLeader",

		BOOL "unk0",

		int "clanDesc",

		int "R",

		int "G",

		int "B",
	}
	alias "0x97C9E4E7024A8F2C"
	alias "_NOTIFICATION_SEND_APARTMENT_INVITE"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		This function and the one below it are for after you receive an invite, not sending it.

		p0 = 1 or 0

		nothin doin. 
		int invite(Player player)
			{
				int iVar2, iVar3;
				networkHandleMgr handle;
				NETWORK_HANDLE_FROM_PLAYER(player, &amp;handle.netHandle, 13);
				networkClanMgr clan;

				char *playerName = GET_PLAYER_NAME(player);
				_SET_NOTIFICATION_TEXT_ENTRY("STRING");
				_SET_NOTIFACTION_COLOR_NEXT(0);
				ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(playerName);
				if (NETWORK_CLAN_PLAYER_GET_DESC(&amp;clan, 35, &amp;handle.netHandle))
				{
					iVar2 = 0;
					if (ARE_STRINGS_EQUAL(clan.unk22, "Leader") &amp;&amp; clan.unk30 == 0)
					{
						iVar2 = 1;
					}
					if (clan.unk21 &gt; 0)
					{
						iVar3 = 0;
					}
					else
					{
						iVar3 = 1;
					}
					BOOL unused = _0x54E79E9C(&amp;clan.clanHandle, 35);
					return _DRAW_NOTIFICATION_APARTMENT_INVITE(iVar3, 0 /*unused*/, &amp;clan.unk17, clan.unk30, iVar2, 0, clan.clanHandle, 0, 0, 0);
				}
			}
</summary>
	]]

native "_DRAW_NOTIFICATION_CLAN_INVITE"
	hash "0x137BC35589E34E1E"
	jhash (0x88B9B909)
	arguments {
		BOOL "p0",

		BOOL "p1",

		intPtr "p2",

		int "p3",

		BOOL "isLeader",

		BOOL "unk0",

		int "clanDesc",

		charPtr "playerName",

		int "R",

		int "G",

		int "B",
	}
	alias "0x137BC35589E34E1E"
	alias "_NOTIFICATION_SEND_CLAN_INVITE"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		p0 = 1 or 0

		crashes my game...
		this is for sending invites to network players - jobs/apartment/ect... 
		return notification handle

		int invite(Player player)
			{
				networkHandleMgr netHandle;
				networkClanMgr clan;
				char *playerName = GET_PLAYER_NAME(player);
				_SET_NOTIFICATION_TEXT_ENTRY("STRING");
				_SET_NOTIFACTION_COLOR_NEXT(1);
				ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(playerName);
				NETWORK_HANDLE_FROM_PLAYER(player, &amp;netHandle.netHandle, 13);
				if (NETWORK_CLAN_PLAYER_IS_ACTIVE(&amp;netHandle.netHandle))
				{
					NETWORK_CLAN_PLAYER_GET_DESC(&amp;clan.clanHandle, 35, &amp;netHandle.netHandle);
					_DRAW_NOTIFICATION_CLAN_INVITE(0, _0x54E79E9C(&amp;clan.clanHandle, 35), &amp;clan.unk17, clan.isLeader, 0, 0, clan.clanHandle, playerName, 0, 0, 0);
				}
			}
</summary>
	]]

native "0x33EE12743CCD6343"
	hash "0x33EE12743CCD6343"
	jhash (0xE05E7052)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",
	}
	ns "HUD"
	returns	"Any"

native "0xC8F3AAF93D0600BF"
	hash "0xC8F3AAF93D0600BF"
	jhash (0x4FA43BA4)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "HUD"
	returns	"Any"

native "0x7AE0589093A2E088"
	hash "0x7AE0589093A2E088"
	jhash (0x8C90D22F)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",

		Any "p5",
	}
	ns "HUD"
	returns	"Any"

native "_DRAW_NOTIFICATION_4"
	hash "0xF020C96915705B3A"
	jhash (0x8E319AB8)
	arguments {
		BOOL "blink",

		BOOL "p1",
	}
	ns "HUD"
	returns	"int"

native "0x8EFCCF6EC66D85E4"
	hash "0x8EFCCF6EC66D85E4"
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		BOOL "p3",

		BOOL "p4",
	}
	ns "HUD"
	returns	"Any"
	doc [[!
<summary>
		Example, only occurrence in the scripts:
		UI::_8EFCCF6EC66D85E4(&amp;v_23, &amp;v_13, &amp;v_13, 1, v_34);
</summary>
	]]

native "0xB6871B0555B02996"
	hash "0xB6871B0555B02996"
	jhash (0x5E93FBFA)
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",

		Any "p2",

		AnyPtr "p3",

		AnyPtr "p4",

		Any "p5",
	}
	ns "HUD"
	returns	"Any"

native "_DRAW_NOTIFICATION_WITH_ICON"
	hash "0xD202B92CBF1D816F"
	arguments {
		int "type",

		int "image",

		charPtr "text",
	}
	alias "0xD202B92CBF1D816F"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		returns a notification handle, prints out a notification like below:
		type range: 0 
		if you set type to 1, image goes from 0 - 39 - Xbox you can add text to

		example: 
		UI::_0xD202B92CBF1D816F(1, 20, "Who you trynna get crazy with, ese? Don't you know I'm LOCO?!");
</summary>
	]]

native "_DRAW_NOTIFICATION_WITH_BUTTON"
	hash "0xDD6CB2CCE7C2735C"
	arguments {
		int "type",

		charPtr "button",

		charPtr "text",
	}
	alias "0xDD6CB2CCE7C2735C"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		returns a notification handle, prints out a notification like below:
		type range: 0 
		if you set type to 1, button accepts "~INPUT_SOMETHING~"

		example:
		UI::_0xDD6CB2CCE7C2735C(1, "~INPUT_TALK~", "Who you trynna get crazy with, ese? Don't you know I'm LOCO?!");
		- imgur.com/UPy0Ial


		Examples from the scripts:
		l_D1[1/*1*/]=UI::_DD6CB2CCE7C2735C(1,"~INPUT_REPLAY_START_STOP_RECORDING~","");
		l_D1[2/*1*/]=UI::_DD6CB2CCE7C2735C(1,"~INPUT_SAVE_REPLAY_CLIP~","");
		l_D1[1/*1*/]=UI::_DD6CB2CCE7C2735C(1,"~INPUT_REPLAY_START_STOP_RECORDING~","");
		l_D1[2/*1*/]=UI::_DD6CB2CCE7C2735C(1,"~INPUT_REPLAY_START_STOP_RECORDING_SECONDARY~","");

</summary>
	]]

native "BEGIN_TEXT_COMMAND_PRINT"
	hash "0xB87A37EEB7FAA67D"
	jhash (0xF42C43C7)
	arguments {
		charPtr "GxtEntry",
	}
	alias "_SET_TEXT_ENTRY_2"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Used to be known as _SET_TEXT_ENTRY_2

		void ShowSubtitle(char *text)
		{
			BEGIN_TEXT_COMMAND_PRINT("STRING");
			ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
			END_TEXT_COMMAND_PRINT(2000, 1);
		}
</summary>
	]]

native "END_TEXT_COMMAND_PRINT"
	hash "0x9D77056A530643F6"
	jhash (0x38F82261)
	arguments {
		int "duration",

		BOOL "drawImmediately",
	}
	alias "_DRAW_SUBTITLE_TIMED"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Draws the subtitle at middle center of the screen.

		int duration = time in milliseconds to show text on screen before disappearing

		drawImmediately = If true, the text will be drawn immediately, if false, the text will be drawn after the previous subtitle has finished

		Used to be known as _DRAW_SUBTITLE_TIMED
</summary>
	]]

native "BEGIN_TEXT_COMMAND_IS_MESSAGE_DISPLAYED"
	hash "0x853648FD1063A213"
	jhash (0xDD524A11)
	arguments {
		charPtr "text",
	}
	alias "0x853648FD1063A213"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		nothin doin. 

		BOOL Message(char* text)
			{
				BEGIN_TEXT_COMMAND_IS_MESSAGE_DISPLAYED("STRING");
				ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
				return END_TEXT_COMMAND_IS_MESSAGE_DISPLAYED();
			}
</summary>
	]]

native "END_TEXT_COMMAND_IS_MESSAGE_DISPLAYED"
	hash "0x8A9BA1AB3E237613"
	jhash (0x672EFB45)
	alias "0x8A9BA1AB3E237613"
	ns "HUD"
	returns	"BOOL"

native "BEGIN_TEXT_COMMAND_DISPLAY_TEXT"
	hash "0x25FBB336DF1804CB"
	jhash (0x3E35563E)
	arguments {
		charPtr "text",
	}
	alias "_SET_TEXT_ENTRY"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		The following were found in the decompiled script files:
		STRING, TWOSTRINGS, NUMBER, PERCENTAGE, FO_TWO_NUM, ESMINDOLLA, ESDOLLA, MTPHPER_XPNO, AHD_DIST, CMOD_STAT_0, CMOD_STAT_1, CMOD_STAT_2, CMOD_STAT_3, DFLT_MNU_OPT, F3A_TRAFDEST, ES_HELP_SOC3

		ESDOLLA 
		ESMINDOLLA - cash (negative)

		Used to be known as _SET_TEXT_ENTRY
</summary>
	]]

native "END_TEXT_COMMAND_DISPLAY_TEXT"
	hash "0xCD015E5BB0D96A57"
	jhash (0x6F8350CE)
	arguments {
		float "x",

		float "y",
	}
	alias "_DRAW_TEXT"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		After applying the properties to the text (See UI::SET_TEXT_), this will draw the text in the applied position. Also 0.0f &lt; x, y &lt; 1.0f, percentage of the axis.

		Used to be known as _DRAW_TEXT
</summary>
	]]

native "_BEGIN_TEXT_COMMAND_WIDTH"
	hash "0x54CE8AC98E120CAB"
	jhash (0x51E7A037)
	arguments {
		charPtr "text",
	}
	alias "_SET_TEXT_ENTRY_FOR_WIDTH"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Example:
		_BEGIN_TEXT_COMMAND_WIDTH("NUMBER");
		ADD_TEXT_COMPONENT_FLOAT(69.420f, 2);
		float width = _END_TEXT_COMMAND_GET_WIDTH(true);
</summary>
	]]

native "_END_TEXT_COMMAND_GET_WIDTH"
	hash "0x85F061DA64ED2F67"
	jhash (0xD12A643A)
	arguments {
		BOOL "p0",
	}
	alias "_GET_TEXT_SCREEN_WIDTH"
	ns "HUD"
	returns	"float"
	doc [[!
<summary>
		Used with _BEGIN_TEXT_COMMAND_WIDTH.

		In scripts, p0 is false when used in combination with "ESMINDOLLA" or "ESDOLLA", otherwise it's true.

		Returns from range 0 to 1.
</summary>
	]]

native "_BEGIN_TEXT_COMMAND_LINE_COUNT"
	hash "0x521FB041D93DD0E4"
	jhash (0x94B82066)
	arguments {
		charPtr "entry",
	}
	alias "_SET_TEXT_GXT_ENTRY"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		get's line count


		int GetLineCount(char *text, float x, float y)
			{
				_BEGIN_TEXT_COMMAND_LINE_COUNT("STRING");
		                ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
				return _END_TEXT_COMMAND_GET_LINE_COUNT(x, y);
			}
</summary>
	]]

native "_GET_TEXT_SCREEN_LINE_COUNT"
	hash "0x9040DFB09BE75706"
	jhash (0xAA318785)
	arguments {
		float "x",

		float "y",
	}
	alias "0x9040DFB09BE75706"
	alias "_END_TEXT_COMMAND_GET_LINE_COUNT"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Determines how many lines the text string will use when drawn on screen. 
		Must use _BEGIN_TEXT_COMMAND_LINE_COUNT for setting up
</summary>
	]]

native "BEGIN_TEXT_COMMAND_DISPLAY_HELP"
	hash "0x8509B634FBE7DA11"
	jhash (0xB245FC10)
	arguments {
		charPtr "inputType",
	}
	alias "_SET_TEXT_COMPONENT_FORMAT"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Used to be known as _SET_TEXT_COMPONENT_FORMAT
</summary>
	]]

native "END_TEXT_COMMAND_DISPLAY_HELP"
	hash "0x238FFE5C7B0498A6"
	jhash (0xB59B530D)
	arguments {
		Any "p0",

		BOOL "loop",

		BOOL "beep",

		int "duration",
	}
	alias "_DISPLAY_HELP_TEXT_FROM_STRING_LABEL"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		-----------
		p3 (duration in MS) was previously mentioned as "shape", but with some more testing it seems that it's more likely to be a duration in MS. (Tested this when not calling it every tick, but instead only once and let it display for the specified duration). 
		-1 seems to be default delay (around 3 seconds), 5000 (ms) seems to be the max. Anything &gt; 5000 will still result in 5 seconds of display time.

		Old p3 (shape) description: "shape goes from -1 to 50 (may be more)."
		--------------

		p0 is always 0.

		Example:
		void FloatingHelpText(char* text)
		{
			BEGIN_TEXT_COMMAND_DISPLAY_HELP("STRING");
			ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
			END_TEXT_COMMAND_DISPLAY_HELP (0, 0, 1, -1);
		}

		Image:
		- imgbin.org/images/26209.jpg

		more inputs/icons:
		- pastebin.com/nqNYWMSB

		Used to be known as _DISPLAY_HELP_TEXT_FROM_STRING_LABEL
</summary>
	]]

native "BEGIN_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED"
	hash "0x0A24DA3A41B718F5"
	jhash (0x00E20F2D)
	arguments {
		charPtr "labelName",
	}
	alias "0x0A24DA3A41B718F5"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		BOOL IsContextActive(char *ctx)
			{
				BEGIN_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(ctx);
				return END_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(0);
			}
</summary>
	]]

native "END_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED"
	hash "0x10BDDBFC529428DD"
	jhash (0xF63A13EC)
	arguments {
		int "p0",
	}
	alias "0x10BDDBFC529428DD"
	ns "HUD"
	returns	"BOOL"

native "BEGIN_TEXT_COMMAND_SET_BLIP_NAME"
	hash "0xF9113A30DE5C6670"
	jhash (0xF4C211F6)
	arguments {
		charPtr "gxtentry",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		example:

		UI::BEGIN_TEXT_COMMAND_SET_BLIP_NAME("STRING");
		UI::_ADD_TEXT_COMPONENT_STRING("Name");
		UI::END_TEXT_COMMAND_SET_BLIP_NAME(blip);
</summary>
	]]

native "END_TEXT_COMMAND_SET_BLIP_NAME"
	hash "0xBC38B49BCB83BC9B"
	jhash (0xE8E59820)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"void"

native "_BEGIN_TEXT_COMMAND_OBJECTIVE"
	hash "0x23D69E0465570028"
	jhash (0x0E103475)
	arguments {
		charPtr "p0",
	}
	alias "0x23D69E0465570028"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		nothin doin. 

		void message()
			{
				_BEGIN_TEXT_COMMAND_OBJECTIVE("AHT_RTIT");
				_END_TEXT_COMMAND_OBJECTIVE(0);
			}
</summary>
	]]

native "_END_TEXT_COMMAND_OBJECTIVE"
	hash "0xCFDBDF5AE59BA0F4"
	jhash (0x2944A6C5)
	arguments {
		BOOL "p0",
	}
	alias "0xCFDBDF5AE59BA0F4"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		p0 is always false in scripts.
</summary>
	]]

native "BEGIN_TEXT_COMMAND_CLEAR_PRINT"
	hash "0xE124FA80A759019C"
	jhash (0x550665AE)
	arguments {
		charPtr "text",
	}
	alias "0xE124FA80A759019C"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		clears a print text command with this text
</summary>
	]]

native "END_TEXT_COMMAND_CLEAR_PRINT"
	hash "0xFCC75460ABA29378"
	jhash (0x67785AF2)
	alias "0xFCC75460ABA29378"
	ns "HUD"
	returns	"void"

native "_BEGIN_TEXT_COMMAND_TIMER"
	hash "0x8F9EE5687F8EECCD"
	jhash (0xBF855650)
	arguments {
		charPtr "p0",
	}
	alias "0x8F9EE5687F8EECCD"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
			void message(char *text)
			{
				_BEGIN_TEXT_COMMAND_TIMER("STRING");
				ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
				_END_TEXT_COMMAND_TIMER(0);
			}
</summary>
	]]

native "_END_TEXT_COMMAND_TIMER"
	hash "0xA86911979638106F"
	jhash (0x6E7FDA1C)
	arguments {
		BOOL "p0",
	}
	alias "0xA86911979638106F"
	ns "HUD"
	returns	"void"

native "ADD_TEXT_COMPONENT_INTEGER"
	hash "0x03B504CF259931BC"
	jhash (0xFE272A57)
	arguments {
		int "value",
	}
	ns "HUD"
	returns	"void"

native "ADD_TEXT_COMPONENT_FLOAT"
	hash "0xE7DCB5B874BCD96E"
	jhash (0x24D78013)
	arguments {
		float "value",

		int "decimalPlaces",
	}
	ns "HUD"
	returns	"void"

native "ADD_TEXT_COMPONENT_SUBSTRING_TEXT_LABEL"
	hash "0xC63CD5D2920ACBE7"
	jhash (0xDCE05406)
	arguments {
		charPtr "labelName",
	}
	alias "_ADD_TEXT_COMPONENT_ITEM_STRING"
	ns "HUD"
	returns	"void"

native "ADD_TEXT_COMPONENT_SUBSTRING_TEXT_LABEL_HASH_KEY"
	hash "0x17299B63C7683A2B"
	jhash (0x150E03B6)
	arguments {
		Hash "gxtEntryHash",
	}
	alias "0x17299B63C7683A2B"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		It adds the localized text of the specified GXT entry name. Eg. if the argument is GET_HASH_KEY("ES_HELP"), adds "Continue". Just uses a text labels hash key
</summary>
	]]

native "ADD_TEXT_COMPONENT_SUBSTRING_BLIP_NAME"
	hash "0x80EAD8E2E1D5D52E"
	jhash (0x5DE98F0A)
	arguments {
		Blip "blip",
	}
	alias "0x80EAD8E2E1D5D52E"
	ns "HUD"
	returns	"void"

native "ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME"
	hash "0x6C188BE134E074AA"
	jhash (0x27A244D8)
	arguments {
		charPtr "text",
	}
	alias "_ADD_TEXT_COMPONENT_STRING"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		• Description :

		 Processes a string and removes the player name(max len 99)
		 You can use this function to create notifications/subtitles
		--------------------------------------------------------------------
		• Usage(Colors) :

		 ~r~ = red
		 ~y~ = yellow
		 ~g~ = green
		 ~b~ = light blue
		 ~w~ = white
		 ~p~ = purple
		 ~n~ = new line

		--------------------------------------------------------------------
		• Usage(Input) :
		~INPUT_CONTEXT~ will show button symbol (regarding last input device -&gt; keyboard/gamepad)
		example:
		string info = "Context action is assigned to ~INPUT_CONTEXT~!";

		--------------------------------------------------------------------
		• Example (C++):

		void ShowNotification(char *text)  
		{ 
		        UI::_SET_NOTIFICATION_TEXT_ENTRY("STRING"); 
		        UI::ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text); 
		        UI::_DRAW_NOTIFICATION(FALSE, FALSE); // if first param = 1, the message flashes 1 or 2 times
		}

		• Colors example : 

		string red = "~r~Red test";
		string white_and_yellow = "~w~White and ~y~yellow";
		string text_with_double_line = "First line.~n~Second line";

		This native (along with 0x5F68520888E69014 and 0x94CF4AC034C9C986) do not actually filter anything. They simply add the provided text (as of 944)

		Used to be known as _ADD_TEXT_COMPONENT_STRING
</summary>
	]]

native "ADD_TEXT_COMPONENT_SUBSTRING_TIME"
	hash "0x1115F16B8AB9E8BF"
	jhash (0x135B3CD0)
	arguments {
		int "timestamp",

		int "flags",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Adds a timer (e.g. "00:00:00:000"). The appearance of the timer depends on the flags, which needs more research.
</summary>
	]]

native "ADD_TEXT_COMPONENT_FORMATTED_INTEGER"
	hash "0x0E4C749FF9DE9CC4"
	jhash (0x12929BDF)
	arguments {
		int "value",

		BOOL "commaSeparated",
	}
	alias "0x0E4C749FF9DE9CC4"
	ns "HUD"
	returns	"void"

native "_ADD_TEXT_COMPONENT_APP_TITLE"
	hash "0x761B77454205A61D"
	jhash (0x65E1D404)
	arguments {
		charPtr "p0",

		int "p1",
	}
	alias "0x761B77454205A61D"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		p1 was always -1.
		used for phone applications; scaleform
</summary>
	]]

native "ADD_TEXT_COMPONENT_SUBSTRING_WEBSITE"
	hash "0x94CF4AC034C9C986"
	jhash (0xC736999E)
	arguments {
		charPtr "website",
	}
	alias "_ADD_TEXT_COMPONENT_STRING2"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		This native (along with 0x5F68520888E69014 and 0x6C188BE134E074AA) do not actually filter anything. They simply add the provided text (as of 944)
</summary>
	]]

native "_ADD_TEXT_COMPONENT_SCALEFORM"
	hash "0x5F68520888E69014"
	jhash (0x0829A799)
	arguments {
		charPtr "p0",
	}
	alias "_ADD_TEXT_COMPONENT_STRING3"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		This native (along with 0x6C188BE134E074AA and 0x94CF4AC034C9C986) do not actually filter anything. They simply add the provided text (as of 944)

		did you even check the disassembly?

		&gt; Do you even lift bro? The PLAYER_NAME and WEBSITE natives are the correct names, it doesn't matter if they're filtered or not. Blame R* for that matter. Hashes don't lie, and it's extremely unlikely the validated names are collisions (what are the odds??)
</summary>
	]]

native "_SET_NOTIFICATION_COLOR_NEXT"
	hash "0x39BBF623FC803EAC"
	jhash (0x6F1A1901)
	arguments {
		int "hudIndex",
	}
	alias "0x39BBF623FC803EAC"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		sets font color for the next notification
</summary>
	]]

native "_GET_TEXT_SUBSTRING"
	hash "0x169BD9382084C8C0"
	jhash (0x34A396EE)
	arguments {
		charPtr "text",

		int "position",

		int "length",
	}
	ns "HUD"
	returns	"charPtr"
	doc [[!
<summary>
		Returns a substring of a specified length starting at a specified position.

		Example:
		// Get "STRING" text from "MY_STRING"
		subStr = UI::_GET_TEXT_SUBSTRING("MY_STRING", 3, 6);
</summary>
	]]

native "_GET_TEXT_SUBSTRING_SAFE"
	hash "0xB2798643312205C5"
	jhash (0x0183A66C)
	arguments {
		charPtr "text",

		int "position",

		int "length",

		int "maxLength",
	}
	ns "HUD"
	returns	"charPtr"
	doc [[!
<summary>
		Returns a substring of a specified length starting at a specified position. The result is guaranteed not to exceed the specified max length.

		NOTE: The 'maxLength' parameter might actually be the size of the buffer that is returned. More research is needed. -CL69

		Example:
		// Condensed example of how Rockstar uses this function
		strLen = UI::GET_LENGTH_OF_LITERAL_STRING(GAMEPLAY::GET_ONSCREEN_KEYBOARD_RESULT());
		subStr = UI::_GET_TEXT_SUBSTRING_SAFE(GAMEPLAY::GET_ONSCREEN_KEYBOARD_RESULT(), 0, strLen, 63);

		--

		"fm_race_creator.ysc", line 85115:
		// parameters modified for clarity
		BOOL sub_8e5aa(char *text, int length) {
		    for (i = 0; i &lt;= (length - 2); i += 1) {
		        if (!GAMEPLAY::ARE_STRINGS_EQUAL(UI::_GET_TEXT_SUBSTRING_SAFE(text, i, i + 1, 1), " ")) {
		            return FALSE;
		        }
		    }
		    return TRUE;
		}
</summary>
	]]

native "_GET_TEXT_SUBSTRING_SLICE"
	hash "0xCE94AEBA5D82908A"
	jhash (0xFA6373BB)
	arguments {
		charPtr "text",

		int "startPosition",

		int "endPosition",
	}
	ns "HUD"
	returns	"charPtr"
	doc [[!
<summary>
		Returns a substring that is between two specified positions. The length of the string will be calculated using (endPosition - startPosition).

		Example:
		// Get "STRING" text from "MY_STRING"
		subStr = UI::_GET_TEXT_SUBSTRING_SLICE("MY_STRING", 3, 9);
		// Overflows are possibly replaced with underscores (needs verification)
		subStr = UI::_GET_TEXT_SUBSTRING_SLICE("MY_STRING", 3, 10); // "STRING_"?
</summary>
	]]

native "_GET_LABEL_TEXT"
	hash "0x7B5280EBA9840C72"
	jhash (0x95C4B5AD)
	arguments {
		charPtr "labelName",
	}
	ns "HUD"
	returns	"charPtr"
	doc [[!
<summary>
		Gets a string literal from a label name.
</summary>
	]]

native "CLEAR_PRINTS"
	hash "0xCC33FA791322B9D9"
	jhash (0x216CB1C5)
	ns "HUD"
	returns	"void"

native "CLEAR_BRIEF"
	hash "0x9D292F73ADBD9313"
	jhash (0x9F75A929)
	ns "HUD"
	returns	"void"

native "CLEAR_ALL_HELP_MESSAGES"
	hash "0x6178F68A87A4D3A0"
	jhash (0x9E5D9198)
	ns "HUD"
	returns	"void"

native "CLEAR_THIS_PRINT"
	hash "0xCF708001E1E536DD"
	jhash (0x06878327)
	arguments {
		charPtr "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		p0: found arguments in the b617d scripts: pastebin.com/X5akCN7z
</summary>
	]]

native "CLEAR_SMALL_PRINTS"
	hash "0x2CEA2839313C09AC"
	jhash (0xA869A238)
	ns "HUD"
	returns	"void"

native "DOES_TEXT_BLOCK_EXIST"
	hash "0x1C7302E725259789"
	jhash (0x96F74838)
	arguments {
		charPtr "gxt",
	}
	ns "HUD"
	returns	"BOOL"

native "REQUEST_ADDITIONAL_TEXT"
	hash "0x71A78003C8E71424"
	jhash (0x9FA9175B)
	arguments {
		charPtr "gxt",

		int "slot",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Request a gxt into the passed slot.
</summary>
	]]

native "_REQUEST_ADDITIONAL_TEXT_2"
	hash "0x6009F9F1AE90D8A6"
	jhash (0xF4D27EBE)
	arguments {
		charPtr "gxt",

		int "slot",
	}
	ns "HUD"
	returns	"void"

native "HAS_ADDITIONAL_TEXT_LOADED"
	hash "0x02245FE4BED318B8"
	jhash (0xB0E56045)
	arguments {
		int "slot",
	}
	ns "HUD"
	returns	"BOOL"

native "CLEAR_ADDITIONAL_TEXT"
	hash "0x2A179DF17CCF04CD"
	jhash (0x518141E0)
	arguments {
		int "p0",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"

native "IS_STREAMING_ADDITIONAL_TEXT"
	hash "0x8B6817B71B85EBF0"
	jhash (0xF079E4EB)
	arguments {
		int "p0",
	}
	ns "HUD"
	returns	"BOOL"

native "HAS_THIS_ADDITIONAL_TEXT_LOADED"
	hash "0xADBF060E2B30C5BC"
	jhash (0x80A52040)
	arguments {
		charPtr "gxt",

		int "slot",
	}
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if the specified gxt has loaded into the passed slot.
</summary>
	]]

native "IS_MESSAGE_BEING_DISPLAYED"
	hash "0x7984C03AA5CC2F41"
	jhash (0x6A77FE8D)
	ns "HUD"
	returns	"BOOL"

native "DOES_TEXT_LABEL_EXIST"
	hash "0xAC09CA973C564252"
	jhash (0x6ECAE560)
	arguments {
		charPtr "gxt",
	}
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		Checks if the passed gxt name exists in the game files.
</summary>
	]]

native "GET_LENGTH_OF_STRING_WITH_THIS_TEXT_LABEL"
	hash "0x801BD273D3A23F74"
	jhash (0xA4CA7BE5)
	arguments {
		charPtr "gxt",
	}
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Returns the string length of the string from the gxt string .
</summary>
	]]

native "GET_LENGTH_OF_LITERAL_STRING"
	hash "0xF030907CCBB8A9FD"
	jhash (0x99379D55)
	arguments {
		charPtr "string",
	}
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Returns the length of the string passed (much like strlen).
</summary>
	]]

native "_GET_LENGTH_OF_STRING"
	hash "0x43E4111189E54F0E"
	jhash (0x7DBC0764)
	arguments {
		charPtr "STRING",
	}
	alias "0x43E4111189E54F0E"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		gets the length of a null terminated string, without checking unicode encodings
</summary>
	]]

native "GET_STREET_NAME_FROM_HASH_KEY"
	hash "0xD0EF8A959B8A4CB9"
	jhash (0x1E8E310C)
	arguments {
		Hash "hash",
	}
	ns "HUD"
	returns	"charPtr"
	doc [[!
<summary>
		This functions converts the hash of a street name into a readable string.

		For how to get the hashes, see PATHFIND::GET_STREET_NAME_AT_COORD.
</summary>
	]]

native "IS_HUD_PREFERENCE_SWITCHED_ON"
	hash "0x1930DFA731813EC4"
	jhash (0xC3BC1B4F)
	ns "HUD"
	returns	"BOOL"

native "IS_RADAR_PREFERENCE_SWITCHED_ON"
	hash "0x9EB6522EA68F22FE"
	jhash (0x14AEAA28)
	ns "HUD"
	returns	"BOOL"

native "IS_SUBTITLE_PREFERENCE_SWITCHED_ON"
	hash "0xAD6DACA4BA53E0A4"
	jhash (0x63BA19F5)
	ns "HUD"
	returns	"BOOL"

native "DISPLAY_HUD"
	hash "0xA6294919E56FF02A"
	jhash (0xD10E4E31)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		If Hud should be displayed
</summary>
	]]

native "0x7669F9E39DC17063"
	hash "0x7669F9E39DC17063"
	jhash (0xC380AC85)
	ns "HUD"
	returns	"void"

native "0x402F9ED62087E898"
	hash "0x402F9ED62087E898"
	jhash (0xC47AB1B0)
	ns "HUD"
	returns	"void"

native "DISPLAY_RADAR"
	hash "0xA0EBB943C300E693"
	jhash (0x52816BD4)
	arguments {
		BOOL "Toggle",
	}
	ns "HUD"
	returns	"Any"
	doc [[!
<summary>
		If Minimap / Radar should be displayed.
</summary>
	]]

native "IS_HUD_HIDDEN"
	hash "0xA86478C6958735C5"
	jhash (0x40BADA1D)
	ns "HUD"
	returns	"BOOL"

native "IS_RADAR_HIDDEN"
	hash "0x157F93B036700462"
	jhash (0x1AB3B954)
	ns "HUD"
	returns	"BOOL"

native "_IS_RADAR_ENABLED"
	hash "0xAF754F20EB5CD51A"
	alias "0xAF754F20EB5CD51A"
	ns "HUD"
	returns	"BOOL"

native "SET_BLIP_ROUTE"
	hash "0x4F7D8A9BFB0B43E9"
	jhash (0x3E160C90)
	arguments {
		Blip "blip",

		BOOL "enabled",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Enable / disable showing route for the Blip-object.
</summary>
	]]

native "SET_BLIP_ROUTE_COLOUR"
	hash "0x837155CD2F63DA09"
	jhash (0xDDE7C65C)
	arguments {
		Blip "blip",

		int "colour",
	}
	ns "HUD"
	returns	"void"

native "ADD_NEXT_MESSAGE_TO_PREVIOUS_BRIEFS"
	hash "0x60296AF4BA14ABC5"
	jhash (0xB58B25BD)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		hash collision?
</summary>
	]]

native "0x57D760D55F54E071"
	hash "0x57D760D55F54E071"
	jhash (0x9854485F)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "RESPONDING_AS_TEMP"
	hash "0xBD12C5EEE184C337"
	jhash (0xDCA3F423)
	arguments {
		float "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Please change back to _0xBD12C5EEE184C33 (hash collision)
		actual native starts with SET_RADAR_ZOOM_...
</summary>
	]]

native "SET_RADAR_ZOOM"
	hash "0x096EF57A0C999BBA"
	jhash (0x2A50D1A6)
	arguments {
		int "zoomLevel",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		zoomLevel ranges from 0 to 200 
</summary>
	]]

native "0xF98E4B3E56AFC7B1"
	hash "0xF98E4B3E56AFC7B1"
	jhash (0x25EC28C0)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "HUD"
	returns	"void"

native "_SET_RADAR_ZOOM_LEVEL_THIS_FRAME"
	hash "0xCB7CC0D58405AD41"
	jhash (0x09CF1CE5)
	arguments {
		float "zoomLevel",
	}
	ns "HUD"
	returns	"void"

native "0xD2049635DEB9C375"
	hash "0xD2049635DEB9C375"
	jhash (0xE8D3A910)
	ns "HUD"
	returns	"void"

native "GET_HUD_COLOUR"
	hash "0x7C9C91AB74A0360F"
	jhash (0x63F66A0B)
	arguments {
		int "hudColorIndex",

		intPtr "r",

		intPtr "g",

		intPtr "b",

		intPtr "a",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		HUD colors and their values: pastebin.com/d9aHPbXN
</summary>
	]]

native "0xD68A5FF8A3A89874"
	hash "0xD68A5FF8A3A89874"
	jhash (0x0E41E45C)
	arguments {
		int "r",

		int "g",

		int "b",

		int "a",
	}
	ns "HUD"
	returns	"void"

native "0x16A304E6CB2BFAB9"
	hash "0x16A304E6CB2BFAB9"
	jhash (0x6BE3ACA8)
	arguments {
		int "r",

		int "g",

		int "b",

		int "a",
	}
	ns "HUD"
	returns	"void"

native "_SET_HUD_COLOURS_SWITCH"
	hash "0x1CCC708F0F850613"
	jhash (0x3B216749)
	arguments {
		int "hudColorIndex",

		int "hudColorIndex2",
	}
	alias "0x1CCC708F0F850613"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		HUD colors and their values: pastebin.com/d9aHPbXN
		--------------------------------------------------
		makes hudColorIndex2 color into hudColorIndex color
</summary>
	]]

native "_SET_HUD_COLOUR"
	hash "0xF314CF4F0211894E"
	jhash (0xF6E7E92B)
	arguments {
		int "hudColorIndex",

		int "r",

		int "g",

		int "b",

		int "a",
	}
	alias "0xF314CF4F0211894E"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		HUD colors and their values: pastebin.com/d9aHPbXN
</summary>
	]]

native "FLASH_ABILITY_BAR"
	hash "0x02CFBA0C9E9275CE"
	jhash (0x3648960D)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		If set to true ability bar will flash
</summary>
	]]

native "SET_ABILITY_BAR_VALUE"
	hash "0x9969599CCFF5D85E"
	jhash (0x24E53FD8)
	arguments {
		float "value",

		float "maxValue",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		If 'value' is 50 and 'maxValue' is 100, the bar is halfway filled.
		Same with 5/10, 2/4, etc.
</summary>
	]]

native "FLASH_WANTED_DISPLAY"
	hash "0xA18AFB39081B6A1F"
	jhash (0x629F866B)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"Any"

native "0xBA8D65C1C65702E5"
	hash "0xBA8D65C1C65702E5"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "_GET_TEXT_SCALE_HEIGHT"
	hash "0xDB88A37483346780"
	jhash (0x3330175B)
	arguments {
		float "size",

		int "font",
	}
	alias "0xDB88A37483346780"
	ns "HUD"
	returns	"float"
	doc [[!
<summary>
		This get's the height of the FONT and not the total text. You need to get the number of lines your text uses, and get the height of a newline (I'm using a smaller value) to get the total text height.
</summary>
	]]

native "SET_TEXT_SCALE"
	hash "0x07C837F9A01C34C9"
	jhash (0xB6E15B23)
	arguments {
		float "scale",

		float "size",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Size range : 0f to 1.0f
</summary>
	]]

native "SET_TEXT_COLOUR"
	hash "0xBE6B23FFA53FB442"
	jhash (0xE54DD2C8)
	arguments {
		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "HUD"
	returns	"void"

native "SET_TEXT_CENTRE"
	hash "0xC02F4DBFB51D988B"
	jhash (0xE26D39A1)
	arguments {
		BOOL "align",
	}
	ns "HUD"
	returns	"void"

native "SET_TEXT_RIGHT_JUSTIFY"
	hash "0x6B3C4650BC8BEE47"
	jhash (0x45B60520)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "SET_TEXT_JUSTIFICATION"
	hash "0x4E096588B13FFECA"
	jhash (0x68CDFA60)
	arguments {
		int "justifyType",
	}
	alias "0x4E096588B13FFECA"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Types -
		0: Center-Justify
		1: Left-Justify
		2: Right-Justify

		Right-Justify requires SET_TEXT_WRAP, otherwise it will draw to the far right of the screen
</summary>
	]]

native "SET_TEXT_WRAP"
	hash "0x63145D9C883A1A70"
	jhash (0x6F60AB54)
	arguments {
		float "start",

		float "end",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		It sets the text in a specified box and wraps the text if it exceeds the boundries. Both values are for X axis. Useful when positioning text set to center or aligned to the right.

		start - left boundry on screen position (0.0 - 1.0)
		end - right boundry on screen position (0.0 - 1.0)
</summary>
	]]

native "SET_TEXT_LEADING"
	hash "0xA50ABC31E3CDFAFF"
	jhash (0x98CE21D4)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		from script am_mp_yacht.c int?
		ui::set_text_leading(2);
</summary>
	]]

native "SET_TEXT_PROPORTIONAL"
	hash "0x038C1F517D7FDCF8"
	jhash (0xF49D8A08)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "SET_TEXT_FONT"
	hash "0x66E0276CC5F6B9DA"
	jhash (0x80BC530D)
	arguments {
		int "fontType",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		fonts that mess up your text where made for number values/misc stuff
</summary>
	]]

native "SET_TEXT_DROP_SHADOW"
	hash "0x1CA3E9EAC9D93E5E"
	jhash (0xE2A11511)
	ns "HUD"
	returns	"void"

native "SET_TEXT_DROPSHADOW"
	hash "0x465C84BC39F1C351"
	jhash (0xE6587517)
	arguments {
		int "distance",

		int "r",

		int "g",

		int "b",

		int "a",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		distance - shadow distance in pixels, both horizontal and vertical
		r, g, b, a 
</summary>
	]]

native "SET_TEXT_OUTLINE"
	hash "0x2513DFB0FB8400FE"
	jhash (0xC753412F)
	ns "HUD"
	returns	"void"

native "SET_TEXT_EDGE"
	hash "0x441603240D202FA6"
	jhash (0x3F1A5DAB)
	arguments {
		int "p0",

		int "r",

		int "g",

		int "b",

		int "a",
	}
	ns "HUD"
	returns	"void"

native "SET_TEXT_RENDER_ID"
	hash "0x5F15302936E07111"
	jhash (0xC5C3B7F3)
	arguments {
		int "renderId",
	}
	ns "HUD"
	returns	"void"

native "GET_DEFAULT_SCRIPT_RENDERTARGET_RENDER_ID"
	hash "0x52F0982D7FD156B6"
	jhash (0x8188935F)
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		This function is hard-coded to always return 1.
</summary>
	]]

native "REGISTER_NAMED_RENDERTARGET"
	hash "0x57D9C12635E25CE3"
	jhash (0xFAE5D6F0)
	arguments {
		charPtr "p0",

		BOOL "p1",
	}
	ns "HUD"
	returns	"BOOL"

native "IS_NAMED_RENDERTARGET_REGISTERED"
	hash "0x78DCDC15C9F116B4"
	jhash (0x284057F5)
	arguments {
		charPtr "p0",
	}
	ns "HUD"
	returns	"BOOL"

native "RELEASE_NAMED_RENDERTARGET"
	hash "0xE9F6FFE837354DD4"
	jhash (0xD3F6C892)
	arguments {
		AnyPtr "p0",
	}
	ns "HUD"
	returns	"BOOL"

native "LINK_NAMED_RENDERTARGET"
	hash "0xF6C09E276AEB3F2D"
	jhash (0x6844C4B9)
	arguments {
		Hash "hash",
	}
	ns "HUD"
	returns	"void"

native "GET_NAMED_RENDERTARGET_RENDER_ID"
	hash "0x1A6478B61C6BDC3B"
	jhash (0xF9D7A401)
	arguments {
		charPtr "p0",
	}
	ns "HUD"
	returns	"Any"

native "IS_NAMED_RENDERTARGET_LINKED"
	hash "0x113750538FA31298"
	jhash (0x8B52601F)
	arguments {
		Hash "hash",
	}
	ns "HUD"
	returns	"BOOL"

native "CLEAR_HELP"
	hash "0x8DFCED7A656F8802"
	jhash (0xE6D85741)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "IS_HELP_MESSAGE_ON_SCREEN"
	hash "0xDAD37F45428801AE"
	jhash (0x4B3C9CA9)
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		Doesn't appear to work, use IS_HELP_MESSAGE_BEING_DISPLAYED instead
</summary>
	]]

native "0x214CD562A939246A"
	hash "0x214CD562A939246A"
	jhash (0x812CBE0E)
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		example

		if (UI::IS_HELP_MESSAGE_BEING_DISPLAYED()&amp;&amp;(!UI::_214CD562A939246A())) {
		        return 0;
		}
</summary>
	]]

native "IS_HELP_MESSAGE_BEING_DISPLAYED"
	hash "0x4D79439A6B55AC67"
	jhash (0xA65F262A)
	ns "HUD"
	returns	"BOOL"

native "IS_HELP_MESSAGE_FADING_OUT"
	hash "0x327EDEEEAC55C369"
	jhash (0x3E50AE92)
	ns "HUD"
	returns	"BOOL"

native "0x4A9923385BDB9DAD"
	hash "0x4A9923385BDB9DAD"
	jhash (0x87871CE0)
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		example:

		if (!((v_7)==UI::_4A9923385BDB9DAD())) {
		        UI::SET_BLIP_SPRITE((v_6), (v_7));
		    }


		This function is hard-coded to always return 1.
</summary>
	]]

native "_GET_BLIP_INFO_ID_ITERATOR"
	hash "0x186E5D252FA50E7D"
	jhash (0xB9827942)
	ns "HUD"
	returns	"int"

native "GET_NUMBER_OF_ACTIVE_BLIPS"
	hash "0x9A3FF3DE163034E8"
	jhash (0x144020FA)
	ns "HUD"
	returns	"int"

native "GET_NEXT_BLIP_INFO_ID"
	hash "0x14F96AA50D6FBEA7"
	jhash (0x9356E92F)
	arguments {
		int "blipSprite",
	}
	ns "HUD"
	returns	"Blip"

native "GET_FIRST_BLIP_INFO_ID"
	hash "0x1BEDE233E6CD2A1F"
	jhash (0x64C0273D)
	arguments {
		int "blipSprite",
	}
	ns "HUD"
	returns	"Blip"
	doc [[!
<summary>
		8 = waypoint
</summary>
	]]

native "GET_BLIP_INFO_ID_COORD"
	hash "0xFA7C7F0AADF25D09"
	jhash (0xB7374A66)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"Vector3"

native "GET_BLIP_INFO_ID_DISPLAY"
	hash "0x1E314167F701DC3B"
	jhash (0xD0FC19F4)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"int"

native "GET_BLIP_INFO_ID_TYPE"
	hash "0xBE9B0959FFD0779B"
	jhash (0x501D7B4E)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Returns a value based on what the blip is attached to
		1 
		2 
		3 
		4 
		5 
		6 
		7 
</summary>
	]]

native "GET_BLIP_INFO_ID_ENTITY_INDEX"
	hash "0x4BA4E2553AFEDC2C"
	jhash (0xA068C40B)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"Entity"
	doc [[!
<summary>

</summary>
	]]

native "GET_BLIP_INFO_ID_PICKUP_INDEX"
	hash "0x9B6786E4C03DD382"
	jhash (0x86913D37)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"Pickup"
	doc [[!
<summary>
		This function is hard-coded to always return 0.
</summary>
	]]

native "GET_BLIP_FROM_ENTITY"
	hash "0xBC8DBDCA2436F7E8"
	jhash (0x005A2A47)
	arguments {
		Entity "entity",
	}
	ns "HUD"
	returns	"Blip"
	doc [[!
<summary>
		Returns the Blip handle of given Entity.
</summary>
	]]

native "ADD_BLIP_FOR_RADIUS"
	hash "0x46818D79B1F7499A"
	jhash (0x4626756C)
	arguments {
		float "posX",

		float "posY",

		float "posZ",

		float "radius",
	}
	ns "HUD"
	returns	"Blip"

native "ADD_BLIP_FOR_ENTITY"
	hash "0x5CDE92C702A8FCE7"
	jhash (0x30822554)
	arguments {
		Entity "entity",
	}
	ns "HUD"
	returns	"Blip"
	doc [[!
<summary>
		Returns red ( default ) blip attached to entity.

		Example:
		Blip blip; //Put this outside your case or option
		blip = UI::ADD_BLIP_FOR_ENTITY(YourPedOrBodyguardName);
		UI::SET_BLIP_AS_FRIENDLY(blip, true);
</summary>
	]]

native "ADD_BLIP_FOR_PICKUP"
	hash "0xBE339365C863BD36"
	jhash (0x16693C3A)
	arguments {
		Pickup "pickup",
	}
	ns "HUD"
	returns	"Blip"

native "ADD_BLIP_FOR_COORD"
	hash "0x5A039BB0BCA604B6"
	jhash (0xC6F43D0E)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "HUD"
	returns	"Blip"
	doc [[!
<summary>
		Creates an orange ( default ) Blip-object. Returns a Blip-object which can then be modified.
</summary>
	]]

native "0x72DD432F3CDFC0EE"
	hash "0x72DD432F3CDFC0EE"
	jhash (0xBF25E7B2)
	arguments {
		float "posX",

		float "posY",

		float "posZ",

		float "radius",

		int "p4",
	}
	ns "HUD"
	returns	"void"

native "0x60734CC207C9833C"
	hash "0x60734CC207C9833C"
	jhash (0xE7E1E32B)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_COORDS"
	hash "0xAE2AF67E9D9AF65D"
	jhash (0x680A34D4)
	arguments {
		Blip "blip",

		float "posX",

		float "posY",

		float "posZ",
	}
	ns "HUD"
	returns	"void"

native "GET_BLIP_COORDS"
	hash "0x586AFE3FF72D996E"
	jhash (0xEF6FF47B)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"Vector3"

native "SET_BLIP_SPRITE"
	hash "0xDF735600A4696DAF"
	jhash (0x8DBBB0B9)
	arguments {
		Blip "blip",

		int "spriteId",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Takes a blip object and adds a sprite to it on the map.

		You may have your own list, but since dev-c didn't show it I was bored and started looking through scripts and functions to get a presumable almost positive list of a majority of blip IDs
		h t t p://pastebin.com/Bpj9Sfft

		Blips Images + IDs:
		gtaxscripting.blogspot.com/2016/05/gta-v-blips-id-and-image.html
</summary>
	]]

native "GET_BLIP_SPRITE"
	hash "0x1FC877464A04FC4F"
	jhash (0x72FF2E73)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Blips Images + IDs:
		gtaxscripting.blogspot.com/2016/05/gta-v-blips-id-and-image.html
</summary>
	]]

native "SET_BLIP_NAME_FROM_TEXT_FILE"
	hash "0xEAA0FFE120D92784"
	jhash (0xAC8A5461)
	arguments {
		Blip "blip",

		charPtr "gxtEntry",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Doesn't work if the label text of gxtEntry is &gt;= 80.
</summary>
	]]

native "SET_BLIP_NAME_TO_PLAYER_NAME"
	hash "0x127DE7B20C60A6A3"
	jhash (0x03A0B8F9)
	arguments {
		Blip "blip",

		Player "player",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_ALPHA"
	hash "0x45FF974EEE1C8734"
	jhash (0xA791FCCD)
	arguments {
		Blip "blip",

		int "alpha",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Sets alpha-channel for blip color.

		Example:

		Blip blip = UI::ADD_BLIP_FOR_ENTITY(entity);
		UI::SET_BLIP_COLOUR(blip , 3);
		UI::SET_BLIP_ALPHA(blip , 64);

</summary>
	]]

native "GET_BLIP_ALPHA"
	hash "0x970F608F0EE6C885"
	jhash (0x297AF6C8)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"int"

native "SET_BLIP_FADE"
	hash "0x2AEE8F8390D2298C"
	jhash (0xA5999031)
	arguments {
		Blip "blip",

		int "opacity",

		int "duration",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_ROTATION"
	hash "0xF87683CDF73C3F6E"
	jhash (0x6B8F44FE)
	arguments {
		Blip "blip",

		int "rotation",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		After some testing, looks like you need to use UI:CEIL() on the rotation (vehicle/ped heading) before using it there.
</summary>
	]]

native "SET_BLIP_FLASH_TIMER"
	hash "0xD3CD6FD297AE87CC"
	jhash (0x8D5DF611)
	arguments {
		Blip "blip",

		int "duration",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Adds up after viewing multiple R* scripts. I believe that the duration is in miliseconds.
</summary>
	]]

native "SET_BLIP_FLASH_INTERVAL"
	hash "0xAA51DB313C010A7E"
	jhash (0xEAF67377)
	arguments {
		Blip "blip",

		Any "p1",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_COLOUR"
	hash "0x03D7FB09E75D6B7E"
	jhash (0xBB3C5A41)
	arguments {
		Blip "blip",

		int "color",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		(Hex code are approximate)
		0: White (#fefefe)
		1: Red (#e03232)
		2: Green (#71cb71)
		3: Blue (#5db6e5)
		4: White (#fefefe)
		5: Taxi Yellow (#eec64e)
		6: Light Red (#c25050)
		7: Violet (#9c6eaf)
		8: Pink (#fe7ac3)
		9: Light Orange (#f59d79)
		10: Light Brown (#b18f83)
		11: Light Green (#8dcea7)
		12: Light Blue (Teal) (#70a8ae)
		13: Very Light Purple (#d3d1e7)
		14: Dark Purple (#8f7e98)
		15: Cyan (#6ac4bf)
		16: Light Yellow (#d5c398)
		17: Orange (#ea8e50)
		18: Light Blue (#97cae9)
		19: Dark Pink (#b26287)
		20: Dark Yellow (#8f8d79)
		21: Dark Orange (#a6755e)
		22: Light Gray (#afa8a8)
		23: Light Pink (#e78d9a)
		24: Lemon Green (#bbd65b)
		25: Forest Green (#0c7b56)
		26: Electric Blue (#7ac3fe)
		27: Bright Purple (#ab3ce6)
		28: Dark Taxi Yellow (#cda80c)
		29: Dark Blue (#4561ab)
		30: Dark Cyan (#29a5b8)
		31: Light Brown (#b89b7b)
		32: Very Light Blue (#c8e0fe)
		33: Light Yellow (#f0f096)
		34: Light Pink (#ed8ca1)
		35: Light Red (#f98a8a)
		36: Light Yellow (#fbeea5)
		37: White (#fefefe)
		38: Blue (#2c6db8)
		39: Light Gray (#9a9a9a)
		40: Dark Gray (#4c4c4c)

		Certainly a lot more remaining.
</summary>
	]]

native "SET_BLIP_SECONDARY_COLOUR"
	hash "0x14892474891E09EB"
	jhash (0xC6384D32)
	arguments {
		Blip "blip",

		float "r",

		float "g",

		float "b",
	}
	ns "HUD"
	returns	"void"

native "GET_BLIP_COLOUR"
	hash "0xDF729E8D20CF7327"
	jhash (0xDD6A1E54)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"int"

native "GET_BLIP_HUD_COLOUR"
	hash "0x729B5F1EFBC0AAEE"
	jhash (0xE88B4BC2)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"int"

native "IS_BLIP_SHORT_RANGE"
	hash "0xDA5F8727EB75B926"
	jhash (0x1226765A)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"BOOL"

native "IS_BLIP_ON_MINIMAP"
	hash "0xE41CA53051197A27"
	jhash (0x258CBA3A)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"BOOL"

native "0xDD2238F57B977751"
	hash "0xDD2238F57B977751"
	jhash (0x3E47F357)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"BOOL"

native "0x54318C915D27E4CE"
	hash "0x54318C915D27E4CE"
	jhash (0x43996428)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_HIGH_DETAIL"
	hash "0xE2590BC29220CEBB"
	jhash (0xD5842BFF)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_AS_MISSION_CREATOR_BLIP"
	hash "0x24AC0137444F9FD5"
	jhash (0x802FB686)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "IS_MISSION_CREATOR_BLIP"
	hash "0x26F49BF3381D933D"
	jhash (0x24ACC4E9)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"BOOL"

native "DISABLE_BLIP_NAME_FOR_VAR"
	hash "0x5C90988E7C8E1AF4"
	jhash (0xFFD7476C)
	ns "HUD"
	returns	"Blip"
	doc [[!
<summary>
		Hash collision!!! 

		Returns a blip handle.
</summary>
	]]

native "0x4167EFE0527D706E"
	hash "0x4167EFE0527D706E"
	jhash (0xC5EB849A)
	ns "HUD"
	returns	"BOOL"

native "0xF1A6C18B35BCADE6"
	hash "0xF1A6C18B35BCADE6"
	jhash (0xA2CAAB4F)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_FLASHES"
	hash "0xB14552383D39CE3E"
	jhash (0xC0047F15)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_FLASHES_ALTERNATE"
	hash "0x2E8D9498C56DD0D1"
	jhash (0x1A81202B)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "IS_BLIP_FLASHING"
	hash "0xA5E41FD83AD6CEF0"
	jhash (0x52E111D7)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"BOOL"

native "SET_BLIP_AS_SHORT_RANGE"
	hash "0xBE8BE4FE60E27B72"
	jhash (0x5C67725E)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_SCALE"
	hash "0xD38744167B2FA257"
	jhash (0x1E6EC434)
	arguments {
		Blip "blip",

		float "scale",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_PRIORITY"
	hash "0xAE9FC9EF6A9FAC79"
	jhash (0xCE87DA6F)
	arguments {
		Blip "blip",

		int "priority",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		See this topic for more details : gtaforums.com/topic/717612-v-scriptnative-documentation-and-research/page-35?p=1069477935
</summary>
	]]

native "SET_BLIP_DISPLAY"
	hash "0x9029B2F3DA924928"
	jhash (0x2B521F91)
	arguments {
		Blip "blip",

		int "displayId",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		displayId = 8 : shows on radar

		displayId:
		3 = Shows on Main map but not Radar (not selectable on map)

		displayId = 2 (Shows on Main map + Radar + selectable)
</summary>
	]]

native "SET_BLIP_CATEGORY"
	hash "0x234CDD44D996FD9A"
	jhash (0xEF72F533)
	arguments {
		Blip "blip",

		int "index",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		int index:

		1 = No Text on blip or Distance
		2 = Text on blip
		3 = No text, just distance
		4+ No Text on blip or distance
</summary>
	]]

native "REMOVE_BLIP"
	hash "0x86A652570E5F25DD"
	jhash (0xD8C3C1CD)
	arguments {
		BlipPtr "blip",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		In the C++ SDK, this seems not to work-- the blip isn't removed immediately. I use it for saving cars.

		E.g.:

		Ped pped = PLAYER::PLAYER_PED_ID();
		Vehicle v = PED::GET_VEHICLE_PED_IS_USING(pped);
		Blip b = UI::ADD_BLIP_FOR_ENTITY(v);

		works fine.
		But later attempting to delete it with:

		Blip b = UI::GET_BLIP_FROM_ENTITY(v);
		if (UI::DOES_BLIP_EXIST(b)) UI::REMOVE_BLIP(&amp;b);

		doesn't work. And yes, doesn't work without the DOES_BLIP_EXIST check either. Also, if you attach multiple blips to the same thing (say, a vehicle), and that thing disappears, the blips randomly attach to other things (in my case, a vehicle).

		Thus for me, UI::REMOVE_BLIP(&amp;b) only works if there's one blip, (in my case) the vehicle is marked as no longer needed, you drive away from it and it eventually despawns, AND there is only one blip attached to it. I never intentionally attach multiple blips but if the user saves the car, this adds a blip. Then if they delete it, it is supposed to remove the blip, but it doesn't. Then they can immediately save it again, causing another blip to re-appear.
		-------------

		Passing the address of the variable instead of the value works for me.
		e.g.
		int blip = UI::ADD_BLIP_FOR_ENTITY(ped);
		UI::REMOVE_BLIP(&amp;blip);


		Remove blip will currently crash your game, just artificially remove the blip by setting the sprite to a id that is 'invisible'.

		--
		It crashes my game.
</summary>
	]]

native "SET_BLIP_AS_FRIENDLY"
	hash "0x6F6F290102C02AB4"
	jhash (0xF290CFD8)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		false for enemy
		true for friendly
</summary>
	]]

native "PULSE_BLIP"
	hash "0x742D6FD43115AF73"
	jhash (0x44253855)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"void"

native "SHOW_NUMBER_ON_BLIP"
	hash "0xA3C0B359DCB848B6"
	jhash (0x7BFC66C6)
	arguments {
		Blip "blip",

		int "number",
	}
	ns "HUD"
	returns	"void"

native "HIDE_NUMBER_ON_BLIP"
	hash "0x532CFF637EF80148"
	jhash (0x0B6D610D)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"void"

native "0x75A16C3DA34F1245"
	hash "0x75A16C3DA34F1245"
	jhash (0x1D99F676)
	arguments {
		Blip "blip",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"

native "SHOW_TICK_ON_BLIP"
	hash "0x74513EA3E505181E"
	jhash (0x3DCF0092)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	alias "0x74513EA3E505181E"
	alias "_SET_BLIP_CHECKED"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Adds a green checkmark on top of a blip.
</summary>
	]]

native "SHOW_HEADING_INDICATOR_ON_BLIP"
	hash "0x5FBCA48327B914DF"
	jhash (0xD1C3D71B)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	alias "0x5FBCA48327B914DF"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Adds the GTA: Online player heading indicator to a blip.
</summary>
	]]

native "_SET_BLIP_FRIENDLY"
	hash "0xB81656BC81FE24D1"
	jhash (0x8DE82C15)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	alias "0xB81656BC81FE24D1"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Highlights a blip by a cyan color circle.

		Color can be changed with SET_BLIP_SECONDARY_COLOUR


</summary>
	]]

native "_SET_BLIP_FRIEND"
	hash "0x23C3EB807312F01A"
	jhash (0x4C8F02B4)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	alias "0x23C3EB807312F01A"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Highlights a blip by a half cyan circle.
</summary>
	]]

native "0xDCFB5D4DB8BF367E"
	hash "0xDCFB5D4DB8BF367E"
	jhash (0xABBE1E45)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"

native "0xC4278F70131BAA6D"
	hash "0xC4278F70131BAA6D"
	jhash (0x6AA6A1CC)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"

native "_SET_BLIP_SHRINK"
	hash "0x2B6D467DAB714E8D"
	jhash (0xC575F0BC)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	alias "0x2B6D467DAB714E8D"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Makes a blip go small when off the minimap.
</summary>
	]]

native "0x25615540D894B814"
	hash "0x25615540D894B814"
	jhash (0x40E25DB8)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"

native "DOES_BLIP_EXIST"
	hash "0xA6DB27D19ECBB7DA"
	jhash (0xAE92DD96)
	arguments {
		Blip "blip",
	}
	ns "HUD"
	returns	"BOOL"

native "SET_WAYPOINT_OFF"
	hash "0xA7E4E2D361C2627F"
	jhash (0xB3496E1B)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		This native removes the current waypoint from the map.

		Example:
		C#:
		Function.Call(Hash.SET_WAYPOINT_OFF);

		C++:
		UI::SET_WAYPOINT_OFF();
</summary>
	]]

native "0xD8E694757BCEA8E9"
	hash "0xD8E694757BCEA8E9"
	jhash (0x62BABF2C)
	ns "HUD"
	returns	"void"

native "REFRESH_WAYPOINT"
	hash "0x81FA173F170560D1"
	jhash (0xB395D753)
	ns "HUD"
	returns	"void"

native "IS_WAYPOINT_ACTIVE"
	hash "0x1DD1F58F493F1DA5"
	jhash (0x5E4DF47B)
	ns "HUD"
	returns	"BOOL"

native "SET_NEW_WAYPOINT"
	hash "0xFE43368D2AA4F2FC"
	jhash (0x8444E1F0)
	arguments {
		float "x",

		float "y",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_BRIGHT"
	hash "0xB203913733F27884"
	jhash (0x72BEE6DF)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "SET_BLIP_SHOW_CONE"
	hash "0x13127EC3665E8EE1"
	jhash (0xFF545AD8)
	arguments {
		Blip "blip",

		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "0xC594B315EDF2D4AF"
	hash "0xC594B315EDF2D4AF"
	jhash (0x41B0D022)
	arguments {
		Ped "ped",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Interesting fact: A hash collision for this is RESET_JETPACK_MODEL_SETTINGS
</summary>
	]]

native "SET_MINIMAP_COMPONENT"
	hash "0x75A9A10948D1DEA6"
	jhash (0x419DCDC4)
	arguments {
		int "p0",

		BOOL "p1",

		int "p2",
	}
	ns "HUD"
	returns	"Any"
	doc [[!
<summary>
		Please change to void.

		p2 appears to be always -1.
</summary>
	]]

native "0x60E892BA4F5BDCA4"
	hash "0x60E892BA4F5BDCA4"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Something with Social Club or online.
</summary>
	]]

native "GET_MAIN_PLAYER_BLIP_ID"
	hash "0xDCD4EC3F419D02FA"
	jhash (0xAB93F020)
	ns "HUD"
	returns	"Blip"

native "0x41350B4FC28E3941"
	hash "0x41350B4FC28E3941"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "HIDE_LOADING_ON_FADE_THIS_FRAME"
	hash "0x4B0311D3CDC4648F"
	jhash (0x35087963)
	ns "HUD"
	returns	"void"

native "SET_RADAR_AS_INTERIOR_THIS_FRAME"
	hash "0x59E727A1C9D3E31A"
	jhash (0x6F2626E1)
	arguments {
		Hash "interior",

		float "x",

		float "y",

		int "heading",

		int "zoom",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		List of interior hashes: pastebin.com/1FUyXNqY
		Not for every interior zoom &gt; 0 available.
</summary>
	]]

native "SET_RADAR_AS_EXTERIOR_THIS_FRAME"
	hash "0xE81B7D2A3DAB2D81"
	jhash (0x39ABB10E)
	ns "HUD"
	returns	"void"

native "_SET_PLAYER_BLIP_POSITION_THIS_FRAME"
	hash "0x77E2DD177910E1CF"
	jhash (0x54E75C7D)
	arguments {
		float "x",

		float "y",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Sets the position of the arrow icon representing the player on both the minimap and world map.

		Too bad this wouldn't work over the network (obviously not). Could spoof where we would be.
</summary>
	]]

native "0x9049FE339D5F6F6F"
	hash "0x9049FE339D5F6F6F"
	jhash (0x199DED14)
	ns "HUD"
	returns	"Any"

native "_DISABLE_RADAR_THIS_FRAME"
	hash "0x5FBAE526203990C9"
	jhash (0x1A4318F7)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		confirmed working 
</summary>
	]]

native "0x20FE7FDFEEAD38C0"
	hash "0x20FE7FDFEEAD38C0"
	jhash (0xCE36E3FE)
	ns "HUD"
	returns	"void"

native "_CENTER_PLAYER_ON_RADAR_THIS_FRAME"
	hash "0x6D14BFDC33B34F55"
	jhash (0x334EFD46)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		When calling this, the current frame will have the players "arrow icon" be focused on the dead center of the radar.
</summary>
	]]

native "SET_WIDESCREEN_FORMAT"
	hash "0xC3B07BA00A83B0F1"
	jhash (0xF016E08F)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "DISPLAY_AREA_NAME"
	hash "0x276B6CE369C33678"
	jhash (0x489FDD41)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "DISPLAY_CASH"
	hash "0x96DEC8D5430208B7"
	jhash (0x0049DF83)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		"DISPLAY_CASH(false);" makes the cash amount render on the screen when appropriate
		"DISPLAY_CASH(true);" disables cash amount rendering
</summary>
	]]

native "0x170F541E1CADD1DE"
	hash "0x170F541E1CADD1DE"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Related to displaying cash on the HUD
		Always called before UI::_SET_SINGLEPLAYER_HUD_CASH in decompiled scripts
</summary>
	]]

native "_SET_PLAYER_CASH_CHANGE"
	hash "0x0772DF77852C2E30"
	arguments {
		int "cash",

		int "bank",
	}
	alias "_SET_SINGLEPLAYER_HUD_CASH"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Displays cash change notifications on HUD.
</summary>
	]]

native "DISPLAY_AMMO_THIS_FRAME"
	hash "0xA5E78BA2B1331C55"
	jhash (0x60693CEE)
	arguments {
		BOOL "display",
	}
	ns "HUD"
	returns	"void"

native "DISPLAY_SNIPER_SCOPE_THIS_FRAME"
	hash "0x73115226F4814E62"
	jhash (0xBC6C73CB)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Displays the crosshair for this frame.
</summary>
	]]

native "HIDE_HUD_AND_RADAR_THIS_FRAME"
	hash "0x719FF505F097FD20"
	jhash (0xB75D4AD2)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		I think this works, but seems to prohibit switching to other weapons (or accessing the weapon wheel)
</summary>
	]]

native "0xE67C6DFD386EA5E7"
	hash "0xE67C6DFD386EA5E7"
	jhash (0x5476B9FD)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0xC2D15BEF167E27BC"
	hash "0xC2D15BEF167E27BC"
	jhash (0xF4F3C796)
	ns "HUD"
	returns	"void"

native "0x95CF81BD06EE1887"
	hash "0x95CF81BD06EE1887"
	jhash (0x7BFFE82F)
	ns "HUD"
	returns	"void"

native "SET_MULTIPLAYER_BANK_CASH"
	hash "0xDD21B55DF695CD0A"
	jhash (0x2C842D03)
	ns "HUD"
	returns	"void"

native "REMOVE_MULTIPLAYER_BANK_CASH"
	hash "0xC7C6789AA1CFEDD0"
	jhash (0x728B4EF4)
	ns "HUD"
	returns	"void"

native "SET_MULTIPLAYER_HUD_CASH"
	hash "0xFD1D220394BCB824"
	jhash (0xA8DB435E)
	arguments {
		int "p0",

		int "p1",
	}
	ns "HUD"
	returns	"void"

native "REMOVE_MULTIPLAYER_HUD_CASH"
	hash "0x968F270E39141ECA"
	jhash (0x07BF4A7D)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Removes multiplayer cash hud each frame
</summary>
	]]

native "HIDE_HELP_TEXT_THIS_FRAME"
	hash "0xD46923FC481CA285"
	jhash (0xF3807BED)
	ns "HUD"
	returns	"void"

native "DISPLAY_HELP_TEXT_THIS_FRAME"
	hash "0x960C9FF8F616E41C"
	jhash (0x18E3360A)
	arguments {
		charPtr "message",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		The messages are localized strings.
		Examples:
		"No_bus_money"
		"Enter_bus"
		"Tour_help"
		"LETTERS_HELP2"
		"Dummy"

		**The bool appears to always be false (if it even is a bool, as it's represented by a zero)**
		--------
		p1 doesn't seem to make a difference, regardless of the state it's in. 


		picture of where on the screen this is displayed? 
</summary>
	]]

native "_SHOW_WEAPON_WHEEL"
	hash "0xEB354E5376BC81A7"
	jhash (0x1EFFB02A)
	arguments {
		BOOL "forcedShow",
	}
	alias "0xEB354E5376BC81A7"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Forces the weapon wheel to appear on screen.
</summary>
	]]

native "_BLOCK_WEAPON_WHEEL_THIS_FRAME"
	hash "0x0AFC4AF510774B47"
	jhash (0xB26FED2B)
	alias "0x0AFC4AF510774B47"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		calling this each frame, it stops the player from receiving a weapon via the weapon wheel.
</summary>
	]]

native "0xA48931185F0536FE"
	hash "0xA48931185F0536FE"
	jhash (0x22E9F555)
	ns "HUD"
	returns	"Hash"

native "0x72C1056D678BB7D8"
	hash "0x72C1056D678BB7D8"
	jhash (0x83B608A0)
	arguments {
		Hash "weaponHash",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Appears to be a HIDE_* native.
</summary>
	]]

native "0xA13E93403F26C812"
	hash "0xA13E93403F26C812"
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"Any"

native "0x14C9FDCC41F81F63"
	hash "0x14C9FDCC41F81F63"
	jhash (0xE70D1F43)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "SET_GPS_FLAGS"
	hash "0x5B440763A4C8D15B"
	jhash (0x60539BAB)
	arguments {
		int "p0",

		float "p1",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Only the script that originally called SET_GPS_FLAGS can set them again. Another script cannot set the flags, until the first script that called it has called CLEAR_GPS_FLAGS.

		Doesn't seem like the flags are actually read by the game at all.

		---------------
		Might be left-over from GTA IV. I kind of miss the *ding-dong* turn left in 2 meters lady lol.
</summary>
	]]

native "CLEAR_GPS_FLAGS"
	hash "0x21986729D6A3A830"
	jhash (0x056AFCE6)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Clears the GPS flags. Only the script that originally called SET_GPS_FLAGS can clear them.

		Doesn't seem like the flags are actually read by the game at all.
</summary>
	]]

native "0x1EAC5F91BCBC5073"
	hash "0x1EAC5F91BCBC5073"
	jhash (0xFB9BABF5)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "CLEAR_GPS_RACE_TRACK"
	hash "0x7AA5B4CE533C858B"
	jhash (0x40C59829)
	ns "HUD"
	returns	"void"

native "0xDB34E8D56FC13B08"
	hash "0xDB34E8D56FC13B08"
	jhash (0x7F93799B)
	arguments {
		Any "p0",

		BOOL "p1",

		BOOL "p2",
	}
	ns "HUD"
	returns	"void"

native "0x311438A071DD9B1A"
	hash "0x311438A071DD9B1A"
	jhash (0xEEBDFE55)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",
	}
	ns "HUD"
	returns	"void"

native "0x900086F371220B6F"
	hash "0x900086F371220B6F"
	jhash (0xDA0AF00E)
	arguments {
		BOOL "p0",

		Any "p1",

		Any "p2",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		SET_GPS_???
</summary>
	]]

native "0xE6DE0561D9232A64"
	hash "0xE6DE0561D9232A64"
	jhash (0xCF2E3E24)
	ns "HUD"
	returns	"void"

native "0x3D3D15AF7BCAAF83"
	hash "0x3D3D15AF7BCAAF83"
	jhash (0xC3DCBEDB)
	arguments {
		Any "p0",

		BOOL "p1",

		BOOL "p2",
	}
	ns "HUD"
	returns	"void"

native "0xA905192A6781C41B"
	hash "0xA905192A6781C41B"
	jhash (0xFE485135)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "HUD"
	returns	"void"

native "0x3DDA37128DD1ACA8"
	hash "0x3DDA37128DD1ACA8"
	jhash (0xE87CBE4C)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0x67EEDEA1B9BAFD94"
	hash "0x67EEDEA1B9BAFD94"
	jhash (0x0D9969E4)
	ns "HUD"
	returns	"void"

native "CLEAR_GPS_PLAYER_WAYPOINT"
	hash "0xFF4FB7C8CDFA3DA7"
	jhash (0x0B9C7FC2)
	ns "HUD"
	returns	"void"

native "SET_GPS_FLASHES"
	hash "0x320D0E0D936A0E9B"
	jhash (0xE991F733)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "0x7B21E0BB01E8224A"
	hash "0x7B21E0BB01E8224A"
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "FLASH_MINIMAP_DISPLAY"
	hash "0xF2DD778C22B15BDA"
	jhash (0xB8359952)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		adds a short flash to the Radar/Minimap
		Usage: UI.FLASH_MINIMAP_DISPLAY
</summary>
	]]

native "0x6B1DE27EE78E6A19"
	hash "0x6B1DE27EE78E6A19"
	jhash (0x79A6CAF6)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "TOGGLE_STEALTH_RADAR"
	hash "0x6AFDFB93754950C7"
	jhash (0xC68D47C4)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "KEY_HUD_COLOUR"
	hash "0x1A5CD7752DD28CD3"
	jhash (0xD5BFCADB)
	arguments {
		BOOL "p0",

		Any "p1",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		hash collision
</summary>
	]]

native "SET_MISSION_NAME"
	hash "0x5F28ECF5FC84772F"
	jhash (0x68DCAE10)
	arguments {
		BOOL "p0",

		charPtr "name",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Takes a text label, gets the string (must not be longer than 600 chars, should not exceed 64 chars) and sets the name to that string.
		p0 must be true.
</summary>
	]]

native "_SET_MISSION_NAME_2"
	hash "0xE45087D85F468BC2"
	jhash (0x8D9A1734)
	arguments {
		BOOL "p0",

		charPtr "name",
	}
	alias "0xE45087D85F468BC2"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Similar to SET_MISSION_NAME but this one can take any string (must not be greater than 600 chars, should not exceed 64 chars), not just text labels.
		p0 must be true.
</summary>
	]]

native "0x817B86108EB94E51"
	hash "0x817B86108EB94E51"
	jhash (0xD2161E77)
	arguments {
		BOOL "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		AnyPtr "p3",

		AnyPtr "p4",

		AnyPtr "p5",

		AnyPtr "p6",

		AnyPtr "p7",

		AnyPtr "p8",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		UI::_817B86108EB94E51(1, &amp;g_189F36._f10CD1[0/*16*/], &amp;g_189F36._f10CD1[1/*16*/], &amp;g_189F36._f10CD1[2/*16*/], &amp;g_189F36._f10CD1[3/*16*/], &amp;g_189F36._f10CD1[4/*16*/], &amp;g_189F36._f10CD1[5/*16*/], &amp;g_189F36._f10CD1[6/*16*/], &amp;g_189F36._f10CD1[7/*16*/]);
</summary>
	]]

native "SET_MINIMAP_BLOCK_WAYPOINT"
	hash "0x58FADDED207897DC"
	jhash (0xA41C3B62)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "_SET_NORTH_YANKTON_MAP"
	hash "0x9133955F1A2DA957"
	jhash (0x02F5F1D1)
	arguments {
		BOOL "toggle",
	}
	alias "_SET_DRAW_MAP_VISIBLE"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Toggles the North Yankton map
</summary>
	]]

native "_SET_MINIMAP_REVEALED"
	hash "0xF8DEE0A5600CBB93"
	jhash (0xD8D77733)
	arguments {
		BOOL "toggle",
	}
	alias "0xF8DEE0A5600CBB93"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		If true, the entire map will be revealed.
</summary>
	]]

native "0xE0130B41D3CF4574"
	hash "0xE0130B41D3CF4574"
	jhash (0xA4098ACC)
	ns "HUD"
	returns	"float"

native "_IS_MINIMAP_AREA_REVEALED"
	hash "0x6E31B91145873922"
	jhash (0x65B705F6)
	arguments {
		float "x",

		float "y",

		float "radius",
	}
	alias "0x6E31B91145873922"
	ns "HUD"
	returns	"BOOL"

native "0x62E849B7EB28E770"
	hash "0x62E849B7EB28E770"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0x0923DBF87DFF735E"
	hash "0x0923DBF87DFF735E"
	jhash (0xE010F081)
	arguments {
		float "x",

		float "y",

		float "z",
	}
	ns "HUD"
	returns	"void"

native "0x71BDB63DBAF8DA59"
	hash "0x71BDB63DBAF8DA59"
	jhash (0x5133A750)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "0x35EDD5B2E3FF01C0"
	hash "0x35EDD5B2E3FF01C0"
	jhash (0x20FD3E87)
	ns "HUD"
	returns	"void"

native "LOCK_MINIMAP_ANGLE"
	hash "0x299FAEBB108AE05B"
	jhash (0xDEC733E4)
	arguments {
		int "angle",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Locks the minimap to the specified angle in integer degrees.

		angle: The angle in whole degrees. If less than 0 or greater than 360, unlocks the angle.
</summary>
	]]

native "UNLOCK_MINIMAP_ANGLE"
	hash "0x8183455E16C42E3A"
	jhash (0x742043F9)
	ns "HUD"
	returns	"void"

native "LOCK_MINIMAP_POSITION"
	hash "0x1279E861A329E73F"
	jhash (0xB9632A91)
	arguments {
		float "x",

		float "y",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Locks the minimap to the specified world position.
</summary>
	]]

native "UNLOCK_MINIMAP_POSITION"
	hash "0x3E93E06DB8EF1F30"
	jhash (0x5E8E6F54)
	ns "HUD"
	returns	"void"

native "_SET_MINIMAP_ATTITUDE_INDICATOR_LEVEL"
	hash "0xD201F3FF917A506D"
	jhash (0x0308EDF6)
	arguments {
		float "altitude",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Argument must be 0.0f or above 38.0f, or it will be ignored.
</summary>
	]]

native "0x3F5CC444DCAAA8F2"
	hash "0x3F5CC444DCAAA8F2"
	jhash (0x7FB6FB2A)
	arguments {
		Any "p0",

		Any "p1",

		BOOL "p2",
	}
	ns "HUD"
	returns	"void"

native "0x975D66A0BC17064C"
	hash "0x975D66A0BC17064C"
	jhash (0xF07D8CEF)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "0x06A320535F5F0248"
	hash "0x06A320535F5F0248"
	jhash (0x827F14DE)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "_SET_RADAR_BIGMAP_ENABLED"
	hash "0x231C8F89D0539D8F"
	jhash (0x08EB83D2)
	arguments {
		BOOL "toggleBigMap",

		BOOL "showFullMap",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Toggles the big minimap state like in GTA:Online.
</summary>
	]]

native "IS_HUD_COMPONENT_ACTIVE"
	hash "0xBC4C9EA5391ECC0D"
	jhash (0x6214631F)
	arguments {
		int "id",
	}
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		Full list of components below

		HUD = 0;
		HUD_WANTED_STARS = 1;
		HUD_WEAPON_ICON = 2;
		HUD_CASH = 3;
		HUD_MP_CASH = 4;
		HUD_MP_MESSAGE = 5;
		HUD_VEHICLE_NAME = 6;
		HUD_AREA_NAME = 7;
		HUD_VEHICLE_CLASS = 8;
		HUD_STREET_NAME = 9;
		HUD_HELP_TEXT = 10;
		HUD_FLOATING_HELP_TEXT_1 = 11;
		HUD_FLOATING_HELP_TEXT_2 = 12;
		HUD_CASH_CHANGE = 13;
		HUD_RETICLE = 14;
		HUD_SUBTITLE_TEXT = 15;
		HUD_RADIO_STATIONS = 16;
		HUD_SAVING_GAME = 17;
		HUD_GAME_STREAM = 18;
		HUD_WEAPON_WHEEL = 19;
		HUD_WEAPON_WHEEL_STATS = 20;
		MAX_HUD_COMPONENTS = 21;
		MAX_HUD_WEAPONS = 22;
		MAX_SCRIPTED_HUD_COMPONENTS = 141;
</summary>
	]]

native "IS_SCRIPTED_HUD_COMPONENT_ACTIVE"
	hash "0xDD100EB17A94FF65"
	jhash (0x2B86F382)
	arguments {
		int "id",
	}
	ns "HUD"
	returns	"BOOL"

native "HIDE_SCRIPTED_HUD_COMPONENT_THIS_FRAME"
	hash "0xE374C498D8BADC14"
	jhash (0x31ABA127)
	arguments {
		int "id",
	}
	ns "HUD"
	returns	"void"

native "0x09C0403ED9A751C2"
	hash "0x09C0403ED9A751C2"
	jhash (0xE8C8E535)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"BOOL"

native "HIDE_HUD_COMPONENT_THIS_FRAME"
	hash "0x6806C51AD12B83B8"
	jhash (0xDB2D0762)
	arguments {
		int "id",
	}
	ns "HUD"
	returns	"void"

native "SHOW_HUD_COMPONENT_THIS_FRAME"
	hash "0x0B4DF1FA60C0E664"
	jhash (0x95E1546E)
	arguments {
		int "id",
	}
	ns "HUD"
	returns	"void"

native "0xA4DEDE28B1814289"
	hash "0xA4DEDE28B1814289"
	jhash (0x52746FE1)
	ns "HUD"
	returns	"void"

native "RESET_RETICULE_VALUES"
	hash "0x12782CE0A636E9F0"
	jhash (0xBE27AA3F)
	ns "HUD"
	returns	"void"

native "RESET_HUD_COMPONENT_VALUES"
	hash "0x450930E616475D0D"
	jhash (0xD15B46DA)
	arguments {
		int "id",
	}
	ns "HUD"
	returns	"void"

native "SET_HUD_COMPONENT_POSITION"
	hash "0xAABB1F56E2A17CED"
	jhash (0x2F3A0D15)
	arguments {
		int "id",

		float "x",

		float "y",
	}
	ns "HUD"
	returns	"void"

native "GET_HUD_COMPONENT_POSITION"
	hash "0x223CA69A8C4417FD"
	jhash (0x080DCED6)
	arguments {
		int "id",
	}
	ns "HUD"
	returns	"Vector3"

native "CLEAR_REMINDER_MESSAGE"
	hash "0xB57D8DD645CFA2CF"
	jhash (0x5BBCC934)
	alias "0xB57D8DD645CFA2CF"
	ns "HUD"
	returns	"void"

native "_GET_SCREEN_COORD_FROM_WORLD_COORD"
	hash "0xF9904D11F1ACBEC3"
	jhash (0xFE9A39F8)
	arguments {
		float "worldX",

		float "worldY",

		float "worldZ",

		floatPtr "screenX",

		floatPtr "screenY",
	}
	alias "0xF9904D11F1ACBEC3"
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		World to relative screen coords

		this world to screen will keep the text on screen. it will keep it in the screen pos. good for a deer hunting mod
</summary>
	]]

native "_DISPLAY_JOB_REPORT"
	hash "0x523A590C1A3CC0D3"
	jhash (0x10DE5150)
	alias "0x523A590C1A3CC0D3"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Shows a hud element for reporting jobs
</summary>
	]]

native "0xEE4C0E6DBC6F2C6F"
	hash "0xEE4C0E6DBC6F2C6F"
	jhash (0x67649EE0)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Hides the hud element displayed by _0x523A590C1A3CC0D3
</summary>
	]]

native "0x9135584D09A3437E"
	hash "0x9135584D09A3437E"
	jhash (0x9D2C94FA)
	ns "HUD"
	returns	"Any"
	doc [[!
<summary>
		return bool according to scripts
</summary>
	]]

native "0x2432784ACA090DA4"
	hash "0x2432784ACA090DA4"
	jhash (0x45472FD5)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		p0 is int or bool
</summary>
	]]

native "0x7679CC1BCEBE3D4C"
	hash "0x7679CC1BCEBE3D4C"
	jhash (0x198F32D7)
	arguments {
		Any "p0",

		float "p1",

		float "p2",
	}
	ns "HUD"
	returns	"void"

native "0x784BA7E0ECEB4178"
	hash "0x784BA7E0ECEB4178"
	jhash (0x93045157)
	arguments {
		Any "p0",

		float "x",

		float "y",

		float "z",
	}
	ns "HUD"
	returns	"void"

native "0xB094BC1DB4018240"
	hash "0xB094BC1DB4018240"
	jhash (0x18B012B7)
	arguments {
		Any "p0",

		Any "p1",

		float "p2",

		float "p3",
	}
	ns "HUD"
	returns	"void"

native "0x788E7FD431BD67F1"
	hash "0x788E7FD431BD67F1"
	jhash (0x97852A82)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",

		Any "p5",
	}
	ns "HUD"
	returns	"void"

native "CLEAR_FLOATING_HELP"
	hash "0x50085246ABD3FEFA"
	jhash (0xB181F88F)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		p0 looks like int in script
</summary>
	]]

native "_SET_MP_GAMER_TAG_COLOR"
	hash "0x6DD05E9D83EFA4C9"
	jhash (0xC969F2D0)
	arguments {
		int "headDisplayId",

		charPtr "username",

		BOOL "pointedClanTag",

		BOOL "isRockstarClan",

		charPtr "clanTag",

		Any "p5",

		int "r",

		int "g",

		int "b",
	}
	alias "0x6DD05E9D83EFA4C9"
	alias "_CREATE_MP_GAMER_TAG_COLOR"
	ns "HUD"
	returns	"void"

native "_HAS_MP_GAMER_TAG"
	hash "0x6E0EB3EB47C8D7AA"
	jhash (0xEFD2564A)
	alias "0x6E0EB3EB47C8D7AA"
	ns "HUD"
	returns	"BOOL"

native "_CREATE_MP_GAMER_TAG"
	hash "0xBFEFE3321A3F5015"
	jhash (0xF5CD2AA4)
	arguments {
		Ped "ped",

		charPtr "username",

		BOOL "pointedClanTag",

		BOOL "isRockstarClan",

		charPtr "clanTag",

		Any "p5",
	}
	alias "0xBFEFE3321A3F5015"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		p0 was the return of NET_TO_PED in fm_mission_controler.
		p4 was always "".
		returns headDisplayId
</summary>
	]]

native "REMOVE_MP_GAMER_TAG"
	hash "0x31698AA80E0223F8"
	jhash (0x3D081FE4)
	arguments {
		int "gamerTagId",
	}
	alias "0x31698AA80E0223F8"
	ns "HUD"
	returns	"void"

native "IS_MP_GAMER_TAG_ACTIVE"
	hash "0x4E929E7A5796FD26"
	jhash (0x60118951)
	arguments {
		int "gamerTagId",
	}
	alias "0x4E929E7A5796FD26"
	ns "HUD"
	returns	"BOOL"

native "ADD_TREVOR_RANDOM_MODIFIER"
	hash "0x595B5178E412E199"
	jhash (0x63959059)
	arguments {
		int "gamerTagId",
	}
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		Hash collision!
		_IS_MP_GAMER_TAG_ACTIVE_2
</summary>
	]]

native "SET_MP_GAMER_TAG_VISIBILITY"
	hash "0x63BB75ABEDC1F6A0"
	jhash (0xD41DF479)
	arguments {
		int "gamerTagId",

		int "component",

		BOOL "toggle",
	}
	alias "0x63BB75ABEDC1F6A0"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		enum MpGamerTagComponent
		{
		  GAMER_NAME = 0,
		  CREW_TAG,
		  healthArmour,
		  BIG_TEXT,
		  AUDIO_ICON,
		  MP_USING_MENU,
		  MP_PASSIVE_MODE,
		  WANTED_STARS,
		  MP_DRIVER,
		  MP_CO_DRIVER,
		  MP_TAGGED,
		  GAMER_NAME_NEARBY,
		  ARROW,
		  MP_PACKAGES,
		  INV_IF_PED_FOLLOWING,
		  RANK_TEXT,
		  MP_TYPING
		};
</summary>
	]]

native "_SET_MP_GAMER_TAG_"
	hash "0xEE76FF7E6A0166B0"
	jhash (0x767DED29)
	arguments {
		int "headDisplayId",

		BOOL "p1",
	}
	alias "0xEE76FF7E6A0166B0"
	ns "HUD"
	returns	"void"

native "_SET_MP_GAMER_TAG_ICONS"
	hash "0xA67F9C46D612B6F1"
	jhash (0xB01A5434)
	arguments {
		int "headDisplayId",

		BOOL "p1",
	}
	alias "0xA67F9C46D612B6F1"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Displays a bunch of icons above the players name, and level, and their name twice
</summary>
	]]

native "SET_MP_GAMER_TAG_COLOUR"
	hash "0x613ED644950626AE"
	jhash (0x7E3AA40A)
	arguments {
		int "gamerTagId",

		int "flag",

		int "color",
	}
	alias "0x613ED644950626AE"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Ranges from 0 to 255. 0 is grey health bar, ~50 yellow, 200 purple.
</summary>
	]]

native "SET_MP_GAMER_TAG_HEALTH_BAR_COLOUR"
	hash "0x3158C77A7E888AB4"
	jhash (0x5777EC77)
	arguments {
		int "headDisplayId",

		int "color",
	}
	alias "0x3158C77A7E888AB4"
	alias "_SET_MP_GAMER_TAG_HEALTH_BAR_COLOR"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Ranges from 0 to 255. 0 is grey health bar, ~50 yellow, 200 purple.
		Should be enabled as flag (2). Has 0 opacity by default.

		- This was _SET_MP_GAMER_TAG_HEALTH_BAR_COLOR,
</summary>
	]]

native "SET_MP_GAMER_TAG_ALPHA"
	hash "0xD48FE545CD46F857"
	jhash (0xF4418611)
	arguments {
		int "gamerTagId",

		int "component",

		int "alpha",
	}
	alias "0xD48FE545CD46F857"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Sets flag's sprite transparency. 0-255.
</summary>
	]]

native "SET_MP_GAMER_TAG_WANTED_LEVEL"
	hash "0xCF228E2AA03099C3"
	jhash (0x0EBB003F)
	arguments {
		int "gamerTagId",

		int "wantedlvl",
	}
	alias "0xCF228E2AA03099C3"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		displays wanted star above head
</summary>
	]]

native "SET_MP_GAMER_TAG_NAME"
	hash "0xDEA2B8283BAA3944"
	jhash (0x627A559B)
	arguments {
		int "gamerTagId",

		charPtr "string",
	}
	alias "0xDEA2B8283BAA3944"
	ns "HUD"
	returns	"void"

native "_HAS_MP_GAMER_TAG_2"
	hash "0xEB709A36958ABE0D"
	jhash (0xF11414C4)
	arguments {
		int "gamerTagId",
	}
	alias "0xEB709A36958ABE0D"
	ns "HUD"
	returns	"BOOL"

native "_SET_MP_GAMER_TAG_CHATTING"
	hash "0x7B7723747CCB55B6"
	jhash (0x939218AB)
	arguments {
		int "gamerTagId",

		charPtr "string",
	}
	alias "0x7B7723747CCB55B6"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Set's the string displayed when flag 3 (AudioSpeaker) active.
</summary>
	]]

native "_GET_ACTIVE_WEBSITE_ID"
	hash "0x01A358D9128B7A86"
	jhash (0xAB5B7C18)
	alias "0x01A358D9128B7A86"
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		native only found once in appinternet.c4

		same thing as this but does not need websiteID
		Any _0xE3B05614DCE1D014(Any p0) // 0xE3B05614DCE1D014 0xD217EE7E

		returns current websitePageID
</summary>
	]]

native "GET_CURRENT_WEBSITE_ID"
	hash "0x97D47996FC48CBAD"
	jhash (0x42A55B14)
	ns "HUD"
	returns	"int"

native "0xE3B05614DCE1D014"
	hash "0xE3B05614DCE1D014"
	jhash (0xD217EE7E)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"Any"
	doc [[!
<summary>
		 UI::GET_CURRENT_WEBSITE_PAGE_ID(int websiteID)

		returns the current website page sometimes returns false
</summary>
	]]

native "0xB99C4E4D9499DF29"
	hash "0xB99C4E4D9499DF29"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0xAF42195A42C63BBA"
	hash "0xAF42195A42C63BBA"
	ns "HUD"
	returns	"Any"

native "SET_WARNING_MESSAGE"
	hash "0x7B1776B3B53F8D74"
	jhash (0xBE699BDE)
	arguments {
		charPtr "entryLine1",

		int "instructionalKey",

		charPtr "entryLine2",

		BOOL "p3",

		Any "p4",

		AnyPtr "p5",

		AnyPtr "p6",

		BOOL "background",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		You can only use text entries. No custom text.

		Example: SET_WARNING_MESSAGE("t20", 3, "adder", false, -1, 0, 0, true);
</summary>
	]]

native "SET_WARNING_MESSAGE_WITH_HEADER"
	hash "0xDC38CC1E35B6A5D7"
	jhash (0x2DB9EAB5)
	arguments {
		charPtr "entryHeader",

		charPtr "entryLine1",

		int "instructionalKey",

		charPtr "entryLine2",

		BOOL "p4",

		Any "p5",

		AnyPtr "p6",

		AnyPtr "p7",

		BOOL "background",
	}
	alias "_SET_WARNING_MESSAGE_2"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		You can only use text entries. No custom text.


		C# Example :
		Function.Call(Hash._SET_WARNING_MESSAGE_2, "HUD_QUIT", "HUD_CGIGNORE", 2, "HUD_CGINVITE", 0, -1, 0, 0, 1);

		you can recreate this easily with scaleforms

		---------------
		Fixed native name, from before nativedb restoration.
</summary>
	]]

native "_SET_WARNING_MESSAGE_3"
	hash "0x701919482C74B5AB"
	jhash (0x749929D3)
	arguments {
		charPtr "entryHeader",

		charPtr "entryLine1",

		Any "instructionalKey",

		charPtr "entryLine2",

		BOOL "p4",

		Any "p5",

		Any "p6",

		AnyPtr "p7",

		AnyPtr "p8",

		BOOL "p9",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		You can only use text entries. No custom text.
</summary>
	]]

native "0x0C5A80A9E096D529"
	hash "0x0C5A80A9E096D529"
	arguments {
		Any "p0",

		AnyPtr "p1",

		Any "p2",

		Any "p3",

		Any "p4",

		Any "p5",
	}
	ns "HUD"
	returns	"BOOL"

native "0xDAF87174BE7454FF"
	hash "0xDAF87174BE7454FF"
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"BOOL"

native "0x6EF54AB721DC6242"
	hash "0x6EF54AB721DC6242"
	ns "HUD"
	returns	"void"

native "IS_WARNING_MESSAGE_ACTIVE"
	hash "0xE18B138FABC53103"
	jhash (0x94C834AD)
	alias "IS_MEDICAL_DISABLED"
	ns "HUD"
	returns	"BOOL"

native "0x7792424AA0EAC32E"
	hash "0x7792424AA0EAC32E"
	jhash (0x2F9A309C)
	ns "HUD"
	returns	"void"

native "_SET_MAP_FULL_SCREEN"
	hash "0x5354C5BA2EA868A4"
	jhash (0xE4FD20D8)
	arguments {
		BOOL "toggle",
	}
	alias "0x5354C5BA2EA868A4"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		If toggle is true, the map is shown in full screen
		If toggle is false, the map is shown in normal mode
</summary>
	]]

native "0x1EAE6DD17B7A5EFA"
	hash "0x1EAE6DD17B7A5EFA"
	jhash (0x13E7A5A9)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "0x551DF99658DB6EE8"
	hash "0x551DF99658DB6EE8"
	jhash (0x786CA0A2)
	arguments {
		float "p0",

		float "p1",

		float "p2",
	}
	ns "HUD"
	returns	"Any"

native "0x2708FC083123F9FF"
	hash "0x2708FC083123F9FF"
	jhash (0xCBEC9369)
	ns "HUD"
	returns	"void"

native "0x1121BFA1A1A522A8"
	hash "0x1121BFA1A1A522A8"
	jhash (0x3F4AFB13)
	ns "HUD"
	returns	"Any"

native "0x82CEDC33687E1F50"
	hash "0x82CEDC33687E1F50"
	jhash (0x2F28F0A6)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0x211C4EF450086857"
	hash "0x211C4EF450086857"
	jhash (0x801D0D86)
	ns "HUD"
	returns	"void"

native "0xBF4F34A85CA2970C"
	hash "0xBF4F34A85CA2970C"
	jhash (0x317775DF)
	ns "HUD"
	returns	"void"

native "ACTIVATE_FRONTEND_MENU"
	hash "0xEF01D36B9C9D0C7B"
	jhash (0x01D83872)
	arguments {
		Hash "menuhash",

		BOOL "Toggle_Pause",

		int "component",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Does stuff like this:
		gyazo.com/7fcb78ea3520e3dbc5b2c0c0f3712617

		Example:
		int GetHash = GET_HASH_KEY("fe_menu_version_corona_lobby");
		ACTIVATE_FRONTEND_MENU(GetHash, 0, -1);

		BOOL p1 is a toggle to define the game in pause.
		int p2 is unknown but -1 always works, not sure why though.

		[30/03/2017] ins1de :

		the int p2 is actually a component variable. When the pause menu is visible, it opens the tab related to it.

		Example : Function.Call(Hash.ACTIVATE_FRONTEND_MENU,-1171018317, 0, 42);
		Result : Opens the "Online" tab without pausing the menu, with -1 it opens the map.
</summary>
	]]

native "RESTART_FRONTEND_MENU"
	hash "0x10706DC6AD2D49C0"
	jhash (0xB07DAF98)
	arguments {
		Hash "menuHash",

		int "p1",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Before using this native click the native above and look at the decription.

		Example:
		int GetHash = Function.Call&lt;int&gt;(Hash.GET_HASH_KEY, "fe_menu_version_corona_lobby");
		Function.Call(Hash.ACTIVATE_FRONTEND_MENU, GetHash, 0, -1);
		Function.Call(Hash.RESTART_FRONTEND_MENU(GetHash, -1);

		This native refreshes the frontend menu.

		p1 = Hash of Menu
		p2 = Unknown but always works with -1.
</summary>
	]]

native "_GET_CURRENT_FRONTEND_MENU"
	hash "0x2309595AD6145265"
	jhash (0x33D6868F)
	alias "0x2309595AD6145265"
	ns "HUD"
	returns	"Hash"
	doc [[!
<summary>
		if (UI::_2309595AD6145265() == ${fe_menu_version_empty_no_background})

		Seems to get the current frontend menu
</summary>
	]]

native "SET_PAUSE_MENU_ACTIVE"
	hash "0xDF47FC56C71569CF"
	jhash (0x1DCD878E)
	arguments {
		BOOL "toggle",
	}
	ns "HUD"
	returns	"void"

native "DISABLE_FRONTEND_THIS_FRAME"
	hash "0x6D3465A73092F0E6"
	jhash (0xD86A029E)
	ns "HUD"
	returns	"void"

native "0xBA751764F0821256"
	hash "0xBA751764F0821256"
	jhash (0x7F349900)
	ns "HUD"
	returns	"void"

native "0xCC3FDDED67BCFC63"
	hash "0xCC3FDDED67BCFC63"
	jhash (0x630CD8EE)
	ns "HUD"
	returns	"void"

native "SET_FRONTEND_ACTIVE"
	hash "0x745711A75AB09277"
	jhash (0x81E1AD32)
	arguments {
		BOOL "active",
	}
	ns "HUD"
	returns	"void"

native "IS_PAUSE_MENU_ACTIVE"
	hash "0xB0034A223497FFCB"
	jhash (0xD3600591)
	ns "HUD"
	returns	"BOOL"

native "0x2F057596F2BD0061"
	hash "0x2F057596F2BD0061"
	jhash (0xC85C4487)
	ns "HUD"
	returns	"Any"
	doc [[!
<summary>
		Appears to return whether the player is using the pause menu store. Can't be sure though.
</summary>
	]]

native "GET_PAUSE_MENU_STATE"
	hash "0x272ACD84970869C5"
	jhash (0x92F50134)
	ns "HUD"
	returns	"int"
	doc [[!
<summary>
		Returns:


		5
		10
		15
		20
		25
		30
		35

</summary>
	]]

native "0x5BFF36D6ED83E0AE"
	hash "0x5BFF36D6ED83E0AE"
	ns "HUD"
	returns	"Vector3"

native "IS_PAUSE_MENU_RESTARTING"
	hash "0x1C491717107431C7"
	jhash (0x3C4CF4D9)
	ns "HUD"
	returns	"BOOL"

native "_LOG_DEBUG_INFO"
	hash "0x2162C446DFDF38FD"
	jhash (0x2DFD35C7)
	arguments {
		charPtr "p0",
	}
	alias "0x2162C446DFDF38FD"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Not present in retail version of the game, actual definiton seems to be
		_LOG_DEBUG_INFO(char* category, char* debugText);
</summary>
	]]

native "0x77F16B447824DA6C"
	hash "0x77F16B447824DA6C"
	jhash (0x0A89336C)
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "0xCDCA26E80FAECB8F"
	hash "0xCDCA26E80FAECB8F"
	jhash (0xC84BE309)
	ns "HUD"
	returns	"void"

native "_ADD_FRONTEND_MENU_CONTEXT"
	hash "0xDD564BDD0472C936"
	jhash (0x9FE8FD5E)
	arguments {
		Hash "hash",
	}
	alias "0xDD564BDD0472C936"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Seems to add/set the current menu context (to show/hide buttons?)

		Pausemenu.xml:
		&lt;Contexts&gt;*ALL*, DISPLAY_CORONA_BUTTONS, *NONE*, BET_LOCKED, BET_AVAILABLE, SCROLL_OPTION&lt;/Contexts&gt;
		Code:
		if (...) {
		    sub_bbd34(a_0, 0, "FM_BET_HELP");
		    UI::_DD564BDD0472C936(${bet_available}); // This native
		    UI::OBJECT_DECAL_TOGGLE(${bet_locked});
		} else { 
		    sub_bbd34(a_0, 0, "");
		    UI::OBJECT_DECAL_TOGGLE(${bet_available});
		    UI::_DD564BDD0472C936(${bet_locked}); // This native
		}

		OBJECT_DECAL_TOGGLE seems to remove a context, It also has a hash collision

		// Old
		Scripts do not make this native's purpose clear. However, this native most likely has something to do with decals since in nearly every instance, "OBJECT_DECAL_TOGGLE" is called prior.
</summary>
	]]

native "OBJECT_DECAL_TOGGLE"
	hash "0x444D8CF241EC25C5"
	jhash (0x0029046E)
	arguments {
		Hash "hash",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Please change back to _0x444D8CF241EC25C5 (hash collision)
</summary>
	]]

native "0x84698AB38D0C6636"
	hash "0x84698AB38D0C6636"
	jhash (0xC51BC42F)
	arguments {
		Hash "hash",
	}
	ns "HUD"
	returns	"BOOL"

native "0x2A25ADC48F87841F"
	hash "0x2A25ADC48F87841F"
	jhash (0x016D7AF9)
	ns "HUD"
	returns	"Any"

native "0xDE03620F8703A9DF"
	hash "0xDE03620F8703A9DF"
	ns "HUD"
	returns	"Any"

native "0x359AF31A4B52F5ED"
	hash "0x359AF31A4B52F5ED"
	ns "HUD"
	returns	"Any"

native "0x13C4B962653A5280"
	hash "0x13C4B962653A5280"
	ns "HUD"
	returns	"Any"

native "0xC8E1071177A23BE5"
	hash "0xC8E1071177A23BE5"
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",

		AnyPtr "p2",
	}
	ns "HUD"
	returns	"BOOL"

native "ENABLE_DEATHBLOOD_SEETHROUGH"
	hash "0x4895BDEA16E7C080"
	jhash (0x15B24768)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Please change back to _0x4895BDEA16E7C080 (hash collision)
</summary>
	]]

native "0xC78E239AC5B2DDB9"
	hash "0xC78E239AC5B2DDB9"
	jhash (0x6C67131A)
	arguments {
		BOOL "p0",

		Any "p1",

		Any "p2",
	}
	ns "HUD"
	returns	"void"

native "0xF06EBB91A81E09E3"
	hash "0xF06EBB91A81E09E3"
	jhash (0x11D09737)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0x3BAB9A4E4F2FF5C7"
	hash "0x3BAB9A4E4F2FF5C7"
	jhash (0xD3BF3ABD)
	ns "HUD"
	returns	"Any"

native "0xEC9264727EEC0F28"
	hash "0xEC9264727EEC0F28"
	jhash (0xC06B763D)
	ns "HUD"
	returns	"void"

native "0x14621BB1DF14E2B2"
	hash "0x14621BB1DF14E2B2"
	jhash (0xB9392CE7)
	ns "HUD"
	returns	"void"

native "0x66E7CB63C97B7D20"
	hash "0x66E7CB63C97B7D20"
	jhash (0x92DAFA78)
	ns "HUD"
	returns	"Any"

native "0x593FEAE1F73392D4"
	hash "0x593FEAE1F73392D4"
	jhash (0x22CA9F2A)
	ns "HUD"
	returns	"Any"

native "0x4E3CD0EF8A489541"
	hash "0x4E3CD0EF8A489541"
	jhash (0xDA7951A2)
	ns "HUD"
	returns	"Any"

native "0xF284AC67940C6812"
	hash "0xF284AC67940C6812"
	jhash (0x7D95AFFF)
	ns "HUD"
	returns	"Any"

native "0x2E22FEFA0100275E"
	hash "0x2E22FEFA0100275E"
	jhash (0x96863460)
	ns "HUD"
	returns	"Any"

native "0x0CF54F20DE43879C"
	hash "0x0CF54F20DE43879C"
	arguments {
		Any "p0",
	}
	ns "HUD"
	returns	"void"

native "0x36C1451A88A09630"
	hash "0x36C1451A88A09630"
	jhash (0x8543AAC8)
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",
	}
	ns "HUD"
	returns	"void"

native "0x7E17BE53E1AAABAF"
	hash "0x7E17BE53E1AAABAF"
	jhash (0x6025AA2F)
	arguments {
		intPtr "p0",

		intPtr "p1",

		intPtr "p2",
	}
	ns "HUD"
	returns	"void"

native "0xA238192F33110615"
	hash "0xA238192F33110615"
	jhash (0x46794EB2)
	arguments {
		intPtr "p0",

		intPtr "p1",

		intPtr "p2",
	}
	ns "HUD"
	returns	"BOOL"

native "SET_USERIDS_UIHIDDEN"
	hash "0xEF4CED81CEBEDC6D"
	jhash (0x4370999E)
	arguments {
		Any "p0",

		AnyPtr "p1",
	}
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		Hash collision! Please change back to _0xEF4CED81CEBEDC6D
</summary>
	]]

native "0xCA6B2F7CE32AB653"
	hash "0xCA6B2F7CE32AB653"
	arguments {
		Any "p0",

		AnyPtr "p1",

		Any "p2",
	}
	ns "HUD"
	returns	"BOOL"

native "0x90A6526CF0381030"
	hash "0x90A6526CF0381030"
	jhash (0xD6CC4766)
	arguments {
		Any "p0",

		AnyPtr "p1",

		Any "p2",

		Any "p3",
	}
	ns "HUD"
	returns	"BOOL"

native "0x24A49BEAF468DC90"
	hash "0x24A49BEAF468DC90"
	arguments {
		Any "p0",

		AnyPtr "p1",

		Any "p2",

		Any "p3",

		Any "p4",
	}
	ns "HUD"
	returns	"BOOL"

native "0x5FBD7095FE7AE57F"
	hash "0x5FBD7095FE7AE57F"
	jhash (0x51972B04)
	arguments {
		Any "p0",

		floatPtr "p1",
	}
	ns "HUD"
	returns	"BOOL"

native "0x8F08017F9D7C47BD"
	hash "0x8F08017F9D7C47BD"
	arguments {
		Any "p0",

		AnyPtr "p1",

		Any "p2",
	}
	ns "HUD"
	returns	"BOOL"

native "0x052991E59076E4E4"
	hash "0x052991E59076E4E4"
	jhash (0xD43BB56D)
	arguments {
		Hash "p0",

		AnyPtr "p1",
	}
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		p0 was always 0xAE2602A3.
</summary>
	]]

native "CLEAR_PED_IN_PAUSE_MENU"
	hash "0x5E62BE5DC58E9E06"
	jhash (0x28058ACF)
	ns "HUD"
	returns	"void"

native "GIVE_PED_TO_PAUSE_MENU"
	hash "0xAC0BFBDC3BE00E14"
	jhash (0x2AD2C9CE)
	arguments {
		Ped "ped",

		int "p1",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		p1 is either 1 or 2 in the PC scripts.
</summary>
	]]

native "0x3CA6050692BC61B0"
	hash "0x3CA6050692BC61B0"
	jhash (0x127310EB)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "0xECF128344E9FF9F1"
	hash "0xECF128344E9FF9F1"
	jhash (0x8F45D327)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "_SHOW_SOCIAL_CLUB_LEGAL_SCREEN"
	hash "0x805D7CBB36FD6C4C"
	jhash (0x19FCBBB2)
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		probs one frame
</summary>
	]]

native "0xF13FE2A80C05C561"
	hash "0xF13FE2A80C05C561"
	jhash (0x850690FF)
	ns "HUD"
	returns	"Any"

native "0x6F72CD94F7B5B68C"
	hash "0x6F72CD94F7B5B68C"
	jhash (0x9D4934F4)
	ns "HUD"
	returns	"int"

native "0x75D3691713C3B05A"
	hash "0x75D3691713C3B05A"
	jhash (0x57218529)
	ns "HUD"
	returns	"void"

native "0xD2B32BE3FC1626C6"
	hash "0xD2B32BE3FC1626C6"
	jhash (0x5F86AA39)
	ns "HUD"
	returns	"void"

native "0x9E778248D6685FE0"
	hash "0x9E778248D6685FE0"
	jhash (0x7AD67C95)
	arguments {
		charPtr "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		UI::0x7AD67C95("Gallery");
		UI::0x7AD67C95("Missions");
		UI::0x7AD67C95("General");
		UI::0x7AD67C95("Playlists");
</summary>
	]]

native "IS_SOCIAL_CLUB_ACTIVE"
	hash "0xC406BE343FC4B9AF"
	jhash (0xD4DA14EF)
	alias "0xC406BE343FC4B9AF"
	ns "HUD"
	returns	"BOOL"

native "0x1185A8087587322C"
	hash "0x1185A8087587322C"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		SET_TEXT_??? - Used in golf and golf_mp
</summary>
	]]

native "0x8817605C2BA76200"
	hash "0x8817605C2BA76200"
	ns "HUD"
	returns	"void"

native "_IS_TEXT_CHAT_ACTIVE"
	hash "0xB118AF58B5F332A1"
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether or not the text chat (MULTIPLAYER_CHAT Scaleform component) is active.
</summary>
	]]

native "_ABORT_TEXT_CHAT"
	hash "0x1AC8F4AD40E22127"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Aborts the current message in the text chat.
</summary>
	]]

native "_SET_TEXT_CHAT_UNK"
	hash "0x1DB21A44B09E8BA3"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Sets an unknown boolean value in the text chat.
</summary>
	]]

native "0xCEF214315D276FD1"
	hash "0xCEF214315D276FD1"
	jhash (0xFF06772A)
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "_SET_PED_AI_BLIP"
	hash "0xD30C50DF888D58B5"
	jhash (0x96C4C4DD)
	arguments {
		int "pedHandle",

		BOOL "showViewCones",
	}
	alias "0xD30C50DF888D58B5"
	alias "_SET_PED_ENEMY_AI_BLIP"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Previously named _0xD30C50DF888D58B5, this native turns on the AI blip on the specified ped. It also disappears automatically when the ped is too far or if the ped is dead. You don't need to control it with other natives. 

		See gtaforums.com/topic/884370-native-research-ai-blips for further information.

		Note: Everything said at the bottom is only valid for persistant peds, as AI blips seem to behave differently for non-persistant peds.

		• To create an AI blip, you must use UI::0xD30C50DF888D58B5() (_SET_PED_ENEMY_AI_BLIP). It has two arguments: "ped" which is the ped you want to AI blip to be linked to, and "showViewCones" which needs to be true for AI blips to appear.

		• To check if a ped has an AI blip, you can use UI::DOES_PED_HAVE_AI_BLIP(Ped ped), which returns a simple bool.

		• By default, AI blips never disappear. If you want them to disappear when you're at a certain distance from a ped, you can use UI::0x97C65887D4B37FA9(Ped ped, float distance) (_SET_AI_BLIP_MAX_DISTANCE)

		• By default, the blip only appears when you're in combat with the specified ped. If you want it to be always displayed, you can use UI::x0C4BBF625CA98C4E() (_IS_AI_BLIP_ALWAYS_SHOWN). It also has two arguments: "ped", and a flag. If the flag is set to true, the blip will always be displayed. If it's set to false, the AI blip will have its default behaviour.

		• By default, a view cone is displayed with the blip (basically a blue surface that represents the field of view of the ped, like in vanilla stealth missions). If you don't want it, you can disable it with UI::HIDE_SPECIAL_ABILITY_LOCKON_OPERATION(Ped ped, bool flag). If the flag is set to true, the view cone is displayed. If the flag is set to false, it is not.

		• Finally, there's actually 3 types of AI blips:
		0 - the default, red, "enemy" blip
		1 - a weird, semi-transparent, nameless, yellow blip
		2 - the blue "friend" blip
		You can change an AI blip's type with UI::0xE52B8E7F85D39A08(Ped ped, int type) (_SET_AI_BLIP_TYPE).

</summary>
	]]

native "DOES_PED_HAVE_AI_BLIP"
	hash "0x15B8ECF844EE67ED"
	jhash (0x3BE1257F)
	arguments {
		Ped "ped",
	}
	ns "HUD"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether the ped's blip is controlled by the game. 
		It's the default blip you can see on enemies during freeroam in singleplayer (the one that fades out quickly). 
</summary>
	]]

native "_SET_AI_BLIP_TYPE"
	hash "0xE52B8E7F85D39A08"
	jhash (0xD8E31B1A)
	arguments {
		Ped "ped",

		int "type",
	}
	alias "0xE52B8E7F85D39A08"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Set a ped's AI blip type:


		1 - Yellow blip with no name
		2 
</summary>
	]]

native "HIDE_SPECIAL_ABILITY_LOCKON_OPERATION"
	hash "0x3EED80DFF7325CAA"
	jhash (0x872C2CFB)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Hash collision

		If used with a Ped that has an AI blip as the first argument:
		- if p1 is true, a view cone is displayed with the AI blip
</summary>
	]]

native "_IS_AI_BLIP_ALWAYS_SHOWN"
	hash "0x0C4BBF625CA98C4E"
	jhash (0xFFDF46F0)
	arguments {
		Ped "ped",

		BOOL "flag",
	}
	alias "0x0C4BBF625CA98C4E"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		if "flag" is true, the AI blip will always be displayed for the specified ped, if it has an AI blip

		If "flag" is false, the AI blip will only be displayed when the player is in combat with the specified ped, if it has an AI blip
</summary>
	]]

native "_SET_AI_BLIP_MAX_DISTANCE"
	hash "0x97C65887D4B37FA9"
	jhash (0xF9DC2AF7)
	arguments {
		Ped "ped",

		float "distance",
	}
	alias "0x97C65887D4B37FA9"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		Previously named _0x97C65887D4B37FA9.
		Sets the maximum view distance for the AI BIP
</summary>
	]]

native "0x7CD934010E115C2C"
	hash "0x7CD934010E115C2C"
	jhash (0x06349065)
	arguments {
		Ped "ped",
	}
	ns "HUD"
	returns	"BlipPtr"

native "_GET_AI_BLIP"
	hash "0x56176892826A4FE8"
	jhash (0xCA52CF43)
	arguments {
		Ped "ped",
	}
	alias "0x56176892826A4FE8"
	ns "HUD"
	returns	"Blip"
	doc [[!
<summary>
		Returns the current AI BLIP for the specified ped
</summary>
	]]

native "0xA277800A9EAE340E"
	hash "0xA277800A9EAE340E"
	ns "HUD"
	returns	"Any"

native "0x2632482FD6B9AB87"
	hash "0x2632482FD6B9AB87"
	ns "HUD"
	returns	"void"

native "_SET_DIRECTOR_MODE"
	hash "0x808519373FD336A3"
	arguments {
		BOOL "toggle",
	}
	alias "0x808519373FD336A3"
	ns "HUD"
	returns	"void"
	doc [[!
<summary>
		If toggle is true, hides special ability bar / character name in the pause menu
		If toggle is false, shows special ability bar / character name in the pause menu
</summary>
	]]

native "0x04655F9D075D0AE5"
	hash "0x04655F9D075D0AE5"
	arguments {
		BOOL "p0",
	}
	ns "HUD"
	returns	"void"

native "SET_DEBUG_LINES_AND_SPHERES_DRAWING_ACTIVE"
	hash "0x175B6BFC15CDD0C5"
	jhash (0x1418CA37)
	arguments {
		BOOL "enabled",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "DRAW_DEBUG_LINE"
	hash "0x7FDFADE676AA3CB0"
	jhash (0xABF783AB)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "DRAW_DEBUG_LINE_WITH_TWO_COLOURS"
	hash "0xD8B9A8AC5608FF94"
	jhash (0xE8BFF632)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "r1",

		int "g1",

		int "b1",

		int "r2",

		int "g2",

		int "b2",

		int "alpha1",

		int "alpha2",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "DRAW_DEBUG_SPHERE"
	hash "0xAAD68E1AB39DA632"
	jhash (0x304D0EEF)
	arguments {
		float "x",

		float "y",

		float "z",

		float "radius",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "DRAW_DEBUG_BOX"
	hash "0x083A2CA4F2E573BD"
	jhash (0x8524A848)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "DRAW_DEBUG_CROSS"
	hash "0x73B1189623049839"
	jhash (0xB6DF3709)
	arguments {
		float "x",

		float "y",

		float "z",

		float "size",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "DRAW_DEBUG_TEXT"
	hash "0x3903E216620488E8"
	jhash (0x269B006F)
	arguments {
		charPtr "text",

		float "x",

		float "y",

		float "z",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "DRAW_DEBUG_TEXT_2D"
	hash "0xA3BB2E9555C05A8F"
	jhash (0x528B973B)
	arguments {
		charPtr "text",

		float "x",

		float "y",

		float "z",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		NOTE: Debugging functions are not present in the retail version of the game.
</summary>
	]]

native "DRAW_LINE"
	hash "0x6B7256074AE34680"
	jhash (0xB3426BCC)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Draws a depth-tested line from one point to another.
		----------------
		x1, y1, z1 : Coordinates for the first point
		x2, y2, z2 : Coordinates for the second point
		r, g, b, alpha : Color with RGBA-Values
		I recommend using a predefined function to call this.
		[VB.NET]
		Public Sub DrawLine(from As Vector3, [to] As Vector3, col As Color)
		    [Function].Call(Hash.DRAW_LINE, from.X, from.Y, from.Z, [to].X, [to].Y, [to].Z, col.R, col.G, col.B, col.A)
		End Sub

		[C#]
		public void DrawLine(Vector3 from, Vector3 to, Color col)
		{
		    Function.Call(Hash.DRAW_LINE, from.X, from.Y, from.Z, to.X, to.Y, to.Z, col.R, col.G, col.B, col.A);
		}
</summary>
	]]

native "DRAW_POLY"
	hash "0xAC26716048436851"
	jhash (0xABD19253)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		float "x3",

		float "y3",

		float "z3",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		x/y/z - Location of a vertex (in world coords), presumably.
		----------------
		x1, y1, z1     : Coordinates for the first point
		x2, y2, z2     : Coordinates for the second point
		x3, y3, z3     : Coordinates for the third point
		r, g, b, alpha : Color with RGBA-Values

		Keep in mind that only one side of the drawn triangle is visible: It's the side, in which the vector-product of the vectors heads to: (b-a)x(c-a) Or (b-a)x(c-b).
		But be aware: The function seems to work somehow differently. I have trouble having them drawn in rotated orientation. Try it yourself and if you somehow succeed, please edit this and post your solution.
		I recommend using a predefined function to call this.
		[VB.NET]
		Public Sub DrawPoly(a As Vector3, b As Vector3, c As Vector3, col As Color)
		    [Function].Call(Hash.DRAW_POLY, a.X, a.Y, a.Z, b.X, b.Y, b.Z, c.X, c.Y, c.Z, col.R, col.G, col.B, col.A)
		End Sub

		[C#]
		public void DrawPoly(Vector3 a, Vector3 b, Vector3 c, Color col)
		{
		    Function.Call(Hash.DRAW_POLY, a.X, a.Y, a.Z, b.X, b.Y, b.Z, c.X, c.Y, c.Z, col.R, col.G, col.B, col.A);
		}
		BTW: Intersecting triangles are not supported: They overlap in the order they were called.
</summary>
	]]

native "DRAW_BOX"
	hash "0xD3A9971CADAC7252"
	jhash (0xCD4D9DD5)
	arguments {
		float "x1",

		float "y1",

		float "z1",

		float "x2",

		float "y2",

		float "z2",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		x,y,z = start pos
		x2,y2,z2 = end pos

		Draw's a 3D Box between the two x,y,z coords.
		--------------
		Keep in mind that the edges of the box do only align to the worlds base-vectors. Therefore something like rotation cannot be applied. That means this function is pretty much useless, unless you want a static unicolor box somewhere.
		I recommend using a predefined function to call this.
		[VB.NET]
		Public Sub DrawBox(a As Vector3, b As Vector3, col As Color)
		    [Function].Call(Hash.DRAW_BOX,a.X, a.Y, a.Z,b.X, b.Y, b.Z,col.R, col.G, col.B, col.A)
		End Sub

		[C#]
		public void DrawBox(Vector3 a, Vector3 b, Color col)
		{
		    Function.Call(Hash.DRAW_BOX,a.X, a.Y, a.Z,b.X, b.Y, b.Z,col.R, col.G, col.B, col.A);
		}
</summary>
	]]

native "0x23BA6B0C2AD7B0D3"
	hash "0x23BA6B0C2AD7B0D3"
	jhash (0xC44C2F44)
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Found only in all creator scripts. (fm_capture_creator, fm_deathmatch_creator, fm_lts_creator, fm_mission_controller, fm_race_creator)

		Used in-between DRAW_* calls (DRAW_POLY specifically).

</summary>
	]]

native "0x1DD2139A9A20DCE8"
	hash "0x1DD2139A9A20DCE8"
	jhash (0xBA9AD458)
	ns "GRAPHICS"
	returns	"BOOL"

native "0x90A78ECAA4E78453"
	hash "0x90A78ECAA4E78453"
	jhash (0xADBBA287)
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Seems to return a value 0-2.
</summary>
	]]

native "0x0A46AF8A78DC5E0A"
	hash "0x0A46AF8A78DC5E0A"
	jhash (0x9E553002)
	ns "GRAPHICS"
	returns	"void"

native "0x4862437A486F91B0"
	hash "0x4862437A486F91B0"
	jhash (0x56C1E488)
	arguments {
		charPtr "p0",

		AnyPtr "p1",

		AnyPtr "p2",

		BOOL "p3",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Possibly some unknown structures.
</summary>
	]]

native "0x1670F8D05056F257"
	hash "0x1670F8D05056F257"
	jhash (0x226B08EA)
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Seems to return a value 0-2.
</summary>
	]]

native "0x7FA5D82B8F58EC06"
	hash "0x7FA5D82B8F58EC06"
	jhash (0x1F3CADB0)
	ns "GRAPHICS"
	returns	"BOOL"

native "0x5B0316762AFD4A64"
	hash "0x5B0316762AFD4A64"
	jhash (0xA9DC8558)
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Seems to return a value 0-2.
</summary>
	]]

native "0x346EF3ECAAAB149E"
	hash "0x346EF3ECAAAB149E"
	jhash (0x88EAF398)
	ns "GRAPHICS"
	returns	"void"

native "0xA67C35C56EB1BD9D"
	hash "0xA67C35C56EB1BD9D"
	jhash (0x47B0C137)
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Only one instances in two scripts. (cellphone_controller, maintransition)
</summary>
	]]

native "0x0D6CA79EEEBD8CA3"
	hash "0x0D6CA79EEEBD8CA3"
	jhash (0x65376C9B)
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Seems to return a value 0-2.
</summary>
	]]

native "0xD801CC02177FA3F1"
	hash "0xD801CC02177FA3F1"
	jhash (0x9CBA682A)
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		4 matches across 2 scripts.

		appcamera:
		called after UI::HIDE_HUD_AND_RADAR_THIS_FRAME() and before GRAPHICS::0x108F36CC();

		cellphone_controller:
		called after GRAPHICS::0xE9F2B68F(0, 0) and before GRAPHICS::0x108F36CC();
</summary>
	]]

native "0x1BBC135A4D25EDDE"
	hash "0x1BBC135A4D25EDDE"
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Only one instance across all scripts. (maintransition)
		May not be a bool, it could be one of these 0-2 values that are returned just about 500 god damn times.
</summary>
	]]

native "0x3DEC726C25A11BAC"
	hash "0x3DEC726C25A11BAC"
	jhash (0x3B15D33C)
	arguments {
		int "p0",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		1 match in 1 script. cellphone_controller.
		p0 is -1 in scripts.

		Dr. Underscore (1/6/18):
		I have two uses in two scripts; and it's called with -1 in maintransition, not cellphone_controller. Are you using x360 scripts, or an older version of PC scripts?
		Also returns bool.
</summary>
	]]

native "0x0C0C4E81E1AC60A0"
	hash "0x0C0C4E81E1AC60A0"
	jhash (0xEC5D0317)
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Dr. Underscore (1/6/18):
		Seems to return a value 0-2.
</summary>
	]]

native "0x759650634F07B6B4"
	hash "0x759650634F07B6B4"
	jhash (0x25D569EB)
	arguments {
		int "p0",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "0xCB82A0BF0E3E3265"
	hash "0xCB82A0BF0E3E3265"
	jhash (0xCFCDC518)
	arguments {
		int "p0",
	}
	ns "GRAPHICS"
	returns	"int"

native "0x6A12D88881435DCA"
	hash "0x6A12D88881435DCA"
	jhash (0x108F36CC)
	ns "GRAPHICS"
	returns	"void"

native "0x1072F115DAB0717E"
	hash "0x1072F115DAB0717E"
	jhash (0xE9F2B68F)
	arguments {
		BOOL "p0",

		BOOL "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "GET_MAXIMUM_NUMBER_OF_PHOTOS"
	hash "0x34D23450F028B0BF"
	jhash (0x727AA63F)
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		This function is hard-coded to always return 0.

		Limit is 96, see _GET_MAXIMUM_NUMBER_OF_PHOTOS_2 (0xDC54A7AF8B3A14EF).
</summary>
	]]

native "_GET_MAXIMUM_NUMBER_OF_PHOTOS_2"
	hash "0xDC54A7AF8B3A14EF"
	jhash (0x239272BD)
	alias "0xDC54A7AF8B3A14EF"
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		This is the "actual" GET_MAXIMUM_NUMBER_OF_PHOTOS native. Always returns 96.
</summary>
	]]

native "_GET_NUMBER_OF_PHOTOS"
	hash "0x473151EBC762C6DA"
	jhash (0x21DBF0C9)
	alias "0x473151EBC762C6DA"
	ns "GRAPHICS"
	returns	"int"

native "0x2A893980E96B659A"
	hash "0x2A893980E96B659A"
	jhash (0x199FABF0)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		2 matches across 2 scripts. Only showed in appcamera &amp; appmedia. Both were 0.

		Dr. Underscore (1/6/18):
		I've found a reference in maintransition with 1, plus in appcamera and appmedia.
		Takes and returns a bool.
</summary>
	]]

native "0xF5BED327CEA362B1"
	hash "0xF5BED327CEA362B1"
	jhash (0x596B900D)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		3 matches across 3 scripts. First 2 were 0, 3rd was 1. Possibly a bool.
		appcamera, appmedia, and cellphone_controller.
</summary>
	]]

native "0x4AF92ACD3141D96C"
	hash "0x4AF92ACD3141D96C"
	jhash (0xC9EF81ED)
	ns "GRAPHICS"
	returns	"void"

native "0xE791DF1F73ED2C8B"
	hash "0xE791DF1F73ED2C8B"
	jhash (0x9D84554C)
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"Any"
	doc [[!
<summary>
		This function is hard-coded to always return 0.
</summary>
	]]

native "0xEC72C258667BE5EA"
	hash "0xEC72C258667BE5EA"
	jhash (0x9C106AD9)
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"Any"
	doc [[!
<summary>
		This function is hard-coded to always return 0.
</summary>
	]]

native "_RETURN_TWO"
	hash "0x40AFB081F8ADD4EE"
	jhash (0x762E5C5F)
	arguments {
		Any "p0",
	}
	alias "0x40AFB081F8ADD4EE"
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		It returns two lol

		li r3, 2
		blr

		thats all it does.

		mov dword ptr [rax], 2

		Заебись функционал
</summary>
	]]

native "_DRAW_LIGHT_WITH_RANGE_AND_SHADOW"
	hash "0xF49E9A9716A04595"
	arguments {
		float "x",

		float "y",

		float "z",

		int "r",

		int "g",

		int "b",

		float "range",

		float "intensity",

		float "shadow",
	}
	alias "_DRAW_LIGHT_WITH_RANGE_WITH_SHADOW"
	ns "GRAPHICS"
	returns	"void"

native "DRAW_LIGHT_WITH_RANGE"
	hash "0xF2A1B2771A01DBD4"
	jhash (0x6A396E9A)
	arguments {
		float "posX",

		float "posY",

		float "posZ",

		int "colorR",

		int "colorG",

		int "colorB",

		float "range",

		float "intensity",
	}
	ns "GRAPHICS"
	returns	"void"

native "DRAW_SPOT_LIGHT"
	hash "0xD0F64B265C8C8B33"
	jhash (0xBDBC410C)
	arguments {
		float "posX",

		float "posY",

		float "posZ",

		float "dirX",

		float "dirY",

		float "dirZ",

		int "colorR",

		int "colorG",

		int "colorB",

		float "distance",

		float "brightness",

		float "hardness",

		float "radius",

		float "falloff",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Parameters:
		* pos - coordinate where the spotlight is located
		* dir - the direction vector the spotlight should aim at from its current position
		* r,g,b - color of the spotlight
		* distance - the maximum distance the light can reach
		* brightness - the brightness of the light
		* roundness - "smoothness" of the circle edge
		* radius - the radius size of the spotlight
		* falloff - the falloff size of the light's edge (example: www.i.imgur.com/DemAWeO.jpg)

		Example in C# (spotlight aims at the closest vehicle):
		Vector3 myPos = Game.Player.Character.Position;
		Vehicle nearest = World.GetClosestVehicle(myPos , 1000f);
		Vector3 destinationCoords = nearest.Position;
		Vector3 dirVector = destinationCoords - myPos;
		dirVector.Normalize();
		Function.Call(Hash.DRAW_SPOT_LIGHT, pos.X, pos.Y, pos.Z, dirVector.X, dirVector.Y, dirVector.Z, 255, 255, 255, 100.0f, 1f, 0.0f, 13.0f, 1f);
</summary>
	]]

native "_DRAW_SPOT_LIGHT_WITH_SHADOW"
	hash "0x5BCA583A583194DB"
	jhash (0x32BF9598)
	arguments {
		float "posX",

		float "posY",

		float "posZ",

		float "dirX",

		float "dirY",

		float "dirZ",

		int "colorR",

		int "colorG",

		int "colorB",

		float "distance",

		float "brightness",

		float "roundness",

		float "radius",

		float "falloff",

		int "shadowId",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		shadowId: each call to this native in the same tick should have a different value passed to this parameter, if two or more calls have the same values, only the first one will render its shadow properly
</summary>
	]]

native "0xC9B18B4619F48F7B"
	hash "0xC9B18B4619F48F7B"
	jhash (0x93628786)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "_ENTITY_DESCRIPTION_TEXT"
	hash "0xDEADC0DEDEADC0DE"
	arguments {
		Entity "entity",
	}
	alias "0xDEADC0DEDEADC0DE"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Only found twice in decompiled scripts. Something to do with an entity/object?

		On a side note, it's very interesting how the hash for this native is "DEADC0DE" - this is usually used as padding for initializing a buffer of some sort. I wonder if this native is actually "dead"?

		"carmod_shop.ysc", line 9520:
		if (ENTITY::DOES_ENTITY_EXIST(l_324._f6)) {
		    GRAPHICS::_0xDEADC0DEDEADC0DE(l_324._f6);
		}

		"fm_mission_controller.ysc", line 189641:
		if (GAMEPLAY::IS_BIT_SET(g_1870E1._f7B64[a_0/*104*/]._f25, 28)) {
		    GRAPHICS::_0xDEADC0DEDEADC0DE(NETWORK::NET_TO_OBJ(l_4064._f26A._f87[a_0/*1*/]));
		    if (!GAMEPLAY::IS_BIT_SET(g_1870E1._f7B64[a_0/*104*/]._f25, 31)) {
		        if (!ENTITY::IS_ENTITY_DEAD(v_7)) {
		            AUDIO::PLAY_SOUND_FROM_ENTITY(-1, "EMP_Vehicle_Hum", v_7, "DLC_HEIST_BIOLAB_DELIVER_EMP_SOUNDS", 0, 0);
		            GAMEPLAY::SET_BIT(&amp;g_1870E1._f7B64[a_0/*104*/]._f25, 31);
		        }
		    }
		}

		Console Hash: 0xC12AC47A

		----------

		It's most likely named UPDATE_* (like UPDATE_ENTITY_SHIT_OR_SOMETHING).
</summary>
	]]

native "DRAW_MARKER"
	hash "0x28477EC23D892089"
	jhash (0x48D84A02)
	arguments {
		int "type",

		float "posX",

		float "posY",

		float "posZ",

		float "dirX",

		float "dirY",

		float "dirZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "scaleX",

		float "scaleY",

		float "scaleZ",

		int "red",

		int "green",

		int "blue",

		int "alpha",

		BOOL "bobUpAndDown",

		BOOL "faceCamera",

		int "p19",

		BOOL "rotate",

		charPtr "textureDict",

		charPtr "textureName",

		BOOL "drawOnEnts",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		enum MarkerTypes
		{
			MarkerTypeUpsideDownCone = 0,
			MarkerTypeVerticalCylinder = 1,
			MarkerTypeThickChevronUp = 2,
			MarkerTypeThinChevronUp = 3,
			MarkerTypeCheckeredFlagRect = 4,
			MarkerTypeCheckeredFlagCircle = 5,
			MarkerTypeVerticleCircle = 6,
			MarkerTypePlaneModel = 7,
			MarkerTypeLostMCDark = 8,
			MarkerTypeLostMCLight = 9,
			MarkerTypeNumber0 = 10,
			MarkerTypeNumber1 = 11,
			MarkerTypeNumber2 = 12,
			MarkerTypeNumber3 = 13,
			MarkerTypeNumber4 = 14,
			MarkerTypeNumber5 = 15,
			MarkerTypeNumber6 = 16,
			MarkerTypeNumber7 = 17,
			MarkerTypeNumber8 = 18,
			MarkerTypeNumber9 = 19,
			MarkerTypeChevronUpx1 = 20,
			MarkerTypeChevronUpx2 = 21,
			MarkerTypeChevronUpx3 = 22,
			MarkerTypeHorizontalCircleFat = 23,
			MarkerTypeReplayIcon = 24,
			MarkerTypeHorizontalCircleSkinny = 25,
			MarkerTypeHorizontalCircleSkinny_Arrow = 26,
			MarkerTypeHorizontalSplitArrowCircle = 27,
			MarkerTypeDebugSphere = 28,
			MarkerTypeDallorSign = 29,
			MarkerTypeHorizontalBars = 30,
			MarkerTypeWolfHead = 31
		};

		dirX/Y/Z represent a heading on each axis in which the marker should face, alternatively you can rotate each axis independently with rotX/Y/Z (and set dirX/Y/Z all to 0).

		faceCamera - Rotates only the y-axis (the heading) towards the camera

		p19 - no effect, default value in script is 2

		rotate - Rotates only on the y-axis (the heading)

		textureDict - Name of texture dictionary to load texture from (e.g. "GolfPutting")

		textureName - Name of texture inside dictionary to load (e.g. "PuttingMarker")

		drawOnEnts - Draws the marker onto any entities that intersect it

		basically what he said, except textureDict and textureName are totally not char*, or if so, then they are always set to 0/NULL/nullptr in every script I checked, eg:

		bj.c: graphics::draw_marker(6, vParam0, 0f, 0f, 1f, 0f, 0f, 0f, 4f, 4f, 4f, 240, 200, 80, iVar1, 0, 0, 2, 0, 0, 0, false);

		his is what I used to draw an amber downward pointing chevron "V", has to be redrawn every frame.  The 180 is for 180 degrees rotation around the Y axis, the 50 is alpha, assuming max is 100, but it will accept 255.

		GRAPHICS::DRAW_MARKER(2, v.x, v.y, v.z + 2, 0, 0, 0, 0, 180, 0, 2, 2, 2, 255, 128, 0, 50, 0, 1, 1, 0, 0, 0, 0);


</summary>
	]]

native "CREATE_CHECKPOINT"
	hash "0x0134F0835AB6BFCB"
	jhash (0xF541B690)
	arguments {
		int "type",

		float "posX1",

		float "posY1",

		float "posZ1",

		float "posX2",

		float "posY2",

		float "posZ2",

		float "radius",

		int "red",

		int "green",

		int "blue",

		int "alpha",

		int "reserved",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Creates a checkpoint. Returns the handle of the checkpoint.

		20/03/17 : Attention, checkpoints are already handled by the game itself, so you must not loop it like markers.

		Parameters:
		* type - The type of checkpoint to create. See below for a list of checkpoint types.
		* pos1 - The position of the checkpoint.
		* pos2 - The position of the next checkpoint to point to.
		* radius - The radius of the checkpoint.
		* color - The color of the checkpoint.
		* reserved - Special parameter, see below for details. Usually set to 0 in the scripts.

		Checkpoint types:
		0-4---------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
		5-9---------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
		10-14-------Ring: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
		15-19-------1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker      
		20-24-------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker 
		25-29-------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker    
		30-34-------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker 
		35-38-------Ring: Airplane Up, Left, Right, UpsideDown
		39----------?
		40----------Ring: just a ring
		41----------?
		42-44-------Cylinder w/ number (uses 'reserved' parameter)
		45-47-------Cylinder no arrow or number

		If using type 42-44, reserved sets number / number and shape to display

		0-99------------Just numbers (0-99)
		100-109-----------------Arrow (0-9)
		110-119------------Two arrows (0-9)
		120-129----------Three arrows (0-9)
		130-139----------------Circle (0-9)
		140-149------------CycleArrow (0-9)
		150-159----------------Circle (0-9)
		160-169----Circle  w/ pointer (0-9)
		170-179-------Perforated ring (0-9)
		180-189----------------Sphere (0-9)
</summary>
	]]

native "_SET_CHECKPOINT_SCALE"
	hash "0x4B5B4DA5D79F1943"
	jhash (0x80151CCF)
	arguments {
		int "checkpoint",

		float "p0",
	}
	alias "0x4B5B4DA5D79F1943"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		p0 - Scale? Looks to be a normalized value (0.0 - 1.0)

		offroad_races.c4, line ~67407:
		a_3._f7 = GRAPHICS::CREATE_CHECKPOINT(v_D, v_A, a_4, a_7, v_E, v_F, v_10, sub_62b2(v_A, 220, 255), 0);
		UI::GET_HUD_COLOUR(134, &amp;v_E, &amp;v_F, &amp;v_10, &amp;v_11);
		GRAPHICS::_SET_CHECKPOINT_ICON_RGBA(a_3._f7, v_E, v_F, v_10, sub_62b2(v_A, 70, 210));
		GRAPHICS::_4B5B4DA5D79F1943(a_3._f7, 0.95);
		GRAPHICS::SET_CHECKPOINT_CYLINDER_HEIGHT(a_3._f7, 4.0, 4.0, 100.0);

</summary>
	]]

native "SET_CHECKPOINT_CYLINDER_HEIGHT"
	hash "0x2707AAE9D9297D89"
	jhash (0xFF0F9B22)
	arguments {
		int "checkpoint",

		float "nearHeight",

		float "farHeight",

		float "radius",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Sets the cylinder height of the checkpoint.

		Parameters:
		* nearHeight - The height of the checkpoint when inside of the radius.
		* farHeight - The height of the checkpoint when outside of the radius.
		* radius - The radius of the checkpoint.
</summary>
	]]

native "SET_CHECKPOINT_RGBA"
	hash "0x7167371E8AD747F7"
	jhash (0xEF9C8CB3)
	arguments {
		int "checkpoint",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Sets the checkpoint color.
</summary>
	]]

native "_SET_CHECKPOINT_ICON_RGBA"
	hash "0xB9EA40907C680580"
	jhash (0xA5456DBB)
	arguments {
		int "checkpoint",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Sets the checkpoint icon color.
</summary>
	]]

native "0xF51D36185993515D"
	hash "0xF51D36185993515D"
	jhash (0x20EABD0F)
	arguments {
		int "checkpoint",

		float "posX",

		float "posY",

		float "posZ",

		float "unkX",

		float "unkY",

		float "unkZ",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		This does not move an existing checkpoint... so wtf.
</summary>
	]]

native "0x615D3925E87A3B26"
	hash "0x615D3925E87A3B26"
	jhash (0x1E3A3126)
	arguments {
		int "checkpoint",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Unknown. Called after creating a checkpoint (type: 51) in the creators.
</summary>
	]]

native "DELETE_CHECKPOINT"
	hash "0xF5ED37F54CD4D52E"
	jhash (0xB66CF3CA)
	arguments {
		int "checkpoint",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x22A249A53034450A"
	hash "0x22A249A53034450A"
	jhash (0x932FDB81)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xDC459CFA0CCE245B"
	hash "0xDC459CFA0CCE245B"
	jhash (0x7E946E87)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "REQUEST_STREAMED_TEXTURE_DICT"
	hash "0xDFA2EF8E04127DD5"
	jhash (0x4C9B035F)
	arguments {
		charPtr "textureDict",

		BOOL "p1",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		last param seems to be unused in disassembly
</summary>
	]]

native "HAS_STREAMED_TEXTURE_DICT_LOADED"
	hash "0x0145F696AAAAD2E4"
	jhash (0x3F436EEF)
	arguments {
		charPtr "textureDict",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "SET_STREAMED_TEXTURE_DICT_AS_NO_LONGER_NEEDED"
	hash "0xBE2CACCF5A8AA805"
	jhash (0xF07DDA38)
	arguments {
		charPtr "textureDict",
	}
	ns "GRAPHICS"
	returns	"void"

native "DRAW_RECT"
	hash "0x3A618A217E5154F0"
	jhash (0xDD2BFC77)
	arguments {
		float "x",

		float "y",

		float "width",

		float "height",

		int "r",

		int "g",

		int "b",

		int "a",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Draws a rectangle on the screen.

		-x: The relative X point of the center of the rectangle. (0.0-1.0, 0.0 is the left edge of the screen, 1.0 is the right edge of the screen)

		-y: The relative Y point of the center of the rectangle. (0.0-1.0, 0.0 is the top edge of the screen, 1.0 is the bottom edge of the screen)

		-width: The relative width of the rectangle. (0.0-1.0, 1.0 means the whole screen width)

		-height: The relative height of the rectangle. (0.0-1.0, 1.0 means the whole screen height)

		-R: Red part of the color. (0-255)

		-G: Green part of the color. (0-255)

		-B: Blue part of the color. (0-255)

		-A: Alpha part of the color. (0-255, 0 means totally transparent, 255 means totally opaque)

		The total number of rectangles to be drawn in one frame is apparently limited to 399.

</summary>
	]]

native "0xC6372ECD45D73BCD"
	hash "0xC6372ECD45D73BCD"
	jhash (0xF8FBCC25)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "_SET_UI_LAYER"
	hash "0x61BB1D9B3A95D802"
	jhash (0xADF81D24)
	arguments {
		int "layer",
	}
	alias "0x61BB1D9B3A95D802"
	alias "_SET_2D_LAYER"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Called before drawing stuff.

		Examples:
		GRAPHICS::_61BB1D9B3A95D802(7);
		GRAPHICS::DRAW_RECT(0.5, 0.5, 3.0, 3.0, v_4, v_5, v_6, a_0._f172, 0);

		GRAPHICS::_61BB1D9B3A95D802(1);
		GRAPHICS::DRAW_RECT(0.5, 0.5, 1.5, 1.5, 0, 0, 0, 255, 0);

		Appears to be the layer it's drawn on 

</summary>
	]]

native "_SCREEN_DRAW_POSITION_BEGIN"
	hash "0xB8A850F20A067EB6"
	jhash (0x228A2598)
	arguments {
		int "horizontal",

		int "vertical",
	}
	alias "_SET_SCREEN_DRAW_POSITION"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		This function anchors all drawn objects to a side of the safe zone. This needs to be called to make the interface invulnerable to changes in safezone size among different users.
		
		The horizontalAnchor can be called with values:
		67 - Right: DRAW_TEXT starts in the middle of the screen, while DRAW_RECT starts on the right; both move with the right side of the screen
		76 - Left: Anchors to the left side, DRAW_RECT starts on the left side of the screen, same as DRAW_TEXT when centered
		82 - Right: DRAW_TEXT starts on the left side (normal 0,0), while DRAW_RECT starts some short distance away from the right side of the screen, both move with the right side of the screen
		
		The verticalAnchor can be called with values:
		66 - Bottom: DRAW_RECT starts about as far as the middle of the map from the bottom, while DRAW_TEXT is about rather centered
		67 - Bottom: It starts at a certain distance from the bottom, but the distance is fixed, the distance is different from 66.
		84 - Top: Anchors to the top, DRAW_RECT starts on the top of the screen, DRAW_TEXT just below it
		
		Calling it with any other values, is as good as not calling it at all, which can be selectively done. e.g. _SCREEN_DRAW_POSITION_BEGIN(0,84) makes all draw commands scale with the top screen, but with neither sides. This is exetremely useful for aligning something with the top-center.

		edit:
		this is to make drawn text, scaleforms and sprites be isolated from the "main screen" used when you change the RenderTarget id so you to draw on phone do this before you "draw" things and then do "SCREEN_DRAW_POSITION_END()"
</summary>
	]]

native "_SCREEN_DRAW_POSITION_END"
	hash "0xE3A3DB414A373DAB"
	jhash (0x3FE33BD6)
	alias "0xE3A3DB414A373DAB"
	ns "GRAPHICS"
	returns	"void"

native "_SCREEN_DRAW_POSITION_RATIO"
	hash "0xF5A2C681787E579D"
	jhash (0x76C641E4)
	arguments {
		float "x",

		float "y",

		float "p2",

		float "p3",
	}
	alias "0xF5A2C681787E579D"
	ns "GRAPHICS"
	returns	"void"

native "0x6DD8F5AA635EB4B2"
	hash "0x6DD8F5AA635EB4B2"
	arguments {
		float "p0",

		float "p1",

		floatPtr "p2",

		floatPtr "p3",
	}
	ns "GRAPHICS"
	returns	"void"

native "GET_SAFE_ZONE_SIZE"
	hash "0xBAF107B6BB2C97F0"
	jhash (0x3F0D1A6F)
	ns "GRAPHICS"
	returns	"float"
	doc [[!
<summary>
		Gets the scale of safe zone. if the safe zone size scale is max, it will return 1.0.
</summary>
	]]

native "DRAW_SPRITE"
	hash "0xE7FFAE5EBF23D890"
	jhash (0x1FEC16B0)
	arguments {
		charPtr "textureDict",

		charPtr "textureName",

		float "screenX",

		float "screenY",

		float "width",

		float "height",

		float "heading",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Draws a 2D sprite on the screen.

		Parameters:
		textureDict - Name of texture dictionary to load texture from (e.g. "CommonMenu", "MPWeaponsCommon", etc.)

		textureName - Name of texture to load from texture dictionary (e.g. "last_team_standing_icon", "tennis_icon", etc.)

		screenX/Y - Screen offset (0.5 = center)
		scaleX/Y - Texture scaling. Negative values can be used to flip the texture on that axis. (0.5 = half)

		heading - Texture rotation in degrees (default = 0.0) positive is clockwise, measured in degrees

		red,green,blue - Sprite color (default = 255/255/255)

		alpha - opacity level
</summary>
	]]

native "ADD_ENTITY_ICON"
	hash "0x9CD43EEE12BF4DD0"
	jhash (0xF3027D21)
	arguments {
		Entity "entity",

		charPtr "icon",
	}
	ns "GRAPHICS"
	returns	"Any"
	doc [[!
<summary>
		Example:
		GRAPHICS::ADD_ENTITY_ICON(a_0, "MP_Arrow");

		I tried this and nothing happened...
</summary>
	]]

native "SET_ENTITY_ICON_VISIBILITY"
	hash "0xE0E8BEECCA96BA31"
	jhash (0xD1D2FD52)
	arguments {
		Entity "entity",

		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_ENTITY_ICON_COLOR"
	hash "0x1D5F595CCAE2E238"
	jhash (0x6EE1E946)
	arguments {
		Entity "entity",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_DRAW_ORIGIN"
	hash "0xAA0008F3BBB8F416"
	jhash (0xE10198D5)
	arguments {
		float "x",

		float "y",

		float "z",

		Any "p3",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Sets the on-screen drawing origin for draw-functions (which is normally x=0,y=0 in the upper left corner of the screen) to a world coordinate.
		From now on, the screen coordinate which displays the given world coordinate on the screen is seen as x=0,y=0.

		Example in C#:
		Vector3 boneCoord = somePed.GetBoneCoord(Bone.SKEL_Head);
		Function.Call(Hash.SET_DRAW_ORIGIN, boneCoord.X, boneCoord.Y, boneCoord.Z, 0);
		Function.Call(Hash.DRAW_SPRITE, "helicopterhud", "hud_corner", -0.01, -0.015, 0.013, 0.013, 0.0, 255, 0, 0, 200);
		Function.Call(Hash.DRAW_SPRITE, "helicopterhud", "hud_corner", 0.01, -0.015, 0.013, 0.013, 90.0, 255, 0, 0, 200);
		Function.Call(Hash.DRAW_SPRITE, "helicopterhud", "hud_corner", -0.01, 0.015, 0.013, 0.013, 270.0, 255, 0, 0, 200);
		Function.Call(Hash.DRAW_SPRITE, "helicopterhud", "hud_corner", 0.01, 0.015, 0.013, 0.013, 180.0, 255, 0, 0, 200);
		Function.Call(Hash.CLEAR_DRAW_ORIGIN);

		Result: www11.pic-upload.de/19.06.15/bkqohvil2uao.jpg
		If the pedestrian starts walking around now, the sprites are always around her head, no matter where the head is displayed on the screen.

		This function also effects the drawing of texts and other UI-elements.
		The effect can be reset by calling GRAPHICS::CLEAR_DRAW_ORIGIN().
</summary>
	]]

native "CLEAR_DRAW_ORIGIN"
	hash "0xFF0B610F6BE0D7AF"
	jhash (0xDD76B263)
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Resets the screen's draw-origin which was changed by the function GRAPHICS::SET_DRAW_ORIGIN(...) back to x=0,y=0.

		See GRAPHICS::SET_DRAW_ORIGIN(...) for further information.
</summary>
	]]

native "ATTACH_TV_AUDIO_TO_ENTITY"
	hash "0x845BAD77CC770633"
	jhash (0x784944DB)
	arguments {
		Entity "entity",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Might be more appropriate in AUDIO?
</summary>
	]]

native "SET_TV_AUDIO_FRONTEND"
	hash "0x113D2C5DC57E1774"
	jhash (0x2E0DFA35)
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Might be more appropriate in AUDIO?

		Rockstar made it like this.

		Probably changes tvs from being a 3d audio to being "global" audio
</summary>
	]]

native "LOAD_MOVIE_MESH_SET"
	hash "0xB66064452270E8F1"
	jhash (0x9627905C)
	arguments {
		charPtr "movieMeshSetName",
	}
	ns "GRAPHICS"
	returns	"int"

native "RELEASE_MOVIE_MESH_SET"
	hash "0xEB119AA014E89183"
	jhash (0x4FA5501D)
	arguments {
		int "movieMeshSet",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x9B6E70C5CEEF4EEB"
	hash "0x9B6E70C5CEEF4EEB"
	jhash (0x9D5D9B38)
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"Any"

native "GET_SCREEN_RESOLUTION"
	hash "0x888D57E407E63624"
	jhash (0x29F3572F)
	arguments {
		intPtr "x",

		intPtr "y",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		int screenresx,screenresy;
		GET_SCREEN_RESOLUTION(&amp;screenresx,&amp;screenresy);

		Hardcoded to always return 1280 x 720
</summary>
	]]

native "_GET_ACTIVE_SCREEN_RESOLUTION"
	hash "0x873C9F3104101DD3"
	arguments {
		intPtr "x",

		intPtr "y",
	}
	alias "_GET_SCREEN_ACTIVE_RESOLUTION"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Returns current screen resolution.
</summary>
	]]

native "_GET_ASPECT_RATIO"
	hash "0xF1307EF624A80D87"
	arguments {
		BOOL "b",
	}
	alias "_GET_SCREEN_ASPECT_RATIO"
	ns "GRAPHICS"
	returns	"float"

native "0xB2EBE8CBC58B90E9"
	hash "0xB2EBE8CBC58B90E9"
	ns "GRAPHICS"
	returns	"Any"

native "GET_IS_WIDESCREEN"
	hash "0x30CF4BDA4FCB1905"
	jhash (0xEC717AEF)
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Setting Aspect Ratio Manually in game will return:

		false - for Narrow format Aspect Ratios (3:2, 4:3, 5:4, etc. )
		true - for Wide format Aspect Ratios (5:3, 16:9, 16:10, etc. )

		Setting Aspect Ratio to "Auto" in game will return "false" or "true" based on the actual set Resolution Ratio.
</summary>
	]]

native "GET_IS_HIDEF"
	hash "0x84ED31191CC5D2C9"
	jhash (0x1C340359)
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		false = Any resolution &lt; 1280x720
		true = Any resolution &gt;= 1280x720
</summary>
	]]

native "0xEFABC7722293DA7C"
	hash "0xEFABC7722293DA7C"
	ns "GRAPHICS"
	returns	"void"

native "SET_NIGHTVISION"
	hash "0x18F621F7A5B1F85D"
	jhash (0xD1E5565F)
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Enables Night Vision.

		Example:
		C#: Function.Call(Hash.SET_NIGHTVISION, true);
		C++: GRAPHICS::SET_NIGHTVISION(true);

		BOOL toggle:
		true = turns night vision on for your player.
		false = turns night vision off for your player.
</summary>
	]]

native "0x35FB78DC42B7BD21"
	hash "0x35FB78DC42B7BD21"
	ns "GRAPHICS"
	returns	"Any"

native "_IS_NIGHTVISION_ACTIVE"
	hash "0x2202A3F42C8E5F79"
	jhash (0x62619061)
	alias "_IS_NIGHTVISION_INACTIVE"
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Gets whether or not NIGHTVISION is Active.

		Note:  When nightvision is actually active, this native will return TRUE!
</summary>
	]]

native "0xEF398BEEE4EF45F9"
	hash "0xEF398BEEE4EF45F9"
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_NOISEOVERIDE"
	hash "0xE787BF1C5CF823C9"
	jhash (0xD576F5DD)
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_NOISINESSOVERIDE"
	hash "0xCB6A7C3BB17A0C67"
	jhash (0x046B62D9)
	arguments {
		float "value",
	}
	ns "GRAPHICS"
	returns	"void"

native "GET_SCREEN_COORD_FROM_WORLD_COORD"
	hash "0x34E82F05DF2974F5"
	jhash (0x1F950E4B)
	arguments {
		float "worldX",

		float "worldY",

		float "worldZ",

		floatPtr "screenX",

		floatPtr "screenY",
	}
	alias "_WORLD3D_TO_SCREEN2D"
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Convert a world coordinate into its relative screen coordinate.  (WorldToScreen)

		Returns a boolean; whether or not the operation was successful. It will return false if the coordinates given are not visible to the rendering camera.


		For .NET users...

		VB:
		Public Shared Function World3DToScreen2d(pos as vector3) As Vector2

		        Dim x2dp, y2dp As New Native.OutputArgument

		        Native.Function.Call(Of Boolean)(Native.Hash.GET_SCREEN_COORD_FROM_WORLD_COORD , pos.x, pos.y, pos.z, x2dp, y2dp)
		        Return New Vector2(x2dp.GetResult(Of Single), y2dp.GetResult(Of Single))

		    End Function

		C#:
		Vector2 World3DToScreen2d(Vector3 pos)
		    {
		        var x2dp = new OutputArgument();
		        var y2dp = new OutputArgument();

		        Function.Call&lt;bool&gt;(Hash.GET_SCREEN_COORD_FROM_WORLD_COORD , pos.X, pos.Y, pos.Z, x2dp, y2dp);
		        return new Vector2(x2dp.GetResult&lt;float&gt;(), y2dp.GetResult&lt;float&gt;());
		    }
		//USE VERY SMALL VALUES FOR THE SCALE OF RECTS/TEXT because it is dramatically larger on screen than in 3D, e.g '0.05' small.

		Used to be called _WORLD3D_TO_SCREEN2D

		I thought we lost you from the scene forever. It does seem however that calling SET_DRAW_ORIGIN then your natives, then ending it. Seems to work better for certain things such as keeping boxes around people for a predator missile e.g.
</summary>
	]]

native "GET_TEXTURE_RESOLUTION"
	hash "0x35736EE65BD00C11"
	jhash (0x096DAA4D)
	arguments {
		charPtr "textureDict",

		charPtr "textureName",
	}
	ns "GRAPHICS"
	returns	"Vector3"
	doc [[!
<summary>
		Returns the texture resolution of the passed texture dict+name.

		Note: Most texture resolutions are doubled compared to the console version of the game.
</summary>
	]]

native "0xE2892E7E55D7073A"
	hash "0xE2892E7E55D7073A"
	jhash (0x455F1084)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_FLASH"
	hash "0x0AB84296FED9CFC6"
	jhash (0x7E55A1EE)
	arguments {
		float "p0",

		float "p1",

		float "fadeIn",

		float "duration",

		float "fadeOut",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Purpose of p0 and p1 unknown.
</summary>
	]]

native "0x3669F1B198DCAA4F"
	hash "0x3669F1B198DCAA4F"
	jhash (0x0DCC0B8B)
	ns "GRAPHICS"
	returns	"void"

native "_SET_BLACKOUT"
	hash "0x1268615ACE24D504"
	jhash (0xAA2A0EAF)
	arguments {
		BOOL "enable",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Disables all emissive textures and lights like city lights, car lights, cop car lights. Particles still emit light

		Used in Humane Labs Heist for EMP.
</summary>
	]]

native "0xC35A6D07C93802B2"
	hash "0xC35A6D07C93802B2"
	ns "GRAPHICS"
	returns	"void"

native "CREATE_TRACKED_POINT"
	hash "0xE2C9439ED45DEA60"
	jhash (0x3129C31A)
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Creates a tracked point, useful for checking the visibility of a 3D point on screen.
</summary>
	]]

native "SET_TRACKED_POINT_INFO"
	hash "0x164ECBB3CF750CB0"
	jhash (0x28689AA4)
	arguments {
		int "point",

		float "x",

		float "y",

		float "z",

		float "radius",
	}
	ns "GRAPHICS"
	returns	"void"

native "IS_TRACKED_POINT_VISIBLE"
	hash "0xC45CCDAAC9221CA8"
	jhash (0x0BFC4F64)
	arguments {
		int "point",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "DESTROY_TRACKED_POINT"
	hash "0xB25DC90BAD56CA42"
	jhash (0x14AC675F)
	arguments {
		int "point",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xBE197EAA669238F4"
	hash "0xBE197EAA669238F4"
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "GRAPHICS"
	returns	"Any"
	doc [[!
<summary>
		This function is hard-coded to always return 0.
</summary>
	]]

native "0x61F95E5BB3E0A8C6"
	hash "0x61F95E5BB3E0A8C6"
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xAE51BC858F32BA66"
	hash "0xAE51BC858F32BA66"
	arguments {
		Any "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x649C97D52332341A"
	hash "0x649C97D52332341A"
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x2C42340F916C5930"
	hash "0x2C42340F916C5930"
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"Any"

native "0x14FC5833464340A8"
	hash "0x14FC5833464340A8"
	ns "GRAPHICS"
	returns	"void"

native "0x0218BA067D249DEA"
	hash "0x0218BA067D249DEA"
	ns "GRAPHICS"
	returns	"void"

native "0x1612C45F9E3E0D44"
	hash "0x1612C45F9E3E0D44"
	ns "GRAPHICS"
	returns	"void"

native "0x5DEBD9C4DC995692"
	hash "0x5DEBD9C4DC995692"
	ns "GRAPHICS"
	returns	"void"

native "0x6D955F6A9E0295B1"
	hash "0x6D955F6A9E0295B1"
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",

		Any "p5",

		Any "p6",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x302C91AB2D477F7E"
	hash "0x302C91AB2D477F7E"
	ns "GRAPHICS"
	returns	"void"

native "0x03FC694AE06C5A20"
	hash "0x03FC694AE06C5A20"
	jhash (0x48F16186)
	ns "GRAPHICS"
	returns	"void"

native "0xD2936CAB8B58FCBD"
	hash "0xD2936CAB8B58FCBD"
	arguments {
		Any "p0",

		BOOL "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		BOOL "p6",

		float "p7",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x5F0F3F56635809EF"
	hash "0x5F0F3F56635809EF"
	jhash (0x13D4ABC0)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x5E9DAF5A20F15908"
	hash "0x5E9DAF5A20F15908"
	jhash (0xD2157428)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x36F6626459D91457"
	hash "0x36F6626459D91457"
	jhash (0xC07C64C9)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "_SET_FAR_SHADOWS_SUPPRESSED"
	hash "0x80ECBC0C856D3B0B"
	jhash (0xFE903D0F)
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		When this is set to ON, shadows only draw as you get nearer.

		When OFF, they draw from a further distance. (((BUT))) f*ck up nearer shadows quality.
</summary>
	]]

native "0x25FC3E33A31AD0C9"
	hash "0x25FC3E33A31AD0C9"
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xB11D94BC55F41932"
	hash "0xB11D94BC55F41932"
	jhash (0xDE10BA1F)
	arguments {
		charPtr "p0",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Has something to do with player switch.

		Only possible values:
		- "CSM_ST_BOX3x3"
</summary>
	]]

native "0x27CB772218215325"
	hash "0x27CB772218215325"
	ns "GRAPHICS"
	returns	"void"

native "0x6DDBF9DFFC4AC080"
	hash "0x6DDBF9DFFC4AC080"
	jhash (0x9F470BE3)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xD39D13C9FEBF0511"
	hash "0xD39D13C9FEBF0511"
	jhash (0x4A124267)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x02AC28F3A01FA04A"
	hash "0x02AC28F3A01FA04A"
	jhash (0xB19B2764)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"Any"

native "0x0AE73D8DF3A762B2"
	hash "0x0AE73D8DF3A762B2"
	jhash (0x342FA2B4)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xA51C4B86B71652AE"
	hash "0xA51C4B86B71652AE"
	jhash (0x5D3BFFC9)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x312342E1A4874F3F"
	hash "0x312342E1A4874F3F"
	jhash (0xD9653728)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		BOOL "p8",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		p8 seems to always be false.
</summary>
	]]

native "0x2485D34E50A22E84"
	hash "0x2485D34E50A22E84"
	jhash (0x72BA8A14)
	arguments {
		float "p0",

		float "p1",

		float "p2",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x12995F2E53FFA601"
	hash "0x12995F2E53FFA601"
	jhash (0x804F444C)
	arguments {
		int "p0",

		int "p1",

		int "p2",

		int "p3",

		int "p4",

		int "p5",

		int "p6",

		int "p7",

		int "p8",

		int "p9",

		int "p10",

		int "p11",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Only used in the golf and golf_mp script
</summary>
	]]

native "0xDBAA5EC848BA2D46"
	hash "0xDBAA5EC848BA2D46"
	jhash (0xBB1A1294)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xC0416B061F2B7E5E"
	hash "0xC0416B061F2B7E5E"
	jhash (0x1A1A72EF)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xB1BB03742917A5D6"
	hash "0xB1BB03742917A5D6"
	jhash (0x3BB12B75)
	arguments {
		int "type",

		float "xPos",

		float "yPos",

		float "zPos",

		float "p4",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		12 matches across 4 scripts. All 4 scripts were job creators.

		type ranged from 0 - 2.
		p4 was always 0.2f. Likely scale.
		assuming p5 - p8 is RGBA, the graphic is always yellow (255, 255, 0, 255).

		Tested but noticed nothing.
</summary>
	]]

native "0x9CFDD90B2B844BF7"
	hash "0x9CFDD90B2B844BF7"
	jhash (0x4EA70FB4)
	arguments {
		float "p0",

		float "p1",

		float "p2",

		float "p3",

		float "p4",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Only appeared in Golf &amp; Golf_mp. Parameters were all ptrs
</summary>
	]]

native "0x06F761EA47C1D3ED"
	hash "0x06F761EA47C1D3ED"
	jhash (0x0D830DC7)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xA4819F5E23E2FFAD"
	hash "0xA4819F5E23E2FFAD"
	jhash (0xA08B46AD)
	ns "GRAPHICS"
	returns	"Any"

native "0xA4664972A9B8F8BA"
	hash "0xA4664972A9B8F8BA"
	jhash (0xECD470F0)
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"int"

native "SET_SEETHROUGH"
	hash "0x7E08924259E08CE0"
	jhash (0x74D4995C)
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Toggles Heatvision on/off.
</summary>
	]]

native "_IS_SEETHROUGH_ACTIVE"
	hash "0x44B80ABAB9D80BD3"
	jhash (0x1FE547F2)
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Returns whether or not SEETHROUGH is active.
</summary>
	]]

native "0xD7D0B00177485411"
	hash "0xD7D0B00177485411"
	jhash (0x654F0287)
	arguments {
		Any "p0",

		float "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xB3C641F3630BF6DA"
	hash "0xB3C641F3630BF6DA"
	jhash (0xF6B837F0)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xE59343E9E96529E7"
	hash "0xE59343E9E96529E7"
	jhash (0xD906A3A9)
	ns "GRAPHICS"
	returns	"Any"

native "0xE63D7C6EECECB66B"
	hash "0xE63D7C6EECECB66B"
	jhash (0xD34A6CBA)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xE3E2C1B4C59DBC77"
	hash "0xE3E2C1B4C59DBC77"
	jhash (0xD8CC7221)
	arguments {
		int "unk",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Sets an unknown value related to timecycles.
</summary>
	]]

native "_TRANSITION_TO_BLURRED"
	hash "0xA328A24AAA6B7FDC"
	jhash (0x5604B890)
	arguments {
		float "transitionTime",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		time in ms to transition to fully blurred screen
</summary>
	]]

native "_TRANSITION_FROM_BLURRED"
	hash "0xEFACC8AEF94430D5"
	jhash (0x46617502)
	arguments {
		float "transitionTime",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		time in ms to transition from fully blurred to normal
</summary>
	]]

native "0xDE81239437E8C5A8"
	hash "0xDE81239437E8C5A8"
	jhash (0xDB7AECDA)
	ns "GRAPHICS"
	returns	"void"

native "IS_PARTICLE_FX_DELAYED_BLINK"
	hash "0x5CCABFFCA31DDE33"
	jhash (0xEA432A94)
	ns "GRAPHICS"
	returns	"float"

native "0x7B226C785A52A0A9"
	hash "0x7B226C785A52A0A9"
	jhash (0x926B8734)
	ns "GRAPHICS"
	returns	"Any"

native "_SET_FROZEN_RENDERING_DISABLED"
	hash "0xDFC252D8A3E15AB7"
	jhash (0x30ADE541)
	arguments {
		BOOL "enabled",
	}
	alias "_ENABLE_GAMEPLAY_CAM"
	ns "GRAPHICS"
	returns	"void"

native "0xEB3DAC2C86001E5E"
	hash "0xEB3DAC2C86001E5E"
	ns "GRAPHICS"
	returns	"BOOL"

native "0xE1C8709406F2C41C"
	hash "0xE1C8709406F2C41C"
	jhash (0x0113EAE4)
	ns "GRAPHICS"
	returns	"void"

native "0x851CD923176EBA7C"
	hash "0x851CD923176EBA7C"
	jhash (0xDCBA251B)
	ns "GRAPHICS"
	returns	"void"

native "0xBA3D65906822BED5"
	hash "0xBA3D65906822BED5"
	jhash (0x513D444B)
	arguments {
		BOOL "p0",

		BOOL "p1",

		float "p2",

		float "p3",

		float "p4",

		float "p5",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Every p2 - p5 occurrence was 0f.
</summary>
	]]

native "0x7AC24EAB6D74118D"
	hash "0x7AC24EAB6D74118D"
	jhash (0xB2410EAB)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "0xBCEDB009461DA156"
	hash "0xBCEDB009461DA156"
	jhash (0x5AB94128)
	ns "GRAPHICS"
	returns	"Any"

native "0x27FEB5254759CDE3"
	hash "0x27FEB5254759CDE3"
	jhash (0xD63FCB3E)
	arguments {
		charPtr "textureDict",

		BOOL "p1",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "START_PARTICLE_FX_NON_LOOPED_AT_COORD"
	hash "0x25129531F77B9ED3"
	jhash (0xDD79D679)
	arguments {
		charPtr "effectName",

		float "xPos",

		float "yPos",

		float "zPos",

		float "xRot",

		float "yRot",

		float "zRot",

		float "scale",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		GRAPHICS::START_PARTICLE_FX_NON_LOOPED_AT_COORD("scr_paleto_roof_impact", -140.8576f, 6420.789f, 41.1391f, 0f, 0f, 267.3957f, 0x3F800000, 0, 0, 0);

		Axis - Invert Axis Flags

		list: pastebin.com/N9unUFWY


		-------------------------------------------------------------------
		C#

		Function.Call&lt;int&gt;(Hash.START_PARTICLE_FX_NON_LOOPED_AT_COORD, = you are calling this function.

		char *effectname = This is an in-game effect name, for e.g. "scr_fbi4_trucks_crash" is used to give the effects when truck crashes etc

		float x, y, z pos = this one is Simple, you just have to declare, where do you want this effect to take place at, so declare the ordinates

		float xrot, yrot, zrot = Again simple? just mention the value in case if you want the effect to rotate.

		float scale = is declare the scale of the effect, this may vary as per the effects for e.g 1.0f

		bool xaxis, yaxis, zaxis = To bool the axis values.

		example:
		Function.Call&lt;int&gt;(Hash.START_PARTICLE_FX_NON_LOOPED_AT_COORD, "scr_fbi4_trucks_crash", GTA.Game.Player.Character.Position.X, GTA.Game.Player.Character.Position.Y, GTA.Game.Player.Character.Position.Z + 4f, 0, 0, 0, 5.5f, 0, 0, 0);
</summary>
	]]

native "_START_PARTICLE_FX_NON_LOOPED_AT_COORD_2"
	hash "0xF56B8137DF10135D"
	jhash (0x633F8C48)
	arguments {
		charPtr "effectName",

		float "xPos",

		float "yPos",

		float "zPos",

		float "xRot",

		float "yRot",

		float "zRot",

		float "scale",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		network fx
</summary>
	]]

native "START_PARTICLE_FX_NON_LOOPED_ON_PED_BONE"
	hash "0x0E7E72961BA18619"
	jhash (0x53DAEF4E)
	arguments {
		charPtr "effectName",

		Ped "ped",

		float "offsetX",

		float "offsetY",

		float "offsetZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		int "boneIndex",

		float "scale",

		BOOL "axisX",

		BOOL "axisY",

		BOOL "axisZ",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		GRAPHICS::START_PARTICLE_FX_NON_LOOPED_ON_PED_BONE("scr_sh_bong_smoke", PLAYER::PLAYER_PED_ID(), -0.025f, 0.13f, 0f, 0f, 0f, 0f, 31086, 0x3F800000, 0, 0, 0);

		Axis - Invert Axis Flags

		list: pastebin.com/N9unUFWY
</summary>
	]]

native "_START_PARTICLE_FX_NON_LOOPED_ON_PED_BONE_2"
	hash "0xA41B6A43642AC2CF"
	jhash (0x161780C1)
	arguments {
		charPtr "effectName",

		Ped "ped",

		float "offsetX",

		float "offsetY",

		float "offsetZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		int "boneIndex",

		float "scale",

		BOOL "axisX",

		BOOL "axisY",

		BOOL "axisZ",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		network fx
</summary>
	]]

native "START_PARTICLE_FX_NON_LOOPED_ON_ENTITY"
	hash "0x0D53A3B8DA0809D2"
	jhash (0x9604DAD4)
	arguments {
		charPtr "effectName",

		Entity "entity",

		float "offsetX",

		float "offsetY",

		float "offsetZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "scale",

		BOOL "axisX",

		BOOL "axisY",

		BOOL "axisZ",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Starts a particle effect on an entity for example your player.
		List: pastebin.com/N9unUFWY

		Example:
		C#:
		Function.Call(Hash.REQUEST_NAMED_PTFX_ASSET, "scr_rcbarry2");                     Function.Call(Hash._SET_PTFX_ASSET_NEXT_CALL, "scr_rcbarry2");                             Function.Call(Hash.START_PARTICLE_FX_NON_LOOPED_ON_ENTITY, "scr_clown_appears", Game.Player.Character, 0.0, 0.0, -0.5, 0.0, 0.0, 0.0, 1.0, false, false, false);

		Internally this calls the same function as GRAPHICS::START_PARTICLE_FX_NON_LOOPED_ON_PED_BONE
		however it uses -1 for the specified bone index, so it should be possible to start a non looped fx on an entity bone using that native
</summary>
	]]

native "_START_PARTICLE_FX_NON_LOOPED_ON_ENTITY_2"
	hash "0xC95EB1DB6E92113D"
	arguments {
		charPtr "effectName",

		Entity "entity",

		float "offsetX",

		float "offsetY",

		float "offsetZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "scale",

		BOOL "axisX",

		BOOL "axisY",

		BOOL "axisZ",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Console hash: 0x469A2B4A

		network fx
</summary>
	]]

native "SET_PARTICLE_FX_NON_LOOPED_COLOUR"
	hash "0x26143A59EF48B262"
	jhash (0x7B689E20)
	arguments {
		float "r",

		float "g",

		float "b",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		only works on some fx's
</summary>
	]]

native "SET_PARTICLE_FX_NON_LOOPED_ALPHA"
	hash "0x77168D722C58B2FC"
	jhash (0x497EAFF2)
	arguments {
		float "alpha",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Usage example for C#:

		        Function.Call(Hash.SET_PARTICLE_FX_NON_LOOPED_ALPHA, new InputArgument[] { 0.1f });

		Note: the argument alpha ranges from 0.0f-1.0f !
</summary>
	]]

native "0x8CDE909A0370BB3A"
	hash "0x8CDE909A0370BB3A"
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		console hash: 0x19EC0001
</summary>
	]]

native "START_PARTICLE_FX_LOOPED_AT_COORD"
	hash "0xE184F4F0DC5910E7"
	jhash (0xD348E3E6)
	arguments {
		charPtr "effectName",

		float "x",

		float "y",

		float "z",

		float "xRot",

		float "yRot",

		float "zRot",

		float "scale",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",

		BOOL "p11",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		GRAPHICS::START_PARTICLE_FX_LOOPED_AT_COORD("scr_fbi_falling_debris", 93.7743f, -749.4572f, 70.86904f, 0f, 0f, 0f, 0x3F800000, 0, 0, 0, 0)


		p11 seems to be always 0
</summary>
	]]

native "START_PARTICLE_FX_LOOPED_ON_PED_BONE"
	hash "0xF28DA9F38CD1787C"
	jhash (0xF8FC196F)
	arguments {
		charPtr "effectName",

		Ped "ped",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		float "xRot",

		float "yRot",

		float "zRot",

		int "boneIndex",

		float "scale",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",
	}
	ns "GRAPHICS"
	returns	"int"

native "START_PARTICLE_FX_LOOPED_ON_ENTITY"
	hash "0x1AE42C1660FD6517"
	jhash (0x0D06FF62)
	arguments {
		charPtr "effectName",

		Entity "entity",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		float "xRot",

		float "yRot",

		float "zRot",

		float "scale",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		list: pastebin.com/N9unUFWY
</summary>
	]]

native "_START_PARTICLE_FX_LOOPED_ON_ENTITY_BONE"
	hash "0xC6EB449E33977F0B"
	arguments {
		charPtr "effectName",

		Entity "entity",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		float "xRot",

		float "yRot",

		float "zRot",

		int "boneIndex",

		float "scale",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Console Hash: 0x23BF0F9B
</summary>
	]]

native "_START_PARTICLE_FX_LOOPED_ON_ENTITY_2"
	hash "0x6F60E89A7B64EE1D"
	jhash (0x110752B2)
	arguments {
		charPtr "effectName",

		Entity "entity",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		float "xRot",

		float "yRot",

		float "zRot",

		float "scale",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",
	}
	alias "0x6F60E89A7B64EE1D"
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		network fx
</summary>
	]]

native "_START_PARTICLE_FX_LOOPED_ON_ENTITY_BONE_2"
	hash "0xDDE23F30CC5A0F03"
	arguments {
		charPtr "effectName",

		Entity "entity",

		float "xOffset",

		float "yOffset",

		float "zOffset",

		float "xRot",

		float "yRot",

		float "zRot",

		int "boneIndex",

		float "scale",

		BOOL "xAxis",

		BOOL "yAxis",

		BOOL "zAxis",
	}
	alias "0xDDE23F30CC5A0F03"
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Console Hash: 0xF478EFCF

		network fx
</summary>
	]]

native "STOP_PARTICLE_FX_LOOPED"
	hash "0x8F75998877616996"
	jhash (0xD245455B)
	arguments {
		int "ptfxHandle",

		BOOL "p1",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		p1 is always 0 in the native scripts
</summary>
	]]

native "REMOVE_PARTICLE_FX"
	hash "0xC401503DFE8D53CF"
	jhash (0x6BA48C7E)
	arguments {
		int "ptfxHandle",

		BOOL "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "REMOVE_PARTICLE_FX_FROM_ENTITY"
	hash "0xB8FEAEEBCC127425"
	jhash (0xCEDE52E9)
	arguments {
		Entity "entity",
	}
	ns "GRAPHICS"
	returns	"void"

native "REMOVE_PARTICLE_FX_IN_RANGE"
	hash "0xDD19FA1C6D657305"
	jhash (0x7EB8F275)
	arguments {
		float "X",

		float "Y",

		float "Z",

		float "radius",
	}
	ns "GRAPHICS"
	returns	"void"

native "DOES_PARTICLE_FX_LOOPED_EXIST"
	hash "0x74AFEF0D2E1E409B"
	jhash (0xCBF91D2A)
	arguments {
		int "ptfxHandle",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "SET_PARTICLE_FX_LOOPED_OFFSETS"
	hash "0xF7DDEBEC43483C43"
	jhash (0x641F7790)
	arguments {
		int "ptfxHandle",

		float "x",

		float "y",

		float "z",

		float "rotX",

		float "rotY",

		float "rotZ",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_PARTICLE_FX_LOOPED_EVOLUTION"
	hash "0x5F0C4B5B1C393BE2"
	jhash (0x1CBC1373)
	arguments {
		int "ptfxHandle",

		charPtr "propertyName",

		float "amount",

		BOOL "Id",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Should be named SET_PARTICLE_FX_LOOPED_PROPERTY. "Evolution" doesn't make much sense...
		--------
		p4 seems to be always 0.

		Usage:

		if (!GRAPHICS::DOES_PARTICLE_FX_LOOPED_EXIST(l_25C7)) {
		      l_25C7 = GRAPHICS::_DDE23F30CC5A0F03("scr_veh_plane_gen_damage", l_8B9, l_25C4, 0.0, 0.0, 0.0, ENTITY::_GET_ENTITY_BONE_INDEX(l_8B9, "exhaust"), 1.0, 0, 0, 0);
		      GRAPHICS::SET_PARTICLE_FX_LOOPED_EVOLUTION(l_25C7, "damage_smoke", 0.5, 0);
		      GRAPHICS::SET_PARTICLE_FX_LOOPED_EVOLUTION(l_25C7, "damage_fire", 0.2, 0);
		      }
</summary>
	]]

native "SET_PARTICLE_FX_LOOPED_COLOUR"
	hash "0x7F8F65877F88783B"
	jhash (0x5219D530)
	arguments {
		int "ptfxHandle",

		float "r",

		float "g",

		float "b",

		BOOL "p4",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		only works on some fx's

		p4 = 0
</summary>
	]]

native "SET_PARTICLE_FX_LOOPED_ALPHA"
	hash "0x726845132380142E"
	jhash (0x5ED49BE1)
	arguments {
		int "ptfxHandle",

		float "alpha",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_PARTICLE_FX_LOOPED_SCALE"
	hash "0xB44250AAA456492D"
	jhash (0x099B8B49)
	arguments {
		int "ptfxHandle",

		float "scale",
	}
	ns "GRAPHICS"
	returns	"void"

native "_SET_PARTICLE_FX_LOOPED_RANGE"
	hash "0xDCB194B85EF7B541"
	jhash (0x233DE879)
	arguments {
		int "ptfxHandle",

		float "range",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_PARTICLE_FX_CAM_INSIDE_VEHICLE"
	hash "0xEEC4047028426510"
	jhash (0x19EC0001)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_PARTICLE_FX_CAM_INSIDE_NONPLAYER_VEHICLE"
	hash "0xACEE6F360FC1F6B6"
	jhash (0x6B125A02)
	arguments {
		Any "p0",

		BOOL "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_PARTICLE_FX_SHOOTOUT_BOAT"
	hash "0x96EF97DAEB89BEF5"
	jhash (0xD938DEE0)
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_PARTICLE_FX_BLOOD_SCALE"
	hash "0x5F6DF3D92271E8A1"
	jhash (0x18136DE0)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		hash collision
</summary>
	]]

native "ENABLE_CLOWN_BLOOD_VFX"
	hash "0xD821490579791273"
	jhash (0xC61C75E9)
	arguments {
		BOOL "toggle",
	}
	alias "SET_CAMERA_ENDTIME"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Creates cartoon effect when Michel smokes the weed
</summary>
	]]

native "ENABLE_ALIEN_BLOOD_VFX"
	hash "0x9DCE1F0F78260875"
	jhash (0xCE8B8748)
	arguments {
		BOOL "Toggle",
	}
	alias "0x9DCE1F0F78260875"
	ns "GRAPHICS"
	returns	"void"

native "0x27E32866E9A5C416"
	hash "0x27E32866E9A5C416"
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xBB90E12CAC1DAB25"
	hash "0xBB90E12CAC1DAB25"
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xCA4AE345A153D573"
	hash "0xCA4AE345A153D573"
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x54E22EA2C1956A8D"
	hash "0x54E22EA2C1956A8D"
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x949F397A288B28B3"
	hash "0x949F397A288B28B3"
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x9B079E5221D984D3"
	hash "0x9B079E5221D984D3"
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "_USE_PARTICLE_FX_ASSET_NEXT_CALL"
	hash "0x6C38AF3693A69A91"
	jhash (0x9C720B61)
	arguments {
		charPtr "name",
	}
	alias "_SET_PTFX_ASSET_NEXT_CALL"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		 From the b678d decompiled scripts:

		 GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("FM_Mission_Controler");
		 GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_apartment_mp");
		 GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_indep_fireworks");
		 GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_mp_cig_plane");
		 GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_mp_creator");
		 GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_ornate_heist");
		 GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_prison_break_heist_station");
</summary>
	]]

native "_SET_PARTICLE_FX_ASSET_OLD_TO_NEW"
	hash "0xEA1E2D93F6F75ED9"
	arguments {
		charPtr "oldAsset",

		charPtr "newAsset",
	}
	alias "_SET_PTFX_ASSET_OLD_2_NEW"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		console hash: 0xC92719A7
</summary>
	]]

native "_RESET_PARTICLE_FX_ASSET_OLD_TO_NEW"
	hash "0x89C8553DD3274AAE"
	arguments {
		charPtr "name",
	}
	alias "0x89C8553DD3274AAE"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		console hash: 0x9E8D8B72
		Resets the effect of _SET_PARTICLE_FX_ASSET_OLD_TO_NEW
</summary>
	]]

native "0xA46B73FAA3460AE1"
	hash "0xA46B73FAA3460AE1"
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xF78B803082D4386F"
	hash "0xF78B803082D4386F"
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "WASH_DECALS_IN_RANGE"
	hash "0x9C30613D50A6ADEF"
	jhash (0xDEECBC57)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",
	}
	ns "GRAPHICS"
	returns	"void"

native "WASH_DECALS_FROM_VEHICLE"
	hash "0x5B712761429DBC14"
	jhash (0x2929F11A)
	arguments {
		Vehicle "vehicle",

		float "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "FADE_DECALS_IN_RANGE"
	hash "0xD77EDADB0420E6E0"
	jhash (0xF81E884A)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",

		Any "p4",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Fades nearby decals within the range specified
</summary>
	]]

native "REMOVE_DECALS_IN_RANGE"
	hash "0x5D6B2D4830A67C62"
	jhash (0x06A619A0)
	arguments {
		float "x",

		float "y",

		float "z",

		float "range",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Removes all decals in range from a position, it includes the bullet holes, blood pools, petrol...
</summary>
	]]

native "REMOVE_DECALS_FROM_OBJECT"
	hash "0xCCF71CBDDF5B6CB9"
	jhash (0x8B67DCA7)
	arguments {
		Object "obj",
	}
	ns "GRAPHICS"
	returns	"void"

native "REMOVE_DECALS_FROM_OBJECT_FACING"
	hash "0xA6F6F70FDC6D144C"
	jhash (0xF4999A55)
	arguments {
		Object "obj",

		float "x",

		float "y",

		float "z",
	}
	ns "GRAPHICS"
	returns	"void"

native "REMOVE_DECALS_FROM_VEHICLE"
	hash "0xE91F1B65F2B48D57"
	jhash (0x831D06CA)
	arguments {
		Vehicle "vehicle",
	}
	ns "GRAPHICS"
	returns	"void"

native "ADD_DECAL"
	hash "0xB302244A1839BDAD"
	jhash (0xEAD0C412)
	arguments {
		int "decalType",

		float "posX",

		float "posY",

		float "posZ",

		float "p4",

		float "p5",

		float "p6",

		float "p7",

		float "p8",

		float "p9",

		float "width",

		float "height",

		float "rCoef",

		float "gCoef",

		float "bCoef",

		float "opacity",

		float "timeout",

		BOOL "p17",

		BOOL "p18",

		BOOL "p19",
	}
	ns "GRAPHICS"
	returns	"Object"
	doc [[!
<summary>
		decal types:

		public enum DecalTypes
		{
		    splatters_blood = 1010,
		    splatters_blood_dir = 1015,
		    splatters_blood_mist = 1017,
		    splatters_mud = 1020,
		    splatters_paint = 1030,
		    splatters_water = 1040,
		    splatters_water_hydrant = 1050,
		    splatters_blood2 = 1110,
		    weapImpact_metal = 4010,
		    weapImpact_concrete = 4020,
		    weapImpact_mattress = 4030,
		    weapImpact_mud = 4032,
		    weapImpact_wood = 4050,
		    weapImpact_sand = 4053,
		    weapImpact_cardboard = 4040,
		    weapImpact_melee_glass = 4100,
		    weapImpact_glass_blood = 4102,
		    weapImpact_glass_blood2 = 4104,
		    weapImpact_shotgun_paper = 4200,
		    weapImpact_shotgun_mattress,
		    weapImpact_shotgun_metal,
		    weapImpact_shotgun_wood,
		    weapImpact_shotgun_dirt,
		    weapImpact_shotgun_tvscreen,
		    weapImpact_shotgun_tvscreen2,
		    weapImpact_shotgun_tvscreen3,
		    weapImpact_melee_concrete = 4310,
		    weapImpact_melee_wood = 4312,
		    weapImpact_melee_metal = 4314,
		    burn1 = 4421,
		    burn2,
		    burn3,
		    burn4,
		    burn5,
		    bang_concrete_bang = 5000,
		    bang_concrete_bang2,
		    bang_bullet_bang,
		    bang_bullet_bang2 = 5004,
		    bang_glass = 5031,
		    bang_glass2,
		    solidPool_water = 9000,
		    solidPool_blood,
		    solidPool_oil,
		    solidPool_petrol,
		    solidPool_mud,
		    porousPool_water,
		    porousPool_blood,
		    porousPool_oil,
		    porousPool_petrol,
		    porousPool_mud,
		    porousPool_water_ped_drip,
		    liquidTrail_water = 9050
		}
</summary>
	]]

native "ADD_PETROL_DECAL"
	hash "0x4F5212C7AD880DF8"
	jhash (0x1259DF42)
	arguments {
		float "x",

		float "y",

		float "z",

		float "groundLvl",

		float "width",

		float "transparency",
	}
	ns "GRAPHICS"
	returns	"Any"

native "0x99AC7F0D8B9C893D"
	hash "0x99AC7F0D8B9C893D"
	jhash (0xE3938B0B)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x967278682CB6967A"
	hash "0x967278682CB6967A"
	jhash (0xBAEC6ADD)
	arguments {
		Any "p0",

		Any "p1",

		Any "p2",

		Any "p3",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x0A123435A26C36CD"
	hash "0x0A123435A26C36CD"
	jhash (0xCCCA6855)
	ns "GRAPHICS"
	returns	"void"

native "REMOVE_DECAL"
	hash "0xED3F346429CCD659"
	jhash (0xA4363188)
	arguments {
		Object "decal",
	}
	ns "GRAPHICS"
	returns	"void"

native "IS_DECAL_ALIVE"
	hash "0xC694D74949CAFD0C"
	jhash (0xCDD4A61A)
	arguments {
		Object "decal",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "GET_DECAL_WASH_LEVEL"
	hash "0x323F647679A09103"
	jhash (0x054448EF)
	arguments {
		int "decal",
	}
	ns "GRAPHICS"
	returns	"float"

native "0xD9454B5752C857DC"
	hash "0xD9454B5752C857DC"
	jhash (0xEAB6417C)
	ns "GRAPHICS"
	returns	"void"

native "0x27CFB1B1E078CB2D"
	hash "0x27CFB1B1E078CB2D"
	jhash (0xC2703B88)
	ns "GRAPHICS"
	returns	"void"

native "0x4B5CFC83122DF602"
	hash "0x4B5CFC83122DF602"
	jhash (0xA706E84D)
	ns "GRAPHICS"
	returns	"void"

native "0x2F09F7976C512404"
	hash "0x2F09F7976C512404"
	jhash (0x242C6A04)
	arguments {
		float "xCoord",

		float "yCoord",

		float "zCoord",

		float "p3",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		only documented. to be continued...
</summary>
	]]

native "_ADD_DECAL_TO_MARKER"
	hash "0x8A35C742130C6080"
	jhash (0x335695CF)
	arguments {
		int "decalType",

		charPtr "textureDict",

		charPtr "textureName",
	}
	alias "0x8A35C742130C6080"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		REQUEST_STREAMED_TEXTURE_DICT("MPOnMissMarkers", false);
		*uParam0.f_809 = add_decal(9120, vParam1, vVar4, vVar7, 2f, 2f, to_float(iVar0) / 255f, to_float(iVar1) / 255f, to_float(iVar2) / 255f, 1f, -1f, 1, 0, 0);
		_0x8A35C742130C6080(9120, "MPOnMissMarkers", "Capture_The_Flag_Base_Icon");
</summary>
	]]

native "0xB7ED70C49521A61D"
	hash "0xB7ED70C49521A61D"
	jhash (0x7B786555)
	arguments {
		int "decalType",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		GRAPHICS::_0xB7ED70C49521A61D(9123);
		GRAPHICS::SET_STREAMED_TEXTURE_DICT_AS_NO_LONGER_NEEDED("MPMissMarkers256");
</summary>
	]]

native "MOVE_VEHICLE_DECALS"
	hash "0x84C8D7C2D30D3280"
	jhash (0xCE9E6CF2)
	arguments {
		Any "p0",

		Any "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "_ADD_CLAN_DECAL_TO_VEHICLE"
	hash "0x428BDCB9DA58DA53"
	jhash (0x12077738)
	arguments {
		Vehicle "vehicle",

		Ped "ped",

		int "boneIndex",

		float "x1",

		float "x2",

		float "x3",

		float "y1",

		float "y2",

		float "y3",

		float "z1",

		float "z2",

		float "z3",

		float "scale",

		Any "p13",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Now has 15 parameters, previous declaration:
		BOOL _0x428BDCB9DA58DA53(Any p0, Any p1, Any p2, float p3, float p4, float p5, float p6, float p7, float p8, float p9, float p10, float p11, float p12, Any p13)

		boneIndex is always chassis_dummy in the scripts. The x/y/z params are location relative to the chassis bone. They are usually rotations and measurements. Haven't reversed which are what yet.

		Scale is how big the decal will be.

		p13 is always 0.

		For alpha, 200 seems to match what the game is doing, I think. I don't have access to the new scripts to see what this parameter is, but based on guessing this seems (kind of) accurate.
</summary>
	]]

native "0xD2300034310557E4"
	hash "0xD2300034310557E4"
	jhash (0x667046A8)
	arguments {
		Vehicle "vehicle",

		Any "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xFE26117A5841B2FF"
	hash "0xFE26117A5841B2FF"
	jhash (0x4F4D76E8)
	arguments {
		Vehicle "vehicle",

		Any "p1",
	}
	ns "GRAPHICS"
	returns	"int"

native "_DOES_VEHICLE_HAVE_DECAL"
	hash "0x060D935D3981A275"
	jhash (0x6D58F73B)
	arguments {
		Vehicle "vehicle",

		Any "p1",
	}
	alias "_HAS_VEHICLE_GOT_DECAL"
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		This function is called before ADD_CLAN_DECAL_TO_VEHICLE to see if it needs to run. IDK if it's for clan decal or not, but the 2nd parameter might be decal index? It's always passed 0. Not sure what this function really does. But it does return 0 if the clan tag is not on, and 1 if it is.
</summary>
	]]

native "0x0E4299C549F0D1F1"
	hash "0x0E4299C549F0D1F1"
	jhash (0x9BABCBA4)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x02369D5C8A51FDCF"
	hash "0x02369D5C8A51FDCF"
	jhash (0xFDF6D8DA)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x46D1A61A21F566FC"
	hash "0x46D1A61A21F566FC"
	jhash (0x2056A015)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x2A2A52824DB96700"
	hash "0x2A2A52824DB96700"
	jhash (0x0F486429)
	arguments {
		AnyPtr "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x1600FD8CF72EBC12"
	hash "0x1600FD8CF72EBC12"
	jhash (0xD87CC710)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xEFB55E7C25D3B3BE"
	hash "0xEFB55E7C25D3B3BE"
	jhash (0xE29EE145)
	ns "GRAPHICS"
	returns	"void"

native "0xA44FF770DFBC5DAE"
	hash "0xA44FF770DFBC5DAE"
	ns "GRAPHICS"
	returns	"void"

native "DISABLE_VEHICLE_DISTANTLIGHTS"
	hash "0xC9F98AC1884E73A2"
	jhash (0x7CFAE36F)
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x03300B57FCAC6DDB"
	hash "0x03300B57FCAC6DDB"
	jhash (0x60F72371)
	arguments {
		BOOL "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x98EDF76A7271E4F2"
	hash "0x98EDF76A7271E4F2"
	ns "GRAPHICS"
	returns	"void"

native "_SET_FORCE_PED_FOOTSTEPS_TRACKS"
	hash "0xAEEDAD1420C65CC0"
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Forces footstep tracks on all surfaces.
</summary>
	]]

native "_SET_FORCE_VEHICLE_TRAILS"
	hash "0x4CC7F0FEA5283FE0"
	arguments {
		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Forces vehicle trails on all surfaces.
</summary>
	]]

native "0xD7021272EB0A451E"
	hash "0xD7021272EB0A451E"
	arguments {
		charPtr "p0",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Only one match in the scripts:

		GRAPHICS::_D7021272EB0A451E("int_carrier_hanger");
</summary>
	]]

native "SET_TIMECYCLE_MODIFIER"
	hash "0x2C933ABF17A1DF41"
	jhash (0xA81F3638)
	arguments {
		charPtr "modifierName",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Loads the specified timecycle modifier. Modifiers are defined separately in another file (e.g. "timecycle_mods_1.xml")

		Parameters:
		modifierName - The modifier to load (e.g. "V_FIB_IT3", "scanline_cam", etc.)

		For a full list, see here: pastebin.com/kVPwMemE
</summary>
	]]

native "SET_TIMECYCLE_MODIFIER_STRENGTH"
	hash "0x82E7FFCD5B2326B3"
	jhash (0x458F4F45)
	arguments {
		float "strength",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_TRANSITION_TIMECYCLE_MODIFIER"
	hash "0x3BCF567485E1971C"
	jhash (0xBB2BA72A)
	arguments {
		charPtr "modifierName",

		float "transition",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		For a full list, see here: pastebin.com/kVPwMemE
</summary>
	]]

native "0x1CBA05AE7BD7EE05"
	hash "0x1CBA05AE7BD7EE05"
	jhash (0x56345F6B)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "CLEAR_TIMECYCLE_MODIFIER"
	hash "0x0F07E7745A236711"
	jhash (0x8D8DF8EE)
	ns "GRAPHICS"
	returns	"void"

native "GET_TIMECYCLE_MODIFIER_INDEX"
	hash "0xFDF3D97C674AFB66"
	jhash (0x594FEEC4)
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Only use for this in the PC scripts is:

		if (GRAPHICS::GET_TIMECYCLE_MODIFIER_INDEX() != -1)

		For a full list, see here: pastebin.com/cnk7FTF2

		can someone update this pastebin???
</summary>
	]]

native "0x459FD2C8D0AB78BC"
	hash "0x459FD2C8D0AB78BC"
	jhash (0x03C44E4B)
	ns "GRAPHICS"
	returns	"Any"

native "PUSH_TIMECYCLE_MODIFIER"
	hash "0x58F735290861E6B4"
	jhash (0x7E082045)
	ns "GRAPHICS"
	returns	"void"

native "POP_TIMECYCLE_MODIFIER"
	hash "0x3C8938D7D872211E"
	jhash (0x79D7D235)
	ns "GRAPHICS"
	returns	"void"

native "0xBBF327DED94E4DEB"
	hash "0xBBF327DED94E4DEB"
	jhash (0x85BA15A4)
	arguments {
		charPtr "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xBDEB86F4D5809204"
	hash "0xBDEB86F4D5809204"
	jhash (0x9559BB38)
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0xBF59707B3E5ED531"
	hash "0xBF59707B3E5ED531"
	jhash (0x554BA16E)
	arguments {
		charPtr "p0",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Something to do with timecycles.
</summary>
	]]

native "0x1A8E2C8B9CF4549C"
	hash "0x1A8E2C8B9CF4549C"
	jhash (0xE8F538B5)
	arguments {
		AnyPtr "p0",

		AnyPtr "p1",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x15E33297C3E8DC60"
	hash "0x15E33297C3E8DC60"
	jhash (0x805BAB08)
	arguments {
		Any "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x5096FD9CCB49056D"
	hash "0x5096FD9CCB49056D"
	jhash (0x908A335E)
	arguments {
		AnyPtr "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x92CCC17A7A2285DA"
	hash "0x92CCC17A7A2285DA"
	jhash (0x6776720A)
	ns "GRAPHICS"
	returns	"void"

native "0xBB0527EC6341496D"
	hash "0xBB0527EC6341496D"
	ns "GRAPHICS"
	returns	"Any"

native "0x2C328AF17210F009"
	hash "0x2C328AF17210F009"
	arguments {
		float "p0",
	}
	ns "GRAPHICS"
	returns	"void"

native "0x2BF72AD5B41AA739"
	hash "0x2BF72AD5B41AA739"
	ns "GRAPHICS"
	returns	"void"

native "REQUEST_SCALEFORM_MOVIE"
	hash "0x11FE353CF9733E6F"
	jhash (0xC67E3DCB)
	arguments {
		charPtr "scaleformName",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		GTA V Scaleforms Decompiled
		pastebin.com/mmNdjX2k


		Gets a new native after almost every update.

		Update 1.0.393.2
		0x67D02A194A2FC2BD

		Update 1.0.463.1
		0xC97D787CE7726A2F

		Update 1.0.505.2
		0x36ECDA4DD9A3F08D

		Update 1.0.573.1
		0xE3C796DC28BC3254

		Update 1.0.678.1
		0x2F14983962462691

</summary>
	]]

native "REQUEST_SCALEFORM_MOVIE_INSTANCE"
	hash "0xC514489CFB8AF806"
	jhash (0x7CC8057D)
	arguments {
		charPtr "scaleformName",
	}
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Also used by 0x67D02A194A2FC2BD
</summary>
	]]

native "_REQUEST_SCALEFORM_MOVIE_INTERACTIVE"
	hash "0xBD06C611BB9048C2"
	arguments {
		charPtr "scaleformName",
	}
	alias "_REQUEST_SCALEFORM_MOVIE3"
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Similar to REQUEST_SCALEFORM_MOVIE, but seems to be some kind of "interactive" scaleform movie?

		These seem to be the only scaleforms ever requested by this native:
		"breaking_news"
		"desktop_pc"
		"ECG_MONITOR"
		"Hacking_PC"
		"TEETH_PULLING"

		Note: Unless this hash is out-of-order, this native is next-gen only.

</summary>
	]]

native "HAS_SCALEFORM_MOVIE_LOADED"
	hash "0x85F01B8D5B90570E"
	jhash (0xDDFB6448)
	arguments {
		int "scaleformHandle",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "_HAS_NAMED_SCALEFORM_MOVIE_LOADED"
	hash "0x0C1C5D756FB5F337"
	arguments {
		charPtr "scaleformName",
	}
	alias "0x0C1C5D756FB5F337"
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Pretty sure it's the real name (not 100% sure so I added the _ prefix); can someone else confirm it?

		Only values used in the scripts are:

		"heist_mp"
		"heistmap_mp"
		"instructional_buttons"
		"heist_pre"
</summary>
	]]

native "HAS_SCALEFORM_CONTAINER_MOVIE_LOADED_INTO_PARENT"
	hash "0x8217150E1217EBFD"
	jhash (0x1DFE8D8A)
	arguments {
		int "scaleformHandle",
	}
	ns "GRAPHICS"
	returns	"BOOL"

native "SET_SCALEFORM_MOVIE_AS_NO_LONGER_NEEDED"
	hash "0x1D132D614DD86811"
	jhash (0x5FED3BA1)
	arguments {
		intPtr "scaleformHandle",
	}
	ns "GRAPHICS"
	returns	"void"

native "SET_SCALEFORM_MOVIE_TO_USE_SYSTEM_TIME"
	hash "0x6D8EB211944DCE08"
	jhash (0x18C9DE8D)
	arguments {
		int "scaleform",

		BOOL "toggle",
	}
	ns "GRAPHICS"
	returns	"void"

native "DRAW_SCALEFORM_MOVIE"
	hash "0x54972ADAF0294A93"
	jhash (0x48DA6A58)
	arguments {
		int "scaleformHandle",

		float "x",

		float "y",

		float "width",

		float "height",

		int "red",

		int "green",

		int "blue",

		int "alpha",

		int "unk",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		GTA V Scaleforms Decompiled
		pastebin.com/mmNdjX2k

</summary>
	]]

native "DRAW_SCALEFORM_MOVIE_FULLSCREEN"
	hash "0x0DF606929C105BE1"
	jhash (0x7B48E696)
	arguments {
		int "scaleform",

		int "red",

		int "green",

		int "blue",

		int "alpha",

		int "unk",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		unk is not used so no need
</summary>
	]]

native "DRAW_SCALEFORM_MOVIE_FULLSCREEN_MASKED"
	hash "0xCF537FDE4FBD4CE5"
	jhash (0x9C59FC06)
	arguments {
		int "scaleform1",

		int "scaleform2",

		int "red",

		int "green",

		int "blue",

		int "alpha",
	}
	ns "GRAPHICS"
	returns	"void"

native "DRAW_SCALEFORM_MOVIE_3D"
	hash "0x87D51D72255D4E78"
	jhash (0xC4F63A89)
	arguments {
		int "scaleform",

		float "posX",

		float "posY",

		float "posZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "p7",

		float "sharpness",

		float "p9",

		float "scaleX",

		float "scaleY",

		float "scaleZ",

		Any "p13",
	}
	alias "0x87D51D72255D4E78"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		sharpness goes from 0.0 to 1.0
</summary>
	]]

native "_DRAW_SCALEFORM_MOVIE_3D_NON_ADDITIVE"
	hash "0x1CE592FDC749D6F5"
	jhash (0x899933C8)
	arguments {
		int "scaleform",

		float "posX",

		float "posY",

		float "posZ",

		float "rotX",

		float "rotY",

		float "rotZ",

		float "p7",

		float "p8",

		float "p9",

		float "scaleX",

		float "scaleY",

		float "scaleZ",

		Any "p13",
	}
	alias "0x1CE592FDC749D6F5"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		what the heck does this one do differently from the one above?

</summary>
	]]

native "CALL_SCALEFORM_MOVIE_METHOD"
	hash "0xFBD96D87AC96D533"
	jhash (0x7AB77B57)
	arguments {
		int "scaleform",

		charPtr "method",
	}
	alias "_CALL_SCALEFORM_MOVIE_FUNCTION_VOID"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Calls the Scaleform function.
</summary>
	]]

native "_CALL_SCALEFORM_MOVIE_FUNCTION_FLOAT_PARAMS"
	hash "0xD0837058AE2E4BEE"
	jhash (0x557EDA1D)
	arguments {
		int "scaleform",

		charPtr "functionName",

		float "param1",

		float "param2",

		float "param3",

		float "param4",

		float "param5",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Calls the Scaleform function and passes the parameters as floats.

		The number of parameters passed to the function varies, so the end of the parameter list is represented by -1.0.
</summary>
	]]

native "_CALL_SCALEFORM_MOVIE_FUNCTION_STRING_PARAMS"
	hash "0x51BC1ED3CC44E8F7"
	jhash (0x91A7FCEB)
	arguments {
		int "scaleform",

		charPtr "functionName",

		charPtr "param1",

		charPtr "param2",

		charPtr "param3",

		charPtr "param4",

		charPtr "param5",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Calls the Scaleform function and passes the parameters as strings.

		The number of parameters passed to the function varies, so the end of the parameter list is represented by 0 (NULL).
</summary>
	]]

native "_CALL_SCALEFORM_MOVIE_FUNCTION_MIXED_PARAMS"
	hash "0xEF662D8D57E290B1"
	jhash (0x6EAF56DE)
	arguments {
		int "scaleform",

		charPtr "functionName",

		float "floatParam1",

		float "floatParam2",

		float "floatParam3",

		float "floatParam4",

		float "floatParam5",

		charPtr "stringParam1",

		charPtr "stringParam2",

		charPtr "stringParam3",

		charPtr "stringParam4",

		charPtr "stringParam5",
	}
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Calls the Scaleform function and passes both float and string parameters (in their respective order).

		The number of parameters passed to the function varies, so the end of the float parameters is represented by -1.0, and the end of the string parameters is represented by 0 (NULL).

		NOTE: The order of parameters in the function prototype is important! All float parameters must come first, followed by the string parameters.

		Examples:
		// function MY_FUNCTION(floatParam1, floatParam2, stringParam)
		GRAPHICS::_CALL_SCALEFORM_MOVIE_FUNCTION_MIXED_PARAMS(scaleform, "MY_FUNCTION", 10.0, 20.0, -1.0, -1.0, -1.0, "String param", 0, 0, 0, 0);

		// function MY_FUNCTION_2(floatParam, stringParam1, stringParam2)
		GRAPHICS::_CALL_SCALEFORM_MOVIE_FUNCTION_MIXED_PARAMS(scaleform, "MY_FUNCTION_2", 10.0, -1.0, -1.0, -1.0, -1.0, "String param #1", "String param #2", 0, 0, 0);
</summary>
	]]

native "_BEGIN_SCALEFORM_MOVIE_METHOD_HUD_COMPONENT"
	hash "0x98C494FD5BDFBFD5"
	jhash (0x5D66CE1E)
	arguments {
		int "hudComponent",

		charPtr "functionName",
	}
	alias "_PUSH_SCALEFORM_MOVIE_FUNCTION_FROM_HUD_COMPONENT"
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Pushes a function from the Hud component Scaleform onto the stack. Same behavior as GRAPHICS::_PUSH_SCALEFORM_MOVIE_FUNCTION, just a hud component id instead of a Scaleform.

		Known components:
		19 
		20 

		This native requires more research - all information can be found inside of 'hud.gfx'. Using a decompiler, the different components are located under "scripts\__Packages\com\rockstargames\gtav\hud\hudComponents" and "scripts\__Packages\com\rockstargames\gtav\Multiplayer".
</summary>
	]]

native "BEGIN_SCALEFORM_MOVIE_METHOD"
	hash "0xF6E48914C7A8694E"
	jhash (0x215ABBE8)
	arguments {
		int "scaleform",

		charPtr "functionName",
	}
	alias "_PUSH_SCALEFORM_MOVIE_FUNCTION"
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Push a function from the Scaleform onto the stack

		Old Name: _PUSH_SCALEFORM_MOVIE_FUNCTION
</summary>
	]]

native "_BEGIN_SCALEFORM_MOVIE_METHOD_N"
	hash "0xAB58C27C2E6123C6"
	jhash (0xF6015178)
	arguments {
		charPtr "functionName",
	}
	alias "0xAB58C27C2E6123C6"
	alias "_PUSH_SCALEFORM_MOVIE_FUNCTION_N"
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Possibly calls "global" Scaleform functions - needs more research!
</summary>
	]]

native "_BEGIN_SCALEFORM_MOVIE_METHOD_V"
	hash "0xB9449845F73F5E9C"
	jhash (0x5E219B67)
	arguments {
		charPtr "functionName",
	}
	alias "0xB9449845F73F5E9C"
	ns "GRAPHICS"
	returns	"BOOL"

native "END_SCALEFORM_MOVIE_METHOD"
	hash "0xC6796A8FFA375E53"
	jhash (0x02DBF2D7)
	alias "_POP_SCALEFORM_MOVIE_FUNCTION_VOID"
	ns "GRAPHICS"
	returns	"void"
	doc [[!
<summary>
		Pops and calls the Scaleform function on the stack

		Old Name: _POP_SCALEFORM_MOVIE_FUNCTION_VOID
</summary>
	]]

native "_END_SCALEFORM_MOVIE_METHOD_RETURN"
	hash "0xC50AA39A577AF886"
	jhash (0x2F38B526)
	alias "_POP_SCALEFORM_MOVIE_FUNCTION"
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Pops and calls the Scaleform movie on the stack. Returns data from the function (not sure if this is a string).
</summary>
	]]

native "_GET_SCALEFORM_MOVIE_FUNCTION_RETURN_BOOL"
	hash "0x768FF8961BA904D6"
	jhash (0x5CD7C3C0)
	arguments {
		int "method_return",
	}
	alias "0x768FF8961BA904D6"
	ns "GRAPHICS"
	returns	"BOOL"
	doc [[!
<summary>
		Seems to take data that is returned from "_POP_SCALEFORM_MOVIE_FUNCTION" and checks to see if it's not null/empty.

		"agency_heist3b.ysc", line 71836:
		if (CONTROLS::IS_CONTROL_JUST_PRESSED(2, 201) || CONTROLS::IS_CONTROL_JUST_PRESSED(2, 237)) {
		    GRAPHICS::_PUSH_SCALEFORM_MOVIE_FUNCTION(l_46, "SET_INPUT_EVENT_SELECT");
		    l_45 = GRAPHICS::_POP_SCALEFORM_MOVIE_FUNCTION();
		}
		if (GRAPHICS::_0x768FF8961BA904D6(l_45)) {
		    v_13 = GRAPHICS::_0x2DE7EFA66B906036(l_45);
		    if (v_13 == 6) {
		        sub_73269(a_0);
		    }
		}

</summary>
	]]

native "_GET_SCALEFORM_MOVIE_FUNCTION_RETURN_INT"
	hash "0x2DE7EFA66B906036"
	jhash (0x2CFB0E6D)
	arguments {
		int "method_return",
	}
	alias "0x2DE7EFA66B906036"
	ns "GRAPHICS"
	returns	"int"
	doc [[!
<summary>
		Needs a bit more research, but it seems to return an int.

		Testing with the scaleform "HACKING_PC" it seems to return an int depending on the clicked App/Program ID

		"agency_heist3b.ysc", line 71836:
		if (CONTROLS::IS_CONTROL_JUST_PRESSED(2, 201) || CONTROLS::IS_CONTROL_JUST_PRESSED(2, 237)) {
		    GRAPHICS::_PUSH_SCALEFORM_MOVIE_FUNCTION(l_46, "SET_INPUT_EVENT_SELECT");
		    l_45 = GRAPHICS::_POP_SCALEFORM_MOVIE_FUNCTION();
		}
		if (GRAPHICS::_0x768FF8961BA904D6(l_45)) {
		    v_13 = GRAPHICS::_0x2DE7EFA66B906036(l_45);
		    if (v_13 == 6) {
		        sub_73269(a_0);
		    }
		}
</summary>
	]]

native "SITTING_TV"
	hash "0xE1E258829A885245"
