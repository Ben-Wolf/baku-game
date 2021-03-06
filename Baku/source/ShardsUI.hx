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
		_goodSprite = new FlxSprite(FlxG.width - 45, 40);
		_goodSprite.loadGraphic("assets/images/gooddream.png");
		add(_goodSprite);
		
		_goodText = new FlxText(FlxG.width - 80, 35);
		_goodText.size = 30;
		add(_goodText);
		
		_badSprite = new FlxSprite(FlxG.width - 145, 40);
		_badSprite.loadGraphic("assets/images/baddream.png");
		add(_badSprite);
		
		_badText = new FlxText(FlxG.width - 180, 35);
		_badText.size = 30;
		add(_badText);
	}


	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		_goodText.text = "" + Globals.goodDreams;
		_badText.text = "" + Globals.badDreams;
	}
}