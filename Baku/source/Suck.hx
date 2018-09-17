package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;

class Suck extends FlxSprite {

    public function new(X, Y, length: Int, width: Int) {
        super(X, Y);
        makeGraphic(length, width, FlxColor.WHITE);
        drag.x = drag.y = 2000;
        setSize(8, 14);
        offset.set(4, 2);
    }

    override public function update(elapsed: Float): Void {
        super.update(elapsed);
    }
}
