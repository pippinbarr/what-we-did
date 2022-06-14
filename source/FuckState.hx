package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup;
import flixel.system.FlxSound;



class FuckState extends WWDState
{
	private var lights:FlxSprite;

	private var manIndex:Int = 0;
	private var manSounds:Array<FlxSound>;
	private var manTimer:FlxTimer;

	private var womanIndex:Int = 0;
	private var womanSounds:Array<FlxSound>;
	private var womanTimer:FlxTimer;

	private var lightTimer:FlxTimer;

	private var anyPlayed:Bool = false;

	private var bgSound:FlxSound;

	override public function create():Void
	{
		super.create();

		FlxG.camera.bgColor = 0xFF000000;

		var bg:FlxSprite = new FlxSprite(0,0,AssetPaths.fuck_bg__png);
		lights = new FlxSprite(240,254,AssetPaths.fuck_light__png);

		lights.visible = true;

		var star1:Star = new Star(100,10);
		var star2:Star = new Star(20,22);
		var star3:Star = new Star(200,8);
		var star4:Star = new Star(210,25);
		var star5:Star = new Star(300,10);
		var star6:Star = new Star(410,36);
		var star7:Star = new Star(468,13);
		var star8:Star = new Star(312,20);
		var star9:Star = new Star(630,5);
		var star10:Star = new Star(420,15);

		add(bg);

		add(star1);
		add(star2);
		add(star3);
		add(star4);
		add(star5);
		add(star6);
		add(star7);
		add(star8);
		add(star9);
		add(star10);

		add(lights);

		manSounds = new Array();
		manSounds.push(new FlxSound().loadEmbedded(AssetPaths.fuck_man_1__mp3,false));
		manSounds.push(new FlxSound().loadEmbedded(AssetPaths.fuck_man_2__mp3,false));
		manSounds.push(new FlxSound().loadEmbedded(AssetPaths.fuck_man_3__mp3,false));
		manSounds.push(new FlxSound().loadEmbedded(AssetPaths.fuck_man_4__mp3,false));
		manSounds.sort(Helpers.randomSort);
		manTimer = new FlxTimer();
		manTimer.finished = true;

		for (i in 0...manSounds.length) sounds.add(manSounds[i]);

		womanSounds = new Array();
		womanSounds.push(new FlxSound().loadEmbedded(AssetPaths.fuck_woman_1__mp3,false));
		womanSounds.push(new FlxSound().loadEmbedded(AssetPaths.fuck_woman_2__mp3,false));
		womanSounds.push(new FlxSound().loadEmbedded(AssetPaths.fuck_woman_3__mp3,false));
		womanSounds.push(new FlxSound().loadEmbedded(AssetPaths.fuck_woman_4__mp3,false));
		womanSounds.sort(Helpers.randomSort);
		womanTimer = new FlxTimer();
		womanTimer.finished = true;

		for (i in 0...womanSounds.length) sounds.add(womanSounds[i]);

		bgSound = new FlxSound().loadEmbedded(AssetPaths.fuck_bg__mp3,true);
		bgSound.play();
		sounds.add(bgSound);

		lightTimer = new FlxTimer(4,turnOffTheLights);
	}


	private function turnOffTheLights(t:FlxTimer):Void
	{
		lights.visible = false;
	}

	
	override public function destroy():Void
	{
		super.destroy();
	}


	override public function update():Void
	{
		super.update();


		if (anyPlayed && lastPressed > 4 && !lights.visible)
		{
			lights.visible = true;
			lightTimer.start(4,goToMenu);
		}


		if (lights.visible) return;

		if (Helpers.p1JustPressed())
		{
			anyPlayed = true;

			if (!manTimer.finished) return;

			manIndex++;
			manSounds[manIndex].volume = 0.9;
			manSounds[manIndex].play(true);
			manTimer.start(0.4);

			if (manIndex == manSounds.length - 1)
			{
				manIndex = 0;
				manSounds.sort(Helpers.randomSort);
			}
		}

		if (Helpers.p2JustPressed())
		{
			anyPlayed = true;

			if (!womanTimer.finished) return;

			womanIndex++;
			womanSounds[womanIndex].volume = 0.9;
			womanSounds[womanIndex].play(true);
			womanTimer.start(0.4);

			if (womanIndex == womanSounds.length - 1)
			{
				womanIndex = 0;
				womanSounds.sort(Helpers.randomSort);
			}
		}
	}	
}