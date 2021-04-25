package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class WarningState extends FlxState
{
	override public function create()
	{
		var playButton:FlxButton;

		var text = new FlxText(100, 10, 300,
			"WARNING: THIS GAME HAS THEMES OF:\nSELF HARM, GORE, MENTAL ILLNESS, AND BLOOD.\nIF YOU ARE TRIGGERED BY THOSE TOPICS PLEASE DO NOT PLAY THIS!",
			20);
		add(text);
		text.screenCenter();
		text.y -= 100;

		playButton = new FlxButton(0, 0, "Play", clickPlay);
		add(playButton);
		playButton.screenCenter();

		super.create();
	}

	function clickPlay()
	{
		FlxG.switchState(new MenuState());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
