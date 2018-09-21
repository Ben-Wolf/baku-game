package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;

class Globals{
	public static var level1State = 0;
	public static var level2State = 0;
	public static var level3State = 0;
	public static var level4State = 0;
	public static var level5State = 0;
	
	public static var goodDreams = 0;
	public static var badDreams = 0;
	
	public static function reset():Void{
		level1State = 0;
		level2State = 0;
		level3State = 0;
		level4State = 0;
		level5State = 0;
		goodDreams = 0;
		badDreams = 0;
	}
}