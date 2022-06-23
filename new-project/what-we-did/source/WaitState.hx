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

class WaitState extends WWDState
{
	private var folk:FlxSound;
	private var reich:FlxSound;
	private var statics:FlxSound;

	private var staticIndex:Int = 0;
	private var extraStatics:Array<FlxSound>;

	private var tuning:Float;

	override public function create():Void
	{
		super.create();

		FlxG.camera.bgColor = 0xFF000000;

		var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.wait_houses__png);
		var car:FlxSprite = new FlxSprite(200, 470, AssetPaths.wait_car__png);

		for (i in 0...30)
		{
			var star:Star = new Star(Math.random() * FlxG.width, Math.random() * FlxG.height / 3);
			add(star);
		}

		add(bg);
		add(car);

		folk = new FlxSound().loadEmbedded(AssetPaths.wait_folk__mp3, false);
		reich = new FlxSound().loadEmbedded(AssetPaths.wait_reich__mp3, false);
		statics = new FlxSound().loadEmbedded(AssetPaths.wait_static__wav, true);
		extraStatics = new Array();
		for (i in 0...10)
		{
			extraStatics.push(new FlxSound().loadEmbedded(AssetPaths.wait_static__wav, false));
			extraStatics[i].volume = 1.5 + Math.random();
			sounds.add(extraStatics[i]);
		}

		folk.play();
		folk.volume = 0;

		reich.play();
		reich.volume = 0;

		statics.play();
		statics.volume = 1;

		sounds.add(folk);
		sounds.add(reich);
		sounds.add(statics);

		tuning = 0.32;

		new FlxTimer().start(2 * 60, goToMenu);
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (fadingOut)
			return;

		if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A)
		{
			tuning -= 0.001;
			if (tuning < 0)
				tuning = 1;
			playExtraStatics();
		}
		if (FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D)
		{
			tuning += 0.001;
			if (tuning > 1)
				tuning = 0;
			playExtraStatics();
		}

		setVolumes();
	}

	private function playExtraStatics():Void
	{
		if (Math.random() < 0.05 && !extraStatics[staticIndex].playing)
		{
			extraStatics[staticIndex].play();
			staticIndex = (staticIndex + 1) % extraStatics.length;
		}
	}

	private function setVolumes():Void
	{
		reich.volume = 0.8 - Math.abs(tuning - 0.25) * 10;
		folk.volume = 0.8 - Math.abs(tuning - 0.75) * 10;
		statics.volume = 1.5 - (reich.volume + folk.volume);
	}
}
