package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/stage/level_1.tmx", "assets/data/stage/level_1.tmx");
			type.set ("assets/data/stage/level_1.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/sprite/bullet.png", "assets/images/sprite/bullet.png");
			type.set ("assets/images/sprite/bullet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite/enemy.png", "assets/images/sprite/enemy.png");
			type.set ("assets/images/sprite/enemy.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite/player.png", "assets/images/sprite/player.png");
			type.set ("assets/images/sprite/player.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/sprite/tile.png", "assets/images/sprite/tile.png");
			type.set ("assets/images/sprite/tile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tileset.png", "assets/images/tileset.png");
			type.set ("assets/images/tileset.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tileset_block.png", "assets/images/tileset_block.png");
			type.set ("assets/images/tileset_block.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/fonts/nokiafc22.ttf", "assets/fonts/nokiafc22.ttf");
			type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/fonts/arial.ttf", "assets/fonts/arial.ttf");
			type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
