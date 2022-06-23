package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

enum MenuOption
{
	REGRET;
	DREAM;
	DRIVE;
	FUCK;
	GIVE_UP;
	PRAY;
	WAIT;
}

class MenuState extends FlxState
{
	private static var CARMEN_CHANCE:Float = 0.25;

	private static var NORMAL_FRAME:Int = 0;
	private static var STRIKE_FRAME:Int = 1;

	private static var FADE_TIME:Float = 2;

	public static var totalSteps:Int;

	private var regret:FlxSprite;
	private var wait:FlxSprite;
	private var dream:FlxSprite;
	private var drive:FlxSprite;
	private var pray:FlxSprite;
	private var fuck:FlxSprite;
	private var giveUp:FlxSprite;

	private var black:FlxSprite;

	public static var option0:FlxSprite;
	public static var option1:FlxSprite;
	public static var option2:FlxSprite;
	public static var option3:FlxSprite;

	public static var carmenTexts:Array<String>;

	public var finalCarmenText:String = "They know everything.";

	public static var allOptions:Array<MenuOption> = [REGRET, DREAM, FUCK, GIVE_UP, PRAY, WAIT];
	public static var currentOptions:Array<MenuOption>;
	public static var currentStrikes:Array<Bool>;

	public static var currentOption:Int = 0;

	public static var loadNewOptions:Bool = true;
	public static var firstTime:Bool = true;

	private var pen:FlxSprite;

	private var carmenText:FlxText;
	private var optionText:FlxText;

	private var menuActive:Bool = false;

	override public function create():Void
	{
		super.create();

		// trace("MenuState.create");

		// trace("Add bg.");
		var bg:FlxSprite = new FlxSprite(0, 0, AssetPaths.menu_bg__png);

		// trace("Add option sprites");
		regret = new FlxSprite(0, 0);
		regret.loadGraphic(AssetPaths.menu_regret__png, true, 164, 82, false);
		regret.animation.frameIndex = 0;

		dream = new FlxSprite(0, 0);
		dream.loadGraphic(AssetPaths.menu_dream__png, true, 126, 78, false);
		dream.animation.frameIndex = 0;

		drive = new FlxSprite(0, 0);
		drive.loadGraphic(AssetPaths.menu_drive__png, true, 123, 78, false);
		drive.animation.frameIndex = 0;

		fuck = new FlxSprite(0, 0);
		fuck.loadGraphic(AssetPaths.menu_fuck__png, true, 119, 69, false);
		fuck.animation.frameIndex = 0;

		giveUp = new FlxSprite(0, 0);
		giveUp.loadGraphic(AssetPaths.menu_give_up__png, true, 163, 84, false);
		giveUp.animation.frameIndex = 0;

		pray = new FlxSprite(0, 0);
		pray.loadGraphic(AssetPaths.menu_pray__png, true, 107, 78, false);
		pray.animation.frameIndex = 0;

		wait = new FlxSprite(0, 0);
		wait.loadGraphic(AssetPaths.menu_wait__png, true, 105, 66, false);
		wait.animation.frameIndex = 0;

		pen = new FlxSprite(100, 100, AssetPaths.menu_pen__png);
		pen.offset.y = pen.height;

		if (loadNewOptions)
		{
			// trace("Loading new options.");
			allOptions.sort(randomSort);
			currentOptions = new Array();
			for (i in 0...3)
				currentOptions.push(allOptions[i]);
			currentOptions.push(DRIVE);

			currentStrikes = [false, false, false, false];
		}

		// trace("Assigning option sprites");
		option0 = getOptionSprite(currentOptions[0]);
		option0.x = 100;
		option0.y = 200;
		if (currentStrikes[0])
			option0.animation.frameIndex = STRIKE_FRAME;

		option1 = getOptionSprite(currentOptions[1]);
		option1.x = 125;
		option1.y = 250;
		if (currentStrikes[1])
			option1.animation.frameIndex = STRIKE_FRAME;

		option2 = getOptionSprite(currentOptions[2]);
		option2.x = 150;
		option2.y = 300;
		if (currentStrikes[2])
			option2.animation.frameIndex = STRIKE_FRAME;

		option3 = drive;
		option3.x = 175;
		option3.y = 350;
		if (currentStrikes[3])
			option3.animation.frameIndex = STRIKE_FRAME;

		// trace("Update pen.");
		updatePen();

		// trace("Creating black.");
		black = new FlxSprite(0, 0);
		black.makeGraphic(FlxG.width, FlxG.height, 0xFF000000);

		// trace("Adding sprites.");
		add(bg);

		add(option0);
		add(option1);
		add(option2);
		add(option3);

		add(pen);

		add(black);
		black.visible = false;

		if (firstTime)
		{
			// trace("Running first time.");
			totalSteps = 1;

			carmenTexts = [
				"They know our names.",
				"They know what car we drive.",
				"They know what we look like.",
				"They know where we've been."
			];
			carmenTexts.sort(randomSort);
		}

		if (!firstTime && Math.random() < CARMEN_CHANCE)
		{
			// trace("Running carmen.");
			black.visible = true;
			var carmenString:String = "Uh oh!";

			if (carmenTexts.length > 0)
			{
				carmenString = carmenTexts.pop();
				// trace("Popped " + carmenString);
			}
			else
			{
				carmenString = finalCarmenText;
				// REMOVE ALL THE OPTIONS EXCEPT FOR GIVE_UP!

				// trace("Removing option0");
				remove(option0);

				// trace("Replacing option0 with Give up");
				currentOptions[0] = GIVE_UP;
				option0 = getOptionSprite(currentOptions[0]);
				add(option0);
				option0.x = 100;
				option0.y = 200;

				// trace("Resetting option strikeouts");
				option1.animation.frameIndex = STRIKE_FRAME;
				option2.animation.frameIndex = STRIKE_FRAME;
				option3.animation.frameIndex = STRIKE_FRAME;

				// We do this LAST because one of the other three options
				// may happen to be GIVE_UP in which case we'd end up
				// setting it as "struck through" by mistake!!
				option0.animation.frameIndex = NORMAL_FRAME;

				// trace("Making other options invisible");
				option1.visible = false;
				option2.visible = false;
				option3.visible = false;

				option0.visible = true;

				// trace("Updating pen");
				updatePen();
			}

			// trace("Setting carmenText to " + carmenString);
			carmenText = new FlxText(0, FlxG.height / 2 - 28, FlxG.width, carmenString);
			carmenText.setFormat(AssetPaths.CourierNew__ttf, 28, 0xFFFFFFFF, "center");
			add(carmenText);

			// trace("Stopping FX and fading in");
			FlxG.camera.stopFX();
			FlxG.camera.fade(0xFF000000, FADE_TIME, true, carmenFadedIn);
		}
		else
		{
			// trace("Running normal menu fade in");
			FlxG.camera.stopFX();
			FlxG.camera.fade(0xFF000000, FADE_TIME, true, menuFadedIn);

			menuActive = true;
		}

		// trace("Creating optionText for the we x thing");
		optionText = new FlxText(0, FlxG.height / 2 - 28, FlxG.width, "");
		optionText.setFormat(AssetPaths.CourierNew__ttf, 28, 0xFFFFFFFF, "center");
		add(optionText);
		optionText.visible = false;

		// trace("Setting firstTime and loadNewOptions to false");
		firstTime = false;
		loadNewOptions = false;
	}

	override public function destroy():Void
	{
		super.destroy();

		remove(option0);
		remove(option1);
		remove(option2);
		remove(option3);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (!menuActive)
			return;

		if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S)
		{
			movePenDown();
		}
		else if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W)
		{
			movePenUp();
		}
		else if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.X || FlxG.keys.justPressed.SPACE)
		{
			if (getOptionSprite(currentOptions[currentOption]) != drive)
			{
				currentStrikes[currentOption] = true;
			}

			menuActive = false;
			FlxG.camera.stopFX();
			FlxG.camera.fade(0xFF000000, FADE_TIME, false, menuFadedOut);
		}

		// if (FlxG.keys.justPressed.D) FlxG.switchState(new DreamState());
		// if (FlxG.keys.justPressed.R) FlxG.switchState(new DriveState());
	}

	private function movePenDown():Void
	{
		currentOption = (currentOption + 1) % 4;

		var optionSprite:FlxSprite = getOptionSprite(currentOptions[currentOption]);
		while (optionSprite.animation.frameIndex == STRIKE_FRAME)
		{
			currentOption = (currentOption + 1) % 4;
			optionSprite = getOptionSprite(currentOptions[currentOption]);
		}

		updatePen();
	}

	private function movePenUp():Void
	{
		currentOption -= 1;
		if (currentOption == -1)
			currentOption = 3;

		var optionSprite:FlxSprite = getOptionSprite(currentOptions[currentOption]);
		while (optionSprite.animation.frameIndex == STRIKE_FRAME)
		{
			currentOption -= 1;
			if (currentOption == -1)
				currentOption = 3;
			optionSprite = getOptionSprite(currentOptions[currentOption]);
		}

		updatePen();
	}

	private function updatePen():Void
	{
		var optionSprite:FlxSprite = getOptionSprite(currentOptions[currentOption]);

		while (optionSprite.animation.frameIndex == STRIKE_FRAME)
		{
			currentOption = (currentOption + 1) % 4;
			optionSprite = getOptionSprite(currentOptions[currentOption]);
		}

		pen.x = optionSprite.x + optionSprite.width;
		pen.y = optionSprite.y + optionSprite.height / 6;
	}

	private function getOptionSprite(O:MenuOption):FlxSprite
	{
		switch (O)
		{
			case DREAM:
				return dream;

			case DRIVE:
				return drive;

			case WAIT:
				return wait;

			case PRAY:
				return pray;

			case FUCK:
				return fuck;

			case GIVE_UP:
				return giveUp;

			case REGRET:
				return regret;
		}
	}

	private function getOptionState(O:MenuOption):Dynamic
	{
		// return MenuState;

		switch (O)
		{
			case DREAM:
				return DreamState;

			case DRIVE:
				// We set this to true so that next time we come back to the menu
				// we get a fresh set of random options to choose
				loadNewOptions = true;
				currentOption = 0;
				return DriveState;

			case WAIT:
				return WaitState;

			case PRAY:
				return PrayState;

			case FUCK:
				return FuckState;

			case GIVE_UP:
				return GiveUpState;

			case REGRET:
				return RegretState;
		}

		return MenuState;
	}

	private function getOptionText(O:MenuOption):String
	{
		switch (O)
		{
			case DREAM:
				return "We dream.";

			case DRIVE:
				return "We drive.";

			case WAIT:
				return "We wait.";

			case PRAY:
				return "We pray.";

			case FUCK:
				return "We fuck.";

			case GIVE_UP:
				return "We give up.";

			case REGRET:
				return "We regret.";
		}

		return "Should not see this.";
	}

	public function randomSort(X:Dynamic, Y:Dynamic):Int
	{
		var r:Float = Math.random();
		if (r < 0.33)
			return 1;
		else if (r < 0.66)
			return 0;
		else
			return -1;
	}

	// FADES

	private function menuFadedOut():Void
	{
		FlxG.camera.stopFX();

		totalSteps++;
		optionText.text = totalSteps + ". " + getOptionText(currentOptions[currentOption]);
		optionText.visible = true;
		black.visible = true;

		FlxG.camera.stopFX();
		FlxG.camera.fade(0xFF000000, FADE_TIME, true, optionTextFadedIn);
	}

	private function optionTextFadedIn():Void
	{
		FlxG.camera.stopFX();

		new FlxTimer().start(2, optionTextFadeOut);
		// new FlxTimer().start(0.1,optionTextFadeOut);
	}

	private function optionTextFadeOut(t:FlxTimer):Void
	{
		FlxG.camera.stopFX();

		FlxG.camera.stopFX();
		FlxG.camera.fade(0xFF000000, FADE_TIME, false, optionTextFadedOut);
	}

	private function optionTextFadedOut():Void
	{
		FlxG.switchState(Type.createInstance(getOptionState(currentOptions[currentOption]), []));
	}

	private function carmenFadedIn():Void
	{
		FlxG.camera.stopFX();
		new FlxTimer().start(4, carmenFadeOut);
		// new FlxTimer().start(0.1,carmenFadeOut);
	}

	private function carmenFadeOut(t:FlxTimer):Void
	{
		FlxG.camera.stopFX();
		FlxG.camera.fade(0xFF000000, FADE_TIME, false, carmenFadedOut);
	}

	private function carmenFadedOut():Void
	{
		FlxG.camera.stopFX();
		black.visible = false;
		carmenText.visible = false;
		menuActive = true;
		FlxG.camera.stopFX();
		FlxG.camera.fade(0xFF000000, FADE_TIME, true, menuFadedIn);
	}

	private function menuFadedIn():Void
	{
		menuActive = true;
	}
}
