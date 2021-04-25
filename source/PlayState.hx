package;

import flixel.FlxState;
import flixel.addons.text.FlxTypeText;

class PlayState extends FlxState
{
	public static var level = 1;

	public static var lastlevel:Int = 1;

	var FUNNYTEXT:FlxTypeText;

	override public function create()
	{
		FUNNYTEXT = new FlxTypeText(10, 50, 640,
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
