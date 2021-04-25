package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Flicker extends FlxSprite
{
	public function new(x, y)
	{
		frames = FlxAtlasFrames.fromSparrow("assets/images/PLAY_THE_THIRD.png", "assets/images/PLAY_THE_THIRD.xml");
		animation.addByPrefix("idle", "Symbol", 10, true);
		animation.play("idle");
		super(x, y);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
