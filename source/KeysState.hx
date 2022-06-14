package;


import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;



class KeysState extends FlxState
{
	
	private var w:FlxSprite;
	private var a:FlxSprite;
	private var s:FlxSprite;
	private var d:FlxSprite;
	private var up:FlxSprite;
	private var left:FlxSprite;
	private var down:FlxSprite;
	private var right:FlxSprite;
	private var one:FlxSprite;
	private var two:FlxSprite;


	override public function create():Void
	{
		super.create();

		FlxG.mouse.visible = false;

		w = new FlxSprite(0,0);
		w.loadGraphic(AssetPaths.keys_W__png,true,33,28);
		w.animation.frameIndex = 0;
		w.x = FlxG.width/3 - w.width/2;
		w.y = FlxG.height/2 - w.height;
		add(w);

		s = new FlxSprite(w.x,w.y + w.height + 2);
		s.loadGraphic(AssetPaths.keys_S__png,true,33,29);
		s.animation.frameIndex = 0;
		add(s);

		a = new FlxSprite(s.x - s.width - 2,s.y);
		a.loadGraphic(AssetPaths.keys_A__png,true,33,29);
		a.animation.frameIndex = 0;
		add(a);

		d = new FlxSprite(s.x + s.width + 2,s.y);
		d.loadGraphic(AssetPaths.keys_D__png,true,33,29);
		d.animation.frameIndex = 0;
		add(d);

		one = new FlxSprite(0,0);
		one.loadGraphic(AssetPaths.keys_one__png);
		one.x = w.x + w.width/2 - one.width/2;
		one.y = w.y - one.height * 2;
		add(one);


		up = new FlxSprite(0,0);
		up.loadGraphic(AssetPaths.keys_up__png,true,33,29);
		up.animation.frameIndex = 0;
		up.x = 2*FlxG.width/3 - up.width/2;
		up.y = FlxG.height/2 - up.height;
		add(up);

		down = new FlxSprite(up.x,up.y + up.height + 2);
		down.loadGraphic(AssetPaths.keys_down__png,true,33,29);
		down.animation.frameIndex = 0;
		add(down);

		left = new FlxSprite(down.x - down.width - 2,down.y);
		left.loadGraphic(AssetPaths.keys_left__png,true,33,29);
		left.animation.frameIndex = 0;
		add(left);

		right = new FlxSprite(down.x + down.width + 2,down.y);
		right.loadGraphic(AssetPaths.keys_right__png,true,33,29);
		right.animation.frameIndex = 0;
		add(right);

		two = new FlxSprite(0,0);
		two.loadGraphic(AssetPaths.keys_two__png);
		two.x = up.x + up.width/2 - two.width/2;
		two.y = up.y - two.height * 2;
		add(two);


		FlxG.camera.fade(0xFF000000,2,true,fadedIn);
	}


	private function fadedIn():Void
	{
		FlxG.camera.stopFX();
	}


	private function fadeOut(t:FlxTimer):Void
	{
		FlxG.camera.fade(0xFF000000,2,false,fadedOut);
	}


	private function fadedOut():Void
	{
		FlxG.switchState(new TitleState());
	}


	override public function destroy():Void
	{
		super.destroy();
	}


	override public function update():Void
	{
		super.update();

		if (FlxG.keys.justPressed.W) w.animation.frameIndex = 1;
		if (FlxG.keys.justPressed.A) a.animation.frameIndex = 1;
		if (FlxG.keys.justPressed.S) s.animation.frameIndex = 1;
		if (FlxG.keys.justPressed.D) d.animation.frameIndex = 1;
		if (FlxG.keys.justPressed.UP) up.animation.frameIndex = 1;
		if (FlxG.keys.justPressed.LEFT) left.animation.frameIndex = 1;
		if (FlxG.keys.justPressed.DOWN) down.animation.frameIndex = 1;
		if (FlxG.keys.justPressed.RIGHT) right.animation.frameIndex = 1;

		if (
			w.animation.frameIndex == 1 &&
			a.animation.frameIndex == 1 &&
			s.animation.frameIndex == 1 &&
			d.animation.frameIndex == 1 &&
			up.animation.frameIndex == 1 &&
			left.animation.frameIndex == 1 &&
			down.animation.frameIndex == 1 &&
			right.animation.frameIndex == 1
			)
		{
			fadeOut(null);
		}

	}
}