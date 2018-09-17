package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class MapState extends FlxState {
	var _level1button:MapButton;
	var _level2button:MapButton;
	var _level1Dbutton:MapDreamstateButton;
	var _level2Dbutton:MapDreamstateButton;
	var _exitbutton:ExitButton;
	override public function create():Void {
		super.create();
		bgColor = 0xFF546e99;
		
		_exitbutton = new ExitButton(0.5);
		add(_exitbutton);
		
		
		//TODO: add UI that shows number of fragments
		
		if (Globals.level1State == 0){
			_level1button = new MapButton(100, 100, 0xFFaa1111 , "StartState");
			_level1button.addRelativeHitbox(9, 9, 32, 32);
			_level1button.showHitbox();
			add(_level1button);
		}else{
			if(Globals.level1State == 1)
				_level1Dbutton = new MapDreamstateButton(100, 100, false);
			else if (Globals.level1State == 2)
				_level1Dbutton = new MapDreamstateButton(100, 100, true);
			add(_level1Dbutton);
		}
		
		if (Globals.level2State == 0){
			_level2button = new MapButton(200, 100, 0xFF11aa11 , "PlayState");
			_level2button.addRelativeHitbox(9, 9, 32, 32);
			_level2button.addRelativeHitbox(41, 29, 32, 32);
			_level2button.showHitbox();
			add(_level2button);
		}else{
			if(Globals.level2State == 1)
				_level2Dbutton = new MapDreamstateButton(200, 100, false);
			else if (Globals.level2State == 2)
				_level2Dbutton = new MapDreamstateButton(100, 100, true);
			add(_level2Dbutton);
		}
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}

//add button to fountain
//repurpose buttons for returning dream fragments