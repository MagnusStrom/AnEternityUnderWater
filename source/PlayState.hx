package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
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

	var SWITCHGUI:Switch;

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

		var ship = new FlxSprite(0, 0);
		ship.frames = FlxAtlasFrames.fromSparrow("assets/images/FLICKER.png", "assets/images/FLICKER.xml");
		ship.animation.addByPrefix("idle", "Symbol", 10, true);
		ship.animation.play("idle"); // MIGHT MAKE THIS RANDOM LATER
		add(ship);
		ship.setGraphicSize(670);
		ship.screenCenter();
		ship.antialiasing = true;
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

		SWITCHGUI = new Switch(-50, 25);
		add(SWITCHGUI);

		super.create();
	}

	function loadLevel(levelid)
	{
		// FADE IN
		switch (levelid)
		{
			case 2:
				FUNNYTEXT.resetText("Another amazing day! I wish I had more to do, but I still like just relaxing and watching the ocean go by.");
				FUNNYTEXT.start(0.03, false, false);
		}
		FlxG.camera.fade(FlxColor.WHITE, 1, true, function()
		{
			// RESET SHIT
			SWITCHGUI.switchState("off");
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
		// collisions ig idk whatever thatis
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
					// GIVING THE PLAYER A FUCKING HIT LMFAOOOOOOO
					new FlxTimer().start(5, function(tmr:FlxTimer)
					{
						FUNNYTEXT.resetText("Time to do my tasks! It's as simple as flipping the black switches to yellow to keep the ship alive, as I've been told.");
						FUNNYTEXT.start(0.03, false, false);
					});
				case 2:
					FUNNYTEXT.resetText("Day 2 of coffee! Planning to make this a tradition now. It's very calming, although I wished I had something to read. Time to do my tasks.");
			}
			FUNNYTEXT.start(0.03, false, false);
			// N IF HASNT DONT CHORES GET PISSED. GOD DAMN THIS IS SUCH BAD FRAMEWORK IM SOBBING. I BETTER GET MY SHIT TOGETHER LMFAOOOOOO
		}

		if (FlxG.overlap(MOUSEBOXIGUESS, SWITCH) && FlxG.mouse.pressed)
		{
			CAFFINE.x = 138;
			CAFFINE.y = 227;
			doneTasks = true;
			SWITCH.x = SWITCH.y = 1000; // IM LAZY LOOOL
			var sound:FlxSound = new FlxSound().loadEmbedded("assets/sounds/click.ogg", false, true);
			SWITCHGUI.switchState("on");
			sound.volume = 0.3;
			sound.play();
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
		trace(FlxG.mouse.x + ", " + FlxG.mouse.y);
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
		super.update(elapsed);
	}
}
