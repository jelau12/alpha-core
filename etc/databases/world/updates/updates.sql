delimiter $
begin not atomic

    -- 27/03/2023 2
    if(select count(*) from applied_updates where id = '270320232') = 0 then
        -- Set subname for Brock Stoneseeker
        update creature_template set subname = "Cartography Trainer" where entry = 1681;
        -- Set subname for Karm Ironquill
        update creature_template set subname = "Cartography Supplies" where entry = 1764;
        -- Set subname for Berte & Evalyn
        update creature_template set subname = "Needs Model" where entry in(1880, 1881);
        -- Set faction for Evalyn
        update creature_template set faction = 35 where entry = 1881;
        -- Spawn Berte & Evalyn
        insert into spawns_creatures (spawn_entry1, position_x, position_y, position_z, orientation) VALUES
            (1880, -5333.290, -2955.981, 326.585, 3.444),
            (1881, -5337.208, -2957.187, 325.299, 3.469);
        -- Set faction and level 20 stats for Noma Bluntnose (identical to her husband Magistrate Bluntnose)
        update creature_template set faction = 57, level_min = 20, level_max = 20, health_min = 484, health_max = 484, armor = 852 where entry = 1879;
        -- Spawn Noma Bluntnose
        insert into spawns_creatures (spawn_entry1, position_x, position_y, position_z, orientation) VALUES
            (1879, -5296.893, -2953.931, 336.758, 2.971);

        -- make squirrels small again! and non-humanoid for a change!
        -- ... and Private Merle should not be a squirrel either.
        update creature_template set display_id1 = 134 where entry = 1412;
        update creature_template set display_id1 = 173 where entry = 1421;

        -- move Whaldak Darkbenk <Spider Trainer> to his true location
        update spawns_creatures set position_x = -4828.347, position_y = -2716.226, position_z = 328.332, orientation = 1.585 where spawn_id = 400071;
        -- set proper faction and have him spawn his spider pet
        update creature_template set faction = 57, spell_id1 = 7912 where entry = 2872;

        insert into applied_updates values ('270320232');
    end if;

    -- 29/03/2023 1
    if (select count(*) from `applied_updates` where id='290320231') = 0 then

        -- Alchemist Narett
        UPDATE `creature_template` SET `display_id1`=18 WHERE `entry`=4900;

        -- Brant Jasperbloom
        UPDATE `creature_template` SET `display_id1`=226 WHERE `entry`=4898;

        -- Uma Barthum
        UPDATE `creature_template` SET `display_id1`=15 WHERE `entry`=4899;

        -- Hans Weston
        UPDATE `creature_template` SET `display_id1`=17 WHERE `entry`=4886;

        -- Marie Holdston
        UPDATE `creature_template` SET `display_id1`=327 WHERE `entry`=4888;

        -- Gregor MacVince
        UPDATE `creature_template` SET `display_id1`=107 WHERE `entry`=4885;

        -- Helenia Olden
        UPDATE `creature_template` SET `display_id1`=162 WHERE `entry`=4897;

        -- Jensen Farran
        UPDATE `creature_template` SET `display_id1`=106 WHERE `entry`=4892;

        -- Guard Lasiter
        UPDATE `creature_template` SET `display_id1`=3138 WHERE `entry`=4973;

        -- Piter Verance
        UPDATE `creature_template` SET `display_id1`=17 WHERE `entry`=4890;

        -- Torq Ironblast
        UPDATE `creature_template` SET `display_id1`=2584 WHERE `entry`=4889;

        -- Dwane Wertle
        UPDATE `creature_template` SET `display_id1`=285 WHERE `entry`=4891;

        -- Morgan Stern
        UPDATE `creature_template` SET `display_id1`=280 WHERE `entry`=4794;

        -- Craig Nollward
        UPDATE `creature_template` SET `display_id1`=126 WHERE `entry`=4894;

        -- Bartender Lillian
        UPDATE `creature_template` SET `display_id1`=1049 WHERE `entry`=4893;

        -- Ingo Woolybush
        UPDATE `creature_template` SET `display_id1`=2584 WHERE `entry`=5388;

        -- Theramore Lieutenant
        UPDATE `creature_template` SET `display_id1` = 2981, `display_id2`= 2982, `display_id3` = 2983, `display_id4` = 2984 where `entry` = 4947;

        -- Theramore Skirmisher
        UPDATE `creature_template` SET `display_id1` = 2977, `display_id2` = 2978, `display_id3` = 2979, `display_id4` = 2980 where `entry` = 5044;

        insert into`applied_updates`values ('290320231');
    end if;

    -- 29/03/2023 3
    if (select count(*) from `applied_updates` where id='290320233') = 0 then

        -- Vilebranch Axe Trower
        UPDATE `creature_template` SET `display_id1` = 590, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2639;

        -- Vilebranch Witch Doctor
        UPDATE `creature_template` SET `display_id1` = 1117, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2640;

        -- Vilebranch Headhunter
        UPDATE `creature_template` SET `display_id1` = 1113, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2641;

        -- Vilebranch Shadowcaster
        UPDATE `creature_template` SET `display_id1` = 1115, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2642;

        -- Vilebranch Berserker
        UPDATE `creature_template` SET `display_id1` = 1118, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2643;

        -- Vilebranch Hideskinner
        UPDATE `creature_template` SET `display_id1` = 1154, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2644;

        -- Vilebranch Shadow Hunter
        UPDATE `creature_template` SET `display_id1` = 590, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2645;

        -- Vilebranch Blood Drinker
        UPDATE `creature_template` SET `display_id1` = 1118, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2646;

        -- Vilebranch Soul Eater
        UPDATE `creature_template` SET `display_id1` = 590, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2647;

        -- Vilebranch Aman'zasi Guard
        UPDATE `creature_template` SET `display_id1` = 1151, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2648;

        -- Whiterbark Scalper
        UPDATE `creature_template` SET `display_id1` = 337, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2649;

        -- Whiterbark Zealot
        UPDATE `creature_template` SET `display_id1` = 1113, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2650;

        -- Wetherbark Hideskinner
        UPDATE `creature_template` SET `display_id1` = 337, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2651;

        -- Wetherbark Venomblood
        UPDATE `creature_template` SET `display_id1` = 1116, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2652;

        -- Wetherbark Sadist
        UPDATE `creature_template` SET `display_id1` = 1114, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2653;

        -- Wetherbark Caller
        UPDATE `creature_template` SET `display_id1` = 1115, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 2654;

        -- Vilebranch Warrior
        UPDATE `creature_template` SET `display_id1` = 1118, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 4465;

        -- Vilebranch Scalper
        UPDATE `creature_template` SET `display_id1` = 1111, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 4466;

        -- Vilebranch Soothsayer
        UPDATE `creature_template` SET `display_id1` = 1115, `display_id2` = 0, `display_id3` = 0, `display_id4` = 0 where `entry` = 4467;

        -- Jade Sludge
        UPDATE `creature_template` SET `display_id1` = 1146 where `entry` = 4468;

        insert into`applied_updates`values ('290320233');
    end if;

    -- 29/03/2023 4
    if (select count(*) from `applied_updates` where id='290320234') = 0 then

        -- Defias Renegade Mage
        UPDATE `creature_template` SET `display_id1` = 263, `display_id2` = 278, `display_id3` = 0, `display_id4` = 0 where `entry` = 450;

        insert into`applied_updates`values ('290320234');
    end if;

    -- 30/03/2023 1
    if (select count(*) from `applied_updates` where id='300320231') = 0 then

        -- Update Juli Stormbraid
        update creature_template set display_id1 = 3067, faction = 57 where entry = 5145;
        -- Update Alyssa Griffith
        update creature_template set display_id1 = 1520 where entry = 1321;
        -- Update Jorgen
        update creature_template set display_id1 = 2960 where entry = 4959;
        -- Update Elyssia <Portal Trainer>
        update creature_template set display_id1 = 2204 where entry = 4165;
        -- Update Ainethil <Herbalism Trainer>
        update creature_template set display_id1 = 2215 where entry = 4160;
        -- Update Ursyn Ghull
        update creature_template set display_id1 = 2136 where entry = 3048;
        -- Update Bretta Goldfury
        update creature_template set display_id1 = 3058 where entry = 5123;
        -- Update Witherbark Shadow Hunter
        update creature_template set display_id2 = 4000 where entry = 2557;
        -- Updathe Rhinag
        update creature_template set display_id1 = 4075 where entry = 3190;
        -- Update Theresa Moulaine
        update creature_template set display_id1 = 1498 where entry = 1350;
        -- Update Defias Pirate
        update creature_template set display_id2 = 2348 where entry = 657;
        -- Update Belstaff Stormeye
        update creature_template set display_id2 = 3090 where entry = 2489;

        -- Update Dark Strand creatures
        update creature_template set display_id1 = 1642, display_id2 = 1643, display_id3 = 0, display_id4 = 0 where entry in(2336, 2337, 3879);

        -- Fix Tursk <Crawler Trainer>
        update creature_template set level_min = 50, level_max = 50, faction = 29, name = "Tursk", health_min = 1938, health_max = 1938, armor = 1341, spell_id1 = 7907 where entry = 3623;

        -- Update Charity Mipsy
        update creature_template set display_id1 = 213 where entry = 4896;

        -- Update Witherbark Zealot
        update creature_template set display_id1 = 337 where entry = 2650;
        -- Update Jade Ooze
        update creature_template set display_id1 = 1146 where entry = 2656;

        -- Despawn a bunch of objects related to NYI quest "Counterattack!" from The Barrens
        update spawns_gameobjects set ignored = 1 where spawn_id in(16771, 14777, 14779, 16770, 14776);
        -- Despawn a Fierce Blaze, the camp is NYI
        update spawns_gameobjects set ignored = 1 where spawn_id = 13512;

        -- Set correct quest objective for Regthar Deathgate's quests as he isn't west of Crossroads
        -- but in Crossroads proper in 0.5.3
        -- Kolkar Leaders, proof: https://web.archive.org/web/20040825094143/http://wow.allakhazam.com/db/quest.html?wquest=855
        update quest_template set Objectives = 'Bring 15 Centaur Bracers to Regthar Deathgate at the Crossroads.' where entry = 855;
        -- Same for quest Hezrul Bloodmark, proof: https://web.archive.org/web/20040903231152/http://www.goblinworkshop.com/quests/hezrul-bloodmark.html
        update quest_template set Objectives = "Bring Hezrul's Head to Regthar Deathgate at the Crossroads." where entry = 852;
        -- Same for quest Verog the Dervish, proof: https://web.archive.org/web/20040918103729/http://www.goblinworkshop.com/quests/verog-the-dervish.html
        update quest_template set Objectives = "Bring Verog's Head to Regthar Deathgate at the Crossroads." where entry = 851;
        -- Same for quest Kolkar Leaders, proof: https://web.archive.org/web/20040906103419/http://www.goblinworkshop.com/quests/kolkar-leaders.html
        update quest_template set Objectives = "Bring Barak's Head to Regthar Deathgate at the Crossroads." where entry = 850;

        -- Set placeholder for Kreenig Snarlsnout
        update creature_template set display_id1 = 1420 where entry = 3438;

        -- Add trainer id to Kil'hala
        update creature_template set trainer_id = 507 where entry = 3484;

        -- Update Deathguard Lundmark with placeholder
        update creature_template set display_id1 = 1021 where entry = 5725;

        -- Fix broken SFK cell doors (they spawn too low so you can't ever pass even when opened)
        update spawns_gameobjects set spawn_positionZ = 83.5 where spawn_id in(33219, 32445, 32446);

        -- Despawn objects affected by vanilla terrain change in Forgotten Pools/Barrens
        update spawns_gameobjects set ignored = 1 where spawn_id in(1814, 13202, 15688, 2725, 2611);

        -- Set placeholder for Barak Kodobane, Verog and Hezrul
        update creature_template set display_id1 = 1257 where entry in(3394, 3395, 3396);

        -- Despawn object from Camp Taujaro (shane cube with no use)
        update spawns_gameobjects set ignored = 1 where spawn_id = 14708;

        -- Have Harb Clawhoof spawn his pet cat
        update creature_template set spell_id1 = 7906 where entry = 3685;

        insert into`applied_updates`values ('300320231');
    end if;

    -- 31/03/2023 2
    if (select count(*) from `applied_updates` where id='310320232') = 0 then

        -- Fix Ratchet/Tanaris faction templates by aligning all these goblins with Booty Bay
        update creature_template set faction = 121 where faction in(474, 637);

        -- Despawn objects from Barrens affected by vanilla terrain changes
        update spawns_gameobjects set ignored = 1 where spawn_id in(13241, 13505, 13320, 12935, 2183, 13202, 1814, 2066, 15688, 2725, 1901, 2160, 13314, 2501, 1992);

        -- Fix quest Verog the Dervish - he's not near any command tents since there is no command tent yet.
        update quest_template set Details = "The centaur Verog the Dervish wanders the Barrens, and will be difficult to find. But he is based at the camps near the Stagnant Oasis to the southeast. It may be possible to draw him to you.$B$BTravel to the centaur camps near the Stagnant Oasis and attack the centaurs there. It will be dangerous, but if you can kill enough centaurs at those camps then they should raise an alarm. And Verog will come.$B$BBring me his head and I will place it with Barak Kodobane's." where entry = 851;

        -- Fix quest Echeyakee - he's not summoned by any horn, nor does the horn item even exist
        -- Also fix Objectives to mention the changed questgiver (see below)
        update quest_template set Objectives = "Bring Echeyakee's Hide to Jorn Skyseer at Camp Taujaro.", Details = "Whitemist, Echeyakee in our tongue, is the king of the savannah cats. With such steath does he hunt, he is like a thin white mist on the earth. And with such speed does he kill, his prey have no time for fear, or pain.$B$BHe is mercy, and he is death.$B$BYou will learn this, for I set you on the path to hunt Echeyakee. He stalks with his lion brethren, northeast of The Crossroads...$B$BGo. He is waiting.", OfferRewardText = "You have beaten Echeyakee, and though he hunts no more... his spirit is with you. He will show you the strength found in subtlety, and the honor in mercy.$B$BYour path is long, young $c. Stride it well." where entry = 881;

        -- Spawn Echeyakee at retail position of his lair - it's northeast of the Crossroads and with his "lion brethren"
        insert into spawns_creatures (spawn_entry1, map, position_x, position_y, position_z, orientation, spawntimesecsmin, spawntimesecsmax, movement_type) values (3475, 1, 458.11, -3035.91, 91.6839, 0, 300, 300, 1);

        -- Move quest Echeyakee to Jorn Skyseer in Camp Taujaro. Evidence suggests he was originally the quest starter, not Sergra Darkthorn.
        update creature_quest_starter set entry = 3387 where quest = 881;
        update creature_quest_finisher set entry = 3387 where quest = 881;

        -- Fix quest text of The Angry Scytheclaws
        update quest_template set Details = "The Sunscale Scytheclaws have gone berserk. Normally they fight with Savannah Prowlers for food, keeping both predators scarce.$B$BWithout their natural enemy, they have started stalking the roads, picking off unwary travelers. You must thin their numbers, $N.$B$BFind the Sunscale Scytheclaws to the south, slay them and cut out their bladders. Use the Scytheclaw Bladders to defile the Scytheclaw nests, southwest of the Stagnant Oasis. With their nests defiled they will abandon them and move elsewhere.", RequestItemsText = "Is your task finished? Ponder the life of the Scytheclaw as you do it. There are important lessons within every creature's lifespawn.", OfferRewardText = "Some of the others believe I have been too heavy handed in my lesson. I know that you are simply following my orders, but I want you to consider the life of the creatures you are slaughtering.$B$BThough they are at times a nuisance, they only become threatening when we seek their slaughter. This days defilement will cause us more trouble than it will solve problems...", Objectives = "Kill Sunscale raptors and collect their bladders. Use the bladders on the 3 Scytheclaw nests. Return to Sergra Darkthorn in the Crossroads." where entry = 905;

        -- Despawn Horde Guards from a non-existant camp
        update spawns_creatures set ignored = 1 where spawn_id in(19402, 19361, 19326, 19438, 19412);
        -- Despawn shane cubed benches from the same camp
        update spawns_gameobjects set ignored = 1 where spawn_id in(13407, 13403);

        -- Fix quest text of Deepmoss Spider Eggs
        update quest_template set Details = "Spider egg omelettes are a new fad in Booty Bay! The problem is... Booty Bay's got no supply of eggs.$B$BI smell an opportunity!$B$BIn Windshear Crag -- in the Stonetalon Mountains to the northwest -- lives the deepmoss spider. Bring me its eggs and I'll pay a bundle!$B$BThe spiders like to creep under the shade of trees... Too bad the Venture Company cut down most of their trees!$B$BBut go to Windshear Crag anyway and look for deepmoss spiders. Their eggs will be clustered under what trees remain." where entry = 1069;

        -- Fix Z of two NPCs in Sepulcher
        update spawns_creatures set position_z = 104.877 where spawn_id in(17622, 17625);

        -- Fix Z for Barrel of Milk in Stonetalon Mountains
        update spawns_gameobjects set spawn_positionZ = 22.9 where spawn_id = 47559;

        -- Restore quest Goblin Invaders
        update quest_template set Objectives = "Kill 12 Venture Co. Cutters, 10 Venture Co. Grinders and 6 Venture Co. Loggers, then return to Seereth Stonebreak on the border of Stonetalon and the Barrens.", ReqCreatureOrGOId3 = 3989, ReqCreatureOrGOCount3 = 6 where entry = 1062;

        -- Despawn a floating book in Ratchet, table is missing
        update spawns_gameobjects set ignored = 1 where spawn_id = 13452;

        -- Remove invalid display_id from Southsea Cannoneer
        update creature_template set display_id2 = 3828, display_id3 = 0 where entry = 3382;
        -- Same for Southsea Brigand
        update creature_template set display_id4 = 0 where entry = 3381;
        -- And for Southsea Cutthroat
        update creature_template set display_id2 = 3836, display_id3 = 0, display_id4 = 0 where entry = 3383;

        -- Set proper faction for Theramore units in The Barrens - they need to be hostile to Horde
        update creature_template set faction = 150 where entry in(3454, 3455, 3393, 3385, 3386);

        -- Despawn a bunch of objects from not-yet-existant Northwatch Hold
        update spawns_gameobjects set ignored = 1 where spawn_id in(13360, 12705, 13365, 13354);

        -- Spawn Cannoneers Smythe & Wesson
        update spawns_creatures set ignored = 0, position_x = -2088.116, position_y = -3683.056, position_z = 50.397, orientation = 4.450 where spawn_id = 12165;
        update spawns_creatures set ignored = 0, position_x = -2097.684 , position_y = -3675.315, position_z = 50.254, orientation = 4.450 where spawn_id = 12166;

        -- Slightly move a Lost Barrens Kodo spawn as it spawns inside a house
        update spawns_creatures set position_x = 753.196, position_y = -2777.454, position_z = 92.003 where spawn_id = 15119;

        -- Despawn unused object Tool Bucket from Barrens
        update spawns_gameobjects set ignored = 1 where spawn_entry = 161752;

        -- Despawn unused object Gallywix' Lockbox and trap object
        update spawns_gameobjects set ignored = 1 where spawn_entry in(129127, 130126);

        -- Despawn Venture Co. Drudgers spawning under water
        update spawns_creatures set ignored = 1 where spawn_id in(20791, 20784);

        -- Despawn shane cubed benches
        update spawns_gameobjects set ignored = 1 where spawn_id in(13396, 13392);

        -- Despawn various shane cubed objects that serve no purpose in 0.5.3
        update spawns_gameobjects set ignored = 1 where spawn_id in(13531, 20389, 10808, 12353, 14685, 17202, 17198, 17203, 17204, 17205, 40668, 47699, 32611, 14106, 20637, 1712, 1657, 16873, 3996126, 28294, 12863, 12872, 12864, 15175, 15176, 40694, 42107, 42108, 42109, 14411, 14412, 14422, 33253, 33221, 14441, 14393, 14394, 47966, 47968, 49828, 10919, 40696, 40698, 17228, 18013, 50016, 399472, 230924, 6910, 50158, 99847, 11389, 6447, 17633, 7024, 11922, 32045, 399323, 48357, 48460, 42112, 4523, 98643, 17972, 6942, 13500, 17428, 17598, 17599, 17600, 17926, 17500, 2, 33240, 5258, 6813, 6936, 17597, 17745);
        update spawns_gameobjects set ignored = 1 where spawn_entry in(89634, 90566, 90858, 102985, 126052, 126053, 141812, 141853, 141857, 141858, 141859, 141931, 142175, 142176, 142208, 142209, 142210, 142211, 142212, 142213, 142344, 142345, 142475, 142476, 142487, 142488, 142696, 143979, 147516, 147517, 148418, 148419, 148420, 148421, 148503, 148837, 148883, 148937, 124370, 149432, 149433, 150140, 153204, 153205, 157816, 157817, 157818, 157819, 157820, 161527, 162024, 164870, 175084, 175085, 175207, 175226, 175227, 175233, 175246, 175247, 175248, 175249, 175324, 175329, 175330, 175331, 175490, 175491, 175492, 175586, 175524, 175587, 175787, 175788, 175889, 175890, 175891, 175894, 175924, 175925, 175926, 175928, 175933, 175659, 175944, 175948, 176157, 176165, 176188, 176190, 176196, 176197, 176198, 176208, 176591, 176209, 176865, 176210, 176213, 176214, 176306, 176361, 176393, 176392, 176582, 176635, 176745, 176747, 176967, 176968, 176969, 176970, 176971, 176972, 176973, 176987, 176988, 176989, 176990, 176991, 176992, 176993, 176994, 177045, 177185, 177188, 177198, 177226, 177227, 177243, 177249, 177250, 177251, 177252, 177253, 177254, 177255, 177256, 177264, 177271, 177289, 177307, 177365, 177366, 177369, 177397, 177398, 177399, 177400, 177484, 177485, 177644, 177667, 177677, 177747, 177785, 177787, 177791, 177794, 177793, 177804, 177805, 177806, 177884, 177927, 177964, 178087, 178089, 178125, 178144, 178146, 178147, 178195, 178247, 178324, 178325, 178386, 178553, 178571, 178934, 179144, 179224, 179469, 179736, 179827, 179879, 180100, 180104, 180323, 180335, 180811, 180866, 186218, 68865, 164651);
        -- Set placeholders for Azsharite Formation
        update gameobject_template set displayId = 219 where entry in(152620, 152621, 152631);

        -- Fix faction for Wizzlecrank's Shredder
        update creature_template set faction = 121 where entry = 3439;

        -- Fix Ransin Donner to actually be a Crab Trainer
        update creature_template set faction = 11, trainer_type = 3, trainer_class = 3, trainer_id = 282, spell_id1 = 7907 where entry = 2943;
        -- Fix Kurll to be a Cat Trainer
        update creature_template set trainer_type = 3, trainer_class = 3, spell_id1 = 7906, trainer_id = 277 where entry = 3621;
        -- Fix Rarck to be a Raptor Trainer
        update creature_template set trainer_type = 3, trainer_class = 3, spell_id1 = 7910, trainer_id = 285, faction = 85 where entry = 3625;
        -- Fix Harb Clawhoof to be a Cat Trainer
        update creature_template set trainer_type = 3, trainer_class = 3, trainer_id = 277 where entry = 3685;
        -- Fix Alanndrian Nightsong to be a Tallstrider Trainer
        update creature_template set trainer_type = 3, trainer_class = 3, trainer_id = 286, spell_id1 = 7913 where entry = 3702;
        -- Fix Galthuk to be a Bear Trainer
        update creature_template set trainer_type = 3, trainer_class = 3, trainer_id = 278, spell_id1 = 7903 where entry = 4043;

        -- Rewrite quest Blueleaf Tubers to it's original form
        -- Proof: https://web.archive.org/web/20040908182039/http://www.goblinworkshop.com/quests/redleaf-tubers.html
        update quest_template set Title = "Redleaf Tubers", Details = "Redleaf tubers are a delicacy around the world! But they're rare, very rare. The only place to find them is here in the Barrens, deep in the earth, in Razorfen Kraul.$B$BAnd even then, they're impossible to find unless you know just where to look! That's why I've trained these snufflenose gophers to find them for me. They have great noses and can smell a tuber from fifty paces away.$B$BIt won't be easy, but if you get me some tubers I'll pay you handsomely.", Objectives = "Grab a Crate with Holes. Grab a Snufflenose Command Stick. Grab and read the Snufflenose Owner's Manual. In Razorfen Kraul, use the Crate with Holes to summon a Snufflenose Gopher, and use the Command Stick on the gopher to make it search for Tubers. Bring 10 Redleaf Tubers, the Snufflenose Command Stick and the Crate with Holes to Mebok Mizzyrix in Ratchet." where entry = 1221;
        -- Rename Blueleaf Tubers object to Redleaf Tubers
        update gameobject_template set name = "Redleaf Tuber" where entry = 20920;

        -- Restore quest Shards of a God (replaces Spirits of the Wind)
        update quest_template set Title = "Shards of a God", SpecialFlags = 0, PrevQuestId = 0, Details = "When the vines came out of the earth, they often forced veins of minerals to surface also.$B$BOne special mineral found near the vines has been named blood ore. The Bristleback tribe think the blood ore is sacred and part of Agammagan's body. They sometimes carry shards of it for good fortune.$B$BI think I may be able to create a new alloy from the ore if I were to get enough of it. Find the Bristleback to the south of here, across the dry riverbed, and bring me back as many blood shards as you can.", Objectives = "Bring 20 Blood Shards to Tatternack Steelforge at the Crossroads.", ReqItemCount1 = 20, RewOrReqMoney = 854, RewSpell = 0, RewSpellCast = 0, OfferRewardText = "", RequestItemsText = "" where entry = 889;
        -- Move quest Shards of a God to Tatternack Steelforge
        update creature_quest_starter set entry = 3433 where quest = 889;
        update creature_quest_finisher set entry = 3433 where quest = 889;

        -- Restore original quest details of Weapons of Choice
        update quest_template set Details = "The warchief has instructed me to study all kinds of weapons and armor. He thinks there's something to be learned from even the most pathetic of cultures.$B$BTake the Razormane quillboars to the south, beyond the Field of Giants. As far as I know, they have no skilled blacksmiths, but I'm told they've started to develop sturdier weapons. I'd like to get my hands on a few to learn their techniques.$B$BIf you come across some of their rarer items, bring them to me, and you'll bring honor to the Horde." where entry = 893;

        -- Set proper display_id for Watcher Mocarski
        update creature_template set display_id1 = 2395 where entry = 827;

        -- Set trainer list for Teg Dawnstrider <Enchanting Trainer>
        update creature_template set trainer_id = 508 where entry = 3011;

        -- Fix display_id for Jezelle's Imp and Succubus
        update creature_template set display_id1 = 1213 where entry = 5730;
        update creature_template set display_id1 = 159 where entry = 5728;

        -- Fix Helena Atwood's OOC script (used NYI spell id)
        update creature_ai_scripts set datalong = 1485 where id = 566901;

        -- Restore Skeletal Enforcer based on level 24-25 Skeletal Fiend
        update creature_template set name = "Skeletal Enforcer", faction = 21, static_flags = 0, level_min = 24, level_max = 25, health_min = 664, health_max = 712, armor = 1009, dmg_min = 36, dmg_max = 46, attack_power = 106, loot_id = 531, pickpocket_loot_id = 531, gold_min = 33, gold_max = 48, ai_name = 'EventAI', movement_type = 1, mechanic_immune_mask = 8602131 where entry = 725;
        -- Spawn Skeletal Enforcer as replacement for some Skeletal Fiend and Skeletal Horror on Duskwood Cemetary
        update spawns_creatures set spawn_entry1 = 725 where spawn_id in(4941, 5160, 5040, 4944);
        update spawns_creatures set spawn_entry1 = 725 where spawn_id in(5178, 4993, 4974, 5942);

        -- Set Lord Daval display_id
        update creature_template set display_id1 = 2039 where entry = 1749;
        -- Revert Scarlet Mage display_id to placeholder
        update creature_template set display_id1 = 1640, display_id2 = 1641 where entry = 1832;

        insert into`applied_updates`values ('310320232');
    end if;

    -- 31/03/2023 1
    if (select count(*) from `applied_updates` where id='310320231') = 0 then

        -- Set Unique models for Belstaff (it was set to display_id2 instead of 1 on recent change)
        update creature_template set display_id1 = 3090, display_id2 = 0 where entry = 2489;

        -- Set placeholder for NE male
        update creature_template set display_id1 = 2572 where entry in (3583, 4182, 4183, 4189, 4192, 4193, 4265, 3672, 3797, 4307, 4050, 4052, 4753, 2077);

        -- Set placeholder for NE female
        update creature_template set display_id1 = 2575 where entry in (4185, 4186, 4190, 4191, 4266, 4188, 4051, 4184, 4521, 4194);
        update creature_template set display_id2 = 2575 where entry = 4052;

        -- Set placeholder for Tauren male
        update creature_template set display_id1 = 2578 where entry in (4451, 3222, 4310, 2987, 2549, 4309, 3689, 3978, 3050);

        -- Set placeholder for Tauren female
        update creature_template set display_id1 = 2579 where entry in (4046, 3447);

        -- Set placeholder for UD male
        update creature_template set display_id1 = 1027 where entry in (5414, 2934, 5748, 4488, 5651, 223);

        -- Set placeholder for UD female
        update creature_template set display_id1 = 1029 where entry in (2802);

        -- Set placeholder for Gnome male
        update creature_template set display_id1 = 2581 where entry in (3666);
            -- Since we have evidence showing Ruppo (engineer) using old gnome, we apply old gnomes on engineer related NPCs
        update creature_template set display_id1 = 352 where entry in (374, 1676, 2687, 3133, 1454, 2683);

        -- Set placeholder for Gnome female
        update creature_template set display_id1 = 2590 where entry in (1454);

        -- Set placeholder for Troll male
        update creature_template set display_id1 = 2588 where entry in (2704, 3410, 3406, 3402, 3401);

        -- Set placeholder for Troll female
        update creature_template set display_id1 = 2589 where entry in (3407, 3404, 3405, 3408);

        -- Set placeholder for Orc male
        update creature_template set display_id1 = 2576 where entry in (2856, 4485, 2091, 2108, 2858, 986, 4752, 4618, 2857, 4047);

        -- Set placeholder for Orc female
        update creature_template set display_id1 = 2577 where entry in (3411);

        insert into`applied_updates`values ('310320231');
    end if;

    -- 01/04/2023 1
    if (select count(*) from `applied_updates` where id='010420231') = 0 then
        UPDATE `quest_template` SET `NextQuestId` = '1091', `ExclusiveGroup` = '-1079' WHERE (`entry` = '1079');
        UPDATE `quest_template` SET `PrevQuestId` = '0', `NextQuestId` = '1091', `ExclusiveGroup` = '-1079' WHERE (`entry` = '1080');
        UPDATE `gameobject_template` SET `data0` = '0' WHERE (`entry` = '24776');
        UPDATE `item_template` SET `spellid_1` = '0' WHERE (`entry` = '6145');

        insert into`applied_updates`values ('010420231');
    end if;

    -- 04/04/2023 1
    if (select count(*) from `applied_updates` where id='040420231') = 0 then
        -- Fix alternate display_id for Cenarion NPCs, closes #1120
        update creature_template set display_id2 = 0 where entry in(4041, 3797);

        -- Fix remaining Scarlet NPCs
        update creature_template set display_id1 = 1611, display_id2 = 1612 where entry = 4493;
        update creature_template set display_id1 = 1640, display_id2 = 1641, display_id3 = 0, display_id4 = 0 where entry = 4494;

        -- Fix Maris Granger
        update creature_template set subname = "Mail Armor Merchant", npc_flags = 1 where entry = 1292;
        -- Copy from another Mail Armor Merchant's vendor table
        INSERT INTO npc_vendor (entry, item) SELECT 1292, item FROM npc_vendor WHERE entry = 1349;

        -- Change Tannysa to Tailoring Trainer
        update creature_template set subname = "Tailoring Trainer", trainer_id = 507 where entry = 5566;
        -- Relocate Eldraith to The Park
        update spawns_creatures set position_x = -8722.818, position_y = 1172.953, position_z = 98.34, orientation = 3.304 where spawn_entry1 = 5503;

        -- Fixes for Thousand Needles NPCs
        update creature_template set display_id1 = 2578 where entry = 2986;
        update creature_template set display_id1 = 2576 where entry in(4483, 4545, 4546, 4547);
        update creature_template set display_id1 = 1452, display_id2 = 1453 where entry = 5523;
        update creature_template set display_id1 = 2576 where entry = 4875;
        update creature_template set display_id1 = 2578 where entry in(4876, 4878);
        update creature_template set display_id1 = 2579 where entry = 4877;

        -- Fix Valyen Wolfsong and spawn his pet
        update creature_template set faction = 79 where entry in(4207, 4245);
        insert into spawns_creatures (spawn_entry1, map, position_x, position_y, position_z, orientation) VALUES (4245, 1, 10124.806, 2540.995, 1317.636, 2.174);

        -- Fix quest text of 1072 "An Old Colleague"
        update quest_template set Details = "The device I'm thinking about is my most advanced version to date. But we'll need a special potion if it's to work. I'm thinking we might as well get the really good stuff since this mission could be your last if you decide to help.$B$BAnd for that, we're going to need some potent explosives: Nitromirglyceronium.$B$BThe only person who can make NG-5 is an ol' friend of mine in Ironforge: Lomac Gearstrip.$B$BIf you can talk him into making us some NG-5, I'll get to work on placement for my devices…" where entry = 1072;

        insert into`applied_updates`values ('040420231');
    end if;
        
    -- 05/04/2023 1
    if (select count(*) from `applied_updates` where id='050420231') = 0 then

        -- Witch doctor Unbagwa
        UPDATE `creature_template`
        SET `display_id1`=1115
        WHERE `entry`=1449;
        
        -- Rot Hide Bruiser
        UPDATE `creature_template`
        SET `display_id1`=858
        WHERE `entry`=1944;
        
        -- Shadow Sprite
        UPDATE `creature_template`
        SET `display_id1`=1185
        WHERE `entry`=2003;
        
        -- Vicious Grell
        UPDATE `creature_template`
        SET `display_id1`=1015
        WHERE `entry`=2005;
        
        -- Maruk Wyrmscale
        UPDATE `creature_template`
        SET `display_id1`=1139
        WHERE `entry`=2090;
        
        -- Shadra
        UPDATE `creature_template`
        SET `display_id1`=1160
        WHERE `entry`=2707;
        
        -- Wooly kodo
        UPDATE `creature_template`
        SET `display_id1`=1230
        WHERE `entry`=3237;
        
        -- Elder Mystic Razorsnout
        UPDATE `creature_template`
        SET `display_id1`=1420
        WHERE `entry`=3270;
        
        -- Kuz
        UPDATE `creature_template`
        SET `display_id1`=1420
        WHERE `entry`=3436;
        
        -- Devouring Ectoplasm
        UPDATE `creature_template`
        SET `display_id1`=360
        WHERE `entry`=3638;
        
        -- Pridewing Patriarch
        UPDATE `creature_template`
        SET `display_id1`=2298
        WHERE `entry`=4015;
        
        -- Strashaz Serpent Guard
        UPDATE `creature_template`
        SET `display_id1`=4036
        WHERE `entry`=4366;
        
        -- Strashaz Siren
        UPDATE `creature_template`
        SET `display_id1`=4036
        WHERE `entry`=4371;
        
        -- Elder Murk Thresher 
        UPDATE `creature_template`
        SET `display_id1`=2602
        WHERE `entry`=4390;
        
        -- Mudrock Snapjaw
        UPDATE `creature_template`
        SET `display_id1`=1244
        WHERE `entry`=4400;
        
        -- Deepstrider Searcher 
        UPDATE `creature_template`
        SET `display_id1`=1135
        WHERE `entry`=4687;
        
        -- Ogron
        UPDATE `creature_template`
        SET `display_id1`=655
        WHERE `entry`=4983;
        
        -- Coral Shark 
        UPDATE `creature_template`
        SET `display_id1`=1557, `display_id2`=0, `display_id3`=0, `display_id4`=0
        WHERE `entry`=5434;
        
        -- Sand Shark
        UPDATE `creature_template`
        SET `display_id1`=1557, `display_id2`=0, `display_id3`=0, `display_id4`=0
        WHERE `entry`=5435;
        
        -- Noboru the Cudgel 
        UPDATE `creature_template`
        SET `display_id1`=628
        WHERE `entry`=5477;
        
        -- Ongeku
        UPDATE `creature_template`
        SET `display_id1`=628
        WHERE `entry`=5622;
        
        -- Moshogg spellcrafter
        UPDATE `creature_template`
        SET `display_id1`=326
        WHERE `entry`=710;
        
        -- Moshogg Butcher
        UPDATE `creature_template`
        SET `display_id1`=655
        WHERE `entry`=723;

        -- Moshogg Lord
        UPDATE `creature_template`
        SET `display_id1`=655
        WHERE `entry`=680;
        
        -- Mayzoth
        UPDATE `creature_template`
        SET `display_id1`=33
        WHERE `entry`=818;
        
        -- Twilight runner
        UPDATE `creature_template`
        SET `display_id1`=633
        WHERE `entry`=4067;
        
        -- Galak Centaur
        UPDATE `creature_template`
        SET `display_id1`=2292
        WHERE `entry`=2967;
        
        -- Galak Outrunner
        UPDATE `creature_template`
        SET `display_id1`=2292
        WHERE `entry`=2968;
        
        -- Barak
        UPDATE `creature_template`
        SET `display_id1`=1349
        WHERE `entry`=3394;
        
        -- Deepstrider
        UPDATE `creature_template`
        SET `display_id1`=1135
        WHERE `entry`=4686;
        
        -- Coast Strider
        UPDATE `creature_template`
        SET `display_id1`=1135
        WHERE `entry`=5466;
        
        -- Anillia
        UPDATE `creature_template`
        SET `display_id1`=2722
        WHERE `entry`=3920;
        
        -- Boss thogrun
        UPDATE `creature_template`
        SET `display_id1`=1054
        WHERE `entry`=2944;
        
        -- Broken Tooth
        UPDATE `creature_template`
        SET `display_id1`=1978
        WHERE `entry`=2850;
        
        -- Swapwalker Elder
        UPDATE `creature_template`
        SET `display_id1`=2024
        WHERE `entry`=765;
        
        -- Saltscale Oracle
        UPDATE `creature_template`
        SET `display_id1`=3615
        WHERE `entry`=873;
        
        -- Mire Lord
        UPDATE `creature_template`
        SET `display_id1`=2023
        WHERE `entry`=1081;
        
        -- Razormaw Matriach
        UPDATE `creature_template`
        SET `display_id1`=788
        WHERE `entry`=1140;
        
        -- Rotting Ancestor
        UPDATE `creature_template`
        SET `display_id1`=1197, `display_id2`=1198, `display_id3`=0, `display_id4`=0
        WHERE `entry`=1530;
        
        -- Tormented Spirit
        UPDATE `creature_template`
        SET `display_id1`=985
        WHERE `entry`=1533;
        
        -- Wailing Ancestor
        UPDATE `creature_template`
        SET `display_id1`=984
        WHERE `entry`=1534;
        
        -- Logrosh
        UPDATE `creature_template`
        SET `display_id1`=1046
        WHERE `entry`=2453;

        -- Rot Hide Gnoll (atm scale is way too big)
        UPDATE `creature_template`
        SET `display_id1`=3196
        WHERE `entry`=1674;

        insert into`applied_updates`values ('050420231');
    end if;

    -- 06/04/2023 1
    if (select count(*) from `applied_updates` where id='060420231') = 0 then
        -- Fix mistakenly removed subname
        update creature_template set subname = "" where entry = 1764;
        update creature_template set subname = "Cartography Supplies" where entry = 372;
        -- Move Crossroads guards
        update spawns_creatures set position_x = -336.823, position_y = -2702.599, position_z = 95.796, orientation = 0.024 where spawn_id = 19413;
        update spawns_creatures set position_x = -332.090, position_y = -2668.597, position_z = 95.491, orientation = 5.913 where spawn_id = 19415;
        -- Change display_id of Brimgore
        update creature_template set display_id1 = 2718 where entry = 4339;
        insert into`applied_updates`values ('060420231');
    end if;


    -- 14/04/2023 1
    if (select count(*) from `applied_updates` where id='140420231') = 0 then
        -- Set display_id for Anaya Dawnrunner and Lady Moongazer
        update creature_template set display_id1 = 915 where entry in(3667, 2184);

        insert into`applied_updates`values ('140420231');
    end if;

    -- 03/05/2023 1
    if (select count(*) from `applied_updates` where id='030520231') = 0 then
        -- Change diplay_id for Krolg from 1945 to 1012, issue #1140
        update creature_template set display_id1 = 1012 where entry = 3897;
        -- Change diplay_id for Druid of the Talon to NE PH
        update creature_template set display_id1 = 2572 where entry = 2852;
        -- Change diplay_id for Druid of the Fang to NE PH
        update creature_template set display_id1 = 2572, display_id2 = 0, display_id3 = 0, display_id4 = 0 where entry = 3840;


        insert into`applied_updates`values ('030520231');
    end if;


    -- 04/05/2023 1
    if (select count(*) from `applied_updates` where id='040520231') = 0 then
        -- Relocate Jordan Croft,  issue #1141
        update spawns_creatures set position_x = -9496.263,  position_y = -1194.701, position_z = 49.565, orientation = 5.820 where spawn_id = 400054;
        update creature_template set level_min = 10, level_max = 10, health_min = 198, health_max = 198, armor = 20, dmg_min = 9, dmg_max = 13, attack_power = 62 where entry = 1649;
        -- Spawn Natheril and change his display id to NE PH, stats were changed to stats of lvl 27 npcs, issue #1137
        update spawns_creatures set position_x = 9950.535,  position_y = 1926.531, position_z = 1327.937, orientation = 4.913, ignored = 0 where spawn_id = 41643;
        update creature_template set display_id1 = 2572, level_max = 27, level_min = 27, health_max = 839, health_min = 839, armor = 1097, dmg_max = 46, dmg_min = 36, attack_power = 112, ranged_dmg_max = 56.8458, ranged_dmg_min = 41.3424 where entry = 2084;
        -- Spawn Port Master Szik, issue #1138
        insert into spawns_creatures (spawn_entry1, map, position_x, position_y, position_z, orientation) values (2662, 0, -14344.031, 422.664, 6.630, 4.820);
        update creature_template set level_min = 42, level_max = 42, health_min = 1981, health_max = 1981, armor = 2174, faction = 120, dmg_min = 64, dmg_max = 83, attack_power = 172 where entry = 2662;
        -- Spawn Shaia, issue #1132
        insert into spawns_creatures (spawn_entry1, map, position_x, position_y, position_z, orientation) values (4178, 1, 9698.450, 2339.279, 1331.971, 4.146);
        update creature_template set level_min = 30, level_max = 30, health_min = 1002, health_max = 1002, armor = 1200, faction = 79, dmg_min = 42, dmg_max = 53, attack_power = 122 where entry = 4178;
        -- Spawn Lewin Starfeather, issue #1132
        insert into spawns_creatures (spawn_entry1, map, position_x, position_y, position_z, orientation) values (4239, 1, 9670.684, 2374.456, 1343.310, 3.844);
        update creature_template set level_min = 30, level_max = 30, health_min = 1002, health_max = 1002, armor = 1200, faction = 79, dmg_min = 42, dmg_max = 53, attack_power = 122 where entry = 4239;
        insert into`applied_updates`values ('040520231');
    end if;

    -- 09/06/2023 1
    if (select count(*) from `applied_updates` where id='090620231') = 0 then
        -- Fix encoding for quest text 1072 "An Old Colleague"
        update quest_template set Details = "The device I'm thinking about is my most advanced version to date. But we'll need a special potion if it's to work. I'm thinking we might as well get the really good stuff since this mission could be your last if you decide to help.$B$BAnd for that, we're going to need some potent explosives: Nitromirglyceronium.$B$BThe only person who can make NG-5 is an ol' friend of mine in Ironforge: Lomac Gearstrip.$B$BIf you can talk him into making us some NG-5, I'll get to work on placement for my devices..." where entry = 1072;

        insert into`applied_updates`values ('090620231');
    end if;


    -- 22/06/2023 1
    if (select count(*) from `applied_updates` where id='220620231') = 0 then
        -- # SCARLET MONASTERY DISPLAY_ID

        -- Scarlet Adept
        UPDATE creature_template SET display_id1 = 1640, display_id2 = 1641 WHERE entry = 4296;

        -- Bloodmage boss
        UPDATE creature_template SET display_id1 = 1245 WHERE entry = 4543;

        -- Unfettered Spirit
        UPDATE creature_template SET display_id1 = 146, scale=0.6 WHERE entry = 4308;


        -- # SCARLET MONASTERY SPAWN

        -- CREATE spawns_creatures 4285
        INSERT INTO spawns_creatures VALUES (NULL, 4285, 0, 0, 0, 44, 61.20868682861328, 8.221044540405273, 18.67734146118164, 1.5425058603286743, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4284
        INSERT INTO spawns_creatures VALUES (NULL, 4284, 0, 0, 0, 44, 61.435794830322266, 13.404674530029297, 18.67734146118164, 4.684100151062012, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4283
        INSERT INTO spawns_creatures VALUES (NULL, 4283, 0, 0, 0, 44, 80.1650619506836, 22.348621368408203, 18.677343368530273, 4.606348514556885, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4283
        INSERT INTO spawns_creatures VALUES (NULL, 4283, 0, 0, 0, 44, 79.8206558227539, -24.05950355529785, 18.677345275878906, 1.5959153175354004, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4284
        INSERT INTO spawns_creatures VALUES (NULL, 4284, 0, 0, 0, 44, 62.21089553833008, -15.782360076904297, 18.67734146118164, 1.566855549812317, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4285
        INSERT INTO spawns_creatures VALUES (NULL, 4285, 0, 0, 0, 44, 62.15839767456055, -10.594425201416016, 18.67734146118164, 4.708449363708496, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4283
        INSERT INTO spawns_creatures VALUES (NULL, 4283, 0, 0, 0, 44, 106.28458404541016, -24.045188903808594, 18.678449630737305, 1.682308554649353, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4285
        INSERT INTO spawns_creatures VALUES (NULL, 4285, 0, 0, 0, 44, 127.16918182373047, -0.7003735303878784, 18.677650451660156, 4.729650497436523, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4283
        INSERT INTO spawns_creatures VALUES (NULL, 4283, 0, 0, 0, 44, 124.9183120727539, -11.703500747680664, 18.677701950073242, 3.1345057487487793, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4283
        INSERT INTO spawns_creatures VALUES (NULL, 4283, 0, 0, 0, 44, 124.8828353881836, 10.324862480163574, 18.677705764770508, 3.131364345550537, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 156.88282775878906, 13.355033874511719, 18.006990432739258, 4.761847019195557, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 156.9886932373047, 9.311752319335938, 18.006990432739258, 1.5731316804885864, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 156.95687866210938, -17.447349548339844, 18.00699806213379, 3.2719478607177734, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 153.96755981445312, -18.04072380065918, 18.00699806213379, 0.15313304960727692, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 153.1455841064453, -35.50927734375, 18.006996154785156, 4.097402572631836, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4296
        INSERT INTO spawns_creatures VALUES (NULL, 4296, 0, 0, 0, 44, 151.1444854736328, -37.74823760986328, 18.006996154785156, 0.8804130554199219, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 146.3372802734375, -47.61099624633789, 18.00699806213379, 6.181065559387207, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 154.04507446289062, -64.22149658203125, 18.006996154785156, 3.417245388031006, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4296
        INSERT INTO spawns_creatures VALUES (NULL, 4296, 0, 0, 0, 44, 149.89622497558594, -65.0346450805664, 18.006996154785156, 0.2253885269165039, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4296
        INSERT INTO spawns_creatures VALUES (NULL, 4296, 0, 0, 0, 44, 155.68621826171875, -57.29583740234375, 18.00699806213379, 1.577841877937317, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4288
        INSERT INTO spawns_creatures VALUES (NULL, 4288, 0, 0, 0, 44, 183.4946746826172, -68.68872833251953, 18.293745040893555, 2.1449005603790283, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4304
        INSERT INTO spawns_creatures VALUES (NULL, 4304, 0, 0, 0, 44, 182.2350616455078, -70.44640350341797, 18.138744354248047, 2.5289602279663086, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4288
        INSERT INTO spawns_creatures VALUES (NULL, 4288, 0, 0, 0, 44, 192.18560791015625, -90.86404418945312, 18.165571212768555, 4.069906711578369, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4304
        INSERT INTO spawns_creatures VALUES (NULL, 4304, 0, 0, 0, 44, 194.1005401611328, -89.36634826660156, 18.116897583007812, 5.332042217254639, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4288
        INSERT INTO spawns_creatures VALUES (NULL, 4288, 0, 0, 0, 44, 197.8074188232422, -76.85205841064453, 18.104774475097656, 2.371875286102295, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4304
        INSERT INTO spawns_creatures VALUES (NULL, 4304, 0, 0, 0, 44, 199.91004943847656, -75.19420623779297, 18.31986427307129, 2.5163888931274414, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 192.48756408691406, -104.61534881591797, 18.677331924438477, 1.6092509031295776, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 163.37269592285156, -75.65628814697266, 18.677335739135742, 6.198331832885742, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 192.2702178955078, -54.386653900146484, 18.67732048034668, 4.658161640167236, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 213.57777404785156, -75.52764892578125, 18.67732810974121, 3.1156411170959473, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4288
        INSERT INTO spawns_creatures VALUES (NULL, 4288, 0, 0, 0, 44, 209.93914794921875, -56.679473876953125, 18.677326202392578, 3.1549081802368164, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4304
        INSERT INTO spawns_creatures VALUES (NULL, 4304, 0, 0, 0, 44, 210.07757568359375, -54.803462982177734, 18.677326202392578, 3.148624897003174, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 211.32534790039062, -101.08364868164062, 18.677326202392578, 1.5880368947982788, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 167.0591278076172, -102.42378997802734, 18.677330017089844, 6.259584903717041, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 3974
        INSERT INTO spawns_creatures VALUES (NULL, 3974, 0, 0, 0, 44, 184.5865020751953, -138.36582946777344, 18.022817611694336, 1.588822364807129, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4304
        INSERT INTO spawns_creatures VALUES (NULL, 4304, 0, 0, 0, 44, 184.96774291992188, -134.49969482421875, 18.02281951904297, 4.6267409324646, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4304
        INSERT INTO spawns_creatures VALUES (NULL, 4304, 0, 0, 0, 44, 182.63046264648438, -135.1958465576172, 18.02281951904297, 5.261342525482178, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4304
        INSERT INTO spawns_creatures VALUES (NULL, 4304, 0, 0, 0, 44, 181.2280731201172, -137.0644073486328, 18.02281951904297, 5.996475696563721, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4298
        INSERT INTO spawns_creatures VALUES (NULL, 4298, 0, 0, 0, 44, 230.5638427734375, -83.3134994506836, 18.00699806213379, 3.1792540550231934, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4290
        INSERT INTO spawns_creatures VALUES (NULL, 4290, 0, 0, 0, 44, 222.77687072753906, -106.38179779052734, 18.00699806213379, 0.07850369811058044, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4298
        INSERT INTO spawns_creatures VALUES (NULL, 4298, 0, 0, 0, 44, 224.8974609375, -109.15126037597656, 18.006999969482422, 1.5621190071105957, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4295
        INSERT INTO spawns_creatures VALUES (NULL, 4295, 0, 0, 0, 44, 226.29466247558594, -106.59800720214844, 18.00699806213379, 3.5790226459503174, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 3975
        INSERT INTO spawns_creatures VALUES (NULL, 3975, 0, 0, 0, 44, 255.2139892578125, -99.9120101928711, 18.679365158081055, 3.146263837814331, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 305.0462341308594, -100.3953857421875, 30.82321548461914, 3.1085503101348877, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 300.9446105957031, -76.61844635009766, 30.823219299316406, 3.9583518505096436, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 298.4822998046875, -79.22891235351562, 30.823217391967773, 0.8167579174041748, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 305.0079345703125, -63.123085021972656, 30.823219299316406, 3.0637834072113037, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 297.2182922363281, -46.12883377075195, 30.82322120666504, 0.04471130669116974, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4287
        INSERT INTO spawns_creatures VALUES (NULL, 4287, 0, 0, 0, 44, 301.5986633300781, -46.19062042236328, 30.82322120666504, 3.062997817993164, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4291
        INSERT INTO spawns_creatures VALUES (NULL, 4291, 0, 0, 0, 44, 328.703857421875, -59.07202911376953, 30.828676223754883, 3.3912856578826904, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);
        -- CREATE spawns_creatures 4291
        INSERT INTO spawns_creatures VALUES (NULL, 4291, 0, 0, 0, 44, 318.9059753417969, -42.41212844848633, 30.828672409057617, 3.077118158340454, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4291
        INSERT INTO spawns_creatures VALUES (NULL, 4291, 0, 0, 0, 44, 325.0407409667969, -20.489118576049805, 30.828676223754883, 0.024273494258522987, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4291
        INSERT INTO spawns_creatures VALUES (NULL, 4291, 0, 0, 0, 44, 328.8355407714844, -26.864055633544922, 30.828672409057617, 2.0985107421875, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4299
        INSERT INTO spawns_creatures VALUES (NULL, 4299, 0, 0, 0, 44, 297.38299560546875, -27.905975341796875, 32.37169647216797, 1.6013509035110474, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4299
        INSERT INTO spawns_creatures VALUES (NULL, 4299, 0, 0, 0, 44, 294.32476806640625, -33.404396057128906, 32.37168502807617, 0.4711626470088959, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 296.148681640625, -31.64642333984375, 32.3716926574707, 3.914349317550659, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 319.3476867675781, -1.648572564125061, 30.82866859436035, 6.267398357391357, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4299
        INSERT INTO spawns_creatures VALUES (NULL, 4299, 0, 0, 0, 44, 324.9609375, -1.5419814586639404, 30.82866859436035, 3.1226654052734375, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 305.2064208984375, -9.292184829711914, 32.3717155456543, 3.1250221729278564, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 296.3812255859375, -11.64564037322998, 32.3716926574707, 1.5746480226516724, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4291
        INSERT INTO spawns_creatures VALUES (NULL, 4291, 0, 0, 0, 44, 296.3627014160156, -7.0306782722473145, 32.3716926574707, 4.6691155433654785, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4298
        INSERT INTO spawns_creatures VALUES (NULL, 4298, 0, 0, 0, 44, 364.9994812011719, -3.9089114665985107, 30.82412338256836, 4.699740886688232, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4298
        INSERT INTO spawns_creatures VALUES (NULL, 4298, 0, 0, 0, 44, 365.0293273925781, -14.693588256835938, 30.82412338256836, 1.5581493377685547, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4295
        INSERT INTO spawns_creatures VALUES (NULL, 4295, 0, 0, 0, 44, 343.8344421386719, -14.863336563110352, 30.824125289916992, 1.541650414466858, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4295
        INSERT INTO spawns_creatures VALUES (NULL, 4295, 0, 0, 0, 44, 382.0777282714844, -12.012577056884766, 30.824127197265625, 1.610762596130371, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4298
        INSERT INTO spawns_creatures VALUES (NULL, 4298, 0, 0, 0, 44, 381.89910888671875, -6.627150535583496, 30.824127197265625, 4.702091217041016, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 367.9074401855469, -39.33707046508789, 30.829992294311523, 4.68951940536499, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 369.27655029296875, -39.19841003417969, 30.829984664916992, 4.742926597595215, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 381.0075378417969, -39.18628692626953, 30.829984664916992, 4.653388023376465, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4303
        INSERT INTO spawns_creatures VALUES (NULL, 4303, 0, 0, 0, 44, 379.6044921875, -39.15510177612305, 30.82998275756836, 4.737426280975342, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4303
        INSERT INTO spawns_creatures VALUES (NULL, 4303, 0, 0, 0, 44, 377.9299621582031, -51.784053802490234, 30.830686569213867, 4.675376892089844, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4303
        INSERT INTO spawns_creatures VALUES (NULL, 4303, 0, 0, 0, 44, 371.3196105957031, -51.552024841308594, 30.830673217773438, 4.7177886962890625, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 377.48797607421875, -64.19990539550781, 30.83098602294922, 4.6793036460876465, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 378.82806396484375, -64.22728729248047, 30.83098602294922, 4.726428031921387, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4303
        INSERT INTO spawns_creatures VALUES (NULL, 4303, 0, 0, 0, 44, 371.31964111328125, -64.05171203613281, 30.83098602294922, 4.770410537719727, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 365.6876220703125, -78.83854675292969, 30.83098602294922, 4.772767543792725, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 367.9111022949219, -78.54216766357422, 30.83098602294922, 4.772767543792725, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 383.09027099609375, -78.65242004394531, 30.83098602294922, 4.366716384887695, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4303
        INSERT INTO spawns_creatures VALUES (NULL, 4303, 0, 0, 0, 44, 380.98095703125, -78.1936264038086, 30.83098602294922, 4.759415626525879, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 3976
        INSERT INTO spawns_creatures VALUES (NULL, 3976, 0, 0, 0, 44, 373.9609375, -102.6358413696289, 33.05110549926758, 4.676159858703613, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4299
        INSERT INTO spawns_creatures VALUES (NULL, 4299, 0, 0, 0, 44, 391.9476318359375, -26.628173828125, 30.829946517944336, 5.881746292114258, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4301
        INSERT INTO spawns_creatures VALUES (NULL, 4301, 0, 0, 0, 44, 401.7771911621094, -29.293540954589844, 30.829946517944336, 3.121858835220337, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4301
        INSERT INTO spawns_creatures VALUES (NULL, 4301, 0, 0, 0, 44, 401.88043212890625, -47.975257873535156, 30.830474853515625, 3.124215602874756, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 397.5728759765625, -52.57415771484375, 30.830732345581055, 4.537145137786865, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4301
        INSERT INTO spawns_creatures VALUES (NULL, 4301, 0, 0, 0, 44, 401.8379211425781, -66.44190979003906, 30.83098602294922, 3.089658498764038, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 397.3166809082031, -72.66360473632812, 30.830984115600586, 4.732709884643555, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4300
        INSERT INTO spawns_creatures VALUES (NULL, 4300, 0, 0, 0, 44, 392.9870300292969, -83.0877456665039, 30.83098793029785, 1.5714807510375977, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4299
        INSERT INTO spawns_creatures VALUES (NULL, 4299, 0, 0, 0, 44, 353.0223388671875, -25.72920036315918, 30.829925537109375, 4.583483695983887, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4301
        INSERT INTO spawns_creatures VALUES (NULL, 4301, 0, 0, 0, 44, 347.2741394042969, -29.37743377685547, 30.82959747314453, 6.151139259338379, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4301
        INSERT INTO spawns_creatures VALUES (NULL, 4301, 0, 0, 0, 44, 347.1222839355469, -47.91024398803711, 30.83047103881836, 6.238318920135498, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4301
        INSERT INTO spawns_creatures VALUES (NULL, 4301, 0, 0, 0, 44, 347.23992919921875, -66.6267318725586, 30.83098602294922, 6.23831844329834, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 354.1416320800781, -55.43657684326172, 30.830890655517578, 1.5439940690994263, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4300
        INSERT INTO spawns_creatures VALUES (NULL, 4300, 0, 0, 0, 44, 357.4685363769531, -59.507469177246094, 30.83098793029785, 5.4238600730896, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4300
        INSERT INTO spawns_creatures VALUES (NULL, 4300, 0, 0, 0, 44, 352.7135009765625, -71.37552642822266, 30.830984115600586, 5.33903694152832, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4299
        INSERT INTO spawns_creatures VALUES (NULL, 4299, 0, 0, 0, 44, 353.0116882324219, -83.17613983154297, 30.83098793029785, 1.5219998359680176, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 313.31219482421875, -82.55992126464844, 30.822834014892578, 6.274439811706543, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4300
        INSERT INTO spawns_creatures VALUES (NULL, 4300, 0, 0, 0, 44, 316.3389892578125, -85.03884887695312, 30.82417106628418, 4.898421764373779, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 317.900390625, -89.05941009521484, 30.82632064819336, 1.898199439048767, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4301
        INSERT INTO spawns_creatures VALUES (NULL, 4301, 0, 0, 0, 44, 310.72039794921875, -89.18510437011719, 30.824464797973633, 6.180191993713379, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 315.7038269042969, -114.74170684814453, 32.072689056396484, 4.7680463790893555, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4542
        INSERT INTO spawns_creatures VALUES (NULL, 4542, 0, 0, 0, 44, 329.8094787597656, -106.8153076171875, 30.82891082763672, 2.9443535804748535, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4301
        INSERT INTO spawns_creatures VALUES (NULL, 4301, 0, 0, 0, 44, 438.6317443847656, -89.02783203125, 30.82200050354004, 3.1014299392700195, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4299
        INSERT INTO spawns_creatures VALUES (NULL, 4299, 0, 0, 0, 44, 431.5087585449219, -84.88352966308594, 30.82390594482422, 2.859527111053467, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4300
        INSERT INTO spawns_creatures VALUES (NULL, 4300, 0, 0, 0, 44, 426.1101379394531, -84.2994155883789, 30.826461791992188, 2.0003013610839844, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4300
        INSERT INTO spawns_creatures VALUES (NULL, 4300, 0, 0, 0, 44, 435.9577941894531, -82.79151153564453, 30.82200050354004, 3.1045713424682617, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4299
        INSERT INTO spawns_creatures VALUES (NULL, 4299, 0, 0, 0, 44, 432.3927307128906, -107.138671875, 30.828096389770508, 1.5989586114883423, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 432.196044921875, -113.9665756225586, 32.071876525878906, 4.691855430603027, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4302
        INSERT INTO spawns_creatures VALUES (NULL, 4302, 0, 0, 0, 44, 413.8451232910156, -106.62232971191406, 30.828094482421875, 1.5534026622772217, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 415.2341613769531, -113.78944396972656, 32.07188034057617, 4.241819381713867, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4540
        INSERT INTO spawns_creatures VALUES (NULL, 4540, 0, 0, 0, 44, 412.7303466796875, -113.73188018798828, 32.071876525878906, 5.024076461791992, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 3977
        INSERT INTO spawns_creatures VALUES (NULL, 3977, 0, 0, 0, 44, 374.3002014160156, -149.76394653320312, 29.533010482788086, 1.5447630882263184, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4075
        INSERT INTO spawns_creatures VALUES (NULL, 4075, 0, 0, 0, 44, 276.0992126464844, -53.840301513671875, 31.493806838989258, 2.498227119445801, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4075
        INSERT INTO spawns_creatures VALUES (NULL, 4075, 0, 0, 0, 44, 249.06883239746094, -53.219337463378906, 31.49358367919922, 3.3173978328704834, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4075
        INSERT INTO spawns_creatures VALUES (NULL, 4075, 0, 0, 0, 44, 250.38449096679688, -28.932281494140625, 31.49361228942871, 1.8314237594604492, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4075
        INSERT INTO spawns_creatures VALUES (NULL, 4075, 0, 0, 0, 44, 279.1425476074219, -31.60256004333496, 31.493698120117188, 6.116555213928223, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4293
        INSERT INTO spawns_creatures VALUES (NULL, 4293, 0, 0, 0, 44, 278.0079345703125, -63.43807601928711, 31.493513107299805, 3.9245080947875977, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4306
        INSERT INTO spawns_creatures VALUES (NULL, 4306, 0, 0, 0, 44, 274.5926818847656, -63.79273986816406, 31.4935359954834, 5.569918155670166, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4293
        INSERT INTO spawns_creatures VALUES (NULL, 4293, 0, 0, 0, 44, 250.70338439941406, -55.064579010009766, 31.493614196777344, 4.742108345031738, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 3983
        INSERT INTO spawns_creatures VALUES (NULL, 3983, 0, 0, 0, 44, 256.4114074707031, -57.25048828125, 31.49388313293457, 3.1430366039276123, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4306
        INSERT INTO spawns_creatures VALUES (NULL, 4306, 0, 0, 0, 44, 254.52593994140625, -20.696273803710938, 31.49355697631836, 5.434042453765869, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4306
        INSERT INTO spawns_creatures VALUES (NULL, 4306, 0, 0, 0, 44, 256.7969970703125, -23.28974723815918, 31.49379539489746, 2.239043951034546, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4293
        INSERT INTO spawns_creatures VALUES (NULL, 4293, 0, 0, 0, 44, 278.1042175292969, -26.037797927856445, 31.493553161621094, 4.724827766418457, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4306
        INSERT INTO spawns_creatures VALUES (NULL, 4306, 0, 0, 0, 44, 276.3821105957031, -26.143049240112305, 31.493663787841797, 5.657880783081055, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4306
        INSERT INTO spawns_creatures VALUES (NULL, 4306, 0, 0, 0, 44, 278.9228515625, -29.524349212646484, 31.493633270263672, 1.8769749402999878, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4306
        INSERT INTO spawns_creatures VALUES (NULL, 4306, 0, 0, 0, 44, 277.30108642578125, -30.06794548034668, 31.49375343322754, 1.3366206884384155, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4293
        INSERT INTO spawns_creatures VALUES (NULL, 4293, 0, 0, 0, 44, 277.52740478515625, -55.444801330566406, 31.49366569519043, 1.557315468788147, 18000, 18000, 0, 100, 0, 2, 0, 0, 0);

        -- CREATE spawns_creatures 4283
        INSERT INTO spawns_creatures VALUES (NULL, 4283, 0, 0, 0, 44, 234.6766357421875, -34.47034454345703, 30.823219299316406, 2.01127552986145, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4283
        INSERT INTO spawns_creatures VALUES (NULL, 4283, 0, 0, 0, 44, 224.3471221923828, -10.927236557006836, 30.823226928710938, 6.248498439788818, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4293
        INSERT INTO spawns_creatures VALUES (NULL, 4293, 0, 0, 0, 44, 232.1105194091797, 33.44544982910156, 30.823225021362305, 3.099052667617798, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4306
        INSERT INTO spawns_creatures VALUES (NULL, 4306, 0, 0, 0, 44, 227.5698699951172, 33.452293395996094, 30.823225021362305, 0.025002865120768547, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4543
        INSERT INTO spawns_creatures VALUES (NULL, 4543, 0, 0, 0, 44, 177.99781799316406, 25.786996841430664, 31.49356460571289, 0.0037943858187645674, 18000, 18000, 0, 100, 0, 0, 0, 0, 0);

        -- CREATE spawns_creatures 4308
        INSERT INTO spawns_creatures VALUES (NULL, 4308, 0, 0, 0, 44, 196.94068908691406, 20.90924644470215, 30.839046478271484, 4.015606880187988, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4308
        INSERT INTO spawns_creatures VALUES (NULL, 4308, 0, 0, 0, 44, 191.66236877441406, 21.656526565551758, 30.97735595703125, 6.262632369995117, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4308
        INSERT INTO spawns_creatures VALUES (NULL, 4308, 0, 0, 0, 44, 194.86183166503906, 24.896621704101562, 30.839046478271484, 4.885046005249023, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4308
        INSERT INTO spawns_creatures VALUES (NULL, 4308, 0, 0, 0, 44, 199.48472595214844, 28.760902404785156, 30.839046478271484, 3.7666409015655518, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4308
        INSERT INTO spawns_creatures VALUES (NULL, 4308, 0, 0, 0, 44, 203.85415649414062, 29.59072494506836, 30.883066177368164, 3.3228909969329834, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        -- CREATE spawns_creatures 4308
        INSERT INTO spawns_creatures VALUES (NULL, 4308, 0, 0, 0, 44, 200.7442169189453, 32.96062088012695, 30.839046478271484, 4.435800552368164, 18000, 18000, 0, 100, 0, 1, 0, 0, 0);

        insert into`applied_updates`values ('220620231');
    end if;
end $
delimiter ;
