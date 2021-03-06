package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class FountainState extends FlxState {
	var _mapButton:MapButton;
	var _exchangeButton:FlxSprite;
	var _exchangeButtonHitbox:FlxSprite;
	var _exitbutton:ExitButton;
	var _backdrop:FlxSprite;
	override public function create():Void {
		super.create();
		bgColor = 0xFFAA6e99;
		
		_backdrop = new FlxSprite(0, 0);
		_backdrop.loadGraphic("assets/images/baku_statue.png", true, 800, 620);
		_backdrop.animation.add("animate", [0, 1, 2], 6, false);
		add(_backdrop);
		
		var _shards = new ShardsUI();
		add(_shards);
		
		var _backtomapbutton = new FlxSprite(10, 564);
		_backtomapbutton.loadGraphic("assets/images/backtomapbutton.png");
		add(_backtomapbutton);
		
		_mapButton = new MapButton(9, 563, "assets/images/backtomapoutline.png", "MapState");
		_mapButton.addRelativeHitbox(1, 1, 100, 44);
		add(_mapButton);
		
		_exchangeButton = new FlxSprite(97, 260);
		_exchangeButton.loadGraphic("assets/images/bakufountainoutline.png");
		_exchangeButton.alpha = 0;
		
		_exchangeButtonHitbox = new FlxSprite(97, 260);
		_exchangeButtonHitbox.makeGraphic(547, 288, 0x01AA1111);
		add(_exchangeButtonHitbox);
		if(Globals.badDreams > 0)
			FlxMouseEventManager.add(_exchangeButtonHitbox, exchangeFragments, null , hover, out);
		
		add(_exchangeButton);
		
		_exitbutton = new ExitButton(0.7);
		add(_exitbutton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		_backdrop.animation.play("animate");
	}
	
	public function hover(s:FlxSprite){
		_exchangeButton.alpha = 1;
	}
	
	public function out(s:FlxSprite){
		_exchangeButton.alpha = 0;
	}
	
	public function exchangeFragments(x:FlxSprite):Bool{
		if (Globals.badDreams > 0){
			Globals.badDreams--;
			Globals.goodDreams++;
			return true;
		}else{
			return false;
		}
	}
}