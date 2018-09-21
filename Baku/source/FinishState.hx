package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class FinishState extends FlxState {
	var _winTimer:Float;
	var _continueButton:MapButton;
	
	var _backdrop:FlxSprite;
	
	override public function new():Void{
		super();
		
		bgColor = 0xFFd8c7f4;
		
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
		var _Text2 = new flixel.text.FlxText(0, 0, 0, "Baku was full.", 32);
		_Text2.setFormat(32, 0xFF000000);
		_Text2.screenCenter();
		_Text2.y = _Text2.y - 100;
		add(_Text2);
		
		var _Text1 = new flixel.text.FlxText(0, 0, 0, "He moved on to another neighborhood...", 20);
		_Text1.setFormat(20, 0xFF000000);
		_Text1.screenCenter();
		_Text1.y = _Text1.y - 50;
		add(_Text1);
		var _endText = new flixel.text.FlxText(0, 0, 0, "You replaced " + _total + " dreams out of 5.", 32);
		_endText.setFormat(32, 0xFF000000);
		_endText.screenCenter();
		add(_endText);
		
	}
	
	override public function create():Void {
		super.create();
		
		_continueButton = new MapButton(350, 360, "assets/images/backtomapoutline.png", "StartState");
		var _spr = new FlxSprite(351, 361);
		_spr.loadGraphic("assets/images/continuebutton.png");
		add(_spr);
		_continueButton.addRelativeHitbox(1, 1, 100, 44);
		
		_continueButton.showHitbox();
		add(_continueButton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}