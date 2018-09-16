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
		add(_level1button);
		_level2button = new MapButton(200, 100, 0xFF11aa11 , "PlayState");
		add(_level2button);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}