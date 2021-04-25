package;

import FlickerinBgIdk.Flicker;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import openfl.ui.Mouse;

class PlayState extends FlxState
{
	public static var level = 1;

	public static var lastlevel:Int = 1;

	var FUNNYTEXT:FlxTypeText;

	var MOUSEBOXIGUESS:FlxSprite;
	var CAFFINE:FlxSprite;

	override public function create()
	{
		// HITBOXES(TEMPORARILY)
		CAFFINE = new FlxSprite(138, 227).makeGraphic(100, 100, FlxColor.BLACK);
		add(CAFFINE);

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
		FUNNYTEXT = new FlxTypeText(10, 350, 650,
			"Day 1 of being on this ship. The UNITED STATES government brought me on this mission. They told me to search for something bright on the ocean floor, but not anything else, so I guess I'll know when I'll find it?.",
			20);
		add(FUNNYTEXT);
		FUNNYTEXT.start(0.03, false, false);

		MOUSEBOXIGUESS = new FlxSprite(FlxG.mouse.x, FlxG.mouse.y).makeGraphic(50, 50, FlxColor.GRAY);
		add(MOUSEBOXIGUESS);

		super.create();
	}

	function loadLevel(levelid)
	{
		switch (levelid) {}
	}

	override public function update(elapsed:Float)
	{
		MOUSEBOXIGUESS.x = FlxG.mouse.x - 25;
		MOUSEBOXIGUESS.y = FlxG.mouse.y - 25;
		// collisions ig idk whatever thatis
		if (FlxG.overlap(MOUSEBOXIGUESS, CAFFINE) && FlxG.mouse.pressed)
		{
			FUNNYTEXT.resetText("Oh, forgot my coffee! Always good to wake up in the morning to \nthe ocean and a good cup of coffee.");
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
		super.update(elapsed);
	}
}
