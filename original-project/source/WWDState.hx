package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup;
import flixel.group.FlxTypedGroup;
import flixel.system.FlxSound;



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

		FlxG.camera.fade(0xFF000000,2,true);

		inputActive = true;
	}

	
	override public function destroy():Void
	{
		super.destroy();

		sounds.callAll("stop");
		sounds.destroy();
	}


	override public function update():Void
	{
		super.update();

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
		FlxG.camera.fade(0xFF000000,2,false,fadedOut);
		fadingOut = true;
		sounds.callAll("fadeOut",[2]);
	}


	private function fadedOut():Void
	{
		FlxG.switchState(new MenuState());
	}
}