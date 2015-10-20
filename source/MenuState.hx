package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.group.FlxTypedGroup;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{

	//stage
	private var stage:TiledStage;
	var levelName:String = "level_1";

	public var player:Player;

	//bullets
	public var playerBullets:FlxTypedGroup<Bullet>;

	//enemies
	public var enemies:FlxTypedGroup<Enemy>;

	//blocks
	public var blocks:FlxTypedGroup<Block>;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{

		stage = new TiledStage("assets/data/stage/" + levelName + ".tmx");
 
		//adds stage tiles
		add(stage.scenarioTiles);

		enemies = new FlxTypedGroup<Enemy>();
		add(enemies);

		blocks = new FlxTypedGroup<Block>();
		add(blocks);

		playerBullets = new FlxTypedGroup<Bullet>();
		add(playerBullets);

		player = new Player(100,100,playerBullets);
		add(player);

		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}