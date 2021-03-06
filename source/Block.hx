package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.math.FlxVelocity;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;

class Block extends FlxSprite
{
    private static var GRAVITY:Float = 50;

    public function new(X:Float, Y:Float,Health:Float)
    {
        super(X,Y);
        health = Health;
        loadGraphic(Reg.BLOCK, true, 32, 32, true, "block");
        animation.add("blink", [0, 1], 5, true);
        animation.play("blink");
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

    public function isDestroyed():Bool{
        if (health <= 0){
            return true;
        }
        return false;
    }

}