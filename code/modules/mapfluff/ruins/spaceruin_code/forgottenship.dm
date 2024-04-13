// forgottenship ruin
GLOBAL_VAR_INIT(fscpassword, generate_password())

/proc/generate_password()
	return "[pick(GLOB.phonetic_alphabet)] [rand(1000,9999)]"

/////////// forgottenship objects

/obj/machinery/door/password/voice/sfc
	name = "vault blast door"
	desc = "A massive, plastitanium blast door. You can't penetrate it. There's a microphone on it."
/obj/machinery/door/password/voice/sfc/Initialize(mapload)
	. = ..()
	password = "[GLOB.fscpassword]"

/obj/machinery/vending/medical/syndicate_access/cybersun
	name = "\improper CyberMed ++"
	desc = "An advanced vendor that dispenses medical drugs, both recreational and medicinal."
	products = list(/obj/item/reagent_containers/syringe = 4,
					/obj/item/healthanalyzer = 4,
					/obj/item/reagent_containers/pill/patch/libital = 5,
					/obj/item/reagent_containers/pill/patch/aiuri = 5,
					/obj/item/reagent_containers/cup/bottle/multiver = 1,
					/obj/item/reagent_containers/cup/bottle/syriniver = 1,
					/obj/item/reagent_containers/cup/bottle/epinephrine = 3,
					/obj/item/reagent_containers/cup/bottle/morphine = 3,
					/obj/item/reagent_containers/cup/bottle/potass_iodide = 1,
					/obj/item/reagent_containers/cup/bottle/salglu_solution = 3,
					/obj/item/reagent_containers/syringe/antiviral = 5,
					/obj/item/reagent_containers/medigel/libital = 2,
					/obj/item/reagent_containers/medigel/aiuri = 2,
					/obj/item/reagent_containers/medigel/sterilizine = 1)
	contraband = list(/obj/item/reagent_containers/cup/bottle/cold = 2,
					/obj/item/restraints/handcuffs = 4,
					/obj/item/storage/backpack/duffelbag/syndie/surgery = 1,
					/obj/item/storage/medkit/tactical = 1)
	premium = list(/obj/item/storage/pill_bottle/psicodine = 2,
					/obj/item/reagent_containers/hypospray/medipen = 3,
					/obj/item/reagent_containers/hypospray/medipen/atropine = 2,
					/obj/item/storage/medkit/regular = 3,
					/obj/item/storage/medkit/brute = 1,
					/obj/item/storage/medkit/fire = 1,
					/obj/item/storage/medkit/toxin = 1,
					/obj/item/storage/medkit/o2 = 1,
					/obj/item/storage/medkit/advanced = 1,
					/obj/item/defibrillator/loaded = 1,
					/obj/item/wallframe/defib_mount = 1,
					/obj/item/sensor_device = 2,
					/obj/item/pinpointer/crew = 2,
					/obj/item/shears = 1)

/////////// forgottenship lore

/obj/item/paper/fluff/ruins/forgottenship/password
	name = "vault code change"

/obj/item/paper/fluff/ruins/forgottenship/password/Initialize(mapload)
	default_raw_text = "The current vault code is [GLOB.fscpassword]. Date of change: ERR_UNKN. Next code reset: NONE. Automatically set upon all crew entering cryogenic stasis."
	icon_state = "paper_words"
	inhand_icon_state = "paper"
	return ..()

/obj/item/paper/fluff/ruins/forgottenship/powerissues
	name = "reminder"
	default_raw_text = "If the power goes out, the emergency generator's in Engineering, at the SMES room."

/obj/item/paper/fluff/ruins/forgottenship/missionobj
	name = "mission objectives"
	default_raw_text = "Welcome onboard the SYN-C Starfury. You are assigned to jump-strike a Nanotrasen space station and then depart. Upon completing the mission, jump to system HD-10180 and an automatic supply drone will arrive to replenish the Starfury's supplies. After it arrives, attempt to return to port to recieve new crew."

/////////// forgottenship items

/obj/item/disk/surgery/forgottenship
	name = "Advanced Surgery Disk"
	desc = "A disk that contains advanced surgery procedures, must be loaded into an Operating Console."
	surgeries = list(/datum/surgery/advanced/lobotomy, /datum/surgery/advanced/bioware/vein_threading, /datum/surgery/advanced/bioware/nerve_splicing)

/obj/structure/fluff/empty_sleeper/syndicate/captain
	icon_state = "sleeper_s-open"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	deconstructible = FALSE

/obj/structure/fluff/empty_sleeper/syndicate/captain/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/gps, "Old Encrypted Signal")

/obj/item/storage/box/firingpins/syndicate
	name = "box of syndicate firing pins"
	desc = "A box full of special syndicate firing pins which allow only syndicate operatives to use weapons with those firing pins."

/obj/item/storage/box/firingpins/syndicate/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/firing_pin/implant/pindicate(src)

/////////// AI Laws

/obj/item/ai_module/core/full/cybersun
	name = "Syndicate AI Core Laws"
	law_id = "syndicate_override"


/////////// forgottenship areas

/area/ruin/space/has_grav/syndicate_forgotten_ship
	name = "SYN-C Starfury"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambidanger.ogg', 'sound/ambience/ambidanger2.ogg', 'sound/ambience/ambigen8.ogg', 'sound/ambience/ambigen9.ogg')

/area/ruin/space/has_grav/syndicate_forgotten_ship/medicial
	name = "SYN-C Starfury Medbay"

/area/ruin/space/has_grav/syndicate_forgotten_ship/crew
	name = "SYN-C Starfury Crew Quarters"

/area/ruin/space/has_grav/syndicate_forgotten_ship/bridge
	name = "SYN-C Starfury Bridge"

/area/ruin/space/has_grav/syndicate_forgotten_ship/bar
	name = "SYN-C Starfury Bar"

/area/ruin/space/has_grav/syndicate_forgotten_ship/engineering
	name = "SYN-C Starfury Engineering"

/area/ruin/space/has_grav/syndicate_forgotten_ship/shuttlebay
	name = "SYN-C Starfury Shuttle Bay"

/area/ruin/space/has_grav/syndicate_forgotten_ship/munitions
	name = "SYN-C Starfury Gunnery Bay"

/area/ruin/space/has_grav/syndicate_forgotten_ship/munitions/port
	name = "SYN-C Starfury Port Gunnery Bay"

/area/ruin/space/has_grav/syndicate_forgotten_ship/munitions/starboard
	name = "SYN-C Starfury Starboard Gunnery Bay"

/area/ruin/space/has_grav/syndicate_forgotten_ship/armoury
	name = "SYN-C Starfury Armoury"

/area/ruin/space/has_grav/syndicate_forgotten_ship/maintenance
	name = "SYN-C Starfury Maintenance"

/area/ruin/space/has_grav/syndicate_forgotten_cargopod
	name = "Syndicate Resupply Pod"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambigen3.ogg', 'sound/ambience/signal.ogg')

/area/ruin/space/has_grav/powered/syndicate_forgotten_vault
	name = "SYN-C Starfury Vault"
	icon_state = "syndie-ship"
	ambientsounds = list('sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg')
	area_flags = NOTELEPORT | UNIQUE_AREA
