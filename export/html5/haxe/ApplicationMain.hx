#if !macro
import Main;
import haxe.Resource;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.ILoader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.IURLLoader;
import flash.net.URLRequest;
import flash.net.URLLoaderDataFormat;
import flash.Lib;
import js.html.Element;
import js.html.AudioElement;

class ApplicationMain {
	#if (openfl >= "2.1")
	public static var config:lime.app.Config = {
		antialiasing: Std.int(0),
		background: Std.int(2236962),
		borderless: false,
		depthBuffer: false,
		fps: Std.int(60),
		fullscreen: false,
		height: Std.int(640),
		orientation: "portrait",
		resizable: true,
		stencilBuffer: false,
		title: "WhatWeDid",
		vsync: true,
		width: Std.int(640),
	};
	#end
	private static var completed:Int;
	private static var preloader:flixel.system.FlxPreloader;
	private static var total:Int;

	public static var loaders:Map<String, ILoader>;
	public static var urlLoaders:Map<String, IURLLoader>;
	private static var loaderStack:Array<String>;
	private static var urlLoaderStack:Array<String>;
	// Embed data preloading
	@:noCompletion public static var embeds:Int = 0;
	@:noCompletion public static function loadEmbed(o:Element) {
		embeds++;
		var f = null;
		f = function(_) {
			o.removeEventListener("load", f);
			if (--embeds == 0) preload();
		}
		o.addEventListener("load", f);
	}
	
	public static function main() {
		if (embeds == 0) preload();
	}

	private static function preload() {
		completed = 0;
		loaders = new Map<String, ILoader>();
		urlLoaders = new Map<String, IURLLoader>();
		total = 0;
		
		flash.Lib.current.loaderInfo = flash.display.LoaderInfo.create (null);
		
		flash.Lib.stage.frameRate = 60;
		// preloader:
		Lib.current.addChild(preloader = new flixel.system.FlxPreloader());
		preloader.onInit();
		
		// assets:
		loadBinary("assets/data/data-goes-here.txt");
		loadFile("assets/images/decoration/decoration_clouds.png");
		loadFile("assets/images/dream/dream0.png");
		loadFile("assets/images/dream/dream1.png");
		loadFile("assets/images/dream/dream10.png");
		loadFile("assets/images/dream/dream2.png");
		loadFile("assets/images/dream/dream3.png");
		loadFile("assets/images/dream/dream4.png");
		loadFile("assets/images/dream/dream5.png");
		loadFile("assets/images/dream/dream6.png");
		loadFile("assets/images/dream/dream7.png");
		loadFile("assets/images/dream/dream8.png");
		loadFile("assets/images/dream/dream9.png");
		loadFile("assets/images/dream/dream_bg.png");
		loadFile("assets/images/drive/drive_car.png");
		loadFile("assets/images/drive/drive_map.png");
		loadFile("assets/images/drive/drive_marker.png");
		loadFile("assets/images/fuck/fuck_bg.png");
		loadFile("assets/images/fuck/fuck_light.png");
		loadFile("assets/images/give_up/give_up_bg.png");
		loadFile("assets/images/give_up/give_up_flash.png");
		loadBinary("assets/images/images-go-here.txt");
		loadFile("assets/images/keys/keys_A.png");
		loadFile("assets/images/keys/keys_D.png");
		loadFile("assets/images/keys/keys_down.png");
		loadFile("assets/images/keys/keys_left.png");
		loadFile("assets/images/keys/keys_one.png");
		loadFile("assets/images/keys/keys_right.png");
		loadFile("assets/images/keys/keys_S.png");
		loadFile("assets/images/keys/keys_two.png");
		loadFile("assets/images/keys/keys_up.png");
		loadFile("assets/images/keys/keys_W.png");
		loadFile("assets/images/menu/menu_bg.png");
		loadFile("assets/images/menu/menu_dream.png");
		loadFile("assets/images/menu/menu_drive.png");
		loadFile("assets/images/menu/menu_fuck.png");
		loadFile("assets/images/menu/menu_give_up.png");
		loadFile("assets/images/menu/menu_pen.png");
		loadFile("assets/images/menu/menu_pray.png");
		loadFile("assets/images/menu/menu_regret.png");
		loadFile("assets/images/menu/menu_wait.png");
		loadFile("assets/images/pray/pray_church.png");
		loadFile("assets/images/regret/regret_bg.png");
		loadFile("assets/images/regret/regret_hanging_up.png");
		loadFile("assets/images/regret/regret_hung_up.png");
		loadFile("assets/images/regret/regret_on_phone.png");
		loadFile("assets/images/wait/wait_car.png");
		loadFile("assets/images/wait/wait_houses.png");
		loadBinary("assets/music/music-goes-here.txt");
		loadSound("assets/sounds/dream/dream_hum.mp3");
		loadSound("assets/sounds/drive/car_sound.mp3");
		loadSound("assets/sounds/drive/car_sound.wav");
		loadSound("assets/sounds/fuck/fuck_bg.mp3");
		loadSound("assets/sounds/fuck/fuck_man_1.mp3");
		loadSound("assets/sounds/fuck/fuck_man_2.mp3");
		loadSound("assets/sounds/fuck/fuck_man_3.mp3");
		loadSound("assets/sounds/fuck/fuck_man_4.mp3");
		loadSound("assets/sounds/fuck/fuck_woman_1.mp3");
		loadSound("assets/sounds/fuck/fuck_woman_2.mp3");
		loadSound("assets/sounds/fuck/fuck_woman_3.mp3");
		loadSound("assets/sounds/fuck/fuck_woman_4.mp3");
		loadSound("assets/sounds/give_up/give_up_bg.mp3");
		loadSound("assets/sounds/give_up/give_up_gunshot.mp3");
		loadSound("assets/sounds/pray/organ/A1.mp3");
		loadSound("assets/sounds/pray/organ/B1.mp3");
		loadSound("assets/sounds/pray/organ/C1.mp3");
		loadSound("assets/sounds/pray/organ/D0.mp3");
		loadSound("assets/sounds/pray/organ/D1.mp3");
		loadSound("assets/sounds/pray/organ/E0.mp3");
		loadSound("assets/sounds/pray/organ/F0.mp3");
		loadSound("assets/sounds/pray/organ/G0.mp3");
		loadSound("assets/sounds/pray/pray_bg.mp3");
		loadSound("assets/sounds/regret/regret_click.wav");
		loadSound("assets/sounds/regret/regret_crickets.mp3");
		loadSound("assets/sounds/regret/regret_hang_up.mp3");
		loadSound("assets/sounds/regret/regret_off_the_hook.mp3");
		loadSound("assets/sounds/regret/regret_phone_ring_and_message.mp3");
		loadBinary("assets/sounds/sounds-go-here.txt");
		loadSound("assets/sounds/wait/wait_folk.mp3");
		loadSound("assets/sounds/wait/wait_reich.mp3");
		loadSound("assets/sounds/wait/wait_static.wav");
		loadSound("assets/sounds/beep.mp3");
		loadSound("assets/sounds/flixel.mp3");
		loadSound("assets/sounds/beep.ogg");
		loadSound("assets/sounds/flixel.ogg");
		
		// bitmaps:
		var resourcePrefix = "NME_:bitmap_";
		for (resourceName in Resource.listNames()) {
			if (StringTools.startsWith (resourceName, resourcePrefix)) {
				var type = Type.resolveClass(StringTools.replace (resourceName.substring(resourcePrefix.length), "_", "."));
				if (type != null) {
					total++;
					#if bitfive_logLoading
						flash.Lib.trace("Loading " + Std.string(type));
					#end
					var instance = Type.createInstance (type, [ 0, 0, true, 0x00FFFFFF, bitmapClass_onComplete ]);
				}
			}
		}
		
		if (total != 0) {
			loaderStack = [];
			for (p in loaders.keys()) loaderStack.push(p);
			urlLoaderStack = [];
			for (p in urlLoaders.keys()) urlLoaderStack.push(p);
			// launch 8 loaders at once:
			for (i in 0 ... 8) nextLoader();
		} else begin();
	}
	
	private static function nextLoader() {
		if (loaderStack.length != 0) {
			var p = loaderStack.shift(), o = loaders.get(p);
			#if bitfive_logLoading
				flash.Lib.trace("Loading " + p);
				o.contentLoaderInfo.addEventListener("complete", function(e) {
					flash.Lib.trace("Loaded " + p);
					loader_onComplete(e);
				});
			#else
				o.contentLoaderInfo.addEventListener("complete", loader_onComplete);
			#end
			o.load(new URLRequest(p));
		} else if (urlLoaderStack.length != 0) {
			var p = urlLoaderStack.shift(), o = urlLoaders.get(p);
			#if bitfive_logLoading
				flash.Lib.trace("Loading " + p);
				o.addEventListener("complete", function(e) {
					flash.Lib.trace("Loaded " + p);
					loader_onComplete(e);
				});
			#else
				o.addEventListener("complete", loader_onComplete);
			#end
			o.load(new URLRequest(p));
		}
	}
	
	private static function loadFile(p:String):Void {
		loaders.set(p, new flash.display.Loader());
		total++;
	}
	
	private static function loadBinary(p:String):Void {
		var o = new flash.net.URLLoader();
		o.dataFormat = URLLoaderDataFormat.BINARY;
		urlLoaders.set(p, o);
		total++;
	}
	
	private static function loadSound(p:String):Void {
		return;
		var i:Int = p.lastIndexOf("."), // extension separator location
			c:Dynamic = untyped flash.media.Sound, // sound class
			s:String, // perceived sound filename (*.mp3)
			o:AudioElement, // audio node
			m:Bool = Lib.mobile,
			f:Dynamic->Void = null, // event listener
			q:String = "canplaythrough"; // preload event
		// not a valid sound path:
		if (i == -1) return;
		// wrong audio type:
		if (!c.canPlayType || !c.canPlayType(p.substr(i + 1))) return;
		// form perceived path:
		s = p.substr(0, i) + ".mp3";
		// already loaded?
		if (c.library.exists(s)) return;
		#if bitfive_logLoading
			flash.Lib.trace("Loading " + p);
		#end
		total++;
		c.library.set(s, o = untyped __js__("new Audio(p)"));
		f = function(_) {
			#if bitfive_logLoading
				flash.Lib.trace("Loaded " + p);
			#end
			if (!m) o.removeEventListener(q, f);
			preloader.onUpdate(++completed, total);
			if (completed == total) begin();
		};
		// do not auto-preload sounds on mobile:
		if (m) f(null); else o.addEventListener(q, f);
	}

	private static function begin():Void {
		preloader.addEventListener(Event.COMPLETE, preloader_onComplete);
		preloader.onLoaded();
	}
	
	private static function bitmapClass_onComplete(instance:BitmapData):Void {
		completed++;
		var classType = Type.getClass (instance);
		Reflect.setField(classType, "preload", instance);
		if (completed == total) begin();
	}

	private static function loader_onComplete(event:Event):Void {
		completed ++;
		preloader.onUpdate (completed, total);
		if (completed == total) begin();
		else nextLoader();
	}

	private static function preloader_onComplete(event:Event):Void {
		preloader.removeEventListener(Event.COMPLETE, preloader_onComplete);
		Lib.current.removeChild(preloader);
		preloader = null;
		if (untyped Main.main == null) {
			var o = new DocumentClass();
			if (Std.is(o, flash.display.DisplayObject)) Lib.current.addChild(cast o);
		} else untyped Main.main();
	}
}

@:build(DocumentClass.build())
class DocumentClass extends Main {
	@:keep public function new() {
		super();
	}
}

#else // macro
import haxe.macro.Context;
import haxe.macro.Expr;

class DocumentClass {
	
	macro public static function build ():Array<Field> {
		var classType = Context.getLocalClass().get();
		var searchTypes = classType;
		while (searchTypes.superClass != null) {
			if(searchTypes.pack.length == 2
			&& searchTypes.pack[1] == "display"
			&& searchTypes.name == "DisplayObject") {
				var fields = Context.getBuildFields();
				var method = macro {
					return flash.Lib.current.stage;
				}
				fields.push( {
					name: "get_stage",
					access: [ APrivate, AOverride ],
					kind: FFun( {
						args: [],
						expr: method,
						params: [],
						ret: macro :flash.display.Stage
					}), pos: Context.currentPos() });
				return fields;
			}
			searchTypes = searchTypes.superClass.t.get();
		}
		return null;
	}
	
}
#end