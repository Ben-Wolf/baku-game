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
	public function new(x:Int, y:Int, path:String, loadTarget:String){
		super();
		_levelbutton = new FlxTypedGroup<FlxSprite>(5);
		_loadTarget = loadTarget;

		_leveloutline = new FlxSprite(x, y);
		_leveloutline.loadGraphic(path);
		add(_leveloutline);
		add(_levelbutton);
		_leveloutline.alpha = 0;
	}

	public function addRelativeHitbox(x:Int, y:Int, width:Int, height:Int):Void{
		var levelbutton = new FlxSprite(_leveloutline.x + x, _leveloutline.y + y);
		levelbutton.makeGraphic(width, height, 0x01aa1111);
		_levelbutton.add(levelbutton);
		FlxMouseEventManager.add(levelbutton, clicked, null , hover, out);
	}

	public function showHitbox():Void{
		for (b in _levelbutton){
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
			case "Level1State":
				FlxG.switchState(new Level1State());
			case "Level2State":
				FlxG.switchState(new Level2State());
			case "Level3State":
				FlxG.switchState(new Level3State());
			case "Level4State":
				FlxG.switchState(new Level4State());
			case "Level5State":
				FlxG.switchState(new Level5State());
			case "MapState":
				FlxG.switchState(new MapState());
			case "FountainState":
				FlxG.switchState(new FountainState());
			case "IntroState":
				FlxG.switchState(new IntroState());
		}
	}

	public function hover(s:FlxSprite){
		_leveloutline.alpha = 1;
	}

	public function out(s:FlxSprite){
		_leveloutline.alpha = 0;
	}
}
