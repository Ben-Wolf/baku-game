package;

import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;

class FinishButton extends FlxState {
	var _button:FlxSprite;
	var _alpha:Float;
	var _group:FlxGroup;
	var _showing:Bool;
	
	public function new(alpha:Float){
		super();
		
		var image_width = 106;
		var image_height = 42;
		_button = new FlxSprite(FlxG.width - image_width - 10, FlxG.height/2 - image_height/2);
		_button.loadGraphic("assets/images/finishbutton.png");
		_button.alpha = alpha;
		_alpha = alpha;
		add(_button);
		
		_showing = false;
		
		_group = new FlxGroup(3);
		var _background = new FlxSprite(FlxG.width - image_width - 110, FlxG.height/2 - image_height/2 + 60);
		_background.loadGraphic("assets/images/finishprompt.png");
		_group.add(_background);
		
		var _yesButton = new FlxButton(FlxG.width - image_width - 101, FlxG.height/2 - image_height/2 + 90, "Yes", loadMenu);
		_group.add(_yesButton);
		
		var _noButton = new FlxButton(FlxG.width - image_width, FlxG.height/2 - image_height/2 + 90, "No", hidePrompt);
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
			_showing = false;
			_button.alpha = _alpha;
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