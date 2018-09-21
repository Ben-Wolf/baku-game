package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;

class Baku extends FlxSprite {
    public var speed: Float = 200;
    public var prevDIR: Int = 0; // Not sure what im doing -- will be used for skidding if we get to that
    public var sucking: Bool = false;

    public function new() {
        super();
		loadGraphic("assets/images/bakuanimationsv1.png", true, 64, 64);
        drag.x = drag.y = 1200;
        setFacingFlip(FlxObject.LEFT, true, false);
        setFacingFlip(FlxObject.RIGHT, false, false);
        animation.add("lr", [25, 26, 27, 28], 24, false);
        animation.add("u", [30, 31, 32, 33], 29, false);
        animation.add("d", [11, 12, 13, 14], 10, false);
		animation.add("lrs", [15, 16, 17, 18, 19, 20, 21, 22, 23], 24, false);
		animation.add("us", [1, 2, 3, 4, 5, 6, 7, 8], 29, false);
		animation.add("ds", [35, 36, 37, 38, 39, 40, 41, 42, 43], 10, false); 
		
	
		

    }

    override public function update(elapsed: Float): Void {
        if (!sucking) {
            move();
        } else {
            velocity.x = velocity.y = 0;
        }
        super.update(elapsed);
    }
	
	public function suckboi(): Void{
		
		switch (facing) 
		{
			case FlxObject.LEFT, FlxObject.RIGHT:
				animation.play("lrs");
			case  FlxObject.UP:
				animation.play("ds");
			case FlxObject.DOWN:
				animation.play("us");
				
		}
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
