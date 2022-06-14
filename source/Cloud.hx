package;


import flixel.FlxSprite;
import flixel.FlxG;


class Cloud extends FlxSprite
{
	private static var CLOUD_SPEED_MIN:Int = 40;
	private static var CLOUD_SPEED_RANGE:Int = 10;

	public function new (X,Y):Void
	{
		super(X,Y,AssetPaths.decoration_clouds__png);

		centerOrigin();
		centerOffsets();

		velocity.x = -CLOUD_SPEED_MIN - Math.random() * CLOUD_SPEED_RANGE;
		velocity.x = -CLOUD_SPEED_MIN - Math.random() * CLOUD_SPEED_RANGE;
	}


	override public function update():Void
	{
		super.update();

		if (x + width < 0) 
		{
			x += FlxG.width + width;

			if (Math.random() > 0.5) scale.x *= -1;
			if (Math.random() > 0.5) scale.y *= -1;

			velocity.x = -CLOUD_SPEED_MIN - Math.random() * CLOUD_SPEED_RANGE;
			y = 0 - Math.random() * 50;
		}
	}
}