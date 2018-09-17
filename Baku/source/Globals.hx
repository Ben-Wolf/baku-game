package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;

class Globals{
	public static var level1State = 0;
	public static var level2State = 0;
	
	public static var goodDreams = 0;
	public static var badDreams = 0;
	
	public static function reset():Void{
		level1State = 0;
		level2State = 0;
		goodDreams = 0;
		badDreams = 0;
	}
}