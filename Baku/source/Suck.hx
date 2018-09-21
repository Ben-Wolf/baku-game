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
        // makeGraphic(length, width, FlxColor.WHITE);
        drag.x = drag.y = 2000;
        setSize(8, 14);
        offset.set(4, 2);
        setFacingFlip(FlxObject.LEFT, true, false);
        setFacingFlip(FlxObject.RIGHT, false, false);
        animation.add("lr", [0, 1, 2, 3, 4], 0, false);
        animation.add("up", [0, 1, 2, 3, 4], 0, false);
        animation.add("down", [0, 1, 2, 3, 4], 0, false);
    }

    override public function update(elapsed: Float): Void {
        super.update(elapsed);
    }

    public function left() {
        loadGraphic("assets/images/suck_r.png", true, 32, 32);
        facing = FlxObject.LEFT;
        animation.play("lr");
    }

    public function right() {
        loadGraphic("assets/images/suck_r.png", true, 32, 32);
        facing = FlxObject.RIGHT;
        animation.play("lr");
    }

    public function up() {
        loadGraphic("assets/images/suck_u.png", true, 32, 32);
        facing = FlxObject.UP;
        animation.play("up");
    }

    public function down() {
        loadGraphic("assets/images/suck_d.png", true, 32, 32);
        facing = FlxObject.DOWN;
        animation.play("down");
    }
}
