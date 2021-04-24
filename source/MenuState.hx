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
		sound = new FlxSound().loadEmbedded("assets/music/intromusic.mp3", true, true);
		sound.play();

		var playButton:FlxButton;

		var introscreen = new FlxSprite(0, 0).loadGraphic("assets/images/INTROSCREEN.png");
		add(introscreen);
		introscreen.setGraphicSize(1000);
		introscreen.screenCenter();

		var menusprite = new FlxSprite(0, 0).loadGraphic("assets/images/logo.png");
		add(menusprite);
		menusprite.setGraphicSize(500);
		menusprite.screenCenter();
		menusprite.y -= 125;

		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.frames = FlxAtlasFrames.fromSparrow("assets/images/play.png", "assets/images/play.xml");
		playButton.animation.addByPrefix("idle", "Symbol", 10, true);
		add(playButton);
		playButton.scale.set(0.2, 0.2);
		playButton.updateHitbox();
		playButton.screenCenter();
		playButton.y += 150;
		playButton.animation.play("idle");

		// HOPEFULLY THIS WORKS SO I DONT GET SUED LOLOLOL
		var textFunny:FlxText = new FlxText(100, 250, 0, "WARNING:\n THIS GAME CONTAINS FLASHING LIGHTS \nAND SHAKY SCENES.", 20);
		textFunny.color = FlxColor.BLACK;
		add(textFunny);
		super.create();
	}

	function clickPlay()
	{
		sound.destroy();
		var undertale = new FlxSound().loadEmbedded("assets/sounds/undertalemoment.mp3", false, true);
		undertale.volume = 1;
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
