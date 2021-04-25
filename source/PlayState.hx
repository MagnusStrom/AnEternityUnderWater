package;

import FlickerinBgIdk.Flicker;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public static var level = 1;

	public static var lastlevel:Int = 1;

	var FUNNYTEXT:FlxTypeText;

	override public function create()
	{
		var ship = new Flicker(0, 0); // MIGHT MAKE THIS RANDOM LATER
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
		super.create();
	}

	function loadLevel(levelid)
	{
		switch (levelid) {}
	}

	override public function update(elapsed:Float)
	{
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
