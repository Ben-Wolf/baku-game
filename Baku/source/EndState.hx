package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class EndState extends FlxState {
	var _winTimer:Float;
	var _continueButton:MapButton;
	
	var _backdrop:FlxSprite;
	
	override public function new(won:Bool):Void{
		super();
		
		bgColor = 0xFFAA6e99;
		
		_backdrop = new FlxSprite(0, 0);
		if (won){
			_backdrop.loadGraphic("assets/images/winscreen.png", true, 800, 620);
		}else{
			_backdrop.loadGraphic("assets/images/losescreen.png", true, 800, 620);
		}
		_backdrop.animation.add("animate", [0, 1, 2], 6, false);
		add(_backdrop);
		
		//var _shards = new ShardsUI();
		//add(_shards);
		
		
		
	}
	
	override public function create():Void {
		super.create();
		_continueButton = new MapButton(350, 490, "assets/images/backtomapoutline.png", "MapState");
		_continueButton.addRelativeHitbox(1, 1, 100, 44);
		
		var _spr = new FlxSprite(351, 491);
		_spr.loadGraphic("assets/images/continuebutton.png");
		add(_spr);
		
		_continueButton.showHitbox();
		add(_continueButton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		_backdrop.animation.play("animate");
	}
}