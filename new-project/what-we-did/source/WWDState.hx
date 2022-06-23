package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class WWDState extends FlxState
{
	private var inputActive:Bool = false;
	private var lastPressed:Float = 1000;
	private var lastReleased:Float = 1000;
	private var fadingOut:Bool = false;

	private var sounds:FlxTypedGroup<FlxSound>;

	override public function create():Void
	{
		super.create();

		sounds = new FlxTypedGroup();

		FlxG.camera.fade(0xFF000000, 2, true);

		inputActive = true;
	}

	override public function destroy():Void
	{
		super.destroy();

		sounds.forEach(function(s:FlxBasic)
		{
			cast(s, FlxSound).stop();
		});
		// sounds.callAll("stop");
		sounds.destroy();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (Helpers.p1JustPressed() || Helpers.p2JustPressed())
		{
			lastPressed = 0;
		}
		else
		{
			lastPressed += FlxG.elapsed;
		}

		if (Helpers.p1JustReleased() || Helpers.p2JustReleased())
		{
			lastReleased = 0;
		}
		else
		{
			lastReleased += FlxG.elapsed;
		}

		// if (FlxG.keys.justPressed.ESCAPE)
		// {
		// 	goToMenu();
		// }
	}

	private function goToMenu(t:FlxTimer = null):Void
	{
		FlxG.camera.stopFX();
		FlxG.camera.fade(0xFF000000, 2, false, fadedOut);
		fadingOut = true;
		sounds.forEach(function(s:FlxBasic)
		{
			cast(s, FlxSound).fadeOut(2);
		});
		// sounds.callAll("fadeOut", [2]);
	}

	private function fadedOut():Void
	{
		FlxG.switchState(new MenuState());
	}
}
