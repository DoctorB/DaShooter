package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxVelocity;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.group.FlxGroup.FlxTypedGroup;

class Player extends FlxSprite
{

    private static var SPEED:Float = 250;
    private var bulletArray:FlxTypedGroup<Bullet>;
    

    public function new(X:Float, Y:Float,playerBulletArray:FlxTypedGroup<Bullet>)
    {
        super(X,Y);
        loadGraphic(Reg.PLAYER, true, 38, 50, true, "player");
        animation.add("fly", [0, 1, 2], 5, true);
        animation.play("fly"); 
        bulletArray = playerBulletArray;
    }

    override public function update(elapsed:Float):Void
    {

        velocity.x = 0;
        velocity.y = 0;

        if (alive) {
            //Input
            if (FlxG.keys.pressed.LEFT)
            {
                moveLeft();
            }

            if (FlxG.keys.pressed.RIGHT)
            {
                moveRight();
            }

            if (FlxG.keys.pressed.UP)
            {
                moveUp();
            }

            if (FlxG.keys.pressed.DOWN)
            {
                moveDown();
            }

            if (FlxG.keys.justPressed.A || FlxG.keys.justPressed.SPACE){
                attack();
            }
        }
        super.update(elapsed);
    }

    override public function destroy():Void
    {
        super.destroy();
    }


    private function attack():Void{
        var newBullet = new Bullet(x + 38, y + 23, 500, FlxObject.RIGHT, 25);
        bulletArray.add(newBullet);
    }

    private function moveRight():Void{
            velocity.x += SPEED;
    }

    private function moveLeft():Void{
            velocity.x -= SPEED;
    }

    private function moveUp():Void{
            velocity.y -= SPEED;
    }

    private function moveDown():Void{
            velocity.y += SPEED;
    }

    public function killPlayer():Void{
        alive = false;
        destroy();
    }
}

