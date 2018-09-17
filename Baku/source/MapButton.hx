package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class MapButton extends FlxState {
	var _levelbutton:FlxTypedGroup<FlxSprite>;
	var _leveloutline:FlxSprite;
	var _loadTarget:String;
	public function new(x:Int, y:Int, color:FlxColor, loadTarget:String){
		super();
		_levelbutton = new FlxTypedGroup<FlxSprite>(5);
		_loadTarget = loadTarget;
		
		_leveloutline = new FlxSprite(x, y);
		_leveloutline.makeGraphic(50, 50, color);
		add(_leveloutline);
		add(_levelbutton);
		_leveloutline.alpha = 0;
	}
	
	public function addRelativeHitbox(x:Int, y:Int, width:Int, height:Int):Void{
		var levelbutton = new FlxSprite(_leveloutline.x + x, _leveloutline.y + y);
		levelbutton.makeGraphic(width, height, 0xFFaa1111);
		levelbutton.alpha = 0;
		_levelbutton.add(levelbutton);
		FlxMouseEventManager.add(levelbutton, clicked, null , hover, out);
	}
	
	public function showHitbox():Void{
		for (b in _levelbutton){
			b.alpha = 1;
		}
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
				Globals.reset();
			case "PlayState":
				FlxG.switchState(new PlayState());
			case "MapState":
				FlxG.switchState(new MapState());
			case "FountainState":
				FlxG.switchState(new FountainState());
		}
	}
	
	public function hover(s:FlxSprite){
		_leveloutline.alpha = 1;
	}
	
	public function out(s:FlxSprite){
		_leveloutline.alpha = 0;
	}
}