package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;

class ExitButton extends FlxState {
	var _button:FlxSprite;
	var _alpha:Float;
	var _group:FlxGroup;
	var _showing:Bool;
	
	public function new(alpha:Float){
		super();
		_button = new FlxSprite(10, 40);
		_button.loadGraphic("assets/images/exitbutton.png");
		_button.alpha = alpha;
		_alpha = alpha;
		add(_button);
		
		_showing = false;
		
		_group = new FlxGroup(3);
		var _background = new FlxSprite(10, 100);
		_background.loadGraphic("assets/images/exitprompt.png");
		_group.add(_background);
		
		var _yesButton = new FlxButton(20, 130, "Yes", loadMenu);
		_group.add(_yesButton);
		
		var _noButton = new FlxButton(120, 130, "No", hidePrompt);
		_group.add(_noButton);
		
		for (b in _group){
			b.exists = false;
		}
		
		add(_group);
		
		FlxMouseEventManager.add(_button, showPrompt, null , hover, out);
	}
	
	override public function create():Void {
		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		if (_showing){
			_button.alpha = 1;
		}
	}
	
	public function showPrompt(s:FlxSprite){
		if (_showing){
			for (b in _group){
				b.exists = false;
			}
			_button.alpha = _alpha;
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
		_button.alpha = _alpha;
		_showing = false;
	}
	
	public function loadMenu():Void{
		FlxG.switchState(new StartState());
		Globals.reset();
	}
	
	public function hover(s:FlxSprite){
		_button.alpha = 1;
	}
	
	public function out(s:FlxSprite){
		_button.alpha = _alpha;
	}
}