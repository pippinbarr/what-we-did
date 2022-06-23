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

class PrayState extends WWDState
{
	private var clouds1:Cloud;
	private var clouds2:Cloud;

	private var bgSound:FlxSound;
	private var wNote:FlxSound;
	private var aNote:FlxSound;
	private var sNote:FlxSound;
	private var dNote:FlxSound;
	private var upNote:FlxSound;
	private var leftNote:FlxSound;
	private var downNote:FlxSound;
	private var rightNote:FlxSound;

	private var anyPlayed:Bool = false;

	override public function create():Void
	{
		super.create();

		FlxG.camera.bgColor = 0xFF222222;

		var church:FlxSprite = new FlxSprite(0, 0, AssetPaths.pray_church__png);

		clouds1 = new Cloud(0, 0);
		clouds2 = new Cloud(FlxG.width, 0);

		add(clouds1);
		add(clouds2);

		add(church);

		bgSound = new FlxSound();
		#if html5
		bgSound.loadEmbedded(AssetPaths.pray_bg__mp3, true);
		#else
		bgSound.loadEmbedded(AssetPaths.pray_bg__ogg, true);
		#end
		bgSound.play();

		sounds.add(bgSound);

		wNote = new FlxSound();
		wNote.loadEmbedded(AssetPaths.D1__wav, false);
		sounds.add(wNote);

		aNote = new FlxSound();
		aNote.loadEmbedded(AssetPaths.D0__wav, false);
		sounds.add(aNote);

		sNote = new FlxSound();
		sNote.loadEmbedded(AssetPaths.F0__wav, false);
		sounds.add(sNote);

		dNote = new FlxSound();
		dNote.loadEmbedded(AssetPaths.A1__wav, false);
		sounds.add(dNote);

		upNote = new FlxSound();
		upNote.loadEmbedded(AssetPaths.C1__wav, false);
		sounds.add(upNote);

		leftNote = new FlxSound();
		leftNote.loadEmbedded(AssetPaths.E0__wav, false);
		sounds.add(leftNote);

		downNote = new FlxSound();
		downNote.loadEmbedded(AssetPaths.G0__wav, false);
		sounds.add(downNote);

		rightNote = new FlxSound();
		rightNote.loadEmbedded(AssetPaths.B1__wav, false);
		sounds.add(rightNote);
	}

	override public function destroy():Void
	{
		super.destroy();

		bgSound.stop();
		wNote.stop();
		aNote.stop();
		sNote.stop();
		dNote.stop();
		upNote.stop();
		leftNote.stop();
		downNote.stop();
		rightNote.stop();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (anyPlayed && lastPressed > 10.0 && !fadingOut)
		{
			goToMenu();
			return;
		}

		checkNote(FlxG.keys.justPressed.W, FlxG.keys.justReleased.W, wNote);
		checkNote(FlxG.keys.justPressed.A, FlxG.keys.justReleased.A, aNote);
		checkNote(FlxG.keys.justPressed.S, FlxG.keys.justReleased.S, sNote);
		checkNote(FlxG.keys.justPressed.D, FlxG.keys.justReleased.D, dNote);
		checkNote(FlxG.keys.justPressed.UP, FlxG.keys.justReleased.UP, upNote);
		checkNote(FlxG.keys.justPressed.LEFT, FlxG.keys.justReleased.LEFT, leftNote);
		checkNote(FlxG.keys.justPressed.DOWN, FlxG.keys.justReleased.DOWN, downNote);
		checkNote(FlxG.keys.justPressed.RIGHT, FlxG.keys.justReleased.RIGHT, rightNote);
	}

	private function checkNote(justPressed:Bool, justReleased:Bool, theNote:FlxSound):Void
	{
		if (fadingOut)
			return;

		if (justPressed && (!theNote.playing || theNote.volume < 0.2))
		{
			anyPlayed = true;
			theNote.volume = 0.4;
			theNote.play(true);
		}
		else if (justReleased && theNote.playing)
		{
			theNote.fadeOut(0.2);
		}
		if (theNote.volume == 0)
		{
			theNote.stop();
			theNote.volume = 1;
		}
	}
}
