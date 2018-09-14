package;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Spirit extends FlxSprite {
    public var speed: Float = 300;

    public function new() {
        super();
        makeGraphic(16, 16, FlxColor.RED);
    }

    override public function update(elapsed: Float): Void {
        move();
        super.update(elapsed);
    }

    private function move(): Void {
        velocity.set(speed, 0);
    }
}
