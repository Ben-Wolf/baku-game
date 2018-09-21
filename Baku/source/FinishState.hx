package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class FinishState extends FlxState {
	var _winTimer:Float;
	var _winImage:FlxSprite;
	var _continueButton:FlxSprite;
	
	
	var _mapButton:MapButton;
	var _backdrop:FlxSprite;
	
	override public function new():Void{
		super();
		
		bgColor = 0xFFAA6e99;
		
		_backdrop = new FlxSprite(0, 0);
		_backdrop.loadGraphic("assets/images/baku_statue.png", true, 680, 453);
		_backdrop.animation.add("animate", [0, 1, 2], 6, false);
		add(_backdrop);
		var _total:Int;
		_total = 0;
		if (Globals.level1State == 2){
			_total++;
		}
		if (Globals.level2State == 2){
			_total++;
		}
		if (Globals.level3State == 2){
			_total++;
		}
		if (Globals.level4State == 2){
			_total++;
		}
		if (Globals.level5State == 2){
			_total++;
		}
		var _endText = new flixel.text.FlxText(0, 0, 0, "You replaced " + _total + " dreams out of 5.", 32);
		_endText.screenCenter();
		add(_endText);
		
		
		
		
	}
	
	override public function create():Void {
		super.create();
		_mapButton = new MapButton(100, 100, "assets/images/backtomapoutline.png", "StartState");
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