package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import flixel.system.FlxSound;

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

    // group that contains the explosions
    private var explosionPool:FlxTypedGroup<FlxSprite>;


	//screen
	public static var SCR_WIDTH = 640;
	public static var SCR_HEIGHT = 480;
	public var screenPositionX:Float = 0;
	public var screenSpeed:Float = 1;
	public var scroll:Bool = true;

	private var sndExplosion:FlxSound;


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

        // create a group which will contain the 
        explosionPool = new FlxTypedGroup<FlxSprite>();
        add(explosionPool);

		//loads stage objects
		stage.loadObjects(this);

		FlxG.camera.scroll = new FlxPoint(0,0);
		scroll = true;

		sndExplosion = FlxG.sound.load(Reg.EXPLOSION_SOUND);

		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
        if (sndExplosion != null) {
            sndExplosion.destroy();   
        }
        sndExplosion = null;
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		var newScroll = FlxG.camera.scroll;
		if (scroll){
			if (newScroll.x + SCR_WIDTH >= stage.fullWidth){
				scroll = false;
			}else{
				newScroll.x += screenSpeed;
				FlxG.camera.scroll = newScroll;
				player.x += screenSpeed;
			}			
		}

		
		//collides bullets with blocks
		FlxG.overlap(playerBullets,blocks,null,overlapped);

		//collides player with stage
		FlxG.overlap(stage.scenarioTiles, player, null, FlxObject.separate);

		//collides playerBullets with scenario
		FlxG.collide(stage.scenarioTiles,playerBullets,null);

		//collides playerBullets with enemies
		FlxG.overlap(playerBullets,enemies,null,overlapped);

		//player bullet update
		for (pb in playerBullets){
			//position
			pb.x += screenSpeed;

			//destroyed?
			if (pb.isTouching(FlxObject.ANY) || (pb.x > (newScroll.x + SCR_WIDTH))){
				playerBullets.remove(pb);
				pb.destroy();
			}
		}

		//player collision
		if (player.alive){
			FlxG.overlap(blocks,player,null,overlapped);
			FlxG.overlap(enemies,player,null,overlapped);
			if (player.isTouching(FlxObject.ANY)){
				player.killPlayer();
				this.getExplosion(player.x, player.y);
				GameOver();
			}
		}

		// if a explosion is alive and the animation is done, kill it!
		for(explosion in explosionPool) {
			if(explosion.alive && explosion.animation.finished) {
				explosion.kill();
			}
		}
	}

	private function overlapped(Sprite1:FlxObject, Sprite2:FlxObject):Bool
	{
		var sprite1ClassName:String = Type.getClassName(Type.getClass(Sprite1));
		var sprite2ClassName:String = Type.getClassName(Type.getClass(Sprite2));

		if (sprite1ClassName == "Bullet" && sprite2ClassName == "Enemy"){
			var b: Dynamic = cast(Sprite1,Bullet);
			var e: Dynamic = cast(Sprite2,Enemy);

			//damages enemy
			e.damage(b.damage);
			if (e.isDead()){
				trace("Enemy destroyed");
				enemies.remove(e);
				Sprite2.destroy();
			}

			//destroys bullet
			playerBullets.remove(b);
			Sprite1.destroy();

			return true;
		}

		if (sprite1ClassName == "Bullet" && sprite2ClassName == "Block"){
			var bullet: Dynamic = cast(Sprite1,Bullet);
			var block: Dynamic = cast(Sprite2,Block);

			//damages enemy
			block.damage(bullet.damage);
			if (block.isDestroyed()){
				this.getExplosion(block.x, block.y);
				blocks.remove(block);
				block.destroy();
			}

			//destroys bullet
			playerBullets.remove(bullet);
			bullet.destroy();

			return true;
		}

		if ((sprite1ClassName == "Enemy" || sprite1ClassName == "Block") && sprite2ClassName == "Player"){	
			player.killPlayer();
			this.getExplosion(player.x, player.y);
			GameOver();
			return true;
		}

		return false;
	}


private function getExplosion(x:Float, y:Float):FlxSprite {
		// get a dead explosion from the group
		var explosion:FlxSprite = cast explosionPool.getFirstDead();
		
		// if there aren't any, create a new one
		if(explosion == null) {
			trace("explosion == null");
			explosion = new FlxSprite();
	        explosion.loadGraphic(Reg.EXPLOSION, true, 256, 256, true, "explosion");
			explosion.animation.add("boom", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17], 60, false);
			explosionPool.add(explosion);
		}
		
		// revive the explosion
		explosion.revive();
		
		// set the explosions position to the given position
		explosion.x = x - 128;
		explosion.y = y - 128;
		
		// set rotation to a random value to add a little bit of variety
		explosion.angle = Std.random(360);
		
        sndExplosion.play(true);

		// play the animation
		explosion.animation.play("boom");
		
		return explosion;
	}

	private function GameOver():Void{
		trace("game over");
		scroll = false;
		FlxG.switchState(new TitleState());
	}
}