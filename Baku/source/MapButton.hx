package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;

class MapButton extends FlxState {
	var _levelbutton:FlxSprite;
	var _leveloutline:FlxSprite;
	var _loadTarget:String;
	public function new(x:Int, y:Int, color:FlxColor, loadTarget:String){
		super();
		_loadTarget = loadTarget;
		
		_levelbutton = new FlxSprite(x, y);
		_levelbutton.makeGraphic(32, 32, color);
		add(_levelbutton);
		
		_leveloutline = new FlxSprite(x - 9, y - 9);
		_leveloutline.makeGraphic(50, 50, color);
		add(_leveloutline);
		_leveloutline.alpha = 0;
		
		FlxMouseEventManager.add(_levelbutton, clicked, null , hover, out);
	}
	
	override public function create():Void {
		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
	
	public function clicked(s:FlxSprite){
		trace("loading " + _loadTarget);
		switch(_loadTarget){
			case "StartState":
				FlxG.switchState(new StartState());
			case "PlayState":
				FlxG.switchState(new PlayState());
		}
	}
	
	public function hover(s:FlxSprite){
		_leveloutline.alpha = 1;
	}
	
	public function out(s:FlxSprite){
		_leveloutline.alpha = 0;
	}
}