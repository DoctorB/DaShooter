package;

import flixel.util.FlxSave;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	public static inline var PLAYER:String = "assets/images/sprite/player.png";
	public static inline var BULLET:String = "assets/images/sprite/bullet.png";
	public static inline var ENEMY:String = "assets/images/sprite/enemy.png";
	public static inline var EXPLOSION:String = "assets/images/sprite/explosion.png";
	public static inline var BLOCK:String = "assets/images/tileset_block.png";
	public static inline var PATH_TILESHEETS:String = "assets/images/";
	public static inline var TITLE_LOGO:String = "assets/images/logo.png";

	public static inline var FIRE_SOUND:String = "assets/sounds/sfx_laser2.ogg";
	public static inline var EXPLOSION_SOUND:String = "assets/sounds/explosion.wav";

	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];
}