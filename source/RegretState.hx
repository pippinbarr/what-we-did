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



class RegretState extends WWDState
{

	var personOnPhone:FlxSprite;
	var personHangingUp:FlxSprite;
	var personHungUp:FlxSprite;

	var dialAndAnswer:FlxSound;
	var disconnectClick:FlxSound;
	var disconnected:FlxSound;
	var hangUp:FlxSound;
	var crickets:FlxSound;

	var disconnectTimer:FlxTimer;

	override public function create():Void
	{
		super.create();

		FlxG.camera.bgColor = 0xFF000000;

		var bg:FlxSprite = new FlxSprite(0,0,AssetPaths.regret_bg__png);
		
		personOnPhone = new FlxSprite(391,186,AssetPaths.regret_on_phone__png);
		personHangingUp = new FlxSprite(personOnPhone.x,personOnPhone.y,AssetPaths.regret_hanging_up__png);
		personHungUp = new FlxSprite(personOnPhone.x,personOnPhone.y,AssetPaths.regret_hung_up__png);

		personHangingUp.visible = false;
		personHungUp.visible = false;

		for (i in 0...100)
		{
			var star:Star = new Star(Math.random() * FlxG.width,Math.random() * FlxG.height/2);
			add(star);
		}

		add(bg);

		add(personOnPhone);
		add(personHangingUp);
		add(personHungUp);

		dialAndAnswer = new FlxSound();
		dialAndAnswer.loadEmbedded(AssetPaths.regret_phone_ring_and_message__mp3,false);

		disconnectClick = new FlxSound();
		disconnectClick.loadEmbedded(AssetPaths.regret_click__wav,false);

		disconnected = new FlxSound();
		disconnected.loadEmbedded(AssetPaths.regret_disconnected__wav,true);

		hangUp = new FlxSound();
		hangUp.loadEmbedded(AssetPaths.regret_hang_up__mp3,false);

		crickets = new FlxSound();
		crickets.loadEmbedded(AssetPaths.regret_crickets__mp3,true);

		sounds.add(dialAndAnswer);
		sounds.add(disconnectClick);
		sounds.add(hangUp);
		sounds.add(crickets);

		crickets.play();
		crickets.volume = 0.75;
		dialAndAnswer.play();
		dialAndAnswer.volume = 0.5;

		disconnectTimer = new FlxTimer(10 + 30,disconnect);
		// disconnectTimer = new FlxTimer(11,disconnect);
	}

	
	override public function destroy():Void
	{
		super.destroy();
	}


	override public function update():Void
	{
		super.update();

		if (!personOnPhone.visible) return;

		if (Helpers.p1JustPressed() || Helpers.p2JustPressed())
		{
			personOnPhone.visible = false;
			personHangingUp.visible = true;
			new FlxTimer(1,hungUp);

			dialAndAnswer.stop();
			disconnectClick.stop();
			disconnected.stop();

			hangUp.volume = 0.3;
			hangUp.play();

			disconnectTimer.cancel();

			new FlxTimer(4,goToMenu);
		}
	}	

	private function hungUp(t:FlxTimer):Void
	{
		personHangingUp.visible = false;
		personHungUp.visible = true;
	}


	private function disconnect(t:FlxTimer):Void
	{
		// disconnectClick.volume = 0.9;
		// disconnectClick.play();
		disconnected.volume = 0.25;
		disconnected.play();
	}
}