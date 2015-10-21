package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxVelocity;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;

class Bullet extends FlxSprite
{

    private var speed:Float;
    private var direction:Int;
    private var damage:Float;

    public function new(X:Float, Y:Float,Speed:Float,Direction:Int,Damage:Float)
    {
        super(X,Y);
        speed = Speed;
        direction = Direction;
        damage = Damage;
        loadGraphic(Reg.BULLET, true, 19, 5, true, "bullet");
    }

    override public function update(elapsed:Float):Void
    {
        if (direction == FlxObject.LEFT){
            velocity.x = -speed;     
        }
        if (direction == FlxObject.RIGHT){
            velocity.x = speed;     
        }
        if (direction == FlxObject.FLOOR){
            velocity.y = speed;     
        }
        if (direction == FlxObject.CEILING){
            velocity.y = -speed;     
        }
        super.update(elapsed);        
    }

    override public function destroy():Void
    {
        super.destroy();
    }

}