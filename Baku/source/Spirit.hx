package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.math.FlxPoint;

class Spirit extends FlxSprite {
    public var speed: Float = 300;
    public var playerPos(default, null):FlxPoint;
    var _moveDir: Float;
    var _idleTimer: Float;

    public function new() {
        super();
		loadGraphic("assets/images/spirit2.png", true, 32, 32);
        animation.add("wiggle", [0, 1], true, true);
        animation.play("wiggle");
        _idleTimer = 0;
        playerPos = FlxPoint.get();
    }

    override public function update(elapsed: Float): Void {
        move();
        super.update(elapsed);
    }

    private function move(): Void {
        if (_idleTimer > 0) {

            _idleTimer -= FlxG.random.int(0, 2);
        } else {
            _moveDir = FlxG.random.int(0, 8) * 45;

            velocity.set(speed * 0.4, 0);
            velocity.rotate(FlxPoint.weak(), _moveDir);
            _idleTimer = FlxG.random.int(50, 100);
        }
    }
}
