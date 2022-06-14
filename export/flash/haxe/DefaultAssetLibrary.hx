package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if (sys || nodejs)
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/fonts/ClearSans.ttf", __ASSET__assets_fonts_clearsans_ttf);
		type.set ("assets/fonts/ClearSans.ttf", AssetType.FONT);
		className.set ("assets/fonts/CourierNew.ttf", __ASSET__assets_fonts_couriernew_ttf);
		type.set ("assets/fonts/CourierNew.ttf", AssetType.FONT);
		className.set ("assets/images/decoration/decoration_clouds.png", __ASSET__assets_images_decoration_decoration_clouds_png);
		type.set ("assets/images/decoration/decoration_clouds.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream0.png", __ASSET__assets_images_dream_dream0_png);
		type.set ("assets/images/dream/dream0.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream1.png", __ASSET__assets_images_dream_dream1_png);
		type.set ("assets/images/dream/dream1.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream10.png", __ASSET__assets_images_dream_dream10_png);
		type.set ("assets/images/dream/dream10.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream2.png", __ASSET__assets_images_dream_dream2_png);
		type.set ("assets/images/dream/dream2.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream3.png", __ASSET__assets_images_dream_dream3_png);
		type.set ("assets/images/dream/dream3.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream4.png", __ASSET__assets_images_dream_dream4_png);
		type.set ("assets/images/dream/dream4.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream5.png", __ASSET__assets_images_dream_dream5_png);
		type.set ("assets/images/dream/dream5.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream6.png", __ASSET__assets_images_dream_dream6_png);
		type.set ("assets/images/dream/dream6.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream7.png", __ASSET__assets_images_dream_dream7_png);
		type.set ("assets/images/dream/dream7.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream8.png", __ASSET__assets_images_dream_dream8_png);
		type.set ("assets/images/dream/dream8.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream9.png", __ASSET__assets_images_dream_dream9_png);
		type.set ("assets/images/dream/dream9.png", AssetType.IMAGE);
		className.set ("assets/images/dream/dream_bg.png", __ASSET__assets_images_dream_dream_bg_png);
		type.set ("assets/images/dream/dream_bg.png", AssetType.IMAGE);
		className.set ("assets/images/drive/drive_car.png", __ASSET__assets_images_drive_drive_car_png);
		type.set ("assets/images/drive/drive_car.png", AssetType.IMAGE);
		className.set ("assets/images/drive/drive_map.png", __ASSET__assets_images_drive_drive_map_png);
		type.set ("assets/images/drive/drive_map.png", AssetType.IMAGE);
		className.set ("assets/images/drive/drive_marker.png", __ASSET__assets_images_drive_drive_marker_png);
		type.set ("assets/images/drive/drive_marker.png", AssetType.IMAGE);
		className.set ("assets/images/fuck/fuck_bg.png", __ASSET__assets_images_fuck_fuck_bg_png);
		type.set ("assets/images/fuck/fuck_bg.png", AssetType.IMAGE);
		className.set ("assets/images/fuck/fuck_light.png", __ASSET__assets_images_fuck_fuck_light_png);
		type.set ("assets/images/fuck/fuck_light.png", AssetType.IMAGE);
		className.set ("assets/images/give_up/give_up_bg.png", __ASSET__assets_images_give_up_give_up_bg_png);
		type.set ("assets/images/give_up/give_up_bg.png", AssetType.IMAGE);
		className.set ("assets/images/give_up/give_up_flash.png", __ASSET__assets_images_give_up_give_up_flash_png);
		type.set ("assets/images/give_up/give_up_flash.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/keys/keys_A.png", __ASSET__assets_images_keys_keys_a_png);
		type.set ("assets/images/keys/keys_A.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_D.png", __ASSET__assets_images_keys_keys_d_png);
		type.set ("assets/images/keys/keys_D.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_down.png", __ASSET__assets_images_keys_keys_down_png);
		type.set ("assets/images/keys/keys_down.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_left.png", __ASSET__assets_images_keys_keys_left_png);
		type.set ("assets/images/keys/keys_left.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_one.png", __ASSET__assets_images_keys_keys_one_png);
		type.set ("assets/images/keys/keys_one.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_right.png", __ASSET__assets_images_keys_keys_right_png);
		type.set ("assets/images/keys/keys_right.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_S.png", __ASSET__assets_images_keys_keys_s_png);
		type.set ("assets/images/keys/keys_S.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_two.png", __ASSET__assets_images_keys_keys_two_png);
		type.set ("assets/images/keys/keys_two.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_up.png", __ASSET__assets_images_keys_keys_up_png);
		type.set ("assets/images/keys/keys_up.png", AssetType.IMAGE);
		className.set ("assets/images/keys/keys_W.png", __ASSET__assets_images_keys_keys_w_png);
		type.set ("assets/images/keys/keys_W.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_bg.png", __ASSET__assets_images_menu_menu_bg_png);
		type.set ("assets/images/menu/menu_bg.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_dream.png", __ASSET__assets_images_menu_menu_dream_png);
		type.set ("assets/images/menu/menu_dream.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_drive.png", __ASSET__assets_images_menu_menu_drive_png);
		type.set ("assets/images/menu/menu_drive.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_fuck.png", __ASSET__assets_images_menu_menu_fuck_png);
		type.set ("assets/images/menu/menu_fuck.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_give_up.png", __ASSET__assets_images_menu_menu_give_up_png);
		type.set ("assets/images/menu/menu_give_up.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_pen.png", __ASSET__assets_images_menu_menu_pen_png);
		type.set ("assets/images/menu/menu_pen.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_pray.png", __ASSET__assets_images_menu_menu_pray_png);
		type.set ("assets/images/menu/menu_pray.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_regret.png", __ASSET__assets_images_menu_menu_regret_png);
		type.set ("assets/images/menu/menu_regret.png", AssetType.IMAGE);
		className.set ("assets/images/menu/menu_wait.png", __ASSET__assets_images_menu_menu_wait_png);
		type.set ("assets/images/menu/menu_wait.png", AssetType.IMAGE);
		className.set ("assets/images/pray/pray_church.png", __ASSET__assets_images_pray_pray_church_png);
		type.set ("assets/images/pray/pray_church.png", AssetType.IMAGE);
		className.set ("assets/images/preloader/click.png", __ASSET__assets_images_preloader_click_png);
		type.set ("assets/images/preloader/click.png", AssetType.IMAGE);
		className.set ("assets/images/preloader/loaded.png", __ASSET__assets_images_preloader_loaded_png);
		type.set ("assets/images/preloader/loaded.png", AssetType.IMAGE);
		className.set ("assets/images/preloader/loading.png", __ASSET__assets_images_preloader_loading_png);
		type.set ("assets/images/preloader/loading.png", AssetType.IMAGE);
		className.set ("assets/images/regret/regret_bg.png", __ASSET__assets_images_regret_regret_bg_png);
		type.set ("assets/images/regret/regret_bg.png", AssetType.IMAGE);
		className.set ("assets/images/regret/regret_hanging_up.png", __ASSET__assets_images_regret_regret_hanging_up_png);
		type.set ("assets/images/regret/regret_hanging_up.png", AssetType.IMAGE);
		className.set ("assets/images/regret/regret_hung_up.png", __ASSET__assets_images_regret_regret_hung_up_png);
		type.set ("assets/images/regret/regret_hung_up.png", AssetType.IMAGE);
		className.set ("assets/images/regret/regret_on_phone.png", __ASSET__assets_images_regret_regret_on_phone_png);
		type.set ("assets/images/regret/regret_on_phone.png", AssetType.IMAGE);
		className.set ("assets/images/wait/wait_car.png", __ASSET__assets_images_wait_wait_car_png);
		type.set ("assets/images/wait/wait_car.png", AssetType.IMAGE);
		className.set ("assets/images/wait/wait_houses.png", __ASSET__assets_images_wait_wait_houses_png);
		type.set ("assets/images/wait/wait_houses.png", AssetType.IMAGE);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/dream/dream_bg.mp3", __ASSET__assets_sounds_dream_dream_bg_mp3);
		type.set ("assets/sounds/dream/dream_bg.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/dream/dream_hum.mp3", __ASSET__assets_sounds_dream_dream_hum_mp3);
		type.set ("assets/sounds/dream/dream_hum.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/dream/dream_hum_old.mp3", __ASSET__assets_sounds_dream_dream_hum_old_mp3);
		type.set ("assets/sounds/dream/dream_hum_old.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/drive/car_sound.mp3", __ASSET__assets_sounds_drive_car_sound_mp3);
		type.set ("assets/sounds/drive/car_sound.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/drive/car_sound.wav", __ASSET__assets_sounds_drive_car_sound_wav);
		type.set ("assets/sounds/drive/car_sound.wav", AssetType.SOUND);
		className.set ("assets/sounds/drive/car_sound_old.wav", __ASSET__assets_sounds_drive_car_sound_old_wav);
		type.set ("assets/sounds/drive/car_sound_old.wav", AssetType.SOUND);
		className.set ("assets/sounds/fuck/fuck_bg.mp3", __ASSET__assets_sounds_fuck_fuck_bg_mp3);
		type.set ("assets/sounds/fuck/fuck_bg.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fuck/fuck_man_1.mp3", __ASSET__assets_sounds_fuck_fuck_man_1_mp3);
		type.set ("assets/sounds/fuck/fuck_man_1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fuck/fuck_man_2.mp3", __ASSET__assets_sounds_fuck_fuck_man_2_mp3);
		type.set ("assets/sounds/fuck/fuck_man_2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fuck/fuck_man_3.mp3", __ASSET__assets_sounds_fuck_fuck_man_3_mp3);
		type.set ("assets/sounds/fuck/fuck_man_3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fuck/fuck_man_4.mp3", __ASSET__assets_sounds_fuck_fuck_man_4_mp3);
		type.set ("assets/sounds/fuck/fuck_man_4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fuck/fuck_woman_1.mp3", __ASSET__assets_sounds_fuck_fuck_woman_1_mp3);
		type.set ("assets/sounds/fuck/fuck_woman_1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fuck/fuck_woman_2.mp3", __ASSET__assets_sounds_fuck_fuck_woman_2_mp3);
		type.set ("assets/sounds/fuck/fuck_woman_2.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fuck/fuck_woman_3.mp3", __ASSET__assets_sounds_fuck_fuck_woman_3_mp3);
		type.set ("assets/sounds/fuck/fuck_woman_3.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/fuck/fuck_woman_4.mp3", __ASSET__assets_sounds_fuck_fuck_woman_4_mp3);
		type.set ("assets/sounds/fuck/fuck_woman_4.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/give_up/give_up_bg.mp3", __ASSET__assets_sounds_give_up_give_up_bg_mp3);
		type.set ("assets/sounds/give_up/give_up_bg.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/give_up/give_up_bg_old.mp3", __ASSET__assets_sounds_give_up_give_up_bg_old_mp3);
		type.set ("assets/sounds/give_up/give_up_bg_old.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/give_up/give_up_gunshot.mp3", __ASSET__assets_sounds_give_up_give_up_gunshot_mp3);
		type.set ("assets/sounds/give_up/give_up_gunshot.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/organ/A1.mp3", __ASSET__assets_sounds_pray_organ_a1_mp3);
		type.set ("assets/sounds/pray/organ/A1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/organ/B1.mp3", __ASSET__assets_sounds_pray_organ_b1_mp3);
		type.set ("assets/sounds/pray/organ/B1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/organ/C1.mp3", __ASSET__assets_sounds_pray_organ_c1_mp3);
		type.set ("assets/sounds/pray/organ/C1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/organ/D0.mp3", __ASSET__assets_sounds_pray_organ_d0_mp3);
		type.set ("assets/sounds/pray/organ/D0.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/organ/D1.mp3", __ASSET__assets_sounds_pray_organ_d1_mp3);
		type.set ("assets/sounds/pray/organ/D1.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/organ/E0.mp3", __ASSET__assets_sounds_pray_organ_e0_mp3);
		type.set ("assets/sounds/pray/organ/E0.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/organ/F0.mp3", __ASSET__assets_sounds_pray_organ_f0_mp3);
		type.set ("assets/sounds/pray/organ/F0.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/organ/G0.mp3", __ASSET__assets_sounds_pray_organ_g0_mp3);
		type.set ("assets/sounds/pray/organ/G0.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/pray_bg.mp3", __ASSET__assets_sounds_pray_pray_bg_mp3);
		type.set ("assets/sounds/pray/pray_bg.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/pray/pray_bg_old.mp3", __ASSET__assets_sounds_pray_pray_bg_old_mp3);
		type.set ("assets/sounds/pray/pray_bg_old.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/regret/regret_click.wav", __ASSET__assets_sounds_regret_regret_click_wav);
		type.set ("assets/sounds/regret/regret_click.wav", AssetType.SOUND);
		className.set ("assets/sounds/regret/regret_crickets.mp3", __ASSET__assets_sounds_regret_regret_crickets_mp3);
		type.set ("assets/sounds/regret/regret_crickets.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/regret/regret_disconnected.wav", __ASSET__assets_sounds_regret_regret_disconnected_wav);
		type.set ("assets/sounds/regret/regret_disconnected.wav", AssetType.SOUND);
		className.set ("assets/sounds/regret/regret_hang_up.mp3", __ASSET__assets_sounds_regret_regret_hang_up_mp3);
		type.set ("assets/sounds/regret/regret_hang_up.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/regret/regret_off_the_hook.mp3", __ASSET__assets_sounds_regret_regret_off_the_hook_mp3);
		type.set ("assets/sounds/regret/regret_off_the_hook.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/regret/regret_phone_ring_and_message.mp3", __ASSET__assets_sounds_regret_regret_phone_ring_and_message_mp3);
		type.set ("assets/sounds/regret/regret_phone_ring_and_message.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/regret/regret_phone_ring_and_message_old.mp3", __ASSET__assets_sounds_regret_regret_phone_ring_and_message_old_mp3);
		type.set ("assets/sounds/regret/regret_phone_ring_and_message_old.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/wait/wait_folk.mp3", __ASSET__assets_sounds_wait_wait_folk_mp3);
		type.set ("assets/sounds/wait/wait_folk.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/wait/wait_reich.mp3", __ASSET__assets_sounds_wait_wait_reich_mp3);
		type.set ("assets/sounds/wait/wait_reich.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/wait/wait_static.wav", __ASSET__assets_sounds_wait_wait_static_wav);
		type.set ("assets/sounds/wait/wait_static.wav", AssetType.SOUND);
		className.set ("Courier", __ASSET__assets_fonts_couriernew_ttf1);
		type.set ("Courier", AssetType.FONT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/fonts/ClearSans.ttf";
		className.set (id, __ASSET__assets_fonts_clearsans_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/CourierNew.ttf";
		className.set (id, __ASSET__assets_fonts_couriernew_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/decoration/decoration_clouds.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream10.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream6.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream7.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream8.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream9.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/dream/dream_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/drive/drive_car.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/drive/drive_map.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/drive/drive_marker.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fuck/fuck_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fuck/fuck_light.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/give_up/give_up_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/give_up/give_up_flash.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/keys/keys_A.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_D.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_one.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_S.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_two.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/keys/keys_W.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_dream.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_drive.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_fuck.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_give_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_pen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_pray.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_regret.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/menu/menu_wait.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pray/pray_church.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/preloader/click.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/preloader/loaded.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/preloader/loading.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/regret/regret_bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/regret/regret_hanging_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/regret/regret_hung_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/regret/regret_on_phone.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/wait/wait_car.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/wait/wait_houses.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/dream/dream_bg.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/dream/dream_hum.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/dream/dream_hum_old.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/drive/car_sound.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/drive/car_sound.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/drive/car_sound_old.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/fuck/fuck_bg.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fuck/fuck_man_1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fuck/fuck_man_2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fuck/fuck_man_3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fuck/fuck_man_4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fuck/fuck_woman_1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fuck/fuck_woman_2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fuck/fuck_woman_3.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/fuck/fuck_woman_4.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/give_up/give_up_bg.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/give_up/give_up_bg_old.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/give_up/give_up_gunshot.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/organ/A1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/organ/B1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/organ/C1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/organ/D0.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/organ/D1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/organ/E0.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/organ/F0.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/organ/G0.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/pray_bg.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/pray/pray_bg_old.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/regret/regret_click.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/regret/regret_crickets.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/regret/regret_disconnected.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/regret/regret_hang_up.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/regret/regret_off_the_hook.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/regret/regret_phone_ring_and_message.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/regret/regret_phone_ring_and_message_old.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/wait/wait_folk.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/wait/wait_reich.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/wait/wait_static.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "Courier";
		className.set (id, __ASSET__assets_fonts_couriernew_ttf1);
		
		type.set (id, AssetType.FONT);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		#else
		
		#if openfl
		
		
		openfl.text.Font.registerFont (__ASSET__assets_fonts_clearsans_ttf);
		openfl.text.Font.registerFont (__ASSET__assets_fonts_couriernew_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__assets_fonts_couriernew_ttf1);
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		/*var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/fonts/ClearSans.ttf", __ASSET__assets_fonts_clearsans_ttf);
		type.set ("assets/fonts/ClearSans.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/CourierNew.ttf", __ASSET__assets_fonts_couriernew_ttf);
		type.set ("assets/fonts/CourierNew.ttf", AssetType.FONT);
		
		className.set ("assets/images/decoration/decoration_clouds.png", __ASSET__assets_images_decoration_decoration_clouds_png);
		type.set ("assets/images/decoration/decoration_clouds.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream0.png", __ASSET__assets_images_dream_dream0_png);
		type.set ("assets/images/dream/dream0.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream1.png", __ASSET__assets_images_dream_dream1_png);
		type.set ("assets/images/dream/dream1.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream10.png", __ASSET__assets_images_dream_dream10_png);
		type.set ("assets/images/dream/dream10.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream2.png", __ASSET__assets_images_dream_dream2_png);
		type.set ("assets/images/dream/dream2.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream3.png", __ASSET__assets_images_dream_dream3_png);
		type.set ("assets/images/dream/dream3.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream4.png", __ASSET__assets_images_dream_dream4_png);
		type.set ("assets/images/dream/dream4.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream5.png", __ASSET__assets_images_dream_dream5_png);
		type.set ("assets/images/dream/dream5.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream6.png", __ASSET__assets_images_dream_dream6_png);
		type.set ("assets/images/dream/dream6.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream7.png", __ASSET__assets_images_dream_dream7_png);
		type.set ("assets/images/dream/dream7.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream8.png", __ASSET__assets_images_dream_dream8_png);
		type.set ("assets/images/dream/dream8.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream9.png", __ASSET__assets_images_dream_dream9_png);
		type.set ("assets/images/dream/dream9.png", AssetType.IMAGE);
		
		className.set ("assets/images/dream/dream_bg.png", __ASSET__assets_images_dream_dream_bg_png);
		type.set ("assets/images/dream/dream_bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/drive/drive_car.png", __ASSET__assets_images_drive_drive_car_png);
		type.set ("assets/images/drive/drive_car.png", AssetType.IMAGE);
		
		className.set ("assets/images/drive/drive_map.png", __ASSET__assets_images_drive_drive_map_png);
		type.set ("assets/images/drive/drive_map.png", AssetType.IMAGE);
		
		className.set ("assets/images/drive/drive_marker.png", __ASSET__assets_images_drive_drive_marker_png);
		type.set ("assets/images/drive/drive_marker.png", AssetType.IMAGE);
		
		className.set ("assets/images/fuck/fuck_bg.png", __ASSET__assets_images_fuck_fuck_bg_png);
		type.set ("assets/images/fuck/fuck_bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/fuck/fuck_light.png", __ASSET__assets_images_fuck_fuck_light_png);
		type.set ("assets/images/fuck/fuck_light.png", AssetType.IMAGE);
		
		className.set ("assets/images/give_up/give_up_bg.png", __ASSET__assets_images_give_up_give_up_bg_png);
		type.set ("assets/images/give_up/give_up_bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/give_up/give_up_flash.png", __ASSET__assets_images_give_up_give_up_flash_png);
		type.set ("assets/images/give_up/give_up_flash.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/keys/keys_A.png", __ASSET__assets_images_keys_keys_a_png);
		type.set ("assets/images/keys/keys_A.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_D.png", __ASSET__assets_images_keys_keys_d_png);
		type.set ("assets/images/keys/keys_D.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_down.png", __ASSET__assets_images_keys_keys_down_png);
		type.set ("assets/images/keys/keys_down.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_left.png", __ASSET__assets_images_keys_keys_left_png);
		type.set ("assets/images/keys/keys_left.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_one.png", __ASSET__assets_images_keys_keys_one_png);
		type.set ("assets/images/keys/keys_one.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_right.png", __ASSET__assets_images_keys_keys_right_png);
		type.set ("assets/images/keys/keys_right.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_S.png", __ASSET__assets_images_keys_keys_s_png);
		type.set ("assets/images/keys/keys_S.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_two.png", __ASSET__assets_images_keys_keys_two_png);
		type.set ("assets/images/keys/keys_two.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_up.png", __ASSET__assets_images_keys_keys_up_png);
		type.set ("assets/images/keys/keys_up.png", AssetType.IMAGE);
		
		className.set ("assets/images/keys/keys_W.png", __ASSET__assets_images_keys_keys_w_png);
		type.set ("assets/images/keys/keys_W.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_bg.png", __ASSET__assets_images_menu_menu_bg_png);
		type.set ("assets/images/menu/menu_bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_dream.png", __ASSET__assets_images_menu_menu_dream_png);
		type.set ("assets/images/menu/menu_dream.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_drive.png", __ASSET__assets_images_menu_menu_drive_png);
		type.set ("assets/images/menu/menu_drive.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_fuck.png", __ASSET__assets_images_menu_menu_fuck_png);
		type.set ("assets/images/menu/menu_fuck.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_give_up.png", __ASSET__assets_images_menu_menu_give_up_png);
		type.set ("assets/images/menu/menu_give_up.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_pen.png", __ASSET__assets_images_menu_menu_pen_png);
		type.set ("assets/images/menu/menu_pen.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_pray.png", __ASSET__assets_images_menu_menu_pray_png);
		type.set ("assets/images/menu/menu_pray.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_regret.png", __ASSET__assets_images_menu_menu_regret_png);
		type.set ("assets/images/menu/menu_regret.png", AssetType.IMAGE);
		
		className.set ("assets/images/menu/menu_wait.png", __ASSET__assets_images_menu_menu_wait_png);
		type.set ("assets/images/menu/menu_wait.png", AssetType.IMAGE);
		
		className.set ("assets/images/pray/pray_church.png", __ASSET__assets_images_pray_pray_church_png);
		type.set ("assets/images/pray/pray_church.png", AssetType.IMAGE);
		
		className.set ("assets/images/preloader/click.png", __ASSET__assets_images_preloader_click_png);
		type.set ("assets/images/preloader/click.png", AssetType.IMAGE);
		
		className.set ("assets/images/preloader/loaded.png", __ASSET__assets_images_preloader_loaded_png);
		type.set ("assets/images/preloader/loaded.png", AssetType.IMAGE);
		
		className.set ("assets/images/preloader/loading.png", __ASSET__assets_images_preloader_loading_png);
		type.set ("assets/images/preloader/loading.png", AssetType.IMAGE);
		
		className.set ("assets/images/regret/regret_bg.png", __ASSET__assets_images_regret_regret_bg_png);
		type.set ("assets/images/regret/regret_bg.png", AssetType.IMAGE);
		
		className.set ("assets/images/regret/regret_hanging_up.png", __ASSET__assets_images_regret_regret_hanging_up_png);
		type.set ("assets/images/regret/regret_hanging_up.png", AssetType.IMAGE);
		
		className.set ("assets/images/regret/regret_hung_up.png", __ASSET__assets_images_regret_regret_hung_up_png);
		type.set ("assets/images/regret/regret_hung_up.png", AssetType.IMAGE);
		
		className.set ("assets/images/regret/regret_on_phone.png", __ASSET__assets_images_regret_regret_on_phone_png);
		type.set ("assets/images/regret/regret_on_phone.png", AssetType.IMAGE);
		
		className.set ("assets/images/wait/wait_car.png", __ASSET__assets_images_wait_wait_car_png);
		type.set ("assets/images/wait/wait_car.png", AssetType.IMAGE);
		
		className.set ("assets/images/wait/wait_houses.png", __ASSET__assets_images_wait_wait_houses_png);
		type.set ("assets/images/wait/wait_houses.png", AssetType.IMAGE);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/dream/dream_bg.mp3", __ASSET__assets_sounds_dream_dream_bg_mp3);
		type.set ("assets/sounds/dream/dream_bg.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/dream/dream_hum.mp3", __ASSET__assets_sounds_dream_dream_hum_mp3);
		type.set ("assets/sounds/dream/dream_hum.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/dream/dream_hum_old.mp3", __ASSET__assets_sounds_dream_dream_hum_old_mp3);
		type.set ("assets/sounds/dream/dream_hum_old.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/drive/car_sound.mp3", __ASSET__assets_sounds_drive_car_sound_mp3);
		type.set ("assets/sounds/drive/car_sound.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/drive/car_sound.wav", __ASSET__assets_sounds_drive_car_sound_wav);
		type.set ("assets/sounds/drive/car_sound.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/drive/car_sound_old.wav", __ASSET__assets_sounds_drive_car_sound_old_wav);
		type.set ("assets/sounds/drive/car_sound_old.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/fuck/fuck_bg.mp3", __ASSET__assets_sounds_fuck_fuck_bg_mp3);
		type.set ("assets/sounds/fuck/fuck_bg.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fuck/fuck_man_1.mp3", __ASSET__assets_sounds_fuck_fuck_man_1_mp3);
		type.set ("assets/sounds/fuck/fuck_man_1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fuck/fuck_man_2.mp3", __ASSET__assets_sounds_fuck_fuck_man_2_mp3);
		type.set ("assets/sounds/fuck/fuck_man_2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fuck/fuck_man_3.mp3", __ASSET__assets_sounds_fuck_fuck_man_3_mp3);
		type.set ("assets/sounds/fuck/fuck_man_3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fuck/fuck_man_4.mp3", __ASSET__assets_sounds_fuck_fuck_man_4_mp3);
		type.set ("assets/sounds/fuck/fuck_man_4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fuck/fuck_woman_1.mp3", __ASSET__assets_sounds_fuck_fuck_woman_1_mp3);
		type.set ("assets/sounds/fuck/fuck_woman_1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fuck/fuck_woman_2.mp3", __ASSET__assets_sounds_fuck_fuck_woman_2_mp3);
		type.set ("assets/sounds/fuck/fuck_woman_2.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fuck/fuck_woman_3.mp3", __ASSET__assets_sounds_fuck_fuck_woman_3_mp3);
		type.set ("assets/sounds/fuck/fuck_woman_3.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/fuck/fuck_woman_4.mp3", __ASSET__assets_sounds_fuck_fuck_woman_4_mp3);
		type.set ("assets/sounds/fuck/fuck_woman_4.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/give_up/give_up_bg.mp3", __ASSET__assets_sounds_give_up_give_up_bg_mp3);
		type.set ("assets/sounds/give_up/give_up_bg.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/give_up/give_up_bg_old.mp3", __ASSET__assets_sounds_give_up_give_up_bg_old_mp3);
		type.set ("assets/sounds/give_up/give_up_bg_old.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/give_up/give_up_gunshot.mp3", __ASSET__assets_sounds_give_up_give_up_gunshot_mp3);
		type.set ("assets/sounds/give_up/give_up_gunshot.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/organ/A1.mp3", __ASSET__assets_sounds_pray_organ_a1_mp3);
		type.set ("assets/sounds/pray/organ/A1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/organ/B1.mp3", __ASSET__assets_sounds_pray_organ_b1_mp3);
		type.set ("assets/sounds/pray/organ/B1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/organ/C1.mp3", __ASSET__assets_sounds_pray_organ_c1_mp3);
		type.set ("assets/sounds/pray/organ/C1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/organ/D0.mp3", __ASSET__assets_sounds_pray_organ_d0_mp3);
		type.set ("assets/sounds/pray/organ/D0.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/organ/D1.mp3", __ASSET__assets_sounds_pray_organ_d1_mp3);
		type.set ("assets/sounds/pray/organ/D1.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/organ/E0.mp3", __ASSET__assets_sounds_pray_organ_e0_mp3);
		type.set ("assets/sounds/pray/organ/E0.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/organ/F0.mp3", __ASSET__assets_sounds_pray_organ_f0_mp3);
		type.set ("assets/sounds/pray/organ/F0.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/organ/G0.mp3", __ASSET__assets_sounds_pray_organ_g0_mp3);
		type.set ("assets/sounds/pray/organ/G0.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/pray_bg.mp3", __ASSET__assets_sounds_pray_pray_bg_mp3);
		type.set ("assets/sounds/pray/pray_bg.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/pray/pray_bg_old.mp3", __ASSET__assets_sounds_pray_pray_bg_old_mp3);
		type.set ("assets/sounds/pray/pray_bg_old.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/regret/regret_click.wav", __ASSET__assets_sounds_regret_regret_click_wav);
		type.set ("assets/sounds/regret/regret_click.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/regret/regret_crickets.mp3", __ASSET__assets_sounds_regret_regret_crickets_mp3);
		type.set ("assets/sounds/regret/regret_crickets.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/regret/regret_disconnected.wav", __ASSET__assets_sounds_regret_regret_disconnected_wav);
		type.set ("assets/sounds/regret/regret_disconnected.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/regret/regret_hang_up.mp3", __ASSET__assets_sounds_regret_regret_hang_up_mp3);
		type.set ("assets/sounds/regret/regret_hang_up.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/regret/regret_off_the_hook.mp3", __ASSET__assets_sounds_regret_regret_off_the_hook_mp3);
		type.set ("assets/sounds/regret/regret_off_the_hook.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/regret/regret_phone_ring_and_message.mp3", __ASSET__assets_sounds_regret_regret_phone_ring_and_message_mp3);
		type.set ("assets/sounds/regret/regret_phone_ring_and_message.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/regret/regret_phone_ring_and_message_old.mp3", __ASSET__assets_sounds_regret_regret_phone_ring_and_message_old_mp3);
		type.set ("assets/sounds/regret/regret_phone_ring_and_message_old.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/wait/wait_folk.mp3", __ASSET__assets_sounds_wait_wait_folk_mp3);
		type.set ("assets/sounds/wait/wait_folk.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/wait/wait_reich.mp3", __ASSET__assets_sounds_wait_wait_reich_mp3);
		type.set ("assets/sounds/wait/wait_reich.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/wait/wait_static.wav", __ASSET__assets_sounds_wait_wait_static_wav);
		type.set ("assets/sounds/wait/wait_static.wav", AssetType.SOUND);
		
		className.set ("Courier", __ASSET__assets_fonts_couriernew_ttf1);
		type.set ("Courier", AssetType.FONT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		*/
		var useManifest = true;
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		//return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		//else 
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_clearsans_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_couriernew_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_images_decoration_decoration_clouds_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_dream_dream_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_drive_drive_car_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_drive_drive_map_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_drive_drive_marker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fuck_fuck_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fuck_fuck_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_give_up_give_up_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_give_up_give_up_flash_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_d_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_one_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_s_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_two_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_keys_keys_w_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_dream_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_drive_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_fuck_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_give_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_pen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_pray_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_regret_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_menu_menu_wait_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pray_pray_church_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_preloader_click_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_preloader_loaded_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_preloader_loading_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_regret_regret_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_regret_regret_hanging_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_regret_regret_hung_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_regret_regret_on_phone_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_wait_wait_car_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_wait_wait_houses_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_dream_dream_bg_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_dream_dream_hum_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_dream_dream_hum_old_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_drive_car_sound_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_drive_car_sound_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_drive_car_sound_old_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_bg_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_man_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_man_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_man_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_man_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_woman_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_woman_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_woman_3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_fuck_fuck_woman_4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_give_up_give_up_bg_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_give_up_give_up_bg_old_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_give_up_give_up_gunshot_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_organ_a1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_organ_b1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_organ_c1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_organ_d0_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_organ_d1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_organ_e0_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_organ_f0_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_organ_g0_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_pray_bg_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pray_pray_bg_old_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_regret_regret_click_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_regret_regret_crickets_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_regret_regret_disconnected_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_regret_regret_hang_up_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_regret_regret_off_the_hook_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_regret_regret_phone_ring_and_message_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_regret_regret_phone_ring_and_message_old_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_wait_wait_folk_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_wait_wait_reich_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_wait_wait_static_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_couriernew_ttf1 extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5

#if openfl

@:keep #if display private #end class __ASSET__assets_fonts_clearsans_ttf extends openfl.text.Font { public function new () { super (); fontName = "Clear Sans"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_couriernew_ttf extends openfl.text.Font { public function new () { super (); fontName = "Courier New Bold"; } } 


























































































@:keep #if display private #end class __ASSET__assets_fonts_couriernew_ttf1 extends openfl.text.Font { public function new () { super (); fontName = "Courier New Bold"; } } 



#end

#else

#if openfl
class __ASSET__assets_fonts_clearsans_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/ClearSans.ttf"; fontName = "Clear Sans"; }}
class __ASSET__assets_fonts_couriernew_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/CourierNew.ttf"; fontName = "Courier New Bold"; }}
class __ASSET__assets_fonts_couriernew_ttf1 extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/CourierNew.ttf"; fontName = "Courier New Bold"; }}

#end

#if (windows || mac || linux)

//
//@:file("assets/data/data-goes-here.txt") class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
//@:font("assets/fonts/ClearSans.ttf") class __ASSET__assets_fonts_clearsans_ttf extends openfl.text.Font {}
//@:font("assets/fonts/CourierNew.ttf") class __ASSET__assets_fonts_couriernew_ttf extends openfl.text.Font {}
//@:bitmap("assets/images/decoration/decoration_clouds.png") class __ASSET__assets_images_decoration_decoration_clouds_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream0.png") class __ASSET__assets_images_dream_dream0_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream1.png") class __ASSET__assets_images_dream_dream1_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream10.png") class __ASSET__assets_images_dream_dream10_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream2.png") class __ASSET__assets_images_dream_dream2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream3.png") class __ASSET__assets_images_dream_dream3_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream4.png") class __ASSET__assets_images_dream_dream4_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream5.png") class __ASSET__assets_images_dream_dream5_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream6.png") class __ASSET__assets_images_dream_dream6_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream7.png") class __ASSET__assets_images_dream_dream7_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream8.png") class __ASSET__assets_images_dream_dream8_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream9.png") class __ASSET__assets_images_dream_dream9_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/dream/dream_bg.png") class __ASSET__assets_images_dream_dream_bg_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/drive/drive_car.png") class __ASSET__assets_images_drive_drive_car_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/drive/drive_map.png") class __ASSET__assets_images_drive_drive_map_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/drive/drive_marker.png") class __ASSET__assets_images_drive_drive_marker_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/fuck/fuck_bg.png") class __ASSET__assets_images_fuck_fuck_bg_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/fuck/fuck_light.png") class __ASSET__assets_images_fuck_fuck_light_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/give_up/give_up_bg.png") class __ASSET__assets_images_give_up_give_up_bg_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/give_up/give_up_flash.png") class __ASSET__assets_images_give_up_give_up_flash_png extends openfl.display.BitmapData {}
//@:file("assets/images/images-go-here.txt") class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
//@:bitmap("assets/images/keys/keys_A.png") class __ASSET__assets_images_keys_keys_a_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_D.png") class __ASSET__assets_images_keys_keys_d_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_down.png") class __ASSET__assets_images_keys_keys_down_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_left.png") class __ASSET__assets_images_keys_keys_left_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_one.png") class __ASSET__assets_images_keys_keys_one_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_right.png") class __ASSET__assets_images_keys_keys_right_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_S.png") class __ASSET__assets_images_keys_keys_s_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_two.png") class __ASSET__assets_images_keys_keys_two_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_up.png") class __ASSET__assets_images_keys_keys_up_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/keys/keys_W.png") class __ASSET__assets_images_keys_keys_w_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_bg.png") class __ASSET__assets_images_menu_menu_bg_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_dream.png") class __ASSET__assets_images_menu_menu_dream_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_drive.png") class __ASSET__assets_images_menu_menu_drive_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_fuck.png") class __ASSET__assets_images_menu_menu_fuck_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_give_up.png") class __ASSET__assets_images_menu_menu_give_up_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_pen.png") class __ASSET__assets_images_menu_menu_pen_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_pray.png") class __ASSET__assets_images_menu_menu_pray_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_regret.png") class __ASSET__assets_images_menu_menu_regret_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/menu/menu_wait.png") class __ASSET__assets_images_menu_menu_wait_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/pray/pray_church.png") class __ASSET__assets_images_pray_pray_church_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/preloader/click.png") class __ASSET__assets_images_preloader_click_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/preloader/loaded.png") class __ASSET__assets_images_preloader_loaded_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/preloader/loading.png") class __ASSET__assets_images_preloader_loading_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/regret/regret_bg.png") class __ASSET__assets_images_regret_regret_bg_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/regret/regret_hanging_up.png") class __ASSET__assets_images_regret_regret_hanging_up_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/regret/regret_hung_up.png") class __ASSET__assets_images_regret_regret_hung_up_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/regret/regret_on_phone.png") class __ASSET__assets_images_regret_regret_on_phone_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/wait/wait_car.png") class __ASSET__assets_images_wait_wait_car_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/wait/wait_houses.png") class __ASSET__assets_images_wait_wait_houses_png extends openfl.display.BitmapData {}
//@:file("assets/music/music-goes-here.txt") class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
//@:sound("assets/sounds/dream/dream_bg.mp3") class __ASSET__assets_sounds_dream_dream_bg_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/dream/dream_hum.mp3") class __ASSET__assets_sounds_dream_dream_hum_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/dream/dream_hum_old.mp3") class __ASSET__assets_sounds_dream_dream_hum_old_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/drive/car_sound.mp3") class __ASSET__assets_sounds_drive_car_sound_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/drive/car_sound.wav") class __ASSET__assets_sounds_drive_car_sound_wav extends openfl.media.Sound {}
//@:sound("assets/sounds/drive/car_sound_old.wav") class __ASSET__assets_sounds_drive_car_sound_old_wav extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_bg.mp3") class __ASSET__assets_sounds_fuck_fuck_bg_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_man_1.mp3") class __ASSET__assets_sounds_fuck_fuck_man_1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_man_2.mp3") class __ASSET__assets_sounds_fuck_fuck_man_2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_man_3.mp3") class __ASSET__assets_sounds_fuck_fuck_man_3_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_man_4.mp3") class __ASSET__assets_sounds_fuck_fuck_man_4_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_woman_1.mp3") class __ASSET__assets_sounds_fuck_fuck_woman_1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_woman_2.mp3") class __ASSET__assets_sounds_fuck_fuck_woman_2_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_woman_3.mp3") class __ASSET__assets_sounds_fuck_fuck_woman_3_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/fuck/fuck_woman_4.mp3") class __ASSET__assets_sounds_fuck_fuck_woman_4_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/give_up/give_up_bg.mp3") class __ASSET__assets_sounds_give_up_give_up_bg_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/give_up/give_up_bg_old.mp3") class __ASSET__assets_sounds_give_up_give_up_bg_old_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/give_up/give_up_gunshot.mp3") class __ASSET__assets_sounds_give_up_give_up_gunshot_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/organ/A1.mp3") class __ASSET__assets_sounds_pray_organ_a1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/organ/B1.mp3") class __ASSET__assets_sounds_pray_organ_b1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/organ/C1.mp3") class __ASSET__assets_sounds_pray_organ_c1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/organ/D0.mp3") class __ASSET__assets_sounds_pray_organ_d0_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/organ/D1.mp3") class __ASSET__assets_sounds_pray_organ_d1_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/organ/E0.mp3") class __ASSET__assets_sounds_pray_organ_e0_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/organ/F0.mp3") class __ASSET__assets_sounds_pray_organ_f0_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/organ/G0.mp3") class __ASSET__assets_sounds_pray_organ_g0_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/pray_bg.mp3") class __ASSET__assets_sounds_pray_pray_bg_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/pray/pray_bg_old.mp3") class __ASSET__assets_sounds_pray_pray_bg_old_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/regret/regret_click.wav") class __ASSET__assets_sounds_regret_regret_click_wav extends openfl.media.Sound {}
//@:sound("assets/sounds/regret/regret_crickets.mp3") class __ASSET__assets_sounds_regret_regret_crickets_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/regret/regret_disconnected.wav") class __ASSET__assets_sounds_regret_regret_disconnected_wav extends openfl.media.Sound {}
//@:sound("assets/sounds/regret/regret_hang_up.mp3") class __ASSET__assets_sounds_regret_regret_hang_up_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/regret/regret_off_the_hook.mp3") class __ASSET__assets_sounds_regret_regret_off_the_hook_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/regret/regret_phone_ring_and_message.mp3") class __ASSET__assets_sounds_regret_regret_phone_ring_and_message_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/regret/regret_phone_ring_and_message_old.mp3") class __ASSET__assets_sounds_regret_regret_phone_ring_and_message_old_mp3 extends openfl.media.Sound {}
//@:file("assets/sounds/sounds-go-here.txt") class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
//@:sound("assets/sounds/wait/wait_folk.mp3") class __ASSET__assets_sounds_wait_wait_folk_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/wait/wait_reich.mp3") class __ASSET__assets_sounds_wait_wait_reich_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/wait/wait_static.wav") class __ASSET__assets_sounds_wait_wait_static_wav extends openfl.media.Sound {}
//@:font("assets/fonts/CourierNew.ttf") class __ASSET__assets_fonts_couriernew_ttf1 extends openfl.text.Font {}
//@:sound("/usr/lib/haxe/lib/flixel/3,3,6/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends openfl.media.Sound {}
//@:sound("/usr/lib/haxe/lib/flixel/3,3,6/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends openfl.media.Sound {}
//
//

#end

#end
#end

