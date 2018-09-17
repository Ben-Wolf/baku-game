package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
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
        makeGraphic(16, 16, FlxColor.RED);
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
