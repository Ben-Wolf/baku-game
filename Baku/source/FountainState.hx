package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class FountainState extends FlxState {
	var _mapButton:MapButton;
	var _exchangeButton:FlxSprite;
	var _exitbutton:ExitButton;
	override public function create():Void {
		super.create();
		bgColor = 0xFFAA6e99;
		
		var _shards = new ShardsUI();
		add(_shards);
		
		_exitbutton = new ExitButton(0.5);
		add(_exitbutton);
		
		_mapButton = new MapButton(100, 100, 0xFFAA1111, "MapState");
		_mapButton.addRelativeHitbox(9, 9, 32, 32);
		_mapButton.showHitbox();
		add(_mapButton);
		
		_exchangeButton = new FlxSprite(100, 200);
		_exchangeButton.makeGraphic(50, 50, 0xFFAAAAAA);
		_exchangeButton.alpha = .5;
		FlxMouseEventManager.add(_exchangeButton, exchangeFragments, null , hover, out);
		
		add(_exchangeButton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
	
	public function hover(s:FlxSprite){
		_exchangeButton.alpha = 1;
	}
	
	public function out(s:FlxSprite){
		_exchangeButton.alpha = .5;
	}
	
	public function exchangeFragments(x:FlxSprite):Bool{
		//exchange if requirements are met
		return false;
	}
}