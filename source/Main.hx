package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, WarningState, 1, 120, 120));
		addChild(new FPS(10, 10, 0xffffff));
	}
}
