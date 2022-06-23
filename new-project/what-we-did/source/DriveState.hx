package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class DriveState extends WWDState
{
	public static var history:Array<FlxPoint>;
	public static var carX:Float = -1;
	public static var carY:Float = -1;
	public static var carAngle:Float = -1;
	public static var townX:Float = -1;
	public static var townY:Float = -1;

	private static var MARKER_DELAY:Float = 0.2;

	private var car:FlxSprite;

	private var markers:FlxGroup;
	private var towns:FlxGroup;

	private var carSound:FlxSound;

	override public function create():Void
	{
		super.create();

		markers = new FlxGroup();

		if (history == null)
		{
			history = new Array();
		}
		else
		{
			for (i in 0...history.length)
			{
				if (i / history.length < 0.1)
					continue;

				var marker:FlxSprite = new FlxSprite(history[i].x, history[i].y, AssetPaths.drive_marker__png);
				marker.centerOffsets();
				marker.centerOrigin();
				marker.x = history[i].x;
				marker.y = history[i].y;
				marker.alpha = i / history.length;
				markers.add(marker);
			}
		}

		var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.drive_map__png);

		car = new FlxSprite(200, 200, AssetPaths.drive_car__png);
		car.centerOrigin();
		car.centerOffsets();

		if (carX != -1)
			car.x = carX;
		if (carY != -1)
			car.y = carY;
		if (carAngle != -1)
			car.angle = carAngle;

		towns = new FlxGroup();
		var town1:FlxSprite = new FlxSprite(70, 305, AssetPaths.drive_marker__png);
		var town2:FlxSprite = new FlxSprite(285, 258, AssetPaths.drive_marker__png);
		var town3:FlxSprite = new FlxSprite(576, 127, AssetPaths.drive_marker__png);
		var town4:FlxSprite = new FlxSprite(493, 208, AssetPaths.drive_marker__png);
		var town5:FlxSprite = new FlxSprite(236, 427, AssetPaths.drive_marker__png);
		var town6:FlxSprite = new FlxSprite(462, 556, AssetPaths.drive_marker__png);

		towns.add(town1);
		towns.add(town2);
		towns.add(town3);
		towns.add(town4);
		towns.add(town5);
		towns.add(town6);

		add(bg);
		add(markers);
		add(towns);
		add(car);

		new FlxTimer().start(MARKER_DELAY, drawMarker);

		carSound = new FlxSound();
		carSound.loadEmbedded(AssetPaths.car_sound__wav, true);
		sounds.add(carSound);
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

		if ((FlxG.keys.pressed.LEFT || FlxG.keys.pressed.A) && car.velocity.x + car.velocity.y != 0)
		{
			car.angle -= 3;
		}
		else if ((FlxG.keys.pressed.RIGHT || FlxG.keys.pressed.D) && car.velocity.x + car.velocity.y != 0)
		{
			car.angle += 3;
		}

		if (FlxG.keys.pressed.UP || FlxG.keys.pressed.W)
		{
			car.velocity.x = Math.cos(car.angle * Math.PI / 180) * 100;
			car.velocity.y = Math.sin(car.angle * Math.PI / 180) * 100;

			if (!carSound.playing || (carSound.playing && carSound.volume < 1))
			{
				carSound.play();
				carSound.fadeIn(0.5, carSound.volume, 1);
			}
		}
		else
		{
			car.velocity.x = car.velocity.y = 0;
			carSound.fadeOut(0.25, 0);
		}

		if (car.x + car.width / 2 < 0)
			car.x += FlxG.width;
		else if (car.x + car.width / 2 > FlxG.width)
			car.x -= FlxG.width;
		if (car.y + car.height / 2 < 0)
			car.y += FlxG.height;
		else if (car.y + car.height / 2 > FlxG.height)
			car.y -= FlxG.height;

		FlxG.overlap(car, towns, overlappedTown);
	}

	private function drawMarker(t:FlxTimer):Void
	{
		if (car.velocity.x != 0 || car.velocity.y != 0)
		{
			var marker:FlxSprite = new FlxSprite(car.x, car.y, AssetPaths.drive_marker__png);
			marker.centerOffsets();
			marker.centerOrigin();
			marker.x = car.x + car.width / 2 - marker.width / 2;
			marker.y = car.y + car.height / 2 - marker.height / 2;
			markers.add(marker);

			history.push(new FlxPoint(marker.x, marker.y));
		}
		t.start(MARKER_DELAY, drawMarker);
	}

	private function overlappedTown(a:FlxObject, b:FlxObject):Void
	{
		if (b.x == townX || b.y == townY)
			return;

		townX = b.x;
		townY = b.y;
		carX = car.x;
		carY = car.y;
		carAngle = car.angle;

		car.velocity.x = car.velocity.y = 0;
		carSound.fadeOut(0.25, 0);

		goToMenu();
	}
}
