package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class DreamState extends WWDState
{
	private var dreamSprites:Array<FlxSprite>;
	private var fadeInIndex:Int = 0;
	private var fadeOutIndex:Int = 0;

	private var dreamSound:FlxSound;

	private var dreaming:Bool = false;
	private var waking:Bool = false;

	private var bg:FlxSprite;

	private var awakeness:Float = 0;

	private var limitTimer:FlxTimer;

	override public function create():Void
	{
		super.create();

		FlxG.camera.bgColor = 0xFF000000;

		loadDreamSprites();

		dreamSound = new FlxSound();
		dreamSound.loadEmbedded(AssetPaths.dream_bg__mp3, true);
		sounds.add(dreamSound);

		startDreaming();

		bg = new FlxSprite(0, 0, AssetPaths.dream_bg__png);
		add(bg);
		bg.alpha = 0;

		limitTimer = new FlxTimer().start(1 * 60, dreamLimit);
	}

	private function dreamLimit(t:FlxTimer):Void
	{
		dreaming = false;
		waking = true;
	}

	private function loadDreamSprites():Void
	{
		dreamSprites = new Array();
		for (i in 0...11)
		{
			dreamSprites.push(new FlxSprite(0, 0, "assets/images/dream/dream" + i + ".png"));
			add(dreamSprites[i]);
			dreamSprites[i].alpha = 0;
			dreamSprites[i].centerOrigin();
		}
	}

	private function startDreaming():Void
	{
		fadeInIndex = selectNewSprite();
		fadeOutIndex = selectNewSprite();

		dreamSprites[fadeInIndex].alpha = 0;
		dreamSprites[fadeOutIndex].alpha = 1;

		dreaming = true;

		dreamSound.play();
	}

	private function selectNewSprite():Int
	{
		var newIndex = Math.floor(Math.random() * dreamSprites.length);
		while (newIndex == fadeInIndex || newIndex == fadeOutIndex)
		{
			newIndex = Math.floor(Math.random() * dreamSprites.length);
		}
		return newIndex;
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (dreaming)
		{
			handleDreamInput();
			handleDreamShift();
		}
		else if (waking)
		{
			bg.alpha += 0.001;

			if (bg.alpha >= 1)
			{
				waking = false;
				new FlxTimer().start(4, fadeOut);
			}
		}

		dreamSound.volume = 1 - bg.alpha;
	}

	private function fadeOut(t:FlxTimer):Void
	{
		goToMenu();
	}

	private function handleDreamInput():Void
	{
		if (lastPressed < 0.02)
		{
			bg.alpha += ((bg.alpha / 130) + 0.0075);
		}
		else
		{
			bg.alpha -= ((bg.alpha / 120) + 0.005);
		}
	}

	private function handleDreamShift():Void
	{
		bg.alpha = Math.min(bg.alpha + awakeness, 1);

		if (bg.alpha >= 0.9)
		{
			dreaming = false;
			waking = true;
			return;
		}

		if (dreamSprites[fadeOutIndex].alpha > 0)
		{
			dreamSprites[fadeOutIndex].alpha -= 0.01;
			dreamSprites[fadeInIndex].alpha += 0.01;
		}
		else
		{
			fadeOutIndex = fadeInIndex;
			fadeInIndex = selectNewSprite();

			dreamSprites[fadeOutIndex].alpha = 1;
			dreamSprites[fadeInIndex].alpha = 0;

			if (Math.random() > 0.5)
				dreamSprites[fadeInIndex].scale.x *= -1;
			if (Math.random() > 0.5)
				dreamSprites[fadeInIndex].scale.y *= -1;
		}
	}

	public function randomSort(X:Dynamic, Y:Dynamic):Int
	{
		var r:Float = Math.random();
		if (r < 0.33)
			return 1;
		else if (r < 0.66)
			return 0;
		else
			return -1;
	}
}
