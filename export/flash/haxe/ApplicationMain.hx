import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		app = new openfl.display.Application ();
		app.create (config);
		
		var display = new Preloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if js
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("Clear Sans");
		types.push (AssetType.FONT);
		
		
		urls.push ("Courier New Bold");
		types.push (AssetType.FONT);
		
		
		urls.push ("assets/images/decoration/decoration_clouds.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream0.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream10.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream3.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream4.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream5.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream6.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream7.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream8.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream9.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/dream/dream_bg.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/drive/drive_car.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/drive/drive_map.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/drive/drive_marker.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/fuck/fuck_bg.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/fuck/fuck_light.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/give_up/give_up_bg.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/give_up/give_up_flash.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/images/keys/keys_A.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_D.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_down.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_left.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_one.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_right.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_S.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_two.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_up.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/keys/keys_W.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_bg.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_dream.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_drive.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_fuck.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_give_up.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_pen.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_pray.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_regret.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/menu/menu_wait.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/pray/pray_church.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/preloader/click.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/preloader/loaded.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/preloader/loading.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/regret/regret_bg.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/regret/regret_hanging_up.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/regret/regret_hung_up.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/regret/regret_on_phone.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/wait/wait_car.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/wait/wait_houses.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/sounds/dream/dream_bg.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/dream/dream_hum.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/dream/dream_hum_old.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/drive/car_sound.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/drive/car_sound.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/drive/car_sound_old.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/fuck/fuck_bg.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/fuck/fuck_man_1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/fuck/fuck_man_2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/fuck/fuck_man_3.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/fuck/fuck_man_4.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/fuck/fuck_woman_1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/fuck/fuck_woman_2.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/fuck/fuck_woman_3.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/fuck/fuck_woman_4.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/give_up/give_up_bg.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/give_up/give_up_bg_old.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/give_up/give_up_gunshot.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/organ/A1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/organ/B1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/organ/C1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/organ/D0.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/organ/D1.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/organ/E0.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/organ/F0.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/organ/G0.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/pray_bg.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/pray/pray_bg_old.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/regret/regret_click.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/regret/regret_crickets.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/regret/regret_disconnected.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("assets/sounds/regret/regret_hang_up.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/regret/regret_off_the_hook.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/regret/regret_phone_ring_and_message.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/regret/regret_phone_ring_and_message_old.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/sounds/wait/wait_folk.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/wait/wait_reich.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/wait/wait_static.wav");
		types.push (AssetType.SOUND);
		
		
		urls.push ("Courier New Bold");
		types.push (AssetType.FONT);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (AssetType.MUSIC);
		
		
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if sys
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (2236962),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (640),
			orientation: "portrait",
			resizable: true,
			stencilBuffer: false,
			title: "WhatWeDid",
			vsync: true,
			width: Std.int (640),
			
		}
		
		#if js
		#if munit
		flash.Lib.embed (null, 640, 640, "222222");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		openfl.Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		openfl.Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields (Main)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
