package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;

class MapState extends FlxState {
	var _level1button:FlxSprite;
	var _level1outline:FlxSprite;
	var _level2button:FlxSprite;
	var _level2outline:FlxSprite;
	override public function create():Void {
		super.create();
		bgColor = 0xFF546e99;
		
		//init buttons
		_level1button = new FlxSprite(100, 100);
		_level1button.makeGraphic(32, 32, 0xFFaa1111);
		add(_level1button);
		_level2button = new FlxSprite(200, 100);
		_level2button.makeGraphic(32, 32, 0xFF11aa11);
		add(_level2button);
		
		//init outlines
		_level1outline = new FlxSprite(91, 91);
		_level1outline.makeGraphic(50, 50, 0xFFaa1111);
		add(_level1outline);
		_level1outline.alpha = 0;
		_level2outline = new FlxSprite(191, 91);
		_level2outline.makeGraphic(50, 50, 0xFF11aa11);
		add(_level2outline);
		_level2outline.alpha = 0;
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		
		FlxMouseEventManager.add(_level1button, clicked, null , hover, out);
		FlxMouseEventManager.add(_level2button, clicked, null , hover, out);
	}
	
	public function clicked(s:FlxSprite){
		switch(s.x){
			case 100:
				trace("loading level 1");
			case 200:
				trace("loading level 2");
		}
	}
	
	public function hover(s:FlxSprite){
		switch(s.x){
			case 100:
				_level1outline.alpha = 1;
			case 200:
				_level2outline.alpha = 1;
		}
	}
	
	public function out(s:FlxSprite){
		switch(s.x){
			case 100:
				_level1outline.alpha = 0;
			case 200:
				_level2outline.alpha = 0;
		}
	}
}