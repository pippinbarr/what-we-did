package;

import flixel.FlxG;


class Helpers
{
	
	public static function p1JustPressed():Bool
	{
		return (FlxG.keys.justPressed.W || FlxG.keys.justPressed.A || FlxG.keys.justPressed.S || FlxG.keys.justPressed.D);
	}

	public static function p2JustPressed():Bool
	{
		return (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.RIGHT);
	}

	public static function p1JustReleased():Bool
	{
		return (FlxG.keys.justReleased.W || FlxG.keys.justReleased.A || FlxG.keys.justReleased.S || FlxG.keys.justReleased.D);
	}

	public static function p2JustReleased():Bool
	{
		return (FlxG.keys.justReleased.UP || FlxG.keys.justReleased.LEFT || FlxG.keys.justReleased.DOWN || FlxG.keys.justReleased.RIGHT);
	}

	public static function p1Pressed():Bool
	{
		return (FlxG.keys.pressed.W || FlxG.keys.pressed.A || FlxG.keys.pressed.S || FlxG.keys.pressed.D);
	}

	public static function p2Pressed():Bool
	{
		return (FlxG.keys.pressed.UP || FlxG.keys.pressed.LEFT || FlxG.keys.pressed.DOWN || FlxG.keys.pressed.RIGHT);
	}

	public static function randomSort(X:Dynamic,Y:Dynamic):Int
	{
		var r:Float = Math.random();
		if (r < 0.33) return 1;
		else if (r < 0.66) return 0;
		else return -1;
	}

}