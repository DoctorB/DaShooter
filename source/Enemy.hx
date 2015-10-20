package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxVelocity;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;

class Enemy extends FlxSprite
{
 
    public function new(X:Float, Y:Float,Health:Float)
    {
        super(X,Y);
        health = Health;
        loadGraphic(Reg.ENEMY, true, 42, 52, true, "enemy");
    }

    override public function update():Void
    {
        super.update();
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