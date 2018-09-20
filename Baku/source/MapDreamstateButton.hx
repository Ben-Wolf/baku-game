package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.ui.FlxButton;
import Globals.*;

class MapDreamstateButton extends FlxState {

	var _levelbutton:FlxSprite;
	var _leveloutline:FlxSprite;
	
	var _group:FlxGroup;
	var _showing:Bool;
	var _state:Int;
	var _level:Int;
	
	public function new(x:Int, y:Int, level:Int, state:Int){
		super();
		_state = state;
		
		//TODO: show different sprite based on returned or not
		//show error if not enough good dreams
		_leveloutline = new FlxSprite(x-1, y-1);
		_leveloutline.loadGraphic("assets/images/housetypesoutline.png");
		add(_leveloutline);
		_leveloutline.alpha = 0;
		
		_levelbutton = new FlxSprite(x, y);
		_levelbutton.loadGraphic("assets/images/housetypes.png", true, 39, 54);
		_levelbutton.animation.add("0", [0], 6, false);
		_levelbutton.animation.add("1", [1], 6, false);
		_levelbutton.animation.add("2", [2], 6, false);
		add(_levelbutton);
		_levelbutton.animation.play("" + state);
		
		if(_state == 1){
			FlxMouseEventManager.add(_levelbutton, showPrompt, null , hover, out);
			
			_showing = false;
			
			_group = new FlxGroup(3);
			var _background = new FlxSprite(x + 10, y + 70);
			_background.makeGraphic(200, 60, 0xFFAA1111);
			_group.add(_background);
			
			var _yesButton = new FlxButton(x + 20, y + 100, "Yes", trade);
			_group.add(_yesButton);
			
			var _noButton = new FlxButton(x + 120, y + 100, "No", hidePrompt);
			_group.add(_noButton);
			
			for (b in _group){
				b.exists = false;
			}
			
			add(_group);
		}
	}
	
	public function showHitbox():Void{
		_levelbutton.alpha = 1;
	}
	
	override public function create():Void {
		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
	
	public function trade(){
		if (Globals.goodDreams > 0){
			Globals.goodDreams--;
			for (b in _group){
				b.exists = false;
			}
			_levelbutton.animation.play("2");
			switch(_level){
				case 1:
					Globals.level1State = 2;
				case 2:
					Globals.level2State = 2;
				case 3:
					Globals.level3State = 2;
				case 4:
					Globals.level4State = 2;
				case 5:
					Globals.level5State = 2;
			}
			_state = 2;
		}
	}
	
	public function showPrompt(s:FlxSprite){
		if (_state != 1)
			return;
		if (_showing){
			for (b in _group){
				b.exists = false;
			}
			_showing = false;
		}else{
			for (b in _group){
				b.exists = true;
			}
			_showing = true;
		}
	}
	
	public function hidePrompt():Void{
		for (b in _group){
			b.exists = false;
		}
		_showing = false;
	}
	
	public function hover(s:FlxSprite){
		if (_state != 1)
			return;
		_leveloutline.alpha = 1;
	}
	
	public function out(s:FlxSprite){
		_leveloutline.alpha = 0;
	}
}