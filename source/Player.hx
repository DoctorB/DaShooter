package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxVelocity;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;
import flixel.group.FlxTypedGroup;

class Player extends FlxSprite
{

    private static var SPEED:Float = 250;
    private var bulletArray:FlxTypedGroup<Bullet>;

    public function new(X:Float, Y:Float,playerBulletArray:FlxTypedGroup<Bullet>)
    {
        super(X,Y);
        loadGraphic(Reg.PLAYER, true, 38, 50, true, "player");
        bulletArray = playerBulletArray;
    }

    override public function update():Void
    {

        velocity.x = 0;
        velocity.y = 0;

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

        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }


    private function attack():Void{
        var newBullet = new Bullet(x + 38, y + 23, 500, FlxObject.RIGHT, 10);
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
}