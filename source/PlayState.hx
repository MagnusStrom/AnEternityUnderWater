package;

import WiggleEffect.WiggleEffectType;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxWaveEffect;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import openfl.events.FullScreenEvent;
import openfl.filters.ColorMatrixFilter;
import openfl.filters.GlowFilter;
import openfl.geom.Matrix;
import openfl.geom.Point;
import openfl.ui.Mouse;

class PlayState extends FlxState
{
	public static var level = 1;

	public static var lastlevel:Int = 1;

	var FUNNYTEXT:FlxTypeText;

	var MOUSEBOXIGUESS:FlxSprite;
	var CAFFINE:FlxSprite;
	var SWITCH:FlxSprite;
	var DAYS:FlxSprite;
	var OXY:FlxSprite;

	var funnybg:FlxBackdrop;
	// OH NO
	var doneTasks:Bool = false;

	var SWITCHGUI1:Switch;
	var SWITCHGUI2:Switch;
	var SWITCHGUI3:Switch;

	var screen:FlxSprite;

	public var depth = 10;

	var high:Bool = false;

	var wiggleShit:WiggleEffect = new WiggleEffect();

	var ship:FlxSprite;
	var highShitLOL:FlxEffectSprite;

	override public function create()
	{
		FlxG.fixedTimestep = false;
		// HITBOXES(TEMPORARILY)
		CAFFINE = new FlxSprite(138, 227).makeGraphic(100, 100, FlxColor.BLACK);
		add(CAFFINE);

		DAYS = new FlxSprite(453, 40).makeGraphic(150, 150, FlxColor.BLACK);
		add(DAYS);

		OXY = new FlxSprite(149, 32).makeGraphic(150, 150, FlxColor.BLACK);
		add(OXY);

		SWITCH = new FlxSprite(300, 200).makeGraphic(50, 50, FlxColor.BLACK);
		add(SWITCH);

		funnybg = new FlxBackdrop("assets/images/TSUISJESUS.png", 0, 3, true, true);
		add(funnybg);
		funnybg.velocity.y = -100;

		ship = new FlxSprite(0, 0);
		//	ship.loadGraphic('assets/images/NOFLICKERTROLLFACE.png');
		ship.frames = FlxAtlasFrames.fromSparrow("assets/images/FLICKER.png", "assets/images/FLICKER.xml");
		ship.animation.addByPrefix("idle", "Symbol", 8, true);
		ship.animation.play("idle"); // MIGHT MAKE THIS RANDOM LATER
		add(ship);
		ship.setGraphicSize(670);
		ship.screenCenter();
		ship.antialiasing = true;

		var wave:FlxWaveEffect = new FlxWaveEffect(FlxWaveMode.ALL, 5, 0.5, 1, 10, FlxWaveDirection.HORIZONTAL);

		highShitLOL = new FlxEffectSprite(ship, [wave]);
		// highShitLOL.setGraphicSize(1000); // 670
		// highShitLOL.screenCenter();
		highShitLOL.scale.set(0.7, 0.7);
		highShitLOL.x -= 150;
		highShitLOL.y -= 110;
		add(highShitLOL);
		highShitLOL.visible = false;

		var TEXTBG:FlxSprite = new FlxSprite(0, 350).makeGraphic(700, 500, FlxColor.BLACK);
		add(TEXTBG);
		FUNNYTEXT = new FlxTypeText(10, 350, 630,
			"Day 1 of being on this ship. The UNITED STATES government brought me on this mission. They told me to search for something bright on the ocean floor, but not anything else, so I guess I'll know when I'll find it?.",
			20);
		add(FUNNYTEXT);
		FUNNYTEXT.start(0.03, false, false);

		MOUSEBOXIGUESS = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y).makeGraphic(50, 50, FlxColor.GRAY);
		add(MOUSEBOXIGUESS);
		MOUSEBOXIGUESS.visible = false;

		SWITCHGUI1 = new Switch(-50, 25);
		add(SWITCHGUI1);
		SWITCHGUI2 = new Switch(-150, 25);
		add(SWITCHGUI2);
		SWITCHGUI3 = new Switch(-250, 25);
		add(SWITCHGUI3);

		super.create();
	}

	function loadLevel(levelid)
	{
		SWITCHGUI1.switchState("off");
		// FADE IN
		switch (levelid)
		{
			case 2:
				FUNNYTEXT.resetText("Another day! I wish I had more to do, but I still like just relaxing and watching the ocean go by.");
				FUNNYTEXT.start(0.03, false, false);
			case 3:
				FUNNYTEXT.resetText("Another day, another coffee to drink, another switch to press. Better get to it.");
				FUNNYTEXT.start(0.03, false, false);
			case 4:
				FUNNYTEXT.resetText("Good morning to me. Just gotta remember to keep on pressing. I'll make it to the bottom eventually.");
				FUNNYTEXT.start(0.03, false, false);
			case 5:
				FUNNYTEXT.resetText("I wish I could change the inside of the ship; the scenery outside is always the same.");
				FUNNYTEXT.start(0.03, false, false);
			case 6:
				FUNNYTEXT.resetText("It's been quite a while since I started. I wonder what would happen if I didn't press the switches..?");
				FUNNYTEXT.start(0.03, false, false);
			case 7:
				FUNNYTEXT.resetText("I'm starting to lose track of time down here. I'm going to let my curiosity get the best of me. Let's see what happens if I don't press the switches.");
				FUNNYTEXT.start(0.03, false, false);
			case 8:
				highShitLOL.visible = true;
				ship.visible = false;
				FUNNYTEXT.resetText("Woah, this feels weird. It feels like my head is floating. I like this.");
				FUNNYTEXT.start(0.03, false, false);
			case 9:
				FlxG.camera.color = FlxColor.GRAY;
				FUNNYTEXT.resetText("I....");
				FUNNYTEXT.start(0.03, false, false);
				new FlxTimer().start(3, function(tmr:FlxTimer)
				{
					FUNNYTEXT.resetText("I didin't dream of anything.");
					FUNNYTEXT.start(0.03, false, false);
					new FlxTimer().start(3, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("It was just a gray room.");
						FUNNYTEXT.start(0.03, false, false);
						new FlxTimer().start(3, function(tmr:FlxTimer)
						{
							FUNNYTEXT.resetText("I couldn't move. I couldn't do anything.");
							FUNNYTEXT.start(0.03, false, false);
							new FlxTimer().start(3, function(tmr:FlxTimer)
							{
								FUNNYTEXT.resetText("I was forced to sit there.");
								FUNNYTEXT.start(0.03, false, false);
								new FlxTimer().start(3, function(tmr:FlxTimer)
								{
									FUNNYTEXT.resetText("I need a change. I NEED A CHANGE.");
									FUNNYTEXT.start(0.03, false, false);
									new FlxTimer().start(3, function(tmr:FlxTimer)
									{
										FUNNYTEXT.resetText("Fuck my life...");
										FUNNYTEXT.start(0.03, false, false);
									});
								});
							});
						});
					});
				});
		}
		FlxG.camera.fade(FlxColor.WHITE, 1, true, function()
		{
			// RESET SHIT
			doneTasks = false;
			CAFFINE.x = 138;
			CAFFINE.y = 227;
			SWITCH.x = 300;
			SWITCH.y = 200;
			// SAY SHIT GET INSANE ON 6 OR SMTN IDK
		});
	}

	override public function update(elapsed:Float)
	{
		MOUSEBOXIGUESS.x = FlxG.mouse.x - 25;
		MOUSEBOXIGUESS.y = FlxG.mouse.y - 25;

		// SWITCH COLLISIONS
		// (FlxG.overlap(MOUSEBOXIGUESS, SWITCH) // collisions ig idk whatever thatis
		if (FlxG.overlap(MOUSEBOXIGUESS, OXY) && FlxG.mouse.pressed && doneTasks == false)
		{
			OXY.x = 1000;
			OXY.y = 1000;
			switch (level)
			{
				case 1:
					FUNNYTEXT.resetText("This shows the amount of oxygen in the ship. Should never go down, aslong as I keep flipping the switches!");
					FUNNYTEXT.start(0.03, false, false);
				default:
			}
		}

		if (FlxG.overlap(MOUSEBOXIGUESS, CAFFINE) && FlxG.mouse.pressed && doneTasks == false)
		{
			CAFFINE.x = CAFFINE.y = 1000; // IM LAZY LOOOL
			var sound:FlxSound = new FlxSound().loadEmbedded("assets/sounds/TSUSIPREAL.mp3", false, true);
			sound.volume = 0.5;
			sound.play();
			switch (level)
			{
				case 1:
					FUNNYTEXT.resetText("Oh, forgot my coffee! Always good to wake up in the morning to the ocean and a good cup of coffee.");
					FUNNYTEXT.start(0.03, false, false);
				/*		new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("Time to do my tasks! It's as simple as flipping the black switches to yellow to keep the ship alive, as I've been told.");
						FUNNYTEXT.start(0.03, false, false);
				});*/ // big lazy
				case 2:
					FUNNYTEXT.resetText("Day 2 of coffee! Planning to make this a tradition now. It's very calming, although I wished I had something to read. Time to do my tasks.");
				case 3:
					FUNNYTEXT.resetText("I wish my coffee was warmer.");
				case 4:
					FUNNYTEXT.resetText("Even this is getting a little repetitive, but the energy boost is well needed. Back to pressing.");
				case 5:
					FUNNYTEXT.resetText("I feel a little better. Now, to press those switches.");
				case 6:
					FUNNYTEXT.resetText("That coffee always gets me in the working mood.");
				case 7:
					FUNNYTEXT.resetText("The effects of this coffee are getting duller.");
					FUNNYTEXT.start(0.03, false, false);
					new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("Now I just, chill, I guess.");
						FUNNYTEXT.start(0.03, false, false);
						new FlxTimer().start(9, function(tmr:FlxTimer)
						{
							FUNNYTEXT.resetText("Wow, there really is nothing to do in here.");
							FUNNYTEXT.start(0.03, false, false);
							new FlxTimer().start(5, function(tmr:FlxTimer)
							{
								FUNNYTEXT.resetText("The background is so repetitive...");
								FUNNYTEXT.start(0.03, false, false);
								new FlxTimer().start(7, function(tmr:FlxTimer)
								{
									FUNNYTEXT.resetText("I suppose i'm done for the night. I don't feel a change right now, but I'll see what happens tomorrow, I guess.");
									FUNNYTEXT.start(0.03, false, false);
									new FlxTimer().start(6, function(tmr:FlxTimer)
									{
										FlxG.camera.fade(FlxColor.BLACK, 7, false, function()
										{
											level++;
										});
									});
								});
							});
						});
					});
				case 8:
					FUNNYTEXT.resetText("This coffee feels dry. Must be the oxygen.");
					FUNNYTEXT.start(0.03, false, false);
					new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("Huh, for some reason I'm tired early.");
						FUNNYTEXT.start(0.03, false, false);
						new FlxTimer().start(5, function(tmr:FlxTimer)
						{
							FUNNYTEXT.resetText("I'm gonna go to bed... To wonderful dreams.");
							FUNNYTEXT.start(0.03, false, false);
							FlxG.camera.fade(FlxColor.BLACK, 5, false, function()
							{
								level++;
							});
						});
					});
				default:
					// SHOW FRAME HERE?
					FUNNYTEXT.resetText("This....");
					FUNNYTEXT.start(0.03, false, false);
					new FlxTimer().start(3, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("This is too much.");
						FUNNYTEXT.start(0.03, false, false);
						new FlxTimer().start(3, function(tmr:FlxTimer)
						{
							FUNNYTEXT.resetText("It's the same thing. Day after day after day.");
							FUNNYTEXT.start(0.03, false, false);
							new FlxTimer().start(3, function(tmr:FlxTimer)
							{
								FUNNYTEXT.resetText("I have to drink something else.");
								FUNNYTEXT.start(0.03, false, false);
								new FlxTimer().start(3, function(tmr:FlxTimer)
								{
									FUNNYTEXT.resetText("Something, something that would wake me up... for real.");
									FUNNYTEXT.start(0.03, false, false);
									new FlxTimer().start(3, function(tmr:FlxTimer)
									{
										FUNNYTEXT.resetText("Maybe, the taste of blood would suffice.");
										FUNNYTEXT.start(0.03, false, false);
										new FlxTimer().start(5, function(tmr:FlxTimer)
										{
											var CUTTINGREALLOL:FlxSprite = new FlxSprite(0, 0).makeGraphic(1000, 1000, FlxColor.BLACK);
											add(CUTTINGREALLOL);
											var sound:FlxSound = new FlxSound().loadEmbedded("assets/sounds/heavybreathing.mp3", false, true);
											sound.volume = 0.5;
											sound.play();
											trace("Breathe");
											new FlxTimer().start(1, function(tmr:FlxTimer)
											{
												var sound:FlxSound = new FlxSound().loadEmbedded("assets/sounds/slit.mp3", false, true);
												sound.volume = 1;
												sound.play();
												new FlxTimer().start(1, function(tmr:FlxTimer)
												{
													var sound:FlxSound = new FlxSound().loadEmbedded("assets/sounds/slit.mp3", false, true);
													sound.volume = 1;
													sound.play();
													new FlxTimer().start(1, function(tmr:FlxTimer)
													{
														var sound:FlxSound = new FlxSound().loadEmbedded("assets/sounds/slit.mp3", false, true);
														sound.volume = 0.5;
														sound.play();
													});
												});
											});
											new FlxTimer().start(5, function(tmr:FlxTimer)
											{
												trace("scream");
												// SCREAM

												new FlxTimer().start(5, function(tmr:FlxTimer)
												{
													trace("Back");
													FlxG.camera.color = FlxColor.TRANSPARENT;
													ship.frames = FlxAtlasFrames.fromSparrow("assets/images/SHIPINSANE.png", "assets/images/SHIPINSANE.xml");
													CUTTINGREALLOL.visible = false;
												});
											});
										});
									});
								});
							});
						});
					});
			}
			FUNNYTEXT.start(0.03, false, false);
			// N IF HASNT DONT CHORES GET PISSED. GOD DAMN THIS IS SUCH BAD FRAMEWORK IM SOBBING. I BETTER GET MY SHIT TOGETHER LMFAOOOOOO
		}

		if (FlxG.overlap(MOUSEBOXIGUESS, SWITCH) && FlxG.mouse.pressed)
		{
			CAFFINE.x = 138;
			CAFFINE.y = 227;
			if (level < 7)
			{
				doneTasks = true;
				var sound:FlxSound = new FlxSound().loadEmbedded("assets/sounds/click.ogg", false, true);
				SWITCHGUI1.switchState("on");
				sound.volume = 0.3;
				sound.play();
			}
			SWITCH.x = SWITCH.y = 1000; // IM LAZY LOOOL
			switch (level)
			{
				case 1:
					FUNNYTEXT.resetText("Switch! Switches keep the submarine alive. I guess im done for the day, heheh.");
					FUNNYTEXT.start(0.03, false, false);
					new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("I wonder what to do now... I guess I'll lie down.");
						FUNNYTEXT.start(0.03, false, false);
						new FlxTimer().start(5, function(tmr:FlxTimer)
						{
							FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
							{
								level++;
							});
						});
					});
				case 2:
					FUNNYTEXT.resetText("Done! It doesn't seem important, but I like to think this keeps the submarine alive.");
					FUNNYTEXT.start(0.03, false, false);
					new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("Sometimes, I wish I had a book, or something or someone else to observe. But It's fine!");
						FUNNYTEXT.start(0.03, false, false);
						new FlxTimer().start(5, function(tmr:FlxTimer)
						{
							FUNNYTEXT.resetText("I think I'm gonna go to bed. Gets my head off these thoughts.");
							FUNNYTEXT.start(0.03, false, false);

							new FlxTimer().start(5, function(tmr:FlxTimer)
							{
								FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
								{
									level++;
								});
							});
						});
					});
				case 3:
					FUNNYTEXT.resetText("Nice satisfying presses. Just wish I had something better to do...");
					FUNNYTEXT.start(0.03, false, false);
					new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("This is starting to get a little boring.. But I should be okay!");
						FUNNYTEXT.start(0.03, false, false);
						new FlxTimer().start(5, function(tmr:FlxTimer)
						{
							FUNNYTEXT.resetText("We should be at the ocean floor any day now.");
							FUNNYTEXT.start(0.03, false, false);

							new FlxTimer().start(5, function(tmr:FlxTimer)
							{
								FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
								{
									level++;
								});
							});
						});
					});
				case 4:
					FUNNYTEXT.resetText("Alright. I should get some rest, maybe i'll have an interesting dream.");
					FUNNYTEXT.start(0.03, false, false);
					FlxG.camera.fade(FlxColor.BLACK, 7, false, function()
					{
						level++;
					});
				case 5:
					FUNNYTEXT.resetText("Done. Now, to sleep in hopes of waking up somewhere new");
					FUNNYTEXT.start(0.03, false, false);
					FlxG.camera.fade(FlxColor.BLACK, 7, false, function()
					{
						level++;
					});
				case 6:
					FUNNYTEXT.resetText("I'm done for today. Just have to keep on going.");
					FUNNYTEXT.start(0.03, false, false);
					FlxG.camera.fade(FlxColor.BLACK, 7, false, function()
					{
						level++;
					});
				case 7:
					FUNNYTEXT.resetText("No switch presses for today.");
					FUNNYTEXT.start(0.03, false, false);
				case 8:
					FUNNYTEXT.resetText("No switch presses. I like this feeling.");
					FUNNYTEXT.start(0.03, false, false);
				default:
					FUNNYTEXT.resetText("No switch presses.");
					FUNNYTEXT.start(0.03, false, false);
			}
		}

		if (FlxG.overlap(MOUSEBOXIGUESS, DAYS) && FlxG.mouse.pressed)
		{
			DAYS.x = DAYS.y = 1000; // IM LAZY LOOOL
			switch (level)
			{
				case 1:
					FUNNYTEXT.resetText("This shows how many days it's been! So far, only 1 day on the map. I don't know what the bar means.");
					FUNNYTEXT.start(0.03, false, false);
				default:
			}
			FUNNYTEXT.start(0.03, false, false);
			// N IF HASNT DONT CHORES GET PISSED. GOD DAMN THIS IS SUCH BAD FRAMEWORK IM SOBBING. I BETTER GET MY SHIT TOGETHER LMFAOOOOOO
		}
		// trace(FlxG.mouse.x + ", " + FlxG.mouse.y);
		// funny
		if (lastlevel != level)
		{
			loadLevel(level);
			lastlevel = level;
		}
		else
		{
			lastlevel = level;
		}
		if (FlxG.keys.anyPressed([L]))
		{
			level++;
		}
		super.update(elapsed);
	}
}
