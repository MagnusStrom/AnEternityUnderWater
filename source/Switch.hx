package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxSound;

class Switch extends FlxSprite
{
	public var on:Bool = false;

	public function new(x, y)
	{
		super(x, y);
		loadGraphic("assets/images/switches/LeftOFF.png");
		setGraphicSize(100); // ITS OK IF SPRITE IS UNALIGNED CUZ IM MAKING ANOTHER HITBOX HEHEHEHHRHEHEH i've been thinking about seeing a therapist
	}

	public function switchState(type:Bool) // LAZY IS MY MIDDLE NAME BITCHES!!
	{
		if (type == false)
		{
			on = false;
			loadGraphic("assets/images/switches/LeftOFF.png");
		}
		else
		{
			on = true;
			loadGraphic("assets/images/switches/LeftON.png");
		}
		width = 5;
		height = 5;
		offset.set(0, 0);
		updateHitbox();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
