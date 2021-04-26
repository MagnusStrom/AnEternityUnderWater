package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var menusprite:FlxSprite;

	var sound:FlxSound;

	override public function create()
	{
		FlxG.fixedTimestep = false;
		//		sound = new FlxSound().loadEmbedded("assets/music/intromusic.mp3", true, true);
		//		sound.play();

		var playButton:FlxButton;

		sound = new FlxSound().loadEmbedded("assets/music/REALSHIT.ogg", false, true);
		sound.volume = 0.3;
		sound.play();

		var introscreen = new FlxSprite(0, 0).loadGraphic("assets/images/INTROSCREEN.png");
		add(introscreen);
		introscreen.setGraphicSize(650);
		introscreen.screenCenter();
		introscreen.antialiasing = true;

		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.frames = FlxAtlasFrames.fromSparrow("assets/images/PLAY_THE_THIRD.png", "assets/images/PLAY_THE_THIRD.xml");
		playButton.animation.addByPrefix("idle", "Symbol", 10, true);
		add(playButton);
		playButton.scale.set(0.1, 0.1);
		playButton.updateHitbox();
		playButton.screenCenter();
		playButton.y += 150;
		playButton.animation.play("idle");
		super.create();
	}

	function clickPlay()
	{
		sound.destroy();
		var undertale = new FlxSound().loadEmbedded("assets/sounds/undertalemoment.mp3", false, true);
		undertale.volume = 0.5;
		undertale.play(); // NOT STOLEN FROM UNDERTALE JUST THE INTROS ARE SIMILAR CUZ THE FADE IN
		FlxG.camera.fade(FlxColor.WHITE, 2, false, function()
		{
			FlxG.switchState(new PlayState());
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
