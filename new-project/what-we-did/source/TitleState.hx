package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class TitleState extends FlxState
{
	private var title:FlxText;
	private var title3:FlxText;
	private var titleFadeAmount:Float = 0;

	override public function create():Void
	{
		super.create();

		FlxG.camera.bgColor = 0xFF000000;

		title = new FlxText(0, 0, 207, "1. They know");
		title.setFormat("Courier", 28, 0xFFFFFFFF, "left");
		title.y = FlxG.height / 2 - title.height;

		add(title);

		var title2:FlxText = new FlxText(title.x + title.width + 12, title.y, 190, "what we did");
		title2.setFormat("Courier", 28, 0xFfffffff, "left");
		title2.y = FlxG.height / 2 - title2.height;

		add(title2);

		title3 = new FlxText(title2.x + title2.width, title.y, 14, ".");
		title3.setFormat("Courier", 28, 0xFfffffff, "left");
		title3.y = FlxG.height / 2 - title3.height;

		add(title3);

		title.x = FlxG.width / 2 - (title.width + title2.width + title3.width) / 2;
		title2.x = title.x + title.width + 10;
		title3.x = title2.x + title2.width - 5;

		FlxG.camera.fade(0xFF000000, 2, true, fadedIn);
	}

	private function fadedIn():Void
	{
		FlxG.camera.stopFX();
		new FlxTimer().start(2, fadeToTitle);
	}

	private function fadeToTitle(t:FlxTimer):Void
	{
		titleFadeAmount = 0.01;
	}

	private function fadeOut(t:FlxTimer):Void
	{
		FlxG.camera.fade(0xFF000000, 2, false, fadedOut);
	}

	private function fadedOut():Void
	{
		new FlxTimer().start(2, goToMenu);
	}

	private function goToMenu(t:FlxTimer):Void
	{
		FlxG.switchState(new DriveState());
	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		title.alpha -= titleFadeAmount;
		title3.alpha -= titleFadeAmount;
		if (title.visible && title.alpha <= 0)
		{
			title.visible = false;
			title3.visible = false;
			new FlxTimer().start(2, fadeOut);
		}
	}
}
