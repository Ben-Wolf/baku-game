package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import Globals.*;

class ShardsUI extends FlxState {
	var _goodSprite:FlxSprite;
	var _badSprite:FlxSprite;
	var _goodText:FlxText;
	var _badText:FlxText;
	function new():Void {
		super();
		//add images and numbers to represent good and bad shards(inventory)
		_goodSprite = new FlxSprite(FlxG.width - 60, 10);
		_goodSprite.makeGraphic(50, 50, 0xFF11AA11);
		add(_goodSprite);
		
		_goodText = new FlxText(FlxG.width - 100, 5);
		_goodText.size = 50;
		add(_goodText);
		
		_badSprite = new FlxSprite(FlxG.width - 180, 10);
		_badSprite.makeGraphic(50, 50, 0xFFAA1111);
		add(_badSprite);
		
		_badText = new FlxText(FlxG.width - 220, 5);
		_badText.size = 50;
		add(_badText);
	}


	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		_goodText.text = "" + Globals.goodDreams;
		_badText.text = "" + Globals.badDreams;
	}
}