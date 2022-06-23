package;


import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;


class Star extends FlxSprite
{

	private static var TWINKLE_DELAY_MIN:Float = 4;
	private static var TWINKLE_DELAY_RANGE:Float = 8;
	private static var TWINKLE_SPEED:Float = 0.05;

	var fadeOut:Bool = false;
	var fadeIn:Bool = false;

	public function new (X,Y):Void
	{
		super(X,Y);

		if (Math.random() > 0.5) makeGraphic(3,3,0xFFCCCCCC);
		else makeGraphic(2,2,0xFFCCCCCC);

		new FlxTimer(TWINKLE_DELAY_MIN + Math.random() * TWINKLE_DELAY_RANGE,twinkle);
	}


	override public function update():Void
	{
		super.update();

		if (fadeOut)
		{
			if (alpha > 0.2) 
			{ 
				alpha -= TWINKLE_SPEED;
			}
			else 
			{
				fadeOut = false;
				fadeIn = true;
			}
		}
		else if (fadeIn)
		{
			if (alpha < 1)
			{
				alpha += TWINKLE_SPEED;
			}
			else
			{
				fadeIn = false;
				new FlxTimer(TWINKLE_DELAY_MIN + Math.random() * TWINKLE_DELAY_RANGE,twinkle);
			}
		}
	}


	private function twinkle(t:FlxTimer):Void
	{
		fadeOut = true;
	}
}