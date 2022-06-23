package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class GiveUpState extends WWDState
{
	private var flash:FlxSprite;
	private var shot1:FlxSound;
	private var shot2:FlxSound;
	private var bgSound:FlxSound;

	private var firstShot:Bool = true;
	private var bothDead:Bool = false;

	override public function create():Void
	{
		super.create();

		FlxG.camera.bgColor = 0xFF000000;

		var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.give_up_bg__png);

		flash = new FlxSprite(234, 350, AssetPaths.give_up_flash__png);
		flash.visible = false;

		for (i in 0...50)
		{
			var star:Star = new Star(Math.random() * FlxG.width, Math.random() * FlxG.height);
			add(star);
		}

		add(bg);
		add(flash);

		shot1 = new FlxSound();
		shot1.loadEmbedded(AssetPaths.give_up_gunshot__mp3, false);
		shot1.volume = 0.6;

		shot2 = new FlxSound();
		shot2.loadEmbedded(AssetPaths.give_up_gunshot__mp3, false);
		shot2.volume = 0.6;

		bgSound = new FlxSound();
		bgSound.loadEmbedded(AssetPaths.give_up_bg__mp3, true);
		bgSound.play();

		sounds.add(shot1);
		sounds.add(shot2);
		sounds.add(bgSound);
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		flash.visible = false;

		if (bothDead)
			return;

		if (Helpers.p1JustPressed())
		{
			flash.visible = true;
			if (firstShot)
			{
				shot1.play();
				firstShot = false;
			}
			else
			{
				shot2.play();
				bothDead = true;
			}
		}

		if (Helpers.p2JustPressed())
		{
			flash.visible = true;
			if (firstShot)
			{
				shot1.play();
				firstShot = false;
			}
			else
			{
				shot2.play();
				bothDead = true;
			}
		}
	}
}
