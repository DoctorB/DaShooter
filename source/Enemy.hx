package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxVelocity;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;

class Enemy extends FlxSprite
{
 
    public function new(X:Float, Y:Float,Health:Float)
    {
        super(X,Y);
        health = Health;
        loadGraphic(Reg.ENEMY, true, 42, 52, true, "enemy");
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    public function damage(damage:Float){
        health -= damage;
    }

    public function isDead():Bool{
        if (health <= 0){
            return true;
        }
        return false;
    }
}