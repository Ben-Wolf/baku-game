package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class Baku extends FlxSprite {
    public var speed: Float = 400;
    public var prevDIR: Int = 0; // Not sure what im doing -- will be used for skidding if we get to that
    public var sucking: Bool = false;

    public function new() {
        super();
        loadGraphic("assets/images/temp.png", true, 16, 16);
        drag.x = drag.y = 2000;
        setSize(8, 14);
        offset.set(4, 2);

        setFacingFlip(FlxObject.LEFT, false, false);
        setFacingFlip(FlxObject.RIGHT, true, false);
        animation.add("lr", [3, 4, 3, 5], 6, false);
        animation.add("u", [6, 7, 6, 8], 6, false);
        animation.add("d", [0, 1, 0, 2], 6, false);
    }

    override public function update(elapsed: Float): Void {
        if (!sucking) {
            move();
        } else {
            velocity.x = velocity.y = 0;
        }
        super.update(elapsed);
    }

    function move(): Void {
        var _up: Bool = false;
        var _down: Bool = false;
        var _left: Bool = false;
        var _right: Bool = false;

        _up = FlxG.keys.anyPressed([UP, W]);
        _down = FlxG.keys.anyPressed([DOWN, S]);
        _left = FlxG.keys.anyPressed([LEFT, A]);
        _right = FlxG.keys.anyPressed([RIGHT, D]);

        if (_up && _down) {
            _up = _down = false;
        }

        if (_left && _right) {
            _left = _right = false;
        }

        if (_up || _down || _left || _right) {
            var angle: Float = 0;
            if (_up) {
                angle = -90;
                facing = FlxObject.UP;
                prevDIR = 1;
            } else if (_down) {
                angle = 90;
                facing = FlxObject.DOWN;
                prevDIR = 2;
            } else if (_left) {
                angle = 180;
                facing = FlxObject.LEFT;
                prevDIR = 3;
            } else if (_right) {
                angle = 0;
                facing = FlxObject.RIGHT;
                prevDIR = 4;
            }

            velocity.set(speed, 0);
            velocity.rotate(FlxPoint.weak(0, 0), angle);

            if (velocity.x != 0 || velocity.y != 0 && touching == FlxObject.NONE) {
                switch (facing) {
                    case FlxObject.LEFT, FlxObject.RIGHT:
                        animation.play("lr");
                    case FlxObject.UP:
                        animation.play("u");
                    case FlxObject.DOWN:
                        animation.play("d");
                }
            }
        }

    }
}
