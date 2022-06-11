; (c) Arjay Ceekay 2022 GPL v2

Scriptname YoCeA_MCM extends SKI_ConfigBase
{MCM Menu script}

int[] OID

bool Property bMod = true auto hidden
string enabledModDesc = "Enable Mod"

bool Property bDebug = false auto hidden
string enabledDebugDesc = "Show debug messages"

float Property HumilThresh = 80.0 auto hidden
string HumilThreshDesc = "How much humiliation is required before the public defacing of the dragonborn can start."

float Property HumilEffect = 0.5 auto hidden
string HumilEffectDesc = "Effectivity of the cultists' attempts to humiliate the dragonborn."

bool Property bChamberpotHumil = true auto hidden
String ChamberpotHumilDesc = "Collect chamberpots from all houses and dispose contents in your house."

bool Property bBathingHumil = true auto hidden
String BathingHumilDesc = "Provie bathing service with benefits."

bool Property bHPGarbStash = true auto hidden
String HPGarbStashDesc = "Carry clothes for tomorrow in your hidden pocket."

bool Property bWeedNude = true auto hidden
String WeedNudeDesc = "Weed plants in the nude."

bool Property bGuardPlay = true auto hidden
String GuardPlayDesc = "Provide guards with entertainment to boost their morale."

bool Property bKennelClean = true auto hidden
String KennelCleanDesc = "Cleaning the kennel."

bool Property bBrothelClean = true auto hidden
String BrothelCleanDesc = "Cleaning the brothel."

bool Property bBrothelCommunity = true auto hidden
String BrothelCommunityDesc = "Community service in the brothel."

bool Property bPoorCommService = true auto hidden
String PoorCommServiceDesc = "Community service, throughout, for the poor."

bool Property bStocksService = true auto hidden
String StocksServiceDesc = "Stocks public service."

bool Property bRottenPotato = true auto hidden
String RottenPotatoDesc = "Receiving a shower of rotten fruit and veggies from the public."

Event OnConfigInit()

	OID = new Int[15]
	Pages = new string[1]
	Pages[0] = "Settings"
	Splash = "A_Yoke_of_Gold.dds"
EndFunction

event OnPageReset(string page)
	StorageUtil.SetStringValue(Self, "CurrentPage", page)

	If Page == ""
		LoadCustomContent(Splash)
		Return
	EndIf
	If OID[0] == OID[1]
		UnloadCustomContent()
	EndIf

	If(page == "Settings")
		; a Header to separate Options, 2 rows, left pane only interleaved with right.
		AddHeaderOption("Configuration")
		AddHeaderOption("Stage Settings")
		AddEmptyOption()
		AddEmptyOption()

		OID[0] = AddToggleOption(enabledModDesc, bMod)
		OID[1] = AddSliderOption(HumilThreshDesc, HumilThresh)
		OID[2] = AddToggleOption(enabledDebugDesc, bDebug)
		OID[3] = AddSliderOption(HumilEffectDesc, HumilEffect)

		AddEmptyOption()
		AddEmptyOption()
		; underneath here options on both sides.
		AddHeaderOption("Events")
		AddEmptyOption()

		OID[4] = AddToggleOption(ChamberpotHumilDesc, bChamberpotHumil)
		OID[5] = AddToggleOption(BathingHumilDesc, bBathingHumil)
		OID[6] = AddToggleOption(HPGarbStashDesc, bHPGarbStash)
		OID[7] = AddToggleOption(WeedNudeDesc, bWeedNude)
		OID[8] = AddToggleOption(GuardPlayDesc, bGuardPlay)
		OID[9] = AddToggleOption(KennelCleanDesc, bKennelClean)
		OID[10] = AddToggleOption(BrothelCleanDesc, bBrothelClean)
		OID[11] = AddToggleOption(BrothelCommunityDesc, bBrothelCommunity)
		OID[12] = AddToggleOption(PoorCommServiceDesc, bPoorCommService)
		OID[13] = AddToggleOption(StocksServiceDesc, bStocksService)
		OID[14] = AddToggleOption(RottenPotatoDesc, bRottenPotato)
	EndIf
EndEvent

;;; Slider options
Event OnOptionSliderAccept(int Option, float floatValue)

	if Option == OID[1]
		SetSliderOptionValue(Option, HumilThresh)
	ElseIf Option == OID[3]
		SetSliderOptionValue(Option, HumilEffect)
	endif
EndEvent

Event OnOptionSliderOpen(int Option)

	if Option == OID[1]
		SetSliderDialogStartValue(HumilThresh)
		SetSliderDialogRange(1.0, 100.0)
		SetSliderDialogInterval(0.1)
	elseIf Option == OID[3]
		SetSliderDialogStartValue(HumilEffect)
		SetSliderDialogRange(0.01, 10.0)
		SetSliderDialogInterval(0.01)
	endif
EndEvent

;;; Toggle options
Event OnOptionSelect(int Option)

	If Option == OID[0]
		bMod = !bMod
		SetToggleOptionValue(OID[0], bMod)
	ElseIf Option == OID[2]
		bDebug = !bDebug
		SetToggleOptionValue(OID[2], bDebug)
	ElseIf Option == OID[4]
		bChamberpotHumil = !bChamberpotHumil
		SetToggleOptionValue(OID[4], bChamberpotHumil)
	ElseIf Option == OID[5]
		bBathingHumil = !bBathingHumil
		SetToggleOptionValue(OID[5], bBathingHumil)
	ElseIf Option == OID[6]
		bHPGarbStash = !bHPGarbStash
		SetToggleOptionValue(OID[6], bHPGarbStash)
	ElseIf Option == OID[7]
		bWeedNude = !bWeedNude
		SetToggleOptionValue(OID[7], bWeedNude)
	ElseIf Option == OID[8]
		bGuardPlay = !bGuardPlay
		SetToggleOptionValue(OID[8], bGuardPlay)
	ElseIf Option == OID[9]
		bKennelClean = !bKennelClean
		SetToggleOptionValue(OID[9], bKennelClean)
	ElseIf Option == OID[10]
		bBrothelClean = !bBrothelClean
		SetToggleOptionValue(OID[10], bBrothelClean)
	ElseIf Option == OID[11]
		bBrothelCommunity = !bBrothelCommunity
		SetToggleOptionValue(OID[11], bBrothelCommunity)
	ElseIf Option == OID[12]
		bPoorCommService = !bPoorCommService
		SetToggleOptionValue(OID[12], bPoorCommService)
	ElseIf Option == OID[13]
		bStocksService = !bStocksService
		SetToggleOptionValue(OID[13], bStocksService)
	ElseIf Option == OID[14]
		bRottenPotato = !bRottenPotato
		SetToggleOptionValue(OID[14], bRottenPotato)
	EndIf
EndEvent

Event OnOptionHighlight(int Option)

	If Option == OID[0]
		SetInfoText(enabledModDesc)
	ElseIf Option == OID[1]
		SetInfoText(HumilThreshDesc)
	ElseIf Option == OID[2]
		SetInfoText(enabledDebugDesc)
	ElseIf Option == OID[3]
		SetInfoText(HumilEffectDesc)
	ElseIf Option == OID[4]
		SetInfoText(ChamberpotHumilDesc)
	ElseIf Option == OID[5]
		SetInfoText(BathingHumilDesc)
	ElseIf Option == OID[6]
		SetInfoText(HPGarbStashDesc)
	ElseIf Option == OID[7]
		SetInfoText(WeedNudeDesc)
	ElseIf Option == OID[8]
		SetInfoText(GuardPlayDesc)
	ElseIf Option == OID[9]
		SetInfoText(KennelCleanDesc)
	ElseIf Option == OID[10]
		SetInfoText(BrothelCleanDesc)
	ElseIf Option == OID[11]
		SetInfoText(BrothelCommunityDesc)
	ElseIf Option == OID[12]
		SetInfoText(PoorCommServiceDesc)
	ElseIf Option == OID[13]
		SetInfoText(StocksServiceDesc)
	ElseIf Option == OID[14]
		SetInfoText(RottenPotatoDesc)
	EndIf
EndEvent

Event OnGameReload()

	parent.OnGameReload()
EndEvent

