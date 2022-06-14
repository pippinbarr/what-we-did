package;

import haxe.Timer;
import haxe.Unserializer;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Loader;
import openfl.events.Event;
import openfl.media.Sound;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.text.Font;
import openfl.utils.ByteArray;

class DefaultAssetLibrary extends openfl.AssetLibrary {
	public var className(default, null) = new Map<String, Dynamic>();
	public var path(default, null) = new Map<String, String>();
	public var type(default, null) = new Map<String, AssetType>();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	public function new() {
		super();
		// register assets:
		add("assets/data/data-goes-here.txt", TEXT);
		add("assets/fonts/ClearSans.ttf", FONT);
		add("assets/images/decoration/decoration_clouds.png", IMAGE);
		add("assets/images/dream/dream0.png", IMAGE);
		add("assets/images/dream/dream1.png", IMAGE);
		add("assets/images/dream/dream10.png", IMAGE);
		add("assets/images/dream/dream2.png", IMAGE);
		add("assets/images/dream/dream3.png", IMAGE);
		add("assets/images/dream/dream4.png", IMAGE);
		add("assets/images/dream/dream5.png", IMAGE);
		add("assets/images/dream/dream6.png", IMAGE);
		add("assets/images/dream/dream7.png", IMAGE);
		add("assets/images/dream/dream8.png", IMAGE);
		add("assets/images/dream/dream9.png", IMAGE);
		add("assets/images/dream/dream_bg.png", IMAGE);
		add("assets/images/drive/drive_car.png", IMAGE);
		add("assets/images/drive/drive_map.png", IMAGE);
		add("assets/images/drive/drive_marker.png", IMAGE);
		add("assets/images/fuck/fuck_bg.png", IMAGE);
		add("assets/images/fuck/fuck_light.png", IMAGE);
		add("assets/images/give_up/give_up_bg.png", IMAGE);
		add("assets/images/give_up/give_up_flash.png", IMAGE);
		add("assets/images/images-go-here.txt", TEXT);
		add("assets/images/keys/keys_A.png", IMAGE);
		add("assets/images/keys/keys_D.png", IMAGE);
		add("assets/images/keys/keys_down.png", IMAGE);
		add("assets/images/keys/keys_left.png", IMAGE);
		add("assets/images/keys/keys_one.png", IMAGE);
		add("assets/images/keys/keys_right.png", IMAGE);
		add("assets/images/keys/keys_S.png", IMAGE);
		add("assets/images/keys/keys_two.png", IMAGE);
		add("assets/images/keys/keys_up.png", IMAGE);
		add("assets/images/keys/keys_W.png", IMAGE);
		add("assets/images/menu/menu_bg.png", IMAGE);
		add("assets/images/menu/menu_dream.png", IMAGE);
		add("assets/images/menu/menu_drive.png", IMAGE);
		add("assets/images/menu/menu_fuck.png", IMAGE);
		add("assets/images/menu/menu_give_up.png", IMAGE);
		add("assets/images/menu/menu_pen.png", IMAGE);
		add("assets/images/menu/menu_pray.png", IMAGE);
		add("assets/images/menu/menu_regret.png", IMAGE);
		add("assets/images/menu/menu_wait.png", IMAGE);
		add("assets/images/pray/pray_church.png", IMAGE);
		add("assets/images/regret/regret_bg.png", IMAGE);
		add("assets/images/regret/regret_hanging_up.png", IMAGE);
		add("assets/images/regret/regret_hung_up.png", IMAGE);
		add("assets/images/regret/regret_on_phone.png", IMAGE);
		add("assets/images/wait/wait_car.png", IMAGE);
		add("assets/images/wait/wait_houses.png", IMAGE);
		add("assets/music/music-goes-here.txt", TEXT);
		add("assets/sounds/dream/dream_hum.mp3", MUSIC);
		add("assets/sounds/drive/car_sound.mp3", MUSIC);
		add("assets/sounds/drive/car_sound.wav", SOUND);
		add("assets/sounds/fuck/fuck_bg.mp3", MUSIC);
		add("assets/sounds/fuck/fuck_man_1.mp3", MUSIC);
		add("assets/sounds/fuck/fuck_man_2.mp3", MUSIC);
		add("assets/sounds/fuck/fuck_man_3.mp3", MUSIC);
		add("assets/sounds/fuck/fuck_man_4.mp3", MUSIC);
		add("assets/sounds/fuck/fuck_woman_1.mp3", MUSIC);
		add("assets/sounds/fuck/fuck_woman_2.mp3", MUSIC);
		add("assets/sounds/fuck/fuck_woman_3.mp3", MUSIC);
		add("assets/sounds/fuck/fuck_woman_4.mp3", MUSIC);
		add("assets/sounds/give_up/give_up_bg.mp3", MUSIC);
		add("assets/sounds/give_up/give_up_gunshot.mp3", MUSIC);
		add("assets/sounds/pray/organ/A1.mp3", MUSIC);
		add("assets/sounds/pray/organ/B1.mp3", MUSIC);
		add("assets/sounds/pray/organ/C1.mp3", MUSIC);
		add("assets/sounds/pray/organ/D0.mp3", MUSIC);
		add("assets/sounds/pray/organ/D1.mp3", MUSIC);
		add("assets/sounds/pray/organ/E0.mp3", MUSIC);
		add("assets/sounds/pray/organ/F0.mp3", MUSIC);
		add("assets/sounds/pray/organ/G0.mp3", MUSIC);
		add("assets/sounds/pray/pray_bg.mp3", MUSIC);
		add("assets/sounds/regret/regret_click.wav", SOUND);
		add("assets/sounds/regret/regret_crickets.mp3", MUSIC);
		add("assets/sounds/regret/regret_hang_up.mp3", MUSIC);
		add("assets/sounds/regret/regret_off_the_hook.mp3", MUSIC);
		add("assets/sounds/regret/regret_phone_ring_and_message.mp3", MUSIC);
		add("assets/sounds/sounds-go-here.txt", TEXT);
		add("assets/sounds/wait/wait_folk.mp3", MUSIC);
		add("assets/sounds/wait/wait_reich.mp3", MUSIC);
		add("assets/sounds/wait/wait_static.wav", SOUND);
		add("Clear", FONT, "assets/fonts/ClearSans.ttf");
		add("assets/sounds/beep.mp3", MUSIC);
		add("assets/sounds/flixel.mp3", MUSIC);
		add("assets/sounds/beep.ogg", SOUND);
		add("assets/sounds/flixel.ogg", SOUND);
		//
	}
	
	private function add(id:String, t:AssetType, ?p:String) {
		type.set(id, t);
		path.set(id, p != null ? p : id);
	}
	
	override public function getPath(id:String):String {
		return path.get(id);
	}
	
	override public function exists(id:String, t:AssetType):Bool {
		var r = type.get(id);
		if (r != null) {
			if (r == t || t == null) return true;
			switch (t) {
			case AssetType.SOUND: return r == AssetType.MUSIC;
			case AssetType.MUSIC: return r == AssetType.SOUND;
			case AssetType.BINARY: return true;
			default: return false;
			}
		}
		return false;
	}
	
	override public function getBitmapData(id:String):BitmapData {
		var q = ApplicationMain.loaders.get(path.get(id));
		var b:Bitmap = cast q.contentLoaderInfo.content;
		return b.bitmapData;
	}
	
	override public function getFont(id:String):Font {
		// not yet.
		return null;
	}
	
	override public function getSound(id:String):Sound {
		return new Sound(new URLRequest(path.get(id)));
	}
	
	override public function getMusic(id:String):Sound {
		return new Sound(new URLRequest(path.get(id)));
	}
	
	override public function getBytes(id:String):ByteArray {
		var r:ByteArray = null;
		var p = path.get(id);
		var d = ApplicationMain.urlLoaders.get(p).data;
		if (Std.is(d, String)) {
			(r = new ByteArray()).writeUTFBytes(cast d);
		} else if (Std.is(d, ByteArray)) {
			r = cast d;
		} else r = null;
		if (r != null) {
			r.position = 0;
			return r;
		} else return null;
	}
	
	override public function getText(id:String):String {
		var r:ByteArray = null;
		var p = path.get(id);
		var d = ApplicationMain.urlLoaders.get(p).data;
		if (Std.is(d, String)) {
			return cast d;
		} else if (Std.is(d, ByteArray)) {
			r = cast d;
			r.position = 0;
			return r.readUTFBytes(r.length);
		} else return null;
	}
	
	override public function list(t:AssetType):Array<String> {
		var r:Array<String> = [];
		for (id in type.keys()) {
			if (t == null || exists(id, t)) r.push(id);
		}
		return r;
	}
	
	override public function loadBitmapData(id:String, h:BitmapData->Void):Void {
		if (path.exists(id)) {
			var r = new Loader();
			var f:Event->Void = null;
			f = function(e:Event) {
				r.contentLoaderInfo.removeEventListener(Event.COMPLETE, f);
				var b:Bitmap = cast e.currentTarget.content;
				h(b.bitmapData);
				b = null; f = null; r = null;
			};
			r.addEventListener(Event.COMPLETE, f);
			r.load(new URLRequest(path.get(id)));
		} else h(getBitmapData(id));
	}
	
	override public function loadFont(id:String, h:Font->Void):Void {
		h(getFont(id));
	}
	
	override public function loadSound(id:String, h:Sound->Void):Void {
		h(getSound(id));
	}
	
	override public function loadMusic(id:String, h:Sound->Void):Void {
		h(getMusic(id));
	}
	
	override public function loadBytes(id:String, h:ByteArray->Void):Void {
		if (path.exists(id)) {
			var r = new URLLoader();
			var f:Event->Void = null;
			f = function(e:Event) {
				r.removeEventListener(Event.COMPLETE, f);
				var b = new ByteArray();
				b.writeUTFBytes(e.currentTarget.data);
				b.position = 0;
				h(b);
				b = null; f = null; r = null;
			};
			r.addEventListener(Event.COMPLETE, f);
		} else h(getBytes(id));
	}
	
	override public function loadText(id:String, h:String->Void):Void {
		if (path.exists(id)) {
			var r = new URLLoader();
			var f:Event->Void = null;
			f = function(e:Event) {
				r.removeEventListener(Event.COMPLETE, f);
				h(e.currentTarget.data);
				f = null; r = null;
			};
			r.addEventListener(Event.COMPLETE, f);
		} else h(getText(id));
	}
	
}
