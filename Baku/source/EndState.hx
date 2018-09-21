package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class EndState extends FlxState {
	var _winTimer:Float;
	var _winImage:FlxSprite;
	var _continueButton:FlxSprite;
	
	
	var _mapButton:MapButton;
	var _backdrop:FlxSprite;
	
	override public function new(won:Bool):Void{
		super();
		
		bgColor = 0xFFAA6e99;
		
		_backdrop = new FlxSprite(0, 0);
		if (won){
			_backdrop.loadGraphic("assets/images/baku_statue.png", true, 680, 453);
		}else{
			_backdrop.loadGraphic("assets/images/baku_statue.png", true, 800, 620);
		}
		_backdrop.animation.add("animate", [0, 1, 2], 6, false);
		add(_backdrop);
		
		//var _shards = new ShardsUI();
		//add(_shards);
		
		
		
	}
	
	override public function create():Void {
		super.create();
		_mapButton = new MapButton(100, 100, "assets/images/backtomapoutline.png", "MapState");
		_mapButton.addRelativeHitbox(1, 1, 100, 44);
		
		var tempsprite = new FlxSprite(101, 101);
		tempsprite.makeGraphic(100, 44, 0xFFAA1111);
		add(tempsprite);
		_mapButton.showHitbox();
		add(_mapButton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		_backdrop.animation.play("animate");
	}
}