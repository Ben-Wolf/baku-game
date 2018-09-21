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
	var _showtimer:Int;
	var _state:Int;
	var _level:Int;
	
	public function new(x:Int, y:Int, level:Int, state:Int){
		super();
		_state = state;
		_level = level;
		
		_showtimer = 0;
		
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
	
		_group = new FlxGroup(3);
		var _background = new FlxSprite(x - 20, y + 70);
		_background.loadGraphic("assets/images/orbtext.png");
		_group.add(_background);
		
		for (b in _group){
			b.exists = false;
		}
		
		add(_group);
		if(_state == 1){
			FlxMouseEventManager.add(_levelbutton, trade, null , hover, out);
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
			for (b in _group){
				b.exists = false;
			}
		if (_showtimer > 0){
			for (b in _group){
				b.exists = true;
			}
		}
			_showtimer--;
	}
	
	public function trade(s:FlxSprite){
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
		}else{
			showPrompt(_levelbutton);
		}
	}
	
	public function showPrompt(s:FlxSprite){
		if (_state != 1)
			return;
		_showtimer = 20;
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