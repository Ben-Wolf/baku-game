package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;

class MapState extends FlxState {
	var _level1button:MapButton;
	var _level2button:MapButton;
	override public function create():Void {
		super.create();
		bgColor = 0xFF546e99;
		
		_level1button = new MapButton(100, 100, 0xFFaa1111 , "StartState");
		_level1button.addRelativeHitbox(9, 9, 32, 32);
		_level1button.showHitbox();
		add(_level1button);
		_level2button = new MapButton(200, 100, 0xFF11aa11 , "PlayState");
		_level2button.addRelativeHitbox(9, 9, 32, 32);
		_level2button.addRelativeHitbox(41, 29, 32, 32);
		_level2button.showHitbox();
		add(_level2button);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}